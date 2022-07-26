import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/filters/controllers/filter_controller.dart';

final ProviderFamily<FilterSubmitController<Object>, IList<AutoDisposeStateNotifierProvider<FilterController<Object>, Object>>> filterSubmitController = Provider.family(
    (ProviderRef<FilterSubmitController<Object>> ref, IList<AutoDisposeStateNotifierProvider<FilterController<Object>, Object>> controllers) =>
        FilterSubmitController<Object>._(ref.read, controllers));

class FilterSubmitController<T> {
  final Reader read;
  final IList<AutoDisposeStateNotifierProvider<FilterController<T>, T>> controllers;

  const FilterSubmitController._(this.read, this.controllers);

  void cancelControllers() {
    for (AutoDisposeStateNotifierProvider<FilterController<T>, T> controller in controllers) {
      read(controller.notifier).cancel();
    }
  }

  void resetControllers() {
    for (AutoDisposeStateNotifierProvider<FilterController<T>, T> controller in controllers) {
      read(controller.notifier).reset();
    }
  }

  void submitControllers() {
    for (AutoDisposeStateNotifierProvider<FilterController<T>, T> controller in controllers) {
      read(controller.notifier).submit();
    }
  }
}
