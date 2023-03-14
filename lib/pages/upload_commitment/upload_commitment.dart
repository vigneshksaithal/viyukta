import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:csv/csv.dart';
import 'package:lzstring/lzstring.dart';
import 'package:viyukta/theme/theme.dart';

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
                                onPressed: () {},
                                child: const Text('Submit & Save')),
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

    String text =
        'UN2zwADwq9ZbB/BkhE6znPRIT6YKc9J0f7VVQbI/OEgj9VVjbtOSpHwIKJ4XI5tt6atBqaA3zAh/ijvy1yvMvnAdGUVEKtYnJtjBcRcWLOFUdnpBRzAaHkYm9pz2wrIIDPrZ97Eo5TwmSdq8OITLTyqFLzawV/c0B4grVaEykwQjewtCiQquLFUvbuwF1y2zyCH7YH6/oQvfQtK8EUX8W4voAJTFNk/ROUn+bTQUZCZOvE0E1hHsZ0luXTWQybwM+Fi+ngcJRbkofaV4/Ay7PG7G/9MfRe+4e/pnF+M22EJqVAwRvWJpX7y35UbnEqwQlt27je8PCQJSG0B5KMiR4GUg2HnTTaCL8DyyfQDSIZ1vqipvD3NpLe0C5kfa3Q0okPMrNVoTA/c7g+DKWnC6b09sa1dLm/wRIrsj5LkphycKqTnjiWlOD5/jqfFRWeYZZVf4crRiiVeyvDya5zD5WaceCby1BqLYh1IAr57RsxibeR26roDpJkwJ29u/rohgiZHxuO6lycavOEIxeK6l5w==';

    Future<String?> compressedString = LZString.compress(text);
    // Future<String?> decompressedString = LZString.decompress(compressedString as String?);

    String? compressedStringSync = LZString.compressSync('Some String');
    // String? decompressedStringSync =
    // LZString.decompressSync(compressedStringSync);

    print('COMPRESSED STRING: === ${compressedStringSync!.length}');

    String kData = ref.read(csvProvider).csvData.toString();

    //Original Data
    List<int> original = utf8.encode(text);

    //Compress data
    List<int> compressed = gzip.encode(original);

    //Decompress
    List<int> decompress = gzip.decode(compressed);

    // ref.watch(csvProvider.notifier);

    // print('Original ${original.length} bytes');
    // print('Compressed ${compressed.length} | ${compressed.toList()} bytes');
    // print('Decompressed ${decompress.length} bytes');

    // String decoded = utf8.decode(decompress);
    // assert(data == decoded);
  }
}
