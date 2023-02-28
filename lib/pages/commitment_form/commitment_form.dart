import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../../provider/commitment.dart';
import 'widgets/commitment_details_card.dart';
import 'widgets/general_details_card.dart';

class CommitmentForm extends ConsumerWidget {
  const CommitmentForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Commitment Form'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  // height: ,
                  child: GeneralDetailsCard(),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: double.infinity,
                  child: CommitmentDetailsCard(),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () async {
                        String message = ref.read(commitmentProvider).smsText;
                        List<String> recipents = ["9353924958"];

                        await sendSMS(
                          message: message,
                          recipients: recipents,
                          sendDirect: true,
                        );
                      },
                      child: const Text('Submit'),
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
