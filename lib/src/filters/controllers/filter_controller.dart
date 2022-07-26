import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class FilterController<T> extends StateNotifier<T> {
  FilterController(T state) : super(state);

  /// Reverts back to the previous configuration. Filter bottom sheet is collapsed after this.
  void cancel();

  /// Resets everything to the default configuration. Does not collapse the filter bottom sheet.
  ///
  /// Intended as a convenience so that users do not need to manually toggle every option back.
  void reset();

  /// Apply filter configurations. The previous configuration is now the same as the current one.
  void submit();
}
