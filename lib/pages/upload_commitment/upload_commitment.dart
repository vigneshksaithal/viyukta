import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:csv/csv.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../../provider/settings.dart';
import '../../theme/theme.dart';

import '../../provider/c_s_v_data.dart';

class UploadCommitment extends ConsumerWidget {
  UploadCommitment({super.key});

  String? filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(csvProvider).csvData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Commitment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    _pickFile(ref);
                  },
                  child: const Text('Upload CSV'),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              filePath != null
                  ? Column(
                      children: [
                        const Text('CSV file loaded successfully!'),
                        const SizedBox(height: 32.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CSV Data',
                            style: textTheme().labelMedium,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text('$data'),
                        const SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 32.0),
                            ElevatedButton(
                              onPressed: () async {
                                String? message =
                                    ref.watch(csvProvider).csvData.toString();

                                await ref
                                    .watch(csvProvider.notifier)
                                    .encryptData(message.toString());

                                String encryptedMessage = ref
                                    .watch(csvProvider)
                                    .encryptedCsv
                                    .toString();

                                print("MESSAGE: $encryptedMessage");

                                String? phoneNumber = ref
                                    .watch(settingsProvider)
                                    .phoneNumberController
                                    .text;

                                List<String> recipents = [phoneNumber];

                                print('PHONE NUMBER ::: $phoneNumber');

                                await sendSMS(
                                  message: encryptedMessage,
                                  recipients: recipents,
                                  sendDirect: true,
                                );
                              },
                              child: const Text('Submit & Save'),
                            ),
                          ],
                        )
                      ],
                    )
                  : const Center(
                      child: Text('No Data'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile(WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;
    // we will log the name, size and path of the
    // first picked file (if multiple are selected)
    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    ref.watch(csvProvider.notifier).getFile(fields);
  }
}
