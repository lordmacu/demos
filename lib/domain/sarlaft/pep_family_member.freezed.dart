// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'pep_family_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PepFamilyMember {
  String get name;
  String get lastNames;
  String get identification;
  String get position;
  int get identificationType;
  int get pepType;
  String get documentType;
  String get parentType;
  String get country;

  PepFamilyMember copyWith(
      {String name,
      String lastNames,
      String identification,
      String position,
      int identificationType,
      int pepType,
      String documentType,
      String parentType,
      String country});
}

class _$PepFamilyMemberTearOff {
  const _$PepFamilyMemberTearOff();

  _PepFamiliMember call(
      {@required String name,
      @required String lastNames,
      @required String identification,
      @required String position,
      @required int identificationType,
      @required int pepType,
      String documentType,
      String parentType,
      String country}) {
    return _PepFamiliMember(
      name: name,
      lastNames: lastNames,
      identification: identification,
      position: position,
      identificationType: identificationType,
      pepType: pepType,
      documentType: documentType,
      parentType: parentType,
      country: country,
    );
  }
}

const $PepFamilyMember = _$PepFamilyMemberTearOff();

class _$_PepFamiliMember implements _PepFamiliMember {
  const _$_PepFamiliMember(
      {@required this.name,
      @required this.lastNames,
      @required this.identification,
      @required this.position,
      @required this.identificationType,
      @required this.pepType,
      this.documentType,
      this.parentType,
      this.country})
      : assert(name != null),
        assert(lastNames != null),
        assert(identification != null),
        assert(position != null),
        assert(identificationType != null),
        assert(pepType != null);

  @override
  final String name;
  @override
  final String lastNames;
  @override
  final String identification;
  @override
  final String position;
  @override
  final int identificationType;
  @override
  final int pepType;
  @override
  final String documentType;
  @override
  final String parentType;
  @override
  final String country;

  @override
  String toString() {
    return 'PepFamilyMember(name: $name, lastNames: $lastNames, identification: $identification, position: $position, identificationType: $identificationType, pepType: $pepType, documentType: $documentType, parentType: $parentType, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PepFamiliMember &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastNames, lastNames) ||
                const DeepCollectionEquality()
                    .equals(other.lastNames, lastNames)) &&
            (identical(other.identification, identification) ||
                const DeepCollectionEquality()
                    .equals(other.identification, identification)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.identificationType, identificationType) ||
                const DeepCollectionEquality()
                    .equals(other.identificationType, identificationType)) &&
            (identical(other.pepType, pepType) ||
                const DeepCollectionEquality()
                    .equals(other.pepType, pepType)) &&
            (identical(other.documentType, documentType) ||
                const DeepCollectionEquality()
                    .equals(other.documentType, documentType)) &&
            (identical(other.parentType, parentType) ||
                const DeepCollectionEquality()
                    .equals(other.parentType, parentType)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastNames) ^
      const DeepCollectionEquality().hash(identification) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(identificationType) ^
      const DeepCollectionEquality().hash(pepType) ^
      const DeepCollectionEquality().hash(documentType) ^
      const DeepCollectionEquality().hash(parentType) ^
      const DeepCollectionEquality().hash(country);

  @override
  _$_PepFamiliMember copyWith({
    Object name = freezed,
    Object lastNames = freezed,
    Object identification = freezed,
    Object position = freezed,
    Object identificationType = freezed,
    Object pepType = freezed,
    Object documentType = freezed,
    Object parentType = freezed,
    Object country = freezed,
  }) {
    return _$_PepFamiliMember(
      name: name == freezed ? this.name : name as String,
      lastNames: lastNames == freezed ? this.lastNames : lastNames as String,
      identification: identification == freezed
          ? this.identification
          : identification as String,
      position: position == freezed ? this.position : position as String,
      identificationType: identificationType == freezed
          ? this.identificationType
          : identificationType as int,
      pepType: pepType == freezed ? this.pepType : pepType as int,
      documentType:
          documentType == freezed ? this.documentType : documentType as String,
      parentType:
          parentType == freezed ? this.parentType : parentType as String,
      country: country == freezed ? this.country : country as String,
    );
  }
}

abstract class _PepFamiliMember implements PepFamilyMember {
  const factory _PepFamiliMember(
      {@required String name,
      @required String lastNames,
      @required String identification,
      @required String position,
      @required int identificationType,
      @required int pepType,
      String documentType,
      String parentType,
      String country}) = _$_PepFamiliMember;

  @override
  String get name;
  @override
  String get lastNames;
  @override
  String get identification;
  @override
  String get position;
  @override
  int get identificationType;
  @override
  int get pepType;
  @override
  String get documentType;
  @override
  String get parentType;
  @override
  String get country;

  @override
  _PepFamiliMember copyWith(
      {String name,
      String lastNames,
      String identification,
      String position,
      int identificationType,
      int pepType,
      String documentType,
      String parentType,
      String country});
}
