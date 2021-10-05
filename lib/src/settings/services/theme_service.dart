import 'package:little_teyvat/hive/hive_constants.dart' as hive;
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<ThemeService> themeService = Provider<ThemeService>(
  (ProviderRef<ThemeService> ref) => ThemeService(),
);

class ThemeService {
  /// Returns the value of the theme key. Defaults to true.
  bool getThemeKey() {
    return Hive.box(hive.settingsBox).get(hive.themeKey) ?? true;
  }

  /// Updates the theme key with the new boolean value.
  void updateThemeKey(bool darkModeEnabled) async {
    Box<dynamic> settingsBox = Hive.box(hive.settingsBox);
    await settingsBox.put(hive.themeKey, darkModeEnabled);
  }
}
