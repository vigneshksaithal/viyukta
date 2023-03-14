import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class CSVData {
  List<List<dynamic>> csvData = [];
  String? filePath;
  String? encryptedCsv;

  CSVData({
    required this.csvData,
    required this.filePath,
    this.encryptedCsv,
  });

  CSVData copyWith({
    List<List<dynamic>>? data,
    String? filePath,
    String? encryptedCsv,
  }) {
    return CSVData(
      csvData: data ?? csvData,
      filePath: filePath ?? this.filePath,
      encryptedCsv: encryptedCsv ?? this.encryptedCsv,
    );
  }
}

class CSVNotifier extends StateNotifier<CSVData> {
  CSVNotifier() : super(CSVData(csvData: [], filePath: '')) {
    // call init function here
  }

  void getFile(List<List<dynamic>> data) {
    state = state.copyWith(data: data);
  }

  void filePath(String path) {
    state = state.copyWith(
      filePath: path,
    );
  }

  Future<void> encryptData(String text) async {
    final key = encrypt.Key.fromUtf8('1234567812345678');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(text, iv: iv);

    state = state.copyWith(
      encryptedCsv: encrypted.base64,
    );

    print(
        'ENCRYPTED DATA: |||${encrypted.base64}||| ${encrypted.base64.length}');
  }
}

final csvProvider = StateNotifierProvider<CSVNotifier, CSVData>((ref) {
  return CSVNotifier();
});
