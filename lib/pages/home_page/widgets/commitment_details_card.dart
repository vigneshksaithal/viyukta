import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class CommitmentDetailsCard extends StatelessWidget {
  CommitmentDetailsCard({super.key});

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  final bool value = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Commitment Details',
              style: textTheme().titleMedium,
            ),
            const SizedBox(height: 24.0),
            descriptionTextField(),
            const SizedBox(height: 16.0),
            amountTextField(),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Continues?',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 8),
                buildSwitch(),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Request Payment Date',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Choose date'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextField descriptionTextField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      controller: descriptionController,
    );
  }

  TextField amountTextField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Amount',
        prefixIcon: Icon(Icons.attach_money_outlined),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      controller: amountController,
      keyboardType: TextInputType.number,
    );
  }

  Widget buildSwitch() => Switch.adaptive(
        value: value,
        onChanged: (value) {},
      );
}
