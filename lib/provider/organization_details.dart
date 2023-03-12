import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrganizationDetails {
  String organizationName = 'Aden Govt. Primary & High School',
      organizationType = 'School',
      organizationCode = 'SCH005',
      organizationOfficer = 'Mr. ABCDE FGHIJK';
}

class OrganizationDetailsNotifier extends StateNotifier<OrganizationDetails> {
  OrganizationDetailsNotifier() : super(OrganizationDetails()) {
    // call init function here
  }

  Future<void> getDataFromLocal() async {}
}

final organizationDetailsProvider =
    StateNotifierProvider<OrganizationDetailsNotifier, OrganizationDetails>(
        (ref) {
  return OrganizationDetailsNotifier();
});
