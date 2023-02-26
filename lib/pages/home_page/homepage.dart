import 'package:flutter/material.dart';

import 'widgets/commitment_details_card.dart';
import 'widgets/general_details_card.dart';
import 'widgets/top_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopNavigationBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  // height: ,
                  child: GeneralDetailsCard(),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: CommitmentDetailsCard(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Submit'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
