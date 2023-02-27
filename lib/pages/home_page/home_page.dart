import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:viyukta/pages/commitment_form/commitment_form.dart';
import 'package:viyukta/pages/commitment_list/commitment_list.dart';
import 'package:viyukta/pages/home_page/widgets/organization_details_card.dart';

import '../../theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viyukta'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome! ',
                  style: textTheme().titleLarge,
                ),
              ),
              const SizedBox(height: 16.0),
              const OrganizationDetailsCard(),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const CommitmentForm(),
                    ),
                  );
                },
                child: const Text('Create New Commitment'),
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const CommitmentListPage(),
                    ),
                  );
                },
                child: const Text('View All Commitments'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
