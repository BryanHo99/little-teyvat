import 'package:freezed_annotation/freezed_annotation.dart';

part 'element_filter_model.freezed.dart';

@freezed
class ElementFilterModel with _$ElementFilterModel {
  const factory ElementFilterModel({
    @Default(true) bool pyro,
    @Default(true) bool hydro,
    @Default(true) bool electro,
    @Default(true) bool cryo,
    @Default(true) bool anemo,
    @Default(true) bool geo,
    @Default(true) bool dendro,
  }) = _ElementFilterModel;
}
