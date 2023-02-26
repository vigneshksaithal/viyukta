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
            Row(
              children: [
                Text(
                  'Organization:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8),
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
                  'Organization Code:',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8),
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
