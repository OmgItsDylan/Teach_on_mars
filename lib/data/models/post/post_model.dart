import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:teach_on_mars_test/data/models/picture/picture_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel extends HiveObject with _$PostModel {
  @HiveType(typeId: 0)
  factory PostModel({
    @HiveField(0) String? id,
    @HiveField(1) int? type,
    @HiveField(2) String? title,
    @HiveField(3) PictureModel? picture,
    @HiveField(4) String? author,
    @HiveField(5) String? excerpt,
    @HiveField(6) String? text,
  }) = _PostModel;
  PostModel._();

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
