import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class GeneralDetailsCard extends StatelessWidget {
  GeneralDetailsCard({
    super.key,
  });

  final TextEditingController commitmentRequestNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Details',
              style: textTheme().titleMedium,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Text(
                  'Submission Date',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('26/02/2023'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Commitment Request Number',
              ),
              controller: commitmentRequestNumberController,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Text(
                  'Request Type',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Choose type'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
