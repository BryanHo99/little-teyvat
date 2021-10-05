import 'package:flutter/material.dart';
import 'package:little_teyvat/generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  /// Syntactic sugar to get the screen width.
  double get width => MediaQuery.of(this).size.width;

  /// Syntactic sugar to get the screen height.
  double get height => MediaQuery.of(this).size.height;

  /// Syntactic sugar to get the [AppLocalizations] instance for translating text.
  AppLocalizations get tr => AppLocalizations.of(this);

  /// Syntactic sugar to get the theme.
  ThemeData get theme => Theme.of(this);
}
