import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrganizationDetails {
  String organizationName = 'Aden Govt. Primary & High School',
      organizationCode = 'SCH005',
      organizationHead = 'Mr. ABC',
      organizationType = 'School';
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
