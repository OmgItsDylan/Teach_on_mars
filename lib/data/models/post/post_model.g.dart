// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as String?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      picture: json['picture'] == null
          ? null
          : PictureModel.fromJson(json['picture'] as Map<String, dynamic>),
      author: json['author'] as String?,
      excerpt: json['excerpt'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'picture': instance.picture,
      'author': instance.author,
      'excerpt': instance.excerpt,
      'text': instance.text,
    };
