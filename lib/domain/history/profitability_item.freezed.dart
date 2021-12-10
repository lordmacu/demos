// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profitability_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfitabilityItem {
  String get name;
  double get value;
  bool get isPositive;

  ProfitabilityItem copyWith({String name, double value, bool isPositive});
}

class _$ProfitabilityItemTearOff {
  const _$ProfitabilityItemTearOff();

  _ProfitabilityItem call({String name, double value, bool isPositive}) {
    return _ProfitabilityItem(
      name: name,
      value: value,
      isPositive: isPositive,
    );
  }
}

const $ProfitabilityItem = _$ProfitabilityItemTearOff();

class _$_ProfitabilityItem implements _ProfitabilityItem {
  const _$_ProfitabilityItem({this.name, this.value, this.isPositive});

  @override
  final String name;
  @override
  final double value;
  @override
  final bool isPositive;

  @override
  String toString() {
    return 'ProfitabilityItem(name: $name, value: $value, isPositive: $isPositive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfitabilityItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.isPositive, isPositive) ||
                const DeepCollectionEquality()
                    .equals(other.isPositive, isPositive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(isPositive);

  @override
  _$_ProfitabilityItem copyWith({
    Object name = freezed,
    Object value = freezed,
    Object isPositive = freezed,
  }) {
    return _$_ProfitabilityItem(
      name: name == freezed ? this.name : name as String,
      value: value == freezed ? this.value : value as double,
      isPositive: isPositive == freezed ? this.isPositive : isPositive as bool,
    );
  }
}

abstract class _ProfitabilityItem implements ProfitabilityItem {
  const factory _ProfitabilityItem(
      {String name, double value, bool isPositive}) = _$_ProfitabilityItem;

  @override
  String get name;
  @override
  double get value;
  @override
  bool get isPositive;

  @override
  _ProfitabilityItem copyWith({String name, double value, bool isPositive});
}
