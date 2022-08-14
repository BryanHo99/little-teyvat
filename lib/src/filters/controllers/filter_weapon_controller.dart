import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/weapon_filter_state.dart';
import 'package:little_teyvat/src/filters/models/weapon_filter_model.dart';

final AutoDisposeStateNotifierProvider<FilterWeaponController, WeaponFilterState> filterWeaponController =
    StateNotifierProvider.autoDispose<FilterWeaponController, WeaponFilterState>(
        (AutoDisposeStateNotifierProviderRef<FilterWeaponController, WeaponFilterState> ref) => FilterWeaponController());

class FilterWeaponController extends FilterController<WeaponFilterState> {
  FilterWeaponController() : super(const WeaponFilterState());

  @override
  void cancel() {
    state = state.copyWith(filter: state.temp);
  }

  @override
  void reset() {
    state = state.copyWith(filter: const WeaponFilterModel());
  }

  @override
  void submit() {
    state = state.copyWith(temp: state.filter);
  }

  void toggleBow() {
    final WeaponFilterModel filter = state.filter.copyWith(bow: !state.filter.bow);
    state = state.copyWith(filter: filter);
  }

  void toggleCatalyst() {
    final WeaponFilterModel filter = state.filter.copyWith(catalyst: !state.filter.catalyst);
    state = state.copyWith(filter: filter);
  }

  void toggleClaymore() {
    final WeaponFilterModel filter = state.filter.copyWith(claymore: !state.filter.claymore);
    state = state.copyWith(filter: filter);
  }

  void togglePolearm() {
    final WeaponFilterModel filter = state.filter.copyWith(polearm: !state.filter.polearm);
    state = state.copyWith(filter: filter);
  }

  void toggleSword() {
    final WeaponFilterModel filter = state.filter.copyWith(sword: !state.filter.sword);
    state = state.copyWith(filter: filter);
  }
}
