import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/commitment.dart';
import 'widgets/commitment_details_card.dart';
import 'widgets/general_details_card.dart';
import 'widgets/coding_block_card.dart';

class CommitmentForm extends ConsumerWidget {
  const CommitmentForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commitment Form'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              children: <Widget>[
                GeneralDetailsCard(),
                const SizedBox(height: 32.0),
                const CodingBlockCard(),
                const SizedBox(height: 32.0),
                const CommitmentDetailsCard(),
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        ref.read(commitmentProvider.notifier).resetForm();

                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16.0),
                    TextButton(
                      onPressed: () {
                        ref.read(commitmentProvider.notifier).resetForm();
                      },
                      child: const Text('Reset'),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await ref
                              .watch(commitmentProvider.notifier)
                              .serializeData();

                          String message = ref.read(commitmentProvider).smsText;
                          List<String> recipents = ["+962799440933"];

                          // !Uncomment this to send SMS
                          // await sendSMS(
                          //   message: message,
                          //   recipients: recipents,
                          //   sendDirect: true,
                          // );
                        },
                        child: const Text('Save & Submit'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
