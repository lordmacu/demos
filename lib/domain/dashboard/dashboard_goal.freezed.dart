// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DashboardGoal {
  String get name;
  double get goalAmt;
  double get currentAmt;
  String get emoji;
  bool get tieneDomiciliacionprogramada;
  double get fee;
  int get periodicity;
  int get numMonths;
  bool get migrate;
  double get percentComplete;
  List<dynamic> get goalBalance;
  List<dynamic> get goalTransactions;
  DateTime get created;
  int get id;
  String get color;
  double get percentColor;
  double get assignedBalanceValue;

  DashboardGoal copyWith(
      {String name,
      double goalAmt,
      double currentAmt,
      String emoji,
      bool tieneDomiciliacionprogramada,
      double fee,
      int periodicity,
      int numMonths,
      bool migrate,
      double percentComplete,
      List<dynamic> goalBalance,
      List<dynamic> goalTransactions,
      DateTime created,
      int id,
      String color,
      double percentColor,
      double assignedBalanceValue});
}

class _$DashboardGoalTearOff {
  const _$DashboardGoalTearOff();

  _DashboardGoal call(
      {@required String name,
      @required double goalAmt,
      @required double currentAmt,
      @required String emoji,
      @required bool tieneDomiciliacionprogramada,
      @required double fee,
      @required int periodicity,
      @required int numMonths,
      @required bool migrate,
      double percentComplete,
      List<dynamic> goalBalance,
      List<dynamic> goalTransactions,
      @required DateTime created,
      @required int id,
      String color,
      double percentColor,
      double assignedBalanceValue}) {
    return _DashboardGoal(
      name: name,
      goalAmt: goalAmt,
      currentAmt: currentAmt,
      emoji: emoji,
      tieneDomiciliacionprogramada: tieneDomiciliacionprogramada,
      fee: fee,
      periodicity: periodicity,
      numMonths: numMonths,
      migrate: migrate,
      percentComplete: percentComplete,
      goalBalance: goalBalance,
      goalTransactions: goalTransactions,
      created: created,
      id: id,
      color: color,
      percentColor: percentColor,
      assignedBalanceValue: assignedBalanceValue,
    );
  }
}

const $DashboardGoal = _$DashboardGoalTearOff();

class _$_DashboardGoal implements _DashboardGoal {
  const _$_DashboardGoal(
      {@required this.name,
      @required this.goalAmt,
      @required this.currentAmt,
      @required this.emoji,
      @required this.tieneDomiciliacionprogramada,
      @required this.fee,
      @required this.periodicity,
      @required this.numMonths,
      @required this.migrate,
      this.percentComplete,
      this.goalBalance,
      this.goalTransactions,
      @required this.created,
      @required this.id,
      this.color,
      this.percentColor,
      this.assignedBalanceValue})
      : assert(name != null),
        assert(goalAmt != null),
        assert(currentAmt != null),
        assert(emoji != null),
        assert(tieneDomiciliacionprogramada != null),
        assert(fee != null),
        assert(periodicity != null),
        assert(numMonths != null),
        assert(migrate != null),
        assert(created != null),
        assert(id != null);

  @override
  final String name;
  @override
  final double goalAmt;
  @override
  final double currentAmt;
  @override
  final String emoji;
  @override
  final bool tieneDomiciliacionprogramada;
  @override
  final double fee;
  @override
  final int periodicity;
  @override
  final int numMonths;
  @override
  final bool migrate;
  @override
  final double percentComplete;
  @override
  final List<dynamic> goalBalance;
  @override
  final List<dynamic> goalTransactions;
  @override
  final DateTime created;
  @override
  final int id;
  @override
  final String color;
  @override
  final double percentColor;
  @override
  final double assignedBalanceValue;

