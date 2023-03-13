import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadFile {
  List<List<dynamic>> data = [];

  UploadFile({required this.data});

  UploadFile copyWith({
    List<List<dynamic>>? data,
  }) {
    return UploadFile(data: data ?? this.data);
  }
}

class FileNotifier extends StateNotifier<UploadFile> {
  FileNotifier() : super(UploadFile(data: [])) {
    // call init function here
  }

  Future<void> updateFile(List<List<dynamic>> data) async {
    state = state.copyWith(
      data: state.data,
    );
  }
}

final fileProvider = StateNotifierProvider<FileNotifier, UploadFile>((ref) {
  return FileNotifier();
});
