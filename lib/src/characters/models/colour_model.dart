import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colour_model.freezed.dart';

@freezed
class ColourModel with _$ColourModel {
  const factory ColourModel({
    required Color foregroundColor,
    required Color backgroundColor,
  }) = _ColourModel;
}
