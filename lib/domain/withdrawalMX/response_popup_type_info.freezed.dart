// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'response_popup_type_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ResponsePopUpTypeInfo {
  int get popUpType;

  ResponsePopUpTypeInfo copyWith({int popUpType});
}

class _$ResponsePopUpTypeInfoTearOff {
  const _$ResponsePopUpTypeInfoTearOff();

  _ResponsePopUpTypeInfo call({@required int popUpType}) {
    return _ResponsePopUpTypeInfo(
      popUpType: popUpType,
    );
  }
}

const $ResponsePopUpTypeInfo = _$ResponsePopUpTypeInfoTearOff();

class _$_ResponsePopUpTypeInfo implements _ResponsePopUpTypeInfo {
  const _$_ResponsePopUpTypeInfo({@required this.popUpType})
      : assert(popUpType != null);

  @override
  final int popUpType;

  @override
  String toString() {
    return 'ResponsePopUpTypeInfo(popUpType: $popUpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponsePopUpTypeInfo &&
            (identical(other.popUpType, popUpType) ||
                const DeepCollectionEquality()
                    .equals(other.popUpType, popUpType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(popUpType);

  @override
  _$_ResponsePopUpTypeInfo copyWith({
    Object popUpType = freezed,
  }) {
    return _$_ResponsePopUpTypeInfo(
      popUpType: popUpType == freezed ? this.popUpType : popUpType as int,
    );
  }
}

abstract class _ResponsePopUpTypeInfo implements ResponsePopUpTypeInfo {
  const factory _ResponsePopUpTypeInfo({@required int popUpType}) =
      _$_ResponsePopUpTypeInfo;

  @override
  int get popUpType;

  @override
  _ResponsePopUpTypeInfo copyWith({int popUpType});
}
