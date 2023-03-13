import 'package:flutter_riverpod/flutter_riverpod.dart';

class CSVData {
  List<List<dynamic>> csvData = [];
  String? filePath;

  CSVData({
    required this.csvData,
    required this.filePath,
  });

  CSVData copyWith({
    List<List<dynamic>>? data,
    String? filePath,
  }) {
    return CSVData(
      csvData: data ?? csvData,
      filePath: filePath ?? this.filePath,
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
}

final csvProvider = StateNotifierProvider<CSVNotifier, CSVData>((ref) {
  return CSVNotifier();
});
