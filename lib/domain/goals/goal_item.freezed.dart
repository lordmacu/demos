// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'goal_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$GoalItem {
  String get emoji;
  String get goalName;
  double get totalValue;
  int get periodicity;
  double get feeValue;
  DateTime get createdDate;
  int get numMonths;
  int get id;

  GoalItem copyWith(
      {String emoji,
      String goalName,
      double totalValue,
      int periodicity,
      double feeValue,
      DateTime createdDate,
      int numMonths,
      int id});
}

class _$GoalItemTearOff {
  const _$GoalItemTearOff();

  _GoalItem call(
      {@required String emoji,
      @required String goalName,
      @required double totalValue,
      @required int periodicity,
      @required double feeValue,
      @required DateTime createdDate,
      @required int numMonths,
      @required int id}) {
    return _GoalItem(
      emoji: emoji,
      goalName: goalName,
      totalValue: totalValue,
      periodicity: periodicity,
      feeValue: feeValue,
      createdDate: createdDate,
      numMonths: numMonths,
      id: id,
    );
  }
}

const $GoalItem = _$GoalItemTearOff();

class _$_GoalItem implements _GoalItem {
  const _$_GoalItem(
      {@required this.emoji,
      @required this.goalName,
      @required this.totalValue,
      @required this.periodicity,
      @required this.feeValue,
      @required this.createdDate,
      @required this.numMonths,
      @required this.id})
      : assert(emoji != null),
        assert(goalName != null),
        assert(totalValue != null),
        assert(periodicity != null),
        assert(feeValue != null),
        assert(createdDate != null),
        assert(numMonths != null),
        assert(id != null);

  @override
  final String emoji;
  @override
  final String goalName;
  @override
  final double totalValue;
  @override
  final int periodicity;
  @override
  final double feeValue;
  @override
  final DateTime createdDate;
  @override
  final int numMonths;
  @override
  final int id;

  @override
  String toString() {
    return 'GoalItem(emoji: $emoji, goalName: $goalName, totalValue: $totalValue, periodicity: $periodicity, feeValue: $feeValue, createdDate: $createdDate, numMonths: $numMonths, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalItem &&
            (identical(other.emoji, emoji) ||
                const DeepCollectionEquality().equals(other.emoji, emoji)) &&
            (identical(other.goalName, goalName) ||
                const DeepCollectionEquality()
                    .equals(other.goalName, goalName)) &&
            (identical(other.totalValue, totalValue) ||
                const DeepCollectionEquality()
                    .equals(other.totalValue, totalValue)) &&
            (identical(other.periodicity, periodicity) ||
                const DeepCollectionEquality()
                    .equals(other.periodicity, periodicity)) &&
            (identical(other.feeValue, feeValue) ||
                const DeepCollectionEquality()
                    .equals(other.feeValue, feeValue)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.numMonths, numMonths) ||
                const DeepCollectionEquality()
                    .equals(other.numMonths, numMonths)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emoji) ^
      const DeepCollectionEquality().hash(goalName) ^
      const DeepCollectionEquality().hash(totalValue) ^
      const DeepCollectionEquality().hash(periodicity) ^
      const DeepCollectionEquality().hash(feeValue) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(numMonths) ^
      const DeepCollectionEquality().hash(id);

  @override
  _$_GoalItem copyWith({
    Object emoji = freezed,
    Object goalName = freezed,
    Object totalValue = freezed,
    Object periodicity = freezed,
    Object feeValue = freezed,
    Object createdDate = freezed,
    Object numMonths = freezed,
    Object id = freezed,
  }) {
    return _$_GoalItem(
      emoji: emoji == freezed ? this.emoji : emoji as String,
      goalName: goalName == freezed ? this.goalName : goalName as String,
      totalValue:
          totalValue == freezed ? this.totalValue : totalValue as double,
      periodicity:
          periodicity == freezed ? this.periodicity : periodicity as int,
      feeValue: feeValue == freezed ? this.feeValue : feeValue as double,
      createdDate:
          createdDate == freezed ? this.createdDate : createdDate as DateTime,
      numMonths: numMonths == freezed ? this.numMonths : numMonths as int,
      id: id == freezed ? this.id : id as int,
    );
  }
}

abstract class _GoalItem implements GoalItem {
  const factory _GoalItem(
      {@required String emoji,
      @required String goalName,
      @required double totalValue,
      @required int periodicity,
      @required double feeValue,
      @required DateTime createdDate,
      @required int numMonths,
      @required int id}) = _$_GoalItem;

  @override
  String get emoji;
  @override
  String get goalName;
  @override
  double get totalValue;
  @override
  int get periodicity;
  @override
  double get feeValue;
  @override
  DateTime get createdDate;
  @override
  int get numMonths;
  @override
  int get id;

  @override
  _GoalItem copyWith(
      {String emoji,
      String goalName,
      double totalValue,
      int periodicity,
      double feeValue,
      DateTime createdDate,
      int numMonths,
      int id});
}
