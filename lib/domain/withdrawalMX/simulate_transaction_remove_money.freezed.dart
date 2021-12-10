// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'simulate_transaction_remove_money.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SimulateTransactionRemoveMoney {
  double get notAssignedBalance;
  List<GoalBalanceItem> get goals;

  SimulateTransactionRemoveMoney copyWith(
      {double notAssignedBalance, List<GoalBalanceItem> goals});
}

class _$SimulateTransactionRemoveMoneyTearOff {
  const _$SimulateTransactionRemoveMoneyTearOff();

  _SimulateTransactionRemoveMoney call(
      {@required double notAssignedBalance,
      @required List<GoalBalanceItem> goals}) {
    return _SimulateTransactionRemoveMoney(
      notAssignedBalance: notAssignedBalance,
      goals: goals,
    );
  }
}

const $SimulateTransactionRemoveMoney =
    _$SimulateTransactionRemoveMoneyTearOff();

class _$_SimulateTransactionRemoveMoney
    implements _SimulateTransactionRemoveMoney {
  const _$_SimulateTransactionRemoveMoney(
      {@required this.notAssignedBalance, @required this.goals})
      : assert(notAssignedBalance != null),
        assert(goals != null);

  @override
  final double notAssignedBalance;
  @override
  final List<GoalBalanceItem> goals;

  @override
  String toString() {
    return 'SimulateTransactionRemoveMoney(notAssignedBalance: $notAssignedBalance, goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SimulateTransactionRemoveMoney &&
            (identical(other.notAssignedBalance, notAssignedBalance) ||
                const DeepCollectionEquality()
                    .equals(other.notAssignedBalance, notAssignedBalance)) &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notAssignedBalance) ^
      const DeepCollectionEquality().hash(goals);

  @override
  _$_SimulateTransactionRemoveMoney copyWith({
    Object notAssignedBalance = freezed,
    Object goals = freezed,
  }) {
    return _$_SimulateTransactionRemoveMoney(
      notAssignedBalance: notAssignedBalance == freezed
          ? this.notAssignedBalance
          : notAssignedBalance as double,
      goals: goals == freezed ? this.goals : goals as List<GoalBalanceItem>,
    );
  }
}

abstract class _SimulateTransactionRemoveMoney
    implements SimulateTransactionRemoveMoney {
  const factory _SimulateTransactionRemoveMoney(
          {@required double notAssignedBalance,
          @required List<GoalBalanceItem> goals}) =
      _$_SimulateTransactionRemoveMoney;

  @override
  double get notAssignedBalance;
  @override
  List<GoalBalanceItem> get goals;

  @override
  _SimulateTransactionRemoveMoney copyWith(
      {double notAssignedBalance, List<GoalBalanceItem> goals});
}
