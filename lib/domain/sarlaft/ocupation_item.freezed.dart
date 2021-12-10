// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ocupation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$OcupationItem {
  String get id;
  String get name;
  String get code;

  OcupationItem copyWith({String id, String name, String code});
}

class _$OcupationItemTearOff {
  const _$OcupationItemTearOff();

  _OcupationItem call(
      {@required String id, @required String name, @required String code}) {
    return _OcupationItem(
      id: id,
      name: name,
      code: code,
    );
  }
}

const $OcupationItem = _$OcupationItemTearOff();

class _$_OcupationItem implements _OcupationItem {
  const _$_OcupationItem(
      {@required this.id, @required this.name, @required this.code})
      : assert(id != null),
        assert(name != null),
        assert(code != null);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'OcupationItem(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OcupationItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code);

  @override
  _$_OcupationItem copyWith({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
  }) {
    return _$_OcupationItem(
      id: id == freezed ? this.id : id as String,
      name: name == freezed ? this.name : name as String,
      code: code == freezed ? this.code : code as String,
    );
  }
}

abstract class _OcupationItem implements OcupationItem {
  const factory _OcupationItem(
      {@required String id,
      @required String name,
      @required String code}) = _$_OcupationItem;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;

  @override
  _OcupationItem copyWith({String id, String name, String code});
}
