import 'package:flutter/material.dart';

import 'widgets/organization_details_card.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                OrganizationDetailsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
