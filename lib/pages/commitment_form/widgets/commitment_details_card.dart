import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/commitment.dart';
import '../../../theme/theme.dart';

class CommitmentDetailsCard extends ConsumerWidget {
  CommitmentDetailsCard({super.key});

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isContinued = ref.watch(commitmentProvider).isContinued;

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
            const SizedBox(height: 24.0),
            amountTextField(),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Text(
                  'Continues?',
                  style: textTheme().labelMedium,
                ),
                const SizedBox(width: 16.0),
                Switch(
                  value: isContinued,
                  onChanged: (value) {
                    ref.read(commitmentProvider.notifier).toggleContinued();
                    print(
                        'isContinued: $value, PROVIDE: ${ref.read(commitmentProvider).isContinued}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 24.0),
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

  TextFormField descriptionTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
      controller: descriptionController,
      maxLength: 80,
      minLines: 3,
      maxLines: 3,
    );
  }

  TextField amountTextField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Amount',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      controller: amountController,
      keyboardType: TextInputType.number,
    );
  }
}
