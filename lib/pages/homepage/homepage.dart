import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'widgets/top_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TopNavigationBar(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                List<String> recipents = ["9353924958"];

                await sendSMS(
                  message: "message as",
                  recipients: recipents,
                  sendDirect: true,
                ).catchError((onError) {
                  // print(onError);
                  return onError;
                });
                // print(result);
              },
              child: const Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
