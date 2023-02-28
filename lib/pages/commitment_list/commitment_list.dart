import 'package:flutter/material.dart';

class CommitmentListPage extends StatelessWidget {
  const CommitmentListPage({super.key});

  static const commitmentList = [
    {
      'id': '1',
      'name': 'Commitment 1',
      'description': 'This is commitment 1',
      'status': 'active',
      'date': '2021-01-01',
      'amount': '1000',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            itemCount: commitmentList.length,
            itemBuilder: (context, index) {
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
                  onTap: () {},
                  title: Text('${commitment['id']}'),
                  trailing: Text(
                    '${commitment['status']}',
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
