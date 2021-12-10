// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_user_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DashboardUserItem {
  String get name;
  String get riskProfile;
  bool get hasTransactions;
  double get balance;
  double get efectivo;
  double get titles;
  double get notAssignedBalance;

  DashboardUserItem copyWith(
      {String name,
      String riskProfile,
      bool hasTransactions,
      double balance,
      double efectivo,
      double titles,
      double notAssignedBalance});
}

class _$DashboardUserItemTearOff {
  const _$DashboardUserItemTearOff();

  _DashboardUserItem call(
      {@required String name,
      @required String riskProfile,
      @required bool hasTransactions,
      @required double balance,
      @required double efectivo,
      @required double titles,
      double notAssignedBalance}) {
    return _DashboardUserItem(
      name: name,
      riskProfile: riskProfile,
      hasTransactions: hasTransactions,
      balance: balance,
      efectivo: efectivo,
      titles: titles,
      notAssignedBalance: notAssignedBalance,
    );
  }
}

const $DashboardUserItem = _$DashboardUserItemTearOff();

class _$_DashboardUserItem implements _DashboardUserItem {
  const _$_DashboardUserItem(
      {@required this.name,
      @required this.riskProfile,
      @required this.hasTransactions,
      @required this.balance,
      @required this.efectivo,
      @required this.titles,
      this.notAssignedBalance})
      : assert(name != null),
        assert(riskProfile != null),
        assert(hasTransactions != null),
        assert(balance != null),
        assert(efectivo != null),
        assert(titles != null);

  @override
  final String name;
  @override
  final String riskProfile;
  @override
  final bool hasTransactions;
  @override
  final double balance;
  @override
  final double efectivo;
  @override
  final double titles;
  @override
  final double notAssignedBalance;

  @override
  String toString() {
    return 'DashboardUserItem(name: $name, riskProfile: $riskProfile, hasTransactions: $hasTransactions, balance: $balance, efectivo: $efectivo, titles: $titles, notAssignedBalance: $notAssignedBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardUserItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.riskProfile, riskProfile) ||
                const DeepCollectionEquality()
                    .equals(other.riskProfile, riskProfile)) &&
            (identical(other.hasTransactions, hasTransactions) ||
                const DeepCollectionEquality()
                    .equals(other.hasTransactions, hasTransactions)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.efectivo, efectivo) ||
                const DeepCollectionEquality()
                    .equals(other.efectivo, efectivo)) &&
            (identical(other.titles, titles) ||
                const DeepCollectionEquality().equals(other.titles, titles)) &&
            (identical(other.notAssignedBalance, notAssignedBalance) ||
                const DeepCollectionEquality()
                    .equals(other.notAssignedBalance, notAssignedBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(riskProfile) ^
      const DeepCollectionEquality().hash(hasTransactions) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(efectivo) ^
      const DeepCollectionEquality().hash(titles) ^
      const DeepCollectionEquality().hash(notAssignedBalance);

  @override
  _$_DashboardUserItem copyWith({
    Object name = freezed,
    Object riskProfile = freezed,
    Object hasTransactions = freezed,
    Object balance = freezed,
    Object efectivo = freezed,
    Object titles = freezed,
    Object notAssignedBalance = freezed,
  }) {
    return _$_DashboardUserItem(
      name: name == freezed ? this.name : name as String,
      riskProfile:
          riskProfile == freezed ? this.riskProfile : riskProfile as String,
      hasTransactions: hasTransactions == freezed
          ? this.hasTransactions
          : hasTransactions as bool,
      balance: balance == freezed ? this.balance : balance as double,
      efectivo: efectivo == freezed ? this.efectivo : efectivo as double,
      titles: titles == freezed ? this.titles : titles as double,
      notAssignedBalance: notAssignedBalance == freezed
          ? this.notAssignedBalance
          : notAssignedBalance as double,
    );
  }
}

abstract class _DashboardUserItem implements DashboardUserItem {
  const factory _DashboardUserItem(
      {@required String name,
      @required String riskProfile,
      @required bool hasTransactions,
      @required double balance,
      @required double efectivo,
      @required double titles,
      double notAssignedBalance}) = _$_DashboardUserItem;

  @override
  String get name;
  @override
  String get riskProfile;
  @override
  bool get hasTransactions;
  @override
  double get balance;
  @override
  double get efectivo;
  @override
  double get titles;
  @override
  double get notAssignedBalance;

  @override
  _DashboardUserItem copyWith(
      {String name,
      String riskProfile,
      bool hasTransactions,
      double balance,
      double efectivo,
      double titles,
      double notAssignedBalance});
}
