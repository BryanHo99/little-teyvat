import 'package:flutter/material.dart';
import 'package:little_teyvat/themes/themes.dart';

final ThemeData lightTheme = ThemeData(
  // Miscellaneous
  fontFamily: 'Genshin',
  splashFactory: InkRipple.splashFactory,

  // Colors
  primaryColor: kcBlack,
  scaffoldBackgroundColor: kcWhite,
  backgroundColor: kcGrey100,
  canvasColor: kcWhite,

  // Schemes
  appBarTheme: const AppBarTheme().copyWith(
    foregroundColor: kcBlack,
    backgroundColor: kcWhite,
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: kcBlack,
    secondary: kcWhite,
  ),
  iconTheme: const IconThemeData().copyWith(
    color: kcBlack,
  ),
  switchTheme: const SwitchThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(kcWhite),
    trackColor: MaterialStateProperty.all(kcGrey),
  ),
  textTheme: const TextTheme().copyWith(
    bodyText2: ktBody,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: kcBlack,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  ),
);
