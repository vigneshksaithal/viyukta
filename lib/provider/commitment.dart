import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../protos/commitment.pb.dart';

class Commitment {
  TextEditingController descriptionController = TextEditingController(),
      amountController = TextEditingController();

  DateTime? commitmentDate = DateTime.now();
  int prevCommitmentRequestNumber = 0;
  String? commitmentRequestNumber;
  bool isContinued = false;
  String smsText = '';
  DateTime? paymentDate;

  Commitment({
    required this.descriptionController,
    required this.amountController,
    required this.commitmentDate,
    required this.prevCommitmentRequestNumber,
    required this.commitmentRequestNumber,
    required this.isContinued,
    this.smsText = '',
  });

  Commitment copyWith({
    TextEditingController? businessNameController,
    TextEditingController? descriptionController,
    TextEditingController? amountController,
    DateTime? commitmentDate,
    int? prevCommitmentRequestNumber,
    String? commitmentRequestNumber,
    bool? isContinued,
    String? smsText,
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
      smsText: smsText ?? this.smsText,
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
    return '$stateCode-$departmentCode-${DateTime.now()}';
  }

  void toggleContinued() {
    state = state.copyWith(isContinued: !state.isContinued);
  }

  Future<void> serializeData() async {
    final commitment = CommitmentProto()
      ..requestNumber = '01-005-200001'
      ..date = DateTime.now().toUtc().toString()
      ..amount = state.amountController.text
      ..description = state.descriptionController.text
      ..isContinued = state.isContinued
      ..isApproved = false;

    encryptText(commitment.writeToBuffer().toString());
  }

  Future<void> saveData() async {}

  Future<void> encryptText(String text) async {
    final key = encrypt.Key.fromUtf8('my 32 length key................');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);

    state.smsText = encrypted.base64;

    state = state.copyWith(smsText: encrypted.base64);
  }

  Future<void> descryptText() async {}

  void resetForm() {
    state = Commitment(
      descriptionController: TextEditingController(),
      amountController: TextEditingController(),
      commitmentDate: DateTime.now(),
      prevCommitmentRequestNumber: 0,
      commitmentRequestNumber: null,
      isContinued: false,
    );
  }
}

final commitmentProvider =
    StateNotifierProvider<CommitmentNotifier, Commitment>((ref) {
  return CommitmentNotifier();
});
