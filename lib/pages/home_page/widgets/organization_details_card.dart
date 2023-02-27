import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class OrganizationDetailsCard extends StatelessWidget {
  const OrganizationDetailsCard({
    super.key,
  });

  final String organizationName = 'Yemen School';
  final String organizationCode = 'YMN-SC-001';

  @override
  Widget build(BuildContext context) {
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
                  organizationName,
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
                  organizationCode,
                  style: textTheme().bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Officer:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8.0),
                Text(
                  organizationCode,
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
