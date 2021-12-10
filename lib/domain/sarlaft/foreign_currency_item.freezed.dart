// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foreign_currency_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ForeignCurrencyItem {
  String get productName;
  String get productType;
  String get clientIdentification;
  String get entity;
  int get amount;
  String get countryCode;
  String get countryName;
  String get cityCode;
  String get currencyType;

  ForeignCurrencyItem copyWith(
      {String productName,
      String productType,
      String clientIdentification,
      String entity,
      int amount,
      String countryCode,
      String countryName,
      String cityCode,
      String currencyType});
}

class _$ForeignCurrencyItemTearOff {
  const _$ForeignCurrencyItemTearOff();

  _ForeignCurrencyItem call(
      {@required String productName,
      @required String productType,
      @required String clientIdentification,
      @required String entity,
      @required int amount,
      @required String countryCode,
      @required String countryName,
      @required String cityCode,
      @required String currencyType}) {
    return _ForeignCurrencyItem(
      productName: productName,
      productType: productType,
      clientIdentification: clientIdentification,
      entity: entity,
      amount: amount,
      countryCode: countryCode,
      countryName: countryName,
      cityCode: cityCode,
      currencyType: currencyType,
    );
  }
}

const $ForeignCurrencyItem = _$ForeignCurrencyItemTearOff();

class _$_ForeignCurrencyItem implements _ForeignCurrencyItem {
  const _$_ForeignCurrencyItem(
      {@required this.productName,
      @required this.productType,
      @required this.clientIdentification,
      @required this.entity,
      @required this.amount,
      @required this.countryCode,
      @required this.countryName,
      @required this.cityCode,
      @required this.currencyType})
      : assert(productName != null),
        assert(productType != null),
        assert(clientIdentification != null),
        assert(entity != null),
        assert(amount != null),
        assert(countryCode != null),
        assert(countryName != null),
        assert(cityCode != null),
        assert(currencyType != null);

  @override
  final String productName;
  @override
  final String productType;
  @override
  final String clientIdentification;
  @override
  final String entity;
  @override
  final int amount;
  @override
  final String countryCode;
  @override
  final String countryName;
  @override
  final String cityCode;
  @override
  final String currencyType;

  @override
  String toString() {
    return 'ForeignCurrencyItem(productName: $productName, productType: $productType, clientIdentification: $clientIdentification, entity: $entity, amount: $amount, countryCode: $countryCode, countryName: $countryName, cityCode: $cityCode, currencyType: $currencyType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ForeignCurrencyItem &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.productType, productType) ||
                const DeepCollectionEquality()
                    .equals(other.productType, productType)) &&
            (identical(other.clientIdentification, clientIdentification) ||
                const DeepCollectionEquality().equals(
                    other.clientIdentification, clientIdentification)) &&
            (identical(other.entity, entity) ||
                const DeepCollectionEquality().equals(other.entity, entity)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)) &&
            (identical(other.cityCode, cityCode) ||
                const DeepCollectionEquality()
                    .equals(other.cityCode, cityCode)) &&
            (identical(other.currencyType, currencyType) ||
                const DeepCollectionEquality()
                    .equals(other.currencyType, currencyType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(productType) ^
      const DeepCollectionEquality().hash(clientIdentification) ^
      const DeepCollectionEquality().hash(entity) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(countryName) ^
      const DeepCollectionEquality().hash(cityCode) ^
      const DeepCollectionEquality().hash(currencyType);

  @override
  _$_ForeignCurrencyItem copyWith({
    Object productName = freezed,
    Object productType = freezed,
    Object clientIdentification = freezed,
    Object entity = freezed,
    Object amount = freezed,
    Object countryCode = freezed,
    Object countryName = freezed,
    Object cityCode = freezed,
    Object currencyType = freezed,
  }) {
    return _$_ForeignCurrencyItem(
      productName:
          productName == freezed ? this.productName : productName as String,
      productType:
          productType == freezed ? this.productType : productType as String,
      clientIdentification: clientIdentification == freezed
          ? this.clientIdentification
          : clientIdentification as String,
      entity: entity == freezed ? this.entity : entity as String,
      amount: amount == freezed ? this.amount : amount as int,
      countryCode:
          countryCode == freezed ? this.countryCode : countryCode as String,
      countryName:
          countryName == freezed ? this.countryName : countryName as String,
      cityCode: cityCode == freezed ? this.cityCode : cityCode as String,
      currencyType:
          currencyType == freezed ? this.currencyType : currencyType as String,
    );
  }
}

abstract class _ForeignCurrencyItem implements ForeignCurrencyItem {
  const factory _ForeignCurrencyItem(
      {@required String productName,
      @required String productType,
      @required String clientIdentification,
      @required String entity,
      @required int amount,
      @required String countryCode,
      @required String countryName,
      @required String cityCode,
      @required String currencyType}) = _$_ForeignCurrencyItem;

  @override
  String get productName;
  @override
  String get productType;
  @override
  String get clientIdentification;
  @override
  String get entity;
  @override
  int get amount;
  @override
  String get countryCode;
  @override
  String get countryName;
  @override
  String get cityCode;
  @override
  String get currencyType;

  @override
  _ForeignCurrencyItem copyWith(
      {String productName,
      String productType,
      String clientIdentification,
      String entity,
      int amount,
      String countryCode,
      String countryName,
      String cityCode,
      String currencyType});
}
