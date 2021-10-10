import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/strapi/strapi_constants.dart' as constants;

part 'strapi_image_model.freezed.dart';
part 'strapi_image_model.g.dart';

@freezed
class StrapiImageModel with _$StrapiImageModel {
  const StrapiImageModel._();

  const factory StrapiImageModel({
    required String name,
    required String url,
  }) = _StrapiImageModel;

  factory StrapiImageModel.fromJson(Map<String, dynamic> json) => _$StrapiImageModelFromJson(json);

  String get imageUrl => '${dotenv.env[constants.strapiUrl]!}$url';
}
