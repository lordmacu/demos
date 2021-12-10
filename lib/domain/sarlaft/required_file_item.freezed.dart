// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'required_file_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RequiredFileItem {
  int get id;
  String get name;
  bool get isRequired;
  int get maxSizeKB;

  RequiredFileItem copyWith(
      {int id, String name, bool isRequired, int maxSizeKB});
}

class _$RequiredFileItemTearOff {
  const _$RequiredFileItemTearOff();

  _RequiredFileItem call(
      {@required int id,
      @required String name,
      @required bool isRequired,
      @required int maxSizeKB}) {
    return _RequiredFileItem(
      id: id,
      name: name,
      isRequired: isRequired,
      maxSizeKB: maxSizeKB,
    );
  }
}

const $RequiredFileItem = _$RequiredFileItemTearOff();

class _$_RequiredFileItem implements _RequiredFileItem {
  const _$_RequiredFileItem(
      {@required this.id,
      @required this.name,
      @required this.isRequired,
      @required this.maxSizeKB})
      : assert(id != null),
        assert(name != null),
        assert(isRequired != null),
        assert(maxSizeKB != null);

  @override
  final int id;
  @override
  final String name;
  @override
  final bool isRequired;
  @override
  final int maxSizeKB;

  @override
  String toString() {
    return 'RequiredFileItem(id: $id, name: $name, isRequired: $isRequired, maxSizeKB: $maxSizeKB)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequiredFileItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isRequired, isRequired) ||
                const DeepCollectionEquality()
                    .equals(other.isRequired, isRequired)) &&
            (identical(other.maxSizeKB, maxSizeKB) ||
                const DeepCollectionEquality()
                    .equals(other.maxSizeKB, maxSizeKB)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isRequired) ^
      const DeepCollectionEquality().hash(maxSizeKB);

  @override
  _$_RequiredFileItem copyWith({
    Object id = freezed,
    Object name = freezed,
    Object isRequired = freezed,
    Object maxSizeKB = freezed,
  }) {
    return _$_RequiredFileItem(
      id: id == freezed ? this.id : id as int,
      name: name == freezed ? this.name : name as String,
      isRequired: isRequired == freezed ? this.isRequired : isRequired as bool,
      maxSizeKB: maxSizeKB == freezed ? this.maxSizeKB : maxSizeKB as int,
    );
  }
}

abstract class _RequiredFileItem implements RequiredFileItem {
  const factory _RequiredFileItem(
      {@required int id,
      @required String name,
      @required bool isRequired,
      @required int maxSizeKB}) = _$_RequiredFileItem;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get isRequired;
  @override
  int get maxSizeKB;

  @override
  _RequiredFileItem copyWith(
      {int id, String name, bool isRequired, int maxSizeKB});
}
