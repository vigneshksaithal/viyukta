import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viyukta/provider/organization_details.dart';

import '../../../theme/theme.dart';

class OrganizationDetailsCard extends ConsumerWidget {
  const OrganizationDetailsCard({
    super.key,
  });

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
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Department Name',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    ref.read(organizationDetailsProvider).organizationName,
                    style: textTheme().bodyMedium,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Department Type',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                Text(
                  ref.read(organizationDetailsProvider).organizationType,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Department Code',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                Text(
                  ref.read(organizationDetailsProvider).organizationCode,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authorizing Officer',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    ref.read(organizationDetailsProvider).organizationOfficer,
                    style: textTheme().bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
