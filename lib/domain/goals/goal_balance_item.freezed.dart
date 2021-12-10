// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'goal_balance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$GoalBalanceItem {
  int get id;
  String get nameGoal;
  String get emoji;
  double get transactionAmount;
  double get newBalanceGoal;

  GoalBalanceItem copyWith(
      {int id,
      String nameGoal,
      String emoji,
      double transactionAmount,
      double newBalanceGoal});
}

class _$GoalBalanceItemTearOff {
  const _$GoalBalanceItemTearOff();

  _GoalBalanceItem call(
      {@required int id,
      @required String nameGoal,
      @required String emoji,
      @required double transactionAmount,
      @required double newBalanceGoal}) {
    return _GoalBalanceItem(
      id: id,
      nameGoal: nameGoal,
      emoji: emoji,
      transactionAmount: transactionAmount,
      newBalanceGoal: newBalanceGoal,
    );
  }
}

const $GoalBalanceItem = _$GoalBalanceItemTearOff();

class _$_GoalBalanceItem implements _GoalBalanceItem {
  const _$_GoalBalanceItem(
      {@required this.id,
      @required this.nameGoal,
      @required this.emoji,
      @required this.transactionAmount,
      @required this.newBalanceGoal})
      : assert(id != null),
        assert(nameGoal != null),
        assert(emoji != null),
        assert(transactionAmount != null),
        assert(newBalanceGoal != null);

  @override
  final int id;
  @override
  final String nameGoal;
  @override
  final String emoji;
  @override
  final double transactionAmount;
  @override
  final double newBalanceGoal;

  @override
  String toString() {
    return 'GoalBalanceItem(id: $id, nameGoal: $nameGoal, emoji: $emoji, transactionAmount: $transactionAmount, newBalanceGoal: $newBalanceGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalBalanceItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nameGoal, nameGoal) ||
                const DeepCollectionEquality()
                    .equals(other.nameGoal, nameGoal)) &&
            (identical(other.emoji, emoji) ||
                const DeepCollectionEquality().equals(other.emoji, emoji)) &&
            (identical(other.transactionAmount, transactionAmount) ||
                const DeepCollectionEquality()
                    .equals(other.transactionAmount, transactionAmount)) &&
            (identical(other.newBalanceGoal, newBalanceGoal) ||
                const DeepCollectionEquality()
                    .equals(other.newBalanceGoal, newBalanceGoal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nameGoal) ^
      const DeepCollectionEquality().hash(emoji) ^
      const DeepCollectionEquality().hash(transactionAmount) ^
      const DeepCollectionEquality().hash(newBalanceGoal);

  @override
  _$_GoalBalanceItem copyWith({
    Object id = freezed,
    Object nameGoal = freezed,
    Object emoji = freezed,
    Object transactionAmount = freezed,
    Object newBalanceGoal = freezed,
  }) {
    return _$_GoalBalanceItem(
      id: id == freezed ? this.id : id as int,
      nameGoal: nameGoal == freezed ? this.nameGoal : nameGoal as String,
      emoji: emoji == freezed ? this.emoji : emoji as String,
      transactionAmount: transactionAmount == freezed
          ? this.transactionAmount
          : transactionAmount as double,
      newBalanceGoal: newBalanceGoal == freezed
          ? this.newBalanceGoal
          : newBalanceGoal as double,
    );
  }
}

abstract class _GoalBalanceItem implements GoalBalanceItem {
  const factory _GoalBalanceItem(
      {@required int id,
      @required String nameGoal,
      @required String emoji,
      @required double transactionAmount,
      @required double newBalanceGoal}) = _$_GoalBalanceItem;

  @override
  int get id;
  @override
  String get nameGoal;
  @override
  String get emoji;
  @override
  double get transactionAmount;
  @override
  double get newBalanceGoal;

  @override
  _GoalBalanceItem copyWith(
      {int id,
      String nameGoal,
      String emoji,
      double transactionAmount,
      double newBalanceGoal});
}
