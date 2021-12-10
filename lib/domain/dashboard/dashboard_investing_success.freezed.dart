// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_investing_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DashboardTotalApprovedTransactionsItem {
  bool get isWithdrawal;
  double get totalValue;

  DashboardTotalApprovedTransactionsItem copyWith(
      {bool isWithdrawal, double totalValue});
}

class _$DashboardTotalApprovedTransactionsItemTearOff {
  const _$DashboardTotalApprovedTransactionsItemTearOff();

  _DashboardTotalApprovedTransactionsItem call(
      {@required bool isWithdrawal, @required double totalValue}) {
    return _DashboardTotalApprovedTransactionsItem(
      isWithdrawal: isWithdrawal,
      totalValue: totalValue,
    );
  }
}

const $DashboardTotalApprovedTransactionsItem =
    _$DashboardTotalApprovedTransactionsItemTearOff();

class _$_DashboardTotalApprovedTransactionsItem
    implements _DashboardTotalApprovedTransactionsItem {
  const _$_DashboardTotalApprovedTransactionsItem(
      {@required this.isWithdrawal, @required this.totalValue})
      : assert(isWithdrawal != null),
        assert(totalValue != null);

  @override
  final bool isWithdrawal;
  @override
  final double totalValue;

  @override
  String toString() {
    return 'DashboardTotalApprovedTransactionsItem(isWithdrawal: $isWithdrawal, totalValue: $totalValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardTotalApprovedTransactionsItem &&
            (identical(other.isWithdrawal, isWithdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.isWithdrawal, isWithdrawal)) &&
            (identical(other.totalValue, totalValue) ||
                const DeepCollectionEquality()
                    .equals(other.totalValue, totalValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isWithdrawal) ^
      const DeepCollectionEquality().hash(totalValue);

  @override
  _$_DashboardTotalApprovedTransactionsItem copyWith({
    Object isWithdrawal = freezed,
    Object totalValue = freezed,
  }) {
    return _$_DashboardTotalApprovedTransactionsItem(
      isWithdrawal:
          isWithdrawal == freezed ? this.isWithdrawal : isWithdrawal as bool,
      totalValue:
          totalValue == freezed ? this.totalValue : totalValue as double,
    );
  }
}

abstract class _DashboardTotalApprovedTransactionsItem
    implements DashboardTotalApprovedTransactionsItem {
  const factory _DashboardTotalApprovedTransactionsItem(
      {@required bool isWithdrawal,
      @required double totalValue}) = _$_DashboardTotalApprovedTransactionsItem;

  @override
  bool get isWithdrawal;
  @override
  double get totalValue;

  @override
  _DashboardTotalApprovedTransactionsItem copyWith(
      {bool isWithdrawal, double totalValue});
}
