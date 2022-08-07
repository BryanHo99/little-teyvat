import 'package:flutter/material.dart';
import 'package:little_teyvat/themes/themes.dart';

final ThemeData darkTheme = ThemeData(
  // Miscellaneous
  fontFamily: 'Genshin',
  splashFactory: InkRipple.splashFactory,

  // Colors
  primaryColor: kcWhite,
  scaffoldBackgroundColor: kcGrey900,
  backgroundColor: kcGrey900,
  canvasColor: kcGrey850,

  // Schemes
  appBarTheme: const AppBarTheme().copyWith(
    color: kcBlack,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: kcBlack,
    secondary: kcGrey850,
    tertiary: kcWhite,
  ),
  iconTheme: const IconThemeData().copyWith(
    color: kcWhite,
  ),
  switchTheme: const SwitchThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(kcWhite),
    trackColor: MaterialStateProperty.all(kcGrey),
  ),
  textTheme: const TextTheme().copyWith(
    bodyText2: ktBody,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: kcWhite,
    unselectedItemColor: kcGrey,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kcGrey800,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  ),
);
