import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  // Miscellaneous
  fontFamily: 'Genshin',
  splashFactory: InkRipple.splashFactory,

  // Colors
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.grey[100],
  canvasColor: Colors.white,

  // Schemes
  appBarTheme: const AppBarTheme().copyWith(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.black,
    secondary: Colors.white,
  ),
  iconTheme: const IconThemeData().copyWith(
    color: Colors.black,
  ),
  switchTheme: const SwitchThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(Colors.grey[500]),
  ),
  textTheme: const TextTheme().copyWith(
    bodyText2: const TextStyle(fontSize: 12),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  ),
);
