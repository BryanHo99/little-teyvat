import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/settings/controllers/locales_controller.dart';
import 'package:little_teyvat/src/settings/models/locale_model.dart';
import 'package:little_teyvat/src/settings/services/language_service.dart';
import 'package:little_teyvat/src/settings/settings_constants.dart' as constants;

final AutoDisposeStateNotifierProvider<LanguageController, LocaleModel> languageController = StateNotifierProvider.autoDispose<LanguageController, LocaleModel>(
  (AutoDisposeStateNotifierProviderRef<LanguageController, LocaleModel> ref) {
    final String languageCode = ref.watch(languageService).getLanguageKey();
    final IMap<String, LocaleModel> locales = ref.watch(localesController);
    final LocaleModel localeModel = locales[constants.languages[languageCode]!] ?? locales.entries.first.value;

    return LanguageController._(ref.read, localeModel);
  },
);

class LanguageController extends StateNotifier<LocaleModel> {
  final Reader read;

  LanguageController._(this.read, LocaleModel localeModel) : super(localeModel);

  /// Changes the app's locale.
  void changeLocale(LocaleModel localeModel) {
    // If the same locale is selected, do not update.
    if (state != localeModel) {
      state = localeModel;

      // Update Hive database with the new language key.
      read(languageService).updateLanguageKey(localeModel.languageCode);
    }
  }
}
