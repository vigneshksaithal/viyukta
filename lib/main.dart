import 'package:flutter/material.dart';

import 'pages/homepage/homepage.dart';
import 'theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(context),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
