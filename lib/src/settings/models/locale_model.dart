import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_model.freezed.dart';

@freezed
class LocaleModel with _$LocaleModel {
  const factory LocaleModel({
    required String languageName,
    required String languageCode,
    required Locale locale,
  }) = _LocaleModel;
}
