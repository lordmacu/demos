// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'Extract_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ExtractItem {
  int get month;
  String get monthName;
  int get year;
  int get order;
  bool get generated;

  ExtractItem copyWith(
      {int month, String monthName, int year, int order, bool generated});
}

class _$ExtractItemTearOff {
  const _$ExtractItemTearOff();

  _ExtractItem call(
      {int month,
      String monthName,
      @required int year,
      @required int order,
      bool generated}) {
    return _ExtractItem(
      month: month,
      monthName: monthName,
      year: year,
      order: order,
      generated: generated,
    );
  }
}

const $ExtractItem = _$ExtractItemTearOff();

class _$_ExtractItem implements _ExtractItem {
  const _$_ExtractItem(
      {this.month,
      this.monthName,
      @required this.year,
      @required this.order,
      this.generated})
      : assert(year != null),
        assert(order != null);

  @override
  final int month;
  @override
  final String monthName;
  @override
  final int year;
  @override
  final int order;
  @override
  final bool generated;

  @override
  String toString() {
    return 'ExtractItem(month: $month, monthName: $monthName, year: $year, order: $order, generated: $generated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExtractItem &&
            (identical(other.month, month) ||
                const DeepCollectionEquality().equals(other.month, month)) &&
            (identical(other.monthName, monthName) ||
                const DeepCollectionEquality()
                    .equals(other.monthName, monthName)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.generated, generated) ||
                const DeepCollectionEquality()
                    .equals(other.generated, generated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(month) ^
      const DeepCollectionEquality().hash(monthName) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(generated);

  @override
  _$_ExtractItem copyWith({
    Object month = freezed,
    Object monthName = freezed,
    Object year = freezed,
    Object order = freezed,
    Object generated = freezed,
  }) {
    return _$_ExtractItem(
      month: month == freezed ? this.month : month as int,
      monthName: monthName == freezed ? this.monthName : monthName as String,
      year: year == freezed ? this.year : year as int,
      order: order == freezed ? this.order : order as int,
      generated: generated == freezed ? this.generated : generated as bool,
    );
  }
}

abstract class _ExtractItem implements ExtractItem {
  const factory _ExtractItem(
      {int month,
      String monthName,
      @required int year,
      @required int order,
      bool generated}) = _$_ExtractItem;

  @override
  int get month;
  @override
  String get monthName;
  @override
  int get year;
  @override
  int get order;
  @override
  bool get generated;

  @override
  _ExtractItem copyWith(
      {int month, String monthName, int year, int order, bool generated});
}
