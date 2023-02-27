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
      'currency': 'INR',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Commitment List'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              // const Text('Commitment List'),
            ],
          ),
        ),
      ),
    );
  }
}
