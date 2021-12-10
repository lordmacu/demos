// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingResult {
  int get id;
  String get title;
  String get subtitle;
  String get description;
  String get connectedProfileId;
  String get image;

  ProfilingResult copyWith(
      {int id,
      String title,
      String subtitle,
      String description,
      String connectedProfileId,
      String image});
}

class _$ProfilingResultTearOff {
  const _$ProfilingResultTearOff();

  _ProfilingResult call(
      {@required int id,
      @required String title,
      @required String subtitle,
      @required String description,
      @required String connectedProfileId,
      @required String image}) {
    return _ProfilingResult(
      id: id,
      title: title,
      subtitle: subtitle,
      description: description,
      connectedProfileId: connectedProfileId,
      image: image,
    );
  }
}

const $ProfilingResult = _$ProfilingResultTearOff();

class _$_ProfilingResult implements _ProfilingResult {
  const _$_ProfilingResult(
      {@required this.id,
      @required this.title,
      @required this.subtitle,
      @required this.description,
      @required this.connectedProfileId,
      @required this.image})
      : assert(id != null),
        assert(title != null),
        assert(subtitle != null),
        assert(description != null),
        assert(connectedProfileId != null),
        assert(image != null);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;
  @override
  final String connectedProfileId;
  @override
  final String image;

  @override
  String toString() {
    return 'ProfilingResult(id: $id, title: $title, subtitle: $subtitle, description: $description, connectedProfileId: $connectedProfileId, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.connectedProfileId, connectedProfileId) ||
                const DeepCollectionEquality()
                    .equals(other.connectedProfileId, connectedProfileId)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(connectedProfileId) ^
      const DeepCollectionEquality().hash(image);

  @override
  _$_ProfilingResult copyWith({
    Object id = freezed,
    Object title = freezed,
    Object subtitle = freezed,
    Object description = freezed,
    Object connectedProfileId = freezed,
    Object image = freezed,
  }) {
    return _$_ProfilingResult(
      id: id == freezed ? this.id : id as int,
      title: title == freezed ? this.title : title as String,
      subtitle: subtitle == freezed ? this.subtitle : subtitle as String,
      description:
          description == freezed ? this.description : description as String,
      connectedProfileId: connectedProfileId == freezed
          ? this.connectedProfileId
          : connectedProfileId as String,
      image: image == freezed ? this.image : image as String,
    );
  }
}

abstract class _ProfilingResult implements ProfilingResult {
  const factory _ProfilingResult(
      {@required int id,
      @required String title,
      @required String subtitle,
      @required String description,
      @required String connectedProfileId,
      @required String image}) = _$_ProfilingResult;

  @override
  int get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get description;
  @override
  String get connectedProfileId;
  @override
  String get image;

  @override
  _ProfilingResult copyWith(
      {int id,
      String title,
      String subtitle,
      String description,
      String connectedProfileId,
      String image});
}
