import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],

    appBarTheme: appBarTheme(),
    // primaryColor: Colors.green[500],
    elevatedButtonTheme: elevatedButtonTheme(context),
    outlinedButtonTheme: outlineButtonThemeData(),
    textButtonTheme: textButtonTheme(),
    textTheme: textTheme(),
    cardTheme: cardTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    dividerTheme: dividerThemeData(),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      ),
    ),
  );
}

DividerThemeData dividerThemeData() {
  return DividerThemeData(
    color: Colors.grey[300],
    thickness: 1.0,
    space: 44.0,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    labelStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 16.0,
    ),
    filled: true,
    fillColor: Colors.grey[100],
  );
}

CardTheme cardTheme() {
  return CardTheme(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    elevation: 0.5,
    shadowColor: Colors.grey[200],
    margin: const EdgeInsets.all(0),
    color: Colors.white,
  );
}

TextTheme textTheme() {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.grey[900],
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: Colors.grey[900],
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.blue[800],
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.grey[800],
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.grey[600],
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey[800],
    ),
  );
}

TextButtonThemeData textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

OutlinedButtonThemeData outlineButtonThemeData() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: Colors.grey[500]!,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme(context) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      )),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.grey[100],
      elevation: 0.5,
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: kBackgroundColor,
    iconTheme: const IconThemeData(
      color: Colors.black,
      weight: 800,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    elevation: 0,
    scrolledUnderElevation: 0.5,
    shadowColor: Colors.grey[100],
    titleSpacing: 16.0,
  );
}
