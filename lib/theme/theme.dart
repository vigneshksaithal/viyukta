import 'package:flutter/material.dart';

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
  );
}

DividerThemeData dividerThemeData() {
  return DividerThemeData(
    color: Colors.grey[300],
    thickness: 1.0,
    space: 44.0,
  );
}

OutlinedButtonThemeData outlineButtonThemeData() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 16.0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
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
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme(context) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(50),
      )),
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.grey[100],
      elevation: 0.5,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.grey[100],
    // foregroundColor: Colors.white,
    // toolbarTextStyle: const TextStyle(
    //   fontSize: 28.0,
    //   fontWeight: FontWeight.w800,
    //   color: Colors.black,
    // ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    elevation: 0,
    scrolledUnderElevation: 0.5,
    shadowColor: Colors.grey[100],
    titleSpacing: 16.0,
    surfaceTintColor: Colors.amber,
  );
}
