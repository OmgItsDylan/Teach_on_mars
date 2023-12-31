// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) {
  return _PictureModel.fromJson(json);
}

/// @nodoc
mixin _$PictureModel {
  @HiveField(0)
  int? get width => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get height => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PictureModelCopyWith<PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureModelCopyWith<$Res> {
  factory $PictureModelCopyWith(
          PictureModel value, $Res Function(PictureModel) then) =
      _$PictureModelCopyWithImpl<$Res, PictureModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? width,
      @HiveField(1) int? height,
      @HiveField(2) String? url});
}

/// @nodoc
class _$PictureModelCopyWithImpl<$Res, $Val extends PictureModel>
    implements $PictureModelCopyWith<$Res> {
  _$PictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PictureModelCopyWith<$Res>
    implements $PictureModelCopyWith<$Res> {
  factory _$$_PictureModelCopyWith(
          _$_PictureModel value, $Res Function(_$_PictureModel) then) =
      __$$_PictureModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? width,
      @HiveField(1) int? height,
      @HiveField(2) String? url});
}

/// @nodoc
class __$$_PictureModelCopyWithImpl<$Res>
    extends _$PictureModelCopyWithImpl<$Res, _$_PictureModel>
    implements _$$_PictureModelCopyWith<$Res> {
  __$$_PictureModelCopyWithImpl(
      _$_PictureModel _value, $Res Function(_$_PictureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_PictureModel(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_PictureModel implements _PictureModel {
  _$_PictureModel(
      {@HiveField(0) this.width,
      @HiveField(1) this.height,
      @HiveField(2) this.url});

  factory _$_PictureModel.fromJson(Map<String, dynamic> json) =>
      _$$_PictureModelFromJson(json);

  @override
  @HiveField(0)
  final int? width;
  @override
  @HiveField(1)
  final int? height;
  @override
  @HiveField(2)
  final String? url;

  @override
  String toString() {
    return 'PictureModel(width: $width, height: $height, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PictureModel &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PictureModelCopyWith<_$_PictureModel> get copyWith =>
      __$$_PictureModelCopyWithImpl<_$_PictureModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PictureModelToJson(
      this,
    );
  }
}

abstract class _PictureModel implements PictureModel {
  factory _PictureModel(
      {@HiveField(0) final int? width,
      @HiveField(1) final int? height,
      @HiveField(2) final String? url}) = _$_PictureModel;

  factory _PictureModel.fromJson(Map<String, dynamic> json) =
      _$_PictureModel.fromJson;

  @override
  @HiveField(0)
  int? get width;
  @override
  @HiveField(1)
  int? get height;
  @override
  @HiveField(2)
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_PictureModelCopyWith<_$_PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
