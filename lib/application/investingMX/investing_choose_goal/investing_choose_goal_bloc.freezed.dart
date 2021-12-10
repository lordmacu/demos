// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'investing_choose_goal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$InvestingChooseGoalEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addGoal(DashboardGoal goal, double value),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result choosePeriodicity(int periodicity),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addGoal(DashboardGoal goal, double value),
    Result deleteGoal(DashboardGoal goal),
    Result choosePeriodicity(int periodicity),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addGoal(_AddGoal value),
    @required Result deleteGoal(_DeleteGoal value),
    @required Result choosePeriodicity(_ChoosePerodicity value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addGoal(_AddGoal value),
    Result deleteGoal(_DeleteGoal value),
    Result choosePeriodicity(_ChoosePerodicity value),
    @required Result orElse(),
  });
}

class _$InvestingChooseGoalEventTearOff {
  const _$InvestingChooseGoalEventTearOff();

  _AddGoal addGoal(DashboardGoal goal, double value) {
    return _AddGoal(
      goal,
      value,
    );
  }

  _DeleteGoal deleteGoal(DashboardGoal goal) {
    return _DeleteGoal(
      goal,
    );
  }

  _ChoosePerodicity choosePeriodicity(int periodicity) {
    return _ChoosePerodicity(
      periodicity,
    );
  }
}

const $InvestingChooseGoalEvent = _$InvestingChooseGoalEventTearOff();

class _$_AddGoal implements _AddGoal {
  const _$_AddGoal(this.goal, this.value)
      : assert(goal != null),
        assert(value != null);

  @override
  final DashboardGoal goal;
  @override
  final double value;

