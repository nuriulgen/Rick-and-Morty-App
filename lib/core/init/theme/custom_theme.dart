import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  // Singleton
  CustomTheme._();
  static final instance = CustomTheme._();

  final lightTheme = ThemeData(
    // customized for light theme.
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF01b4c6),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  );

  final darkTheme = ThemeData(
    // customized for dark theme.
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.black),
    ),
    scaffoldBackgroundColor: const Color(0xFF202428),
  );
}
