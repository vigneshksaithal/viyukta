import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommitmentList {
  List<Map> commitmentList = [
    {
      'description': 'School unfiforms for 2023/2024 academic year',
      'amount': 15500,
      'date': DateTime.now(),
      'requestNumber': 'STSC200004',
      'isContinued': false,
      'isApproved': false,
      'paymentDate': DateTime.now(),
    },
    {
      'description': 'Electricity bill for 2023/2024 academic year',
      'amount': 34000,
      'date': DateTime.now(),
      'requestNumber': 'STSC200001',
      'isContinued': false,
      'isApproved': true,
    },
  ];
}

class CommitmentListNotifier extends StateNotifier<CommitmentList> {
  CommitmentListNotifier() : super(CommitmentList()) {
    // call init function here
    getDateFromLocal();
  }

  Future<void> getDateFromLocal() async {}
}

final commitmentListProvider =
    StateNotifierProvider<CommitmentListNotifier, CommitmentList>((ref) {
  return CommitmentListNotifier();
});
