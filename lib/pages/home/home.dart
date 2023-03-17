import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../settings/settings.dart';
import 'widgets/organization_details_card.dart';
import '../commitment_form/commitment_form.dart';
import '../commitment_list/commitment_list.dart';

import '../upload_commitment/upload_commitment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          height: 96.0,
          'assets/images/viyukta-logo.png',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const Settings(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16.0),
                Card(
                  color: Colors.amber[400],
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Please add phone number in settings before using the app. To go to settings, click on gear icon above.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
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
                    child: const Text('Upload Commitment'),
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
