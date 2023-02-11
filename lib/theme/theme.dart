import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.blue[400],
    foregroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    elevation: 0,
    centerTitle: true,
  );
}
