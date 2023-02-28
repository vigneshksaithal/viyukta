import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../protos/commitment.pb.dart';

class Commitment {
  TextEditingController descriptionController = TextEditingController(),
      amountController = TextEditingController();

  DateTime commitmentDate = DateTime.now();
  int prevCommitmentRequestNumber = 0;
  String? commitmentRequestNumber;
  bool isContinued = false;

  Commitment({
    required this.descriptionController,
    required this.amountController,
    required this.commitmentDate,
    required this.prevCommitmentRequestNumber,
    required this.commitmentRequestNumber,
    required this.isContinued,
  });

  Commitment copyWith({
    TextEditingController? businessNameController,
    TextEditingController? descriptionController,
    TextEditingController? amountController,
    DateTime? commitmentDate,
    int? prevCommitmentRequestNumber,
    String? commitmentRequestNumber,
    bool? isContinued,
  }) {
    return Commitment(
      descriptionController:
          descriptionController ?? this.descriptionController,
      amountController: amountController ?? this.amountController,
      commitmentDate: commitmentDate ?? this.commitmentDate,
      prevCommitmentRequestNumber:
          prevCommitmentRequestNumber ?? this.prevCommitmentRequestNumber,
      commitmentRequestNumber:
          commitmentRequestNumber ?? this.commitmentRequestNumber,
      isContinued: isContinued ?? this.isContinued,
    );
  }
}

class CommitmentNotifier extends StateNotifier<Commitment> {
  CommitmentNotifier()
      : super(Commitment(
          descriptionController: TextEditingController(),
          amountController: TextEditingController(),
          commitmentDate: DateTime.now(),
          prevCommitmentRequestNumber: 0,
          commitmentRequestNumber: null,
          isContinued: false,
        )) {
    saveData();
    serializeData();
    state.commitmentRequestNumber =
        generateCommitmentRequestNumber('10', '005');
  }

  String generateCommitmentRequestNumber(
      String stateCode, String departmentCode) {
    return '$stateCode-$departmentCode-${DateTime.now().toUtc()}';
  }

  void toggleContinued() {
    state = state.copyWith(isContinued: !state.isContinued);
  }

  Future<String> serializeData() async {
    final commitment = CommitmentProto()
      ..commitmentRequestNumber = '01-005-200001'
      ..date = DateTime.now().toUtc().toString()
      ..amount = double.parse(state.amountController.text);

    print(commitment.writeToBuffer());

    return commitment.writeToBuffer().toString();
  }

  Future<void> saveData() async {}

  Future<void> sendSMS() async {}
}

final commitmentProvider =
    StateNotifierProvider<CommitmentNotifier, Commitment>((ref) {
  return CommitmentNotifier();
});