import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  // Miscellaneous
  fontFamily: 'Genshin',
  splashFactory: InkRipple.splashFactory,

  // Colors
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey[900],
  backgroundColor: Colors.grey[900],
  canvasColor: Colors.grey[850],

  // Schemes
  appBarTheme: const AppBarTheme().copyWith(
    color: Colors.black,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.white,
    secondary: Colors.black,
  ),
  iconTheme: const IconThemeData().copyWith(
    color: Colors.white,
  ),
  switchTheme: const SwitchThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(Colors.grey[500]),
  ),
  textTheme: const TextTheme().copyWith(
    bodyText2: const TextStyle(fontSize: 12),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[500],
  ),
  cardTheme: const CardTheme().copyWith(
    color: Colors.grey[800],
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  ),
);
