import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/commitment.dart';
import '../../../theme/theme.dart';

class CommitmentDetailsCard extends ConsumerWidget {
  const CommitmentDetailsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isContinued = ref.watch(commitmentProvider).isContinued;
    DateTime? paymentDate = ref.watch(commitmentProvider).paymentDate;

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
            const SizedBox(height: 48.0),
            descriptionTextField(ref),
            const SizedBox(height: 32.0),
            amountTextField(ref),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Date',
                  style: textTheme().labelMedium,
                ),
                TextButton(
                  onPressed: () async {
                    DateTime? date = await pickDate(context);

                    if (date == null) return;

                    paymentDate = date;

                    ref.read(commitmentProvider.notifier).setPaymentDate(date);

                    print('DATE ==== $paymentDate');
                  },
                  child: paymentDate == null
                      ? const Text('Pick a date')
                      : Text(
                          '${paymentDate.day}/${paymentDate.month}/${paymentDate.year}',
                          style: textTheme().bodyMedium,
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(context) => showDatePicker(
        context: context,
        initialDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
        firstDate: DateTime(1900),
        lastDate: DateTime(3000),
      );

  TextFormField descriptionTextField(WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
      controller: ref.watch(commitmentProvider).descriptionController,
      maxLength: 80,
      minLines: 3,
      maxLines: 3,
    );
  }

  TextField amountTextField(WidgetRef ref) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Amount',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      controller: ref.watch(commitmentProvider).amountController,
      keyboardType: TextInputType.number,
    );
  }
}
