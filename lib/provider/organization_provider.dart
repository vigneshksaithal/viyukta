import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Organization {
  TextEditingController businessNameController = TextEditingController(),
      descriptionController = TextEditingController(),
      amountController = TextEditingController();

  String organizationName = 'Yemen School';
}

class CommitmentNotifier extends StateNotifier<Organization> {
  CommitmentNotifier() : super(Organization()) {
    // call init function here
  }

  Future<void> serializeData() async {}
}

final organizationProvider =
    StateNotifierProvider<CommitmentNotifier, Organization>((ref) {
  return CommitmentNotifier();
});
