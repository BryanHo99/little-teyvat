import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/settings/controllers/states/theme_state.dart';
import 'package:little_teyvat/src/settings/services/theme_service.dart';

final AutoDisposeStateNotifierProvider<ThemeController, ThemeState> themeController = StateNotifierProvider.autoDispose<ThemeController, ThemeState>(
  (AutoDisposeStateNotifierProviderRef<ThemeController, ThemeState> ref) {
    final bool darkModeEnabled = ref.watch(themeService).getThemeKey();
    final ThemeState themeState = ThemeState(
      darkModeEnabled: darkModeEnabled,
      themeMode: ThemeController._getThemeMode(darkModeEnabled),
    );

    return ThemeController._(ref.read, themeState);
  },
);

class ThemeController extends StateNotifier<ThemeState> {
  final Reader read;

  ThemeController._(this.read, ThemeState themeState) : super(themeState);

  /// Returns the respective theme mode.
  static ThemeMode _getThemeMode(bool darkModeEnabled) {
    return darkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  /// Animates forward if the theme is in dark mode, otherwise animate in reverse.
  void animate(AnimationController controller) {
    state.darkModeEnabled ? controller.forward() : controller.reverse();
  }

  /// Switches the theme between dark and light mode.
  void changeTheme(bool darkModeEnabled) async {
    state = state.copyWith(
      darkModeEnabled: darkModeEnabled,
      themeMode: _getThemeMode(darkModeEnabled),
    );

    read(themeService).updateThemeKey(darkModeEnabled);
  }
}
