import 'package:little_teyvat/src/filters/controllers/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/element_filter_state.dart';
import 'package:little_teyvat/src/filters/models/element_filter_model.dart';

class ElementFilterController extends FilterController<ElementFilterState> {
  ElementFilterController() : super(const ElementFilterState());

  @override
  void cancel() {
    state = state.copyWith(filter: state.temp);
  }

  @override
  void reset() {
    state = state.copyWith(filter: const ElementFilterModel());
  }

  @override
  void submit() {
    state = state.copyWith(temp: state.filter);
  }

  void toggleAnemo() {
    final ElementFilterModel filter = state.filter.copyWith(anemo: !state.filter.anemo);
    state = state.copyWith(filter: filter);
  }

  void toggleCryo() {
    final ElementFilterModel filter = state.filter.copyWith(cryo: !state.filter.cryo);
    state = state.copyWith(filter: filter);
  }

  void toggleDendro() {
    final ElementFilterModel filter = state.filter.copyWith(dendro: !state.filter.dendro);
    state = state.copyWith(filter: filter);
  }

  void toggleElectro() {
    final ElementFilterModel filter = state.filter.copyWith(electro: !state.filter.electro);
    state = state.copyWith(filter: filter);
  }

  void toggleGeo() {
    final ElementFilterModel filter = state.filter.copyWith(geo: !state.filter.geo);
    state = state.copyWith(filter: filter);
  }

  void toggleHydro() {
    final ElementFilterModel filter = state.filter.copyWith(hydro: !state.filter.hydro);
    state = state.copyWith(filter: filter);
  }

  void togglePyro() {
    final ElementFilterModel filter = state.filter.copyWith(pyro: !state.filter.pyro);
    state = state.copyWith(filter: filter);
  }
}
