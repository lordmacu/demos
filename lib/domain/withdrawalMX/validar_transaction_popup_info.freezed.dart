// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'validar_transaction_popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValidarTransactionPopupInfo {
  bool get result;
  String get message;
  int get popUpType;

  ValidarTransactionPopupInfo copyWith(
      {bool result, String message, int popUpType});
}

class _$ValidarTransactionPopupInfoTearOff {
  const _$ValidarTransactionPopupInfoTearOff();

  _ValidarTransactionPopupInfo call(
      {@required bool result,
      @required String message,
      @required int popUpType}) {
    return _ValidarTransactionPopupInfo(
      result: result,
      message: message,
      popUpType: popUpType,
    );
  }
}

const $ValidarTransactionPopupInfo = _$ValidarTransactionPopupInfoTearOff();

class _$_ValidarTransactionPopupInfo implements _ValidarTransactionPopupInfo {
  const _$_ValidarTransactionPopupInfo(
      {@required this.result, @required this.message, @required this.popUpType})
      : assert(result != null),
        assert(message != null),
        assert(popUpType != null);

  @override
  final bool result;
  @override
  final String message;
  @override
  final int popUpType;

  @override
  String toString() {
    return 'ValidarTransactionPopupInfo(result: $result, message: $message, popUpType: $popUpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ValidarTransactionPopupInfo &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.popUpType, popUpType) ||
                const DeepCollectionEquality()
                    .equals(other.popUpType, popUpType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(popUpType);

  @override
  _$_ValidarTransactionPopupInfo copyWith({
    Object result = freezed,
    Object message = freezed,
    Object popUpType = freezed,
  }) {
    return _$_ValidarTransactionPopupInfo(
      result: result == freezed ? this.result : result as bool,
      message: message == freezed ? this.message : message as String,
      popUpType: popUpType == freezed ? this.popUpType : popUpType as int,
    );
  }
}

abstract class _ValidarTransactionPopupInfo
    implements ValidarTransactionPopupInfo {
  const factory _ValidarTransactionPopupInfo(
      {@required bool result,
      @required String message,
      @required int popUpType}) = _$_ValidarTransactionPopupInfo;

  @override
  bool get result;
  @override
  String get message;
  @override
  int get popUpType;

  @override
  _ValidarTransactionPopupInfo copyWith(
      {bool result, String message, int popUpType});
}
