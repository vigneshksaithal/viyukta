import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme(),
    primaryColor: Colors.blue[500],
    elevatedButtonTheme: elevatedButtonTheme(context),
    textButtonTheme: textButtonTheme(),
    textTheme: textTheme(),
    cardTheme: cardTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

CardTheme cardTheme() {
  return const CardTheme();
}

TextTheme textTheme() {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.blue[800],
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.grey[700],
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.blue[800],
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.grey[700],
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.grey[600],
    ),
  );
}

TextButtonThemeData textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme(context) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.blue[500],
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    elevation: 0,
  );
}
