import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/filters/controllers/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/rarity_filter_state.dart';

final AutoDisposeStateNotifierProvider<FilterRarityController, RarityFilterState> filterRarityController =
    StateNotifierProvider.autoDispose<FilterRarityController, RarityFilterState>(
        (AutoDisposeStateNotifierProviderRef<FilterRarityController, RarityFilterState> ref) => FilterRarityController());

class FilterRarityController extends FilterController<RarityFilterState> {
  FilterRarityController() : super(const RarityFilterState());

  @override
  void cancel() {
    state = state.copyWith(filter: state.temp);
  }

  @override
  void reset() {
    state = state.copyWith(
      filter: const RarityFilterState().filter,
    );
  }

  @override
  void submit() {
    state = state.copyWith(temp: state.filter);
  }

  void toggleRarity(double value) {
    state = state.copyWith(filter: value);
  }
}
