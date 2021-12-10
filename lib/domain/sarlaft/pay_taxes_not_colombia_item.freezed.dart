// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'pay_taxes_not_colombia_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PayTaxesNotColombiaItem {
  String get countryId;
  String get countryName;
  String get name;
  String get documentType;
  String get parentType;
  String get country;
  String get identification;

  PayTaxesNotColombiaItem copyWith(
      {String countryId,
      String countryName,
      String name,
      String documentType,
      String parentType,
      String country,
      String identification});
}

class _$PayTaxesNotColombiaItemTearOff {
  const _$PayTaxesNotColombiaItemTearOff();

  _PayTaxesNotColombiaItem call(
      {@required String countryId,
      @required String countryName,
      @required String name,
      String documentType,
      String parentType,
      String country,
      @required String identification}) {
    return _PayTaxesNotColombiaItem(
      countryId: countryId,
      countryName: countryName,
      name: name,
      documentType: documentType,
      parentType: parentType,
      country: country,
      identification: identification,
    );
  }
}

const $PayTaxesNotColombiaItem = _$PayTaxesNotColombiaItemTearOff();

class _$_PayTaxesNotColombiaItem implements _PayTaxesNotColombiaItem {
  const _$_PayTaxesNotColombiaItem(
      {@required this.countryId,
      @required this.countryName,
      @required this.name,
      this.documentType,
      this.parentType,
      this.country,
      @required this.identification})
      : assert(countryId != null),
        assert(countryName != null),
        assert(name != null),
        assert(identification != null);

  @override
  final String countryId;
  @override
  final String countryName;
  @override
  final String name;
  @override
  final String documentType;
  @override
  final String parentType;
  @override
  final String country;
  @override
  final String identification;

  @override
  String toString() {
    return 'PayTaxesNotColombiaItem(countryId: $countryId, countryName: $countryName, name: $name, documentType: $documentType, parentType: $parentType, country: $country, identification: $identification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayTaxesNotColombiaItem &&
            (identical(other.countryId, countryId) ||
                const DeepCollectionEquality()
                    .equals(other.countryId, countryId)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.documentType, documentType) ||
                const DeepCollectionEquality()
                    .equals(other.documentType, documentType)) &&
            (identical(other.parentType, parentType) ||
                const DeepCollectionEquality()
                    .equals(other.parentType, parentType)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.identification, identification) ||
                const DeepCollectionEquality()
                    .equals(other.identification, identification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(countryId) ^
      const DeepCollectionEquality().hash(countryName) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(documentType) ^
      const DeepCollectionEquality().hash(parentType) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(identification);

  @override
  _$_PayTaxesNotColombiaItem copyWith({
    Object countryId = freezed,
    Object countryName = freezed,
    Object name = freezed,
    Object documentType = freezed,
    Object parentType = freezed,
    Object country = freezed,
    Object identification = freezed,
  }) {
    return _$_PayTaxesNotColombiaItem(
      countryId: countryId == freezed ? this.countryId : countryId as String,
      countryName:
          countryName == freezed ? this.countryName : countryName as String,
      name: name == freezed ? this.name : name as String,
      documentType:
          documentType == freezed ? this.documentType : documentType as String,
      parentType:
          parentType == freezed ? this.parentType : parentType as String,
      country: country == freezed ? this.country : country as String,
      identification: identification == freezed
          ? this.identification
          : identification as String,
    );
  }
}

abstract class _PayTaxesNotColombiaItem implements PayTaxesNotColombiaItem {
  const factory _PayTaxesNotColombiaItem(
      {@required String countryId,
      @required String countryName,
      @required String name,
      String documentType,
      String parentType,
      String country,
      @required String identification}) = _$_PayTaxesNotColombiaItem;

  @override
  String get countryId;
  @override
  String get countryName;
  @override
  String get name;
  @override
  String get documentType;
  @override
  String get parentType;
  @override
  String get country;
  @override
  String get identification;

  @override
  _PayTaxesNotColombiaItem copyWith(
      {String countryId,
      String countryName,
      String name,
      String documentType,
      String parentType,
      String country,
      String identification});
}
