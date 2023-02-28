import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommitmentList {
  List<Map> commitmentList = [
    {
      'organizationName': 'Yemen School',
      'description': 'School for Yemeni children',
      'amount': 12500,
      'commitmentDate': DateTime.now(),
      'prevCommitmentRequestNumber': 0,
      'commitmentRequestNumber': null,
      'isContinued': false,
      'isApproved': false,
    }
  ];
}

class CommitmentNotifier extends StateNotifier<CommitmentList> {
  CommitmentNotifier() : super(CommitmentList()) {
    // call init function here
    getDateFromLocal();
  }

  Future<void> getDateFromLocal() async {}
}

final commitmentListProvider =
    StateNotifierProvider<CommitmentNotifier, CommitmentList>((ref) {
  return CommitmentNotifier();
});
