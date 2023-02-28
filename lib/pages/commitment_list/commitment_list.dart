import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viyukta/provider/commitment_list.dart';
import 'package:viyukta/theme/theme.dart';

class CommitmentListPage extends ConsumerWidget {
  const CommitmentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commitment List'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8.0,
          ),
          child: ListView.builder(
            itemCount: ref.watch(commitmentListProvider).commitmentList.length,
            itemBuilder: (context, index) {
              final commitmentList =
                  ref.watch(commitmentListProvider).commitmentList;

              final commitment = commitmentList[index];
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                    ),
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  onTap: () {},
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${commitment['description']}',
                        style: textTheme().bodySmall?.copyWith(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '${commitment['requestNumber']}',
                        style: textTheme().bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        commitment['isApproved'] ? 'Approved' : 'Denied',
                        style: textTheme().bodySmall?.copyWith(
                              color: commitment['isApproved']
                                  ? Colors.green[500]
                                  : Colors.red[600],
                            ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '${commitment['amount']}',
                        style: textTheme().bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
