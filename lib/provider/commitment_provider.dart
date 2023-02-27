import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Commitment {
  TextEditingController businessNameController = TextEditingController(),
      descriptionController = TextEditingController(),
      amountController = TextEditingController();

  DateTime commitmentDate = DateTime.now();
  int prevCommitmentRequestNumber = 0;
  String? commitmentRequestNumber;
  bool isContinued = false;
}

class CommitmentNotifier extends StateNotifier<Commitment> {
  CommitmentNotifier() : super(Commitment()) {
    saveData();
    state.commitmentRequestNumber =
        generateCommitmentRequestNumber('10', '005');
  }

  String generateCommitmentRequestNumber(
      String stateCode, String departmentCode) {
    return '$stateCode-$departmentCode-${DateTime.now().toUtc()}';
  }

  Future<void> serializeData() async {}

  Future<void> saveData() async {}

  Future<void> sendSMS() async {}
}

final commitmentProvider =
    StateNotifierProvider<CommitmentNotifier, Commitment>((ref) {
  return CommitmentNotifier();
});
