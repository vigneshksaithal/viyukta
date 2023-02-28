import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viyukta/provider/organization_details.dart';

import '../../../theme/theme.dart';

class OrganizationDetailsCard extends ConsumerWidget {
  const OrganizationDetailsCard({
    super.key,
  });

  final String organizationName = 'Yemen School';
  final String organizationCode = 'YMN-SC-001';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Organization Details',
              style: textTheme().titleMedium,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Text(
                  'Name:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8.0),
                Text(
                  ref.read(organizationDetailsProvider).organizationName,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Code:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8.0),
                Text(
                  ref.read(organizationDetailsProvider).organizationCode,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Head:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8.0),
                Text(
                  ref.read(organizationDetailsProvider).organizationHead,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
