import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/commitment.dart';
import '../../../theme/theme.dart';

class GeneralDetailsCard extends ConsumerWidget {
  GeneralDetailsCard({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commtmentProvider = ref.watch(commitmentProvider);
    final commitmentDate = commtmentProvider.commitmentDate;
    String? commitmentRequestNumber = commtmentProvider.commitmentRequestNumber;

    return Card(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General Details',
                style: textTheme().titleMedium,
              ),
              const SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Submission Date',
                    style: textTheme().labelMedium,
                  ),
                  Text(
                    '${commitmentDate?.day}/${commitmentDate?.month}/${commitmentDate?.year}',
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    'Commitment Request Number (CRN)',
                    style: textTheme().labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                '$commitmentRequestNumber',
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Request Type',
                    style: textTheme().labelMedium,
                  ),
                  const SizedBox(width: 16.0),
                  OutlinedButton(
                    onPressed: () {
                      ref.read(commitmentProvider.notifier).serializeData();
                    },
                    child: const Text('Choose type'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
