import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/upload_file.dart';

class UploadCommitment extends ConsumerWidget {
  UploadCommitment({super.key});

  String? filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fileProvider).data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Commitment'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  _pickFile(ref);
                },
                child: const Text('Upload Excel'),
              ),
            ),
            ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  color: index == 0 ? Colors.amber : Colors.white,
                  child: ListTile(
                    leading: Text(
                      data[index][0].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: index == 0 ? 18 : 15,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.normal,
                          color: index == 0 ? Colors.red : Colors.black),
                    ),
                    title: Text(
                      data[index][3],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: index == 0 ? 18 : 15,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.normal,
                          color: index == 0 ? Colors.red : Colors.black),
                    ),
                    trailing: Text(
                      data[index][4].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: index == 0 ? 18 : 15,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.normal,
                          color: index == 0 ? Colors.red : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pickFile(ref) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) {
      return; // we will log the name, size and path of the Y first picked file (if multiple are selected)
    }

    print(result.files.first.name);

    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    print(fields);

    ref.watch(fileProvider.notifier);
  }
}
