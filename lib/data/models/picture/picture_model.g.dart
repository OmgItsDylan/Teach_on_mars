// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PictureModelAdapter extends TypeAdapter<_$_PictureModel> {
  @override
  final int typeId = 1;

  @override
  _$_PictureModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PictureModel(
      width: fields[0] as int?,
      height: fields[1] as int?,
      url: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PictureModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PictureModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PictureModel _$$_PictureModelFromJson(Map<String, dynamic> json) =>
    _$_PictureModel(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_PictureModelToJson(_$_PictureModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
