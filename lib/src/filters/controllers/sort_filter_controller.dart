import 'package:little_teyvat/src/filters/controllers/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/sort_filter_state.dart';
import 'package:little_teyvat/src/filters/models/sort_filter_model.dart';

class SortFilterController extends FilterController<SortFilterState> {
  final String selected;

  SortFilterController(this.selected)
      : super(
          SortFilterState(
            filter: SortFilterModel(selected: selected),
            temp: SortFilterModel(selected: selected),
          ),
        );

  @override
  void cancel() {
    state = state.copyWith(filter: state.temp);
  }

  @override
  void reset() {
    state = state.copyWith(
      filter: SortFilterModel(selected: selected),
    );
  }

  @override
  void submit() {
    state = state.copyWith(temp: state.filter);
  }

  void toggleSortOrder(bool isAscendingOrder) {
    state = state.copyWith(filter: state.filter.copyWith(isAscendingOrder: isAscendingOrder));
  }

  void toggleSortType(String sortType) {
    state = state.copyWith(filter: state.filter.copyWith(selected: sortType));
  }
}
