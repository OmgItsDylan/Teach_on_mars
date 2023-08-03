import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  factory PictureModel({
    int? width,
    int? height,
    String? url,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);
}
