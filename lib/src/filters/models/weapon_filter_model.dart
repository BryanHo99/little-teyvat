import 'package:freezed_annotation/freezed_annotation.dart';

part 'weapon_filter_model.freezed.dart';

@freezed
class WeaponFilterModel with _$WeaponFilterModel{
  const factory WeaponFilterModel({
    @Default(true) final bool sword,
    @Default(true) final bool claymore,
    @Default(true) final bool polearm,
    @Default(true) final bool catalyst,
    @Default(true) final bool bow,
  }) = _WeaponFilterModel;
}
