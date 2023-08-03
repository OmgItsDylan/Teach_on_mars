import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teach_on_mars_test/data/models/picture/picture_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    String? id,
    int? type,
    String? title,
    PictureModel? picture,
    String? author,
    String? excerpt,
    String? text,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
