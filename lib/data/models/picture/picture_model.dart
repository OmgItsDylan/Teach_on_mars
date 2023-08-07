import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  @HiveType(typeId: 1)
  factory PictureModel({
    @HiveField(0) int? width,
    @HiveField(1) int? height,
    @HiveField(2) String? url,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);
}
