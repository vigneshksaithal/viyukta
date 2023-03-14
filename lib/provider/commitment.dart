import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../protos/commitment.pb.dart';

class Commitment {
  TextEditingController descriptionController = TextEditingController(),
      amountController = TextEditingController();

  DateTime? commitmentDate = DateTime.now();
  int prevCommitmentRequestNumber = 10000;
  int commitmentRequestNumber = 10000;

  String? chapterCode;
  String? partCode;
  String? typeCode;
  String? itemCode;

  bool isContinued = false;
  String smsText = '';
  DateTime? paymentDate;

  List jsonSms = [];

  Commitment({
    required this.descriptionController,
    required this.amountController,
    required this.commitmentDate,
    required this.prevCommitmentRequestNumber,
    required this.commitmentRequestNumber,
    required this.chapterCode,
    required this.partCode,
    required this.typeCode,
    required this.itemCode,
    required this.isContinued,
    this.smsText = '',
    this.paymentDate,
  });

  Commitment copyWith({
    TextEditingController? businessNameController,
    TextEditingController? descriptionController,
    TextEditingController? amountController,
    DateTime? commitmentDate,
    int prevCommitmentRequestNumber = 10000,
    int commitmentRequestNumber = 10000,
    String? chapterCode,
    String? partCode,
    String? typeCode,
    String? itemCode,
    bool? isContinued,
    String? smsText,
    DateTime? paymentDate,
  }) {
    return Commitment(
      descriptionController:
          descriptionController ?? this.descriptionController,
      amountController: amountController ?? this.amountController,
      commitmentDate: commitmentDate ?? this.commitmentDate,
      prevCommitmentRequestNumber: prevCommitmentRequestNumber,
      commitmentRequestNumber: commitmentRequestNumber,
      chapterCode: chapterCode ?? this.chapterCode,
      partCode: partCode ?? this.partCode,
      typeCode: typeCode ?? this.typeCode,
      itemCode: itemCode ?? this.itemCode,
      isContinued: isContinued ?? this.isContinued,
      smsText: smsText ?? this.smsText,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }
}

class CommitmentNotifier extends StateNotifier<Commitment> {
  CommitmentNotifier()
      : super(Commitment(
          descriptionController: TextEditingController(),
          amountController: TextEditingController(),
          commitmentDate: DateTime.now(),
          prevCommitmentRequestNumber: 10000,
          commitmentRequestNumber: 10000,
          chapterCode: null,
          partCode: null,
          typeCode: null,
          itemCode: null,
          isContinued: false,
          paymentDate: null,
        )) {
    // Initialize the state here
  }

  void generateCommitmentRequestNumber() {
    state = state.copyWith(
      commitmentRequestNumber: (state.commitmentRequestNumber + 1),
    );
  }

  void toggleContinued() {
    state = state.copyWith(isContinued: !state.isContinued);
  }

  void setChapterCode(String chapterCode) {
    state = state.copyWith(chapterCode: chapterCode);
  }

  void setPaymentDate(DateTime paymentDate) {
    state = state.copyWith(paymentDate: paymentDate);
  }

  void convertDataToJson() {}

  Future<void> serializeData() async {
    final commitment = CommitmentProto()
      ..requestNumber = '01-005-200001'
      ..date = DateTime.now().toUtc().toString()
      ..amount = state.amountController.text
      ..description = state.descriptionController.text
      ..isContinued = state.isContinued
      ..paymentDate = state.paymentDate.toString()
      ..isApproved = false;

    encryptText(commitment.writeToJsonMap().toString());

    print('PROTO JSON: ${commitment.toProto3Json().toString()}');
  }

  Future<void> saveData() async {}

  Future<void> encryptText(String text) async {
    final key = encrypt.Key.fromUtf8('1234567812345678');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(text, iv: iv);

    state.smsText = encrypted.base64;

    state = state.copyWith(smsText: encrypted.base64);

    print('ENCRYPTED DATA: ${encrypted.base64} ${encrypted.base64.length}');
  }

  void resetForm() {
    state = Commitment(
      descriptionController: TextEditingController(),
      amountController: TextEditingController(),
      commitmentDate: DateTime.now(),
      prevCommitmentRequestNumber: state.prevCommitmentRequestNumber,
      commitmentRequestNumber: 0,
      chapterCode: null,
      partCode: null,
      typeCode: null,
      itemCode: null,
      isContinued: false,
      paymentDate: null,
    );
  }
}

final commitmentProvider =
    StateNotifierProvider<CommitmentNotifier, Commitment>((ref) {
  return CommitmentNotifier();
});
