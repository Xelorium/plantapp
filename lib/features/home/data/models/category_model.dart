import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String title,
    required int rank,
    @JsonKey(toJson: _imageToJson, fromJson: _imageFromJson) required CategoryImage? image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

Map<String, dynamic>? _imageToJson(CategoryImage? image) => image?.toJson();
CategoryImage? _imageFromJson(Map<String, dynamic>? json) => 
    json == null ? null : CategoryImage.fromJson(json);

@freezed
abstract class CategoryImage with _$CategoryImage {
  const factory CategoryImage({
    required int id,
    required String url,
  }) = _CategoryImage;

  factory CategoryImage.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageFromJson(json);
}
