import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viyukta/provider/commitment_list.dart';
import 'package:viyukta/theme/theme.dart';

class CommitmentListPage extends ConsumerWidget {
  const CommitmentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List commitmentList = ref.watch(commitmentListProvider).commitmentList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commitment List'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: commitmentList.length,
            itemBuilder: (context, index) {
              final commitment = commitmentList[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(24.0),
                  onTap: () {},
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Expanded(
                          child: Text(
                            '${commitment['description']}',
                            style: textTheme().bodySmall?.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '${commitment['requestNumber']}',
                        style: textTheme().bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.clip,
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
                      // const SizedBox(height: 24),
                      // Text(
                      //   '${commitment['amount']}',
                      //   style: textTheme().bodySmall?.copyWith(
                      //       color: Colors.grey[600],
                      //       fontWeight: FontWeight.w500),
                      // ),
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
