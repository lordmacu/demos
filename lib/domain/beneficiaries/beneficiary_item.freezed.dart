// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'beneficiary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BeneficiaryItem {
  int get id;
  String get name;
  String get number;
  double get percentage;

  BeneficiaryItem copyWith(
      {int id, String name, String number, double percentage});
}

class _$BeneficiaryItemTearOff {
  const _$BeneficiaryItemTearOff();

  _BeneficiaryItem call(
      {@required int id,
      @required String name,
      @required String number,
      @required double percentage}) {
    return _BeneficiaryItem(
      id: id,
      name: name,
      number: number,
      percentage: percentage,
    );
  }
}

const $BeneficiaryItem = _$BeneficiaryItemTearOff();

class _$_BeneficiaryItem implements _BeneficiaryItem {
  const _$_BeneficiaryItem(
      {@required this.id,
      @required this.name,
      @required this.number,
      @required this.percentage})
      : assert(id != null),
        assert(name != null),
        assert(number != null),
        assert(percentage != null);

  @override
  final int id;
  @override
  final String name;
  @override
  final String number;
  @override
  final double percentage;

  @override
  String toString() {
    return 'BeneficiaryItem(id: $id, name: $name, number: $number, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeneficiaryItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(percentage);

  @override
  _$_BeneficiaryItem copyWith({
    Object id = freezed,
    Object name = freezed,
    Object number = freezed,
    Object percentage = freezed,
  }) {
    return _$_BeneficiaryItem(
      id: id == freezed ? this.id : id as int,
      name: name == freezed ? this.name : name as String,
      number: number == freezed ? this.number : number as String,
      percentage:
          percentage == freezed ? this.percentage : percentage as double,
    );
  }
}

abstract class _BeneficiaryItem implements BeneficiaryItem {
  const factory _BeneficiaryItem(
      {@required int id,
      @required String name,
      @required String number,
      @required double percentage}) = _$_BeneficiaryItem;

  @override
  int get id;
  @override
  String get name;
  @override
  String get number;
  @override
  double get percentage;

  @override
  _BeneficiaryItem copyWith(
      {int id, String name, String number, double percentage});
}
