import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class FilterController<T> extends StateNotifier<T> {
  FilterController(T state) : super(state);

  void cancel();

  void reset();

  void submit();
}
