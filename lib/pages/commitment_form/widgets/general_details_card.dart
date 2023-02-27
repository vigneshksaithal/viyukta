import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagepack/messagepack.dart';
import 'package:viyukta/provider/commitment_provider.dart';

import '../../../theme/theme.dart';

class GeneralDetailsCard extends ConsumerWidget {
  GeneralDetailsCard({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  // String businessName = useProvider(commitmentProvider).businessName.toString();

  // var businessNameController = useTextEditingController();

  // useEffect(() {
  // businessNameController.text = businessName;
  // });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commtmentProvider = ref.watch(commitmentProvider);
    final commitmentDate = commtmentProvider.commitmentDate;
    String? commitmentRequestNumber = commtmentProvider.commitmentRequestNumber;

    void simple() {
      final p = Packer()
        ..packString('key1') //pack key1
        ..packString('100-109-20001') //pack value1
        ..packString('key2') //pack key2
        ..packDouble(300000.65);

      final bytes = p.takeBytes(); //Uint8List

      print('Length: ${p.takeBytes()}');

      final u = Unpacker(bytes);

      final n1 = u.unpackString();
      final n2 = u.unpackString();
      // print('unpacked n1=$n1 n2=$n2');

      // print('unpack bytes: ${Unpacker.fromList(bytes).toString()}');
    }

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
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Text(
                    'Submission Date $commitmentRequestNumber',
                    style: textTheme().labelMedium,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    '${commitmentDate.day}/${commitmentDate.month}/${commitmentDate.year}',
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Text(
                    'Commitment Request Number',
                    style: textTheme().labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                '$commitmentRequestNumber',
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
                    onPressed: () {
                      simple();
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
