import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/hive/hive_constants.dart' as hive;
import 'package:little_teyvat/src/settings/settings_constants.dart' as constants;

final Provider<LanguageService> languageService = Provider<LanguageService>(
  (ProviderRef<LanguageService> ref) => LanguageService(),
);

class LanguageService {
  /// Returns the value of the language key. Defaults to English.
  String getLanguageKey() {
    return Hive.box(hive.settingsBox).get(hive.languageKey) ?? constants.en;
  }

  /// Updates the language key with the new language code.
  void updateLanguageKey(String languageCode) async {
    Box<dynamic> settingsBox = Hive.box(hive.settingsBox);
    await settingsBox.put(hive.languageKey, languageCode);
  }
}
