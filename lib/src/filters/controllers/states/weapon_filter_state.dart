import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/filters/models/weapon_filter_model.dart';

part 'weapon_filter_state.freezed.dart';

@freezed
class WeaponFilterState with _$WeaponFilterState {
  const factory WeaponFilterState({
    @Default(WeaponFilterModel()) WeaponFilterModel filter,
    @Default(WeaponFilterModel()) WeaponFilterModel temp,
  }) = _WeaponFilterState;
}