  @override
  String toString() {
    return 'InvestingChooseGoalEvent.addGoal(goal: $goal, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$_AddGoal copyWith({
    Object goal = freezed,
    Object value = freezed,
  }) {
    return _$_AddGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
      value == freezed ? this.value : value as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addGoal(DashboardGoal goal, double value),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result choosePeriodicity(int periodicity),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return addGoal(goal, value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addGoal(DashboardGoal goal, double value),
    Result deleteGoal(DashboardGoal goal),
    Result choosePeriodicity(int periodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addGoal != null) {
      return addGoal(goal, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addGoal(_AddGoal value),
    @required Result deleteGoal(_DeleteGoal value),
    @required Result choosePeriodicity(_ChoosePerodicity value),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return addGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addGoal(_AddGoal value),
    Result deleteGoal(_DeleteGoal value),
    Result choosePeriodicity(_ChoosePerodicity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addGoal != null) {
      return addGoal(this);
    }
    return orElse();
  }
}

abstract class _AddGoal implements InvestingChooseGoalEvent {
  const factory _AddGoal(DashboardGoal goal, double value) = _$_AddGoal;

  DashboardGoal get goal;
  double get value;

  _AddGoal copyWith({DashboardGoal goal, double value});
}

class _$_DeleteGoal implements _DeleteGoal {
  const _$_DeleteGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'InvestingChooseGoalEvent.deleteGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$_DeleteGoal copyWith({
    Object goal = freezed,
  }) {
    return _$_DeleteGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addGoal(DashboardGoal goal, double value),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result choosePeriodicity(int periodicity),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return deleteGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addGoal(DashboardGoal goal, double value),
    Result deleteGoal(DashboardGoal goal),
    Result choosePeriodicity(int periodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoal != null) {
      return deleteGoal(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addGoal(_AddGoal value),
    @required Result deleteGoal(_DeleteGoal value),
    @required Result choosePeriodicity(_ChoosePerodicity value),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return deleteGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addGoal(_AddGoal value),
    Result deleteGoal(_DeleteGoal value),
    Result choosePeriodicity(_ChoosePerodicity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoal != null) {
      return deleteGoal(this);
    }
    return orElse();
  }
}

abstract class _DeleteGoal implements InvestingChooseGoalEvent {
  const factory _DeleteGoal(DashboardGoal goal) = _$_DeleteGoal;

  DashboardGoal get goal;

  _DeleteGoal copyWith({DashboardGoal goal});
}

class _$_ChoosePerodicity implements _ChoosePerodicity {
  const _$_ChoosePerodicity(this.periodicity) : assert(periodicity != null);

  @override
  final int periodicity;

  @override
  String toString() {
    return 'InvestingChooseGoalEvent.choosePeriodicity(periodicity: $periodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChoosePerodicity &&
            (identical(other.periodicity, periodicity) ||
                const DeepCollectionEquality()
                    .equals(other.periodicity, periodicity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(periodicity);

  @override
  _$_ChoosePerodicity copyWith({
    Object periodicity = freezed,
  }) {
    return _$_ChoosePerodicity(
      periodicity == freezed ? this.periodicity : periodicity as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addGoal(DashboardGoal goal, double value),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result choosePeriodicity(int periodicity),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return choosePeriodicity(periodicity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addGoal(DashboardGoal goal, double value),
    Result deleteGoal(DashboardGoal goal),
    Result choosePeriodicity(int periodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (choosePeriodicity != null) {
      return choosePeriodicity(periodicity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addGoal(_AddGoal value),
    @required Result deleteGoal(_DeleteGoal value),
    @required Result choosePeriodicity(_ChoosePerodicity value),
  }) {
    assert(addGoal != null);
    assert(deleteGoal != null);
    assert(choosePeriodicity != null);
    return choosePeriodicity(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addGoal(_AddGoal value),
    Result deleteGoal(_DeleteGoal value),
    Result choosePeriodicity(_ChoosePerodicity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (choosePeriodicity != null) {
      return choosePeriodicity(this);
    }
    return orElse();
  }
}

abstract class _ChoosePerodicity implements InvestingChooseGoalEvent {
  const factory _ChoosePerodicity(int periodicity) = _$_ChoosePerodicity;

  int get periodicity;

  _ChoosePerodicity copyWith({int periodicity});
}

mixin _$InvestingChooseGoalState {
  List<DashboardGoal> get goalsChosen;
  List<double> get valuesChosen;
  Map<int, bool> get alreadyChosen;
  bool get isActive;
  double get total;
  int get chosedPeriodicity;

  InvestingChooseGoalState copyWith(
      {List<DashboardGoal> goalsChosen,
      List<double> valuesChosen,
      Map<int, bool> alreadyChosen,
      bool isActive,
      double total,
      int chosedPeriodicity});
}

class _$InvestingChooseGoalStateTearOff {
  const _$InvestingChooseGoalStateTearOff();

  _InvestingChooseGoalState call(
      {List<DashboardGoal> goalsChosen,
      List<double> valuesChosen,
      Map<int, bool> alreadyChosen,
      bool isActive,
      double total,
      int chosedPeriodicity}) {
    return _InvestingChooseGoalState(
      goalsChosen: goalsChosen,
      valuesChosen: valuesChosen,
      alreadyChosen: alreadyChosen,
      isActive: isActive,
      total: total,
      chosedPeriodicity: chosedPeriodicity,
    );
  }
}

const $InvestingChooseGoalState = _$InvestingChooseGoalStateTearOff();

class _$_InvestingChooseGoalState implements _InvestingChooseGoalState {
  const _$_InvestingChooseGoalState(
      {this.goalsChosen,
      this.valuesChosen,
      this.alreadyChosen,
      this.isActive,
      this.total,
      this.chosedPeriodicity});

  @override
  final List<DashboardGoal> goalsChosen;
  @override
  final List<double> valuesChosen;
  @override
  final Map<int, bool> alreadyChosen;
  @override
  final bool isActive;
  @override
  final double total;
  @override
  final int chosedPeriodicity;

  @override
  String toString() {
    return 'InvestingChooseGoalState(goalsChosen: $goalsChosen, valuesChosen: $valuesChosen, alreadyChosen: $alreadyChosen, isActive: $isActive, total: $total, chosedPeriodicity: $chosedPeriodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvestingChooseGoalState &&
            (identical(other.goalsChosen, goalsChosen) ||
                const DeepCollectionEquality()
                    .equals(other.goalsChosen, goalsChosen)) &&
            (identical(other.valuesChosen, valuesChosen) ||
                const DeepCollectionEquality()
                    .equals(other.valuesChosen, valuesChosen)) &&
            (identical(other.alreadyChosen, alreadyChosen) ||
                const DeepCollectionEquality()
                    .equals(other.alreadyChosen, alreadyChosen)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.chosedPeriodicity, chosedPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.chosedPeriodicity, chosedPeriodicity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goalsChosen) ^
      const DeepCollectionEquality().hash(valuesChosen) ^
      const DeepCollectionEquality().hash(alreadyChosen) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(chosedPeriodicity);

  @override
  _$_InvestingChooseGoalState copyWith({
    Object goalsChosen = freezed,
    Object valuesChosen = freezed,
    Object alreadyChosen = freezed,
    Object isActive = freezed,
    Object total = freezed,
    Object chosedPeriodicity = freezed,
  }) {
    return _$_InvestingChooseGoalState(
      goalsChosen: goalsChosen == freezed
          ? this.goalsChosen
          : goalsChosen as List<DashboardGoal>,
      valuesChosen: valuesChosen == freezed
          ? this.valuesChosen
          : valuesChosen as List<double>,
      alreadyChosen: alreadyChosen == freezed
          ? this.alreadyChosen
          : alreadyChosen as Map<int, bool>,
      isActive: isActive == freezed ? this.isActive : isActive as bool,
      total: total == freezed ? this.total : total as double,
      chosedPeriodicity: chosedPeriodicity == freezed
          ? this.chosedPeriodicity
          : chosedPeriodicity as int,
    );
  }
}

abstract class _InvestingChooseGoalState implements InvestingChooseGoalState {
  const factory _InvestingChooseGoalState(
      {List<DashboardGoal> goalsChosen,
      List<double> valuesChosen,
      Map<int, bool> alreadyChosen,
      bool isActive,
      double total,
      int chosedPeriodicity}) = _$_InvestingChooseGoalState;

  @override
  List<DashboardGoal> get goalsChosen;
  @override
  List<double> get valuesChosen;
  @override
  Map<int, bool> get alreadyChosen;
  @override
  bool get isActive;
  @override
  double get total;
  @override
  int get chosedPeriodicity;

  @override
  _InvestingChooseGoalState copyWith(
      {List<DashboardGoal> goalsChosen,
      List<double> valuesChosen,
      Map<int, bool> alreadyChosen,
      bool isActive,
      double total,
      int chosedPeriodicity});
}
