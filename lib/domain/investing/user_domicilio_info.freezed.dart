// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_domicilio_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$UserDomicilioInfo {
  String get calle;
  String get numExt;
  String get numInt;
  String get colonia;
  String get postal;
  String get estado;
  String get municipio;
  String get estado2;

  UserDomicilioInfo copyWith(
      {String calle,
      String numExt,
      String numInt,
      String colonia,
      String postal,
      String estado,
      String municipio,
      String estado2});
}

class _$UserDomicilioInfoTearOff {
  const _$UserDomicilioInfoTearOff();

  _UserDomicilioInfo call(
      {@required String calle,
      @required String numExt,
      @required String numInt,
      @required String colonia,
      @required String postal,
      @required String estado,
      @required String municipio,
      @required String estado2}) {
    return _UserDomicilioInfo(
      calle: calle,
      numExt: numExt,
      numInt: numInt,
      colonia: colonia,
      postal: postal,
      estado: estado,
      municipio: municipio,
      estado2: estado2,
    );
  }
}

const $UserDomicilioInfo = _$UserDomicilioInfoTearOff();

class _$_UserDomicilioInfo implements _UserDomicilioInfo {
  const _$_UserDomicilioInfo(
      {@required this.calle,
      @required this.numExt,
      @required this.numInt,
      @required this.colonia,
      @required this.postal,
      @required this.estado,
      @required this.municipio,
      @required this.estado2})
      : assert(calle != null),
        assert(numExt != null),
        assert(numInt != null),
        assert(colonia != null),
        assert(postal != null),
        assert(estado != null),
        assert(municipio != null),
        assert(estado2 != null);

  @override
  final String calle;
  @override
  final String numExt;
  @override
  final String numInt;
  @override
  final String colonia;
  @override
  final String postal;
  @override
  final String estado;
  @override
  final String municipio;
  @override
  final String estado2;

  @override
  String toString() {
    return 'UserDomicilioInfo(calle: $calle, numExt: $numExt, numInt: $numInt, colonia: $colonia, postal: $postal, estado: $estado, municipio: $municipio, estado2: $estado2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDomicilioInfo &&
            (identical(other.calle, calle) ||
                const DeepCollectionEquality().equals(other.calle, calle)) &&
            (identical(other.numExt, numExt) ||
                const DeepCollectionEquality().equals(other.numExt, numExt)) &&
            (identical(other.numInt, numInt) ||
                const DeepCollectionEquality().equals(other.numInt, numInt)) &&
            (identical(other.colonia, colonia) ||
                const DeepCollectionEquality()
                    .equals(other.colonia, colonia)) &&
            (identical(other.postal, postal) ||
                const DeepCollectionEquality().equals(other.postal, postal)) &&
            (identical(other.estado, estado) ||
                const DeepCollectionEquality().equals(other.estado, estado)) &&
            (identical(other.municipio, municipio) ||
                const DeepCollectionEquality()
                    .equals(other.municipio, municipio)) &&
            (identical(other.estado2, estado2) ||
                const DeepCollectionEquality().equals(other.estado2, estado2)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calle) ^
      const DeepCollectionEquality().hash(numExt) ^
      const DeepCollectionEquality().hash(numInt) ^
      const DeepCollectionEquality().hash(colonia) ^
      const DeepCollectionEquality().hash(postal) ^
      const DeepCollectionEquality().hash(estado) ^
      const DeepCollectionEquality().hash(municipio) ^
      const DeepCollectionEquality().hash(estado2);

  @override
  _$_UserDomicilioInfo copyWith({
    Object calle = freezed,
    Object numExt = freezed,
    Object numInt = freezed,
    Object colonia = freezed,
    Object postal = freezed,
    Object estado = freezed,
    Object municipio = freezed,
    Object estado2 = freezed,
  }) {
    return _$_UserDomicilioInfo(
      calle: calle == freezed ? this.calle : calle as String,
      numExt: numExt == freezed ? this.numExt : numExt as String,
      numInt: numInt == freezed ? this.numInt : numInt as String,
      colonia: colonia == freezed ? this.colonia : colonia as String,
      postal: postal == freezed ? this.postal : postal as String,
      estado: estado == freezed ? this.estado : estado as String,
      municipio: municipio == freezed ? this.municipio : municipio as String,
      estado2: estado2 == freezed ? this.estado2 : estado2 as String,
    );
  }
}

abstract class _UserDomicilioInfo implements UserDomicilioInfo {
  const factory _UserDomicilioInfo(
      {@required String calle,
      @required String numExt,
      @required String numInt,
      @required String colonia,
      @required String postal,
      @required String estado,
      @required String municipio,
      @required String estado2}) = _$_UserDomicilioInfo;

  @override
  String get calle;
  @override
  String get numExt;
  @override
  String get numInt;
  @override
  String get colonia;
  @override
  String get postal;
  @override
  String get estado;
  @override
  String get municipio;
  @override
  String get estado2;

  @override
  _UserDomicilioInfo copyWith(
      {String calle,
      String numExt,
      String numInt,
      String colonia,
      String postal,
      String estado,
      String municipio,
      String estado2});
}
