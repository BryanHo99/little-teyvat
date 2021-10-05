import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/settings/models/locale_model.dart';
import 'package:little_teyvat/src/settings/settings_constants.dart' as constants;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<IMap<String, LocaleModel>> localesController = Provider<IMap<String, LocaleModel>>(
  (ProviderRef<IMap<String, LocaleModel>> ref) => const <String, LocaleModel>{
    constants.english: LocaleModel(
      languageName: constants.english,
      languageCode: constants.en,
      locale: Locale(constants.en),
    ),
    constants.chinese: LocaleModel(
      languageName: constants.chinese,
      languageCode: constants.zh,
      locale: Locale(constants.zh),
    ),
  }.lock,
);