  @override
  String toString() {
    return 'DashboardGoal(name: $name, goalAmt: $goalAmt, currentAmt: $currentAmt, emoji: $emoji, tieneDomiciliacionprogramada: $tieneDomiciliacionprogramada, fee: $fee, periodicity: $periodicity, numMonths: $numMonths, migrate: $migrate, percentComplete: $percentComplete, goalBalance: $goalBalance, goalTransactions: $goalTransactions, created: $created, id: $id, color: $color, percentColor: $percentColor, assignedBalanceValue: $assignedBalanceValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardGoal &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.goalAmt, goalAmt) ||
                const DeepCollectionEquality()
                    .equals(other.goalAmt, goalAmt)) &&
            (identical(other.currentAmt, currentAmt) ||
                const DeepCollectionEquality()
                    .equals(other.currentAmt, currentAmt)) &&
            (identical(other.emoji, emoji) ||
                const DeepCollectionEquality().equals(other.emoji, emoji)) &&
            (identical(other.tieneDomiciliacionprogramada,
                    tieneDomiciliacionprogramada) ||
                const DeepCollectionEquality().equals(
                    other.tieneDomiciliacionprogramada,
                    tieneDomiciliacionprogramada)) &&
            (identical(other.fee, fee) ||
                const DeepCollectionEquality().equals(other.fee, fee)) &&
            (identical(other.periodicity, periodicity) ||
                const DeepCollectionEquality()
                    .equals(other.periodicity, periodicity)) &&
            (identical(other.numMonths, numMonths) ||
                const DeepCollectionEquality()
                    .equals(other.numMonths, numMonths)) &&
            (identical(other.migrate, migrate) ||
                const DeepCollectionEquality()
                    .equals(other.migrate, migrate)) &&
            (identical(other.percentComplete, percentComplete) ||
                const DeepCollectionEquality()
                    .equals(other.percentComplete, percentComplete)) &&
            (identical(other.goalBalance, goalBalance) ||
                const DeepCollectionEquality()
                    .equals(other.goalBalance, goalBalance)) &&
            (identical(other.goalTransactions, goalTransactions) ||
                const DeepCollectionEquality()
                    .equals(other.goalTransactions, goalTransactions)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality()
                    .equals(other.created, created)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.percentColor, percentColor) ||
                const DeepCollectionEquality()
                    .equals(other.percentColor, percentColor)) &&
            (identical(other.assignedBalanceValue, assignedBalanceValue) ||
                const DeepCollectionEquality()
                    .equals(other.assignedBalanceValue, assignedBalanceValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(goalAmt) ^
      const DeepCollectionEquality().hash(currentAmt) ^
      const DeepCollectionEquality().hash(emoji) ^
      const DeepCollectionEquality().hash(tieneDomiciliacionprogramada) ^
      const DeepCollectionEquality().hash(fee) ^
      const DeepCollectionEquality().hash(periodicity) ^
      const DeepCollectionEquality().hash(numMonths) ^
      const DeepCollectionEquality().hash(migrate) ^
      const DeepCollectionEquality().hash(percentComplete) ^
      const DeepCollectionEquality().hash(goalBalance) ^
      const DeepCollectionEquality().hash(goalTransactions) ^
      const DeepCollectionEquality().hash(created) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(percentColor) ^
      const DeepCollectionEquality().hash(assignedBalanceValue);

  @override
  _$_DashboardGoal copyWith({
    Object name = freezed,
    Object goalAmt = freezed,
    Object currentAmt = freezed,
    Object emoji = freezed,
    Object tieneDomiciliacionprogramada = freezed,
    Object fee = freezed,
    Object periodicity = freezed,
    Object numMonths = freezed,
    Object migrate = freezed,
    Object percentComplete = freezed,
    Object goalBalance = freezed,
    Object goalTransactions = freezed,
    Object created = freezed,
    Object id = freezed,
    Object color = freezed,
    Object percentColor = freezed,
    Object assignedBalanceValue = freezed,
  }) {
    return _$_DashboardGoal(
      name: name == freezed ? this.name : name as String,
      goalAmt: goalAmt == freezed ? this.goalAmt : goalAmt as double,
      currentAmt:
          currentAmt == freezed ? this.currentAmt : currentAmt as double,
      emoji: emoji == freezed ? this.emoji : emoji as String,
      tieneDomiciliacionprogramada: tieneDomiciliacionprogramada == freezed
          ? this.tieneDomiciliacionprogramada
          : tieneDomiciliacionprogramada as bool,
      fee: fee == freezed ? this.fee : fee as double,
      periodicity:
          periodicity == freezed ? this.periodicity : periodicity as int,
      numMonths: numMonths == freezed ? this.numMonths : numMonths as int,
      migrate: migrate == freezed ? this.migrate : migrate as bool,
      percentComplete: percentComplete == freezed
          ? this.percentComplete
          : percentComplete as double,
      goalBalance: goalBalance == freezed
          ? this.goalBalance
          : goalBalance as List<dynamic>,
      goalTransactions: goalTransactions == freezed
          ? this.goalTransactions
          : goalTransactions as List<dynamic>,
      created: created == freezed ? this.created : created as DateTime,
      id: id == freezed ? this.id : id as int,
      color: color == freezed ? this.color : color as String,
      percentColor:
          percentColor == freezed ? this.percentColor : percentColor as double,
      assignedBalanceValue: assignedBalanceValue == freezed
          ? this.assignedBalanceValue
          : assignedBalanceValue as double,
    );
  }
}

abstract class _DashboardGoal implements DashboardGoal {
  const factory _DashboardGoal(
      {@required String name,
      @required double goalAmt,
      @required double currentAmt,
      @required String emoji,
      @required bool tieneDomiciliacionprogramada,
      @required double fee,
      @required int periodicity,
      @required int numMonths,
      @required bool migrate,
      double percentComplete,
      List<dynamic> goalBalance,
      List<dynamic> goalTransactions,
      @required DateTime created,
      @required int id,
      String color,
      double percentColor,
      double assignedBalanceValue}) = _$_DashboardGoal;

  @override
  String get name;
  @override
  double get goalAmt;
  @override
  double get currentAmt;
  @override
  String get emoji;
  @override
  bool get tieneDomiciliacionprogramada;
  @override
  double get fee;
  @override
  int get periodicity;
  @override
  int get numMonths;
  @override
  bool get migrate;
  @override
  double get percentComplete;
  @override
  List<dynamic> get goalBalance;
  @override
  List<dynamic> get goalTransactions;
  @override
  DateTime get created;
  @override
  int get id;
  @override
  String get color;
  @override
  double get percentColor;
  @override
  double get assignedBalanceValue;

  @override
  _DashboardGoal copyWith(
      {String name,
      double goalAmt,
      double currentAmt,
      String emoji,
      bool tieneDomiciliacionprogramada,
      double fee,
      int periodicity,
      int numMonths,
      bool migrate,
      double percentComplete,
      List<dynamic> goalBalance,
      List<dynamic> goalTransactions,
      DateTime created,
      int id,
      String color,
      double percentColor,
      double assignedBalanceValue});
}
