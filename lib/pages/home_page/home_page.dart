import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:viyukta/pages/commitment_form/commitment_form.dart';
import 'package:viyukta/pages/commitment_list/commitment_list.dart';
import 'package:viyukta/pages/home_page/widgets/organization_details_card.dart';

import '../upload_commitment/upload_commitment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          height: 96.0,
          'assets/viyukta-logo.png',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OrganizationDetailsCard(),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: UploadCommitment(),
                        ),
                      );
                    },
                    child: const Text('Upload Commitment (CSV)'),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const CommitmentListPage(),
                      ),
                    );
                  },
                  child: const Text('View Commitments'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
