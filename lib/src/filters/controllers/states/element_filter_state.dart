import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/filters/models/element_filter_model.dart';

part 'element_filter_state.freezed.dart';

@freezed
class ElementFilterState with _$ElementFilterState {
  const factory ElementFilterState({
    @Default(ElementFilterModel()) ElementFilterModel filter,
    @Default(ElementFilterModel()) ElementFilterModel temp,
  }) = _ElementFilterState;
}
