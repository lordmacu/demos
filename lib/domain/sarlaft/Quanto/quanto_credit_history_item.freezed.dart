// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'quanto_credit_history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$QuantoCreditHistoryItem {
  String get clave;
  String get identificacion;
  String get primerApellido;
  String get producto;
  String get tipoIdentificacion;
  String get usuario;
  int get ingress;
  int get egress;

  QuantoCreditHistoryItem copyWith(
      {String clave,
      String identificacion,
      String primerApellido,
      String producto,
      String tipoIdentificacion,
      String usuario,
      int ingress,
      int egress});
}

class _$QuantoCreditHistoryItemTearOff {
  const _$QuantoCreditHistoryItemTearOff();

  _QuantoCreditHistoryItem call(
      {@required String clave,
      @required String identificacion,
      @required String primerApellido,
      @required String producto,
      @required String tipoIdentificacion,
      @required String usuario,
      @required int ingress,
      @required int egress}) {
    return _QuantoCreditHistoryItem(
      clave: clave,
      identificacion: identificacion,
      primerApellido: primerApellido,
      producto: producto,
      tipoIdentificacion: tipoIdentificacion,
      usuario: usuario,
      ingress: ingress,
      egress: egress,
    );
  }
}

const $QuantoCreditHistoryItem = _$QuantoCreditHistoryItemTearOff();

class _$_QuantoCreditHistoryItem implements _QuantoCreditHistoryItem {
  const _$_QuantoCreditHistoryItem(
      {@required this.clave,
      @required this.identificacion,
      @required this.primerApellido,
      @required this.producto,
      @required this.tipoIdentificacion,
      @required this.usuario,
      @required this.ingress,
      @required this.egress})
      : assert(clave != null),
        assert(identificacion != null),
        assert(primerApellido != null),
        assert(producto != null),
        assert(tipoIdentificacion != null),
        assert(usuario != null),
        assert(ingress != null),
        assert(egress != null);

  @override
  final String clave;
  @override
  final String identificacion;
  @override
  final String primerApellido;
  @override
  final String producto;
  @override
  final String tipoIdentificacion;
  @override
  final String usuario;
  @override
  final int ingress;
  @override
  final int egress;

  @override
  String toString() {
    return 'QuantoCreditHistoryItem(clave: $clave, identificacion: $identificacion, primerApellido: $primerApellido, producto: $producto, tipoIdentificacion: $tipoIdentificacion, usuario: $usuario, ingress: $ingress, egress: $egress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuantoCreditHistoryItem &&
            (identical(other.clave, clave) ||
                const DeepCollectionEquality().equals(other.clave, clave)) &&
            (identical(other.identificacion, identificacion) ||
                const DeepCollectionEquality()
                    .equals(other.identificacion, identificacion)) &&
            (identical(other.primerApellido, primerApellido) ||
                const DeepCollectionEquality()
                    .equals(other.primerApellido, primerApellido)) &&
            (identical(other.producto, producto) ||
                const DeepCollectionEquality()
                    .equals(other.producto, producto)) &&
            (identical(other.tipoIdentificacion, tipoIdentificacion) ||
                const DeepCollectionEquality()
                    .equals(other.tipoIdentificacion, tipoIdentificacion)) &&
            (identical(other.usuario, usuario) ||
                const DeepCollectionEquality()
                    .equals(other.usuario, usuario)) &&
            (identical(other.ingress, ingress) ||
                const DeepCollectionEquality()
                    .equals(other.ingress, ingress)) &&
            (identical(other.egress, egress) ||
                const DeepCollectionEquality().equals(other.egress, egress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clave) ^
      const DeepCollectionEquality().hash(identificacion) ^
      const DeepCollectionEquality().hash(primerApellido) ^
      const DeepCollectionEquality().hash(producto) ^
      const DeepCollectionEquality().hash(tipoIdentificacion) ^
      const DeepCollectionEquality().hash(usuario) ^
      const DeepCollectionEquality().hash(ingress) ^
      const DeepCollectionEquality().hash(egress);

  @override
  _$_QuantoCreditHistoryItem copyWith({
    Object clave = freezed,
    Object identificacion = freezed,
    Object primerApellido = freezed,
    Object producto = freezed,
    Object tipoIdentificacion = freezed,
    Object usuario = freezed,
    Object ingress = freezed,
    Object egress = freezed,
  }) {
    return _$_QuantoCreditHistoryItem(
      clave: clave == freezed ? this.clave : clave as String,
      identificacion: identificacion == freezed
          ? this.identificacion
          : identificacion as String,
      primerApellido: primerApellido == freezed
          ? this.primerApellido
          : primerApellido as String,
      producto: producto == freezed ? this.producto : producto as String,
      tipoIdentificacion: tipoIdentificacion == freezed
          ? this.tipoIdentificacion
          : tipoIdentificacion as String,
      usuario: usuario == freezed ? this.usuario : usuario as String,
      ingress: ingress == freezed ? this.ingress : ingress as int,
      egress: egress == freezed ? this.egress : egress as int,
    );
  }
}

abstract class _QuantoCreditHistoryItem implements QuantoCreditHistoryItem {
  const factory _QuantoCreditHistoryItem(
      {@required String clave,
      @required String identificacion,
      @required String primerApellido,
      @required String producto,
      @required String tipoIdentificacion,
      @required String usuario,
      @required int ingress,
      @required int egress}) = _$_QuantoCreditHistoryItem;

  @override
  String get clave;
  @override
  String get identificacion;
  @override
  String get primerApellido;
  @override
  String get producto;
  @override
  String get tipoIdentificacion;
  @override
  String get usuario;
  @override
  int get ingress;
  @override
  int get egress;

  @override
  _QuantoCreditHistoryItem copyWith(
      {String clave,
      String identificacion,
      String primerApellido,
      String producto,
      String tipoIdentificacion,
      String usuario,
      int ingress,
      int egress});
}
