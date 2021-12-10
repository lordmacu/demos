// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'edit_goals_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$EditGoalsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  });
}

class _$EditGoalsEventTearOff {
  const _$EditGoalsEventTearOff();

  _updateName updateName(String newName) {
    return _updateName(
      newName,
    );
  }

  _updateEmoji updateEmoji(String newEmoji) {
    return _updateEmoji(
      newEmoji,
    );
  }

  _updateAmount updateAmount(double newAmount) {
    return _updateAmount(
      newAmount,
    );
  }

  _updatePeriodicity updatePeriodicity(int newPeriodicity) {
    return _updatePeriodicity(
      newPeriodicity,
    );
  }

  _updateSavings updateSavings(double newSavings) {
    return _updateSavings(
      newSavings,
    );
  }

  _postGoal postGoal(DashboardGoal goal) {
    return _postGoal(
      goal,
    );
  }

  _setGoal setGoal(DashboardGoal goal) {
    return _setGoal(
      goal,
    );
  }

  _deleteGoal deleteGoal(DashboardGoal goal) {
    return _deleteGoal(
      goal,
    );
  }

  _forceChart forceShowChart() {
    return const _forceChart();
  }

  _flagMigration flagMigration(bool value) {
    return _flagMigration(
      value,
    );
  }

  _validShowChart validShowChart(double newSavings, int newPeriodicity) {
    return _validShowChart(
      newSavings,
      newPeriodicity,
    );
  }
}

const $EditGoalsEvent = _$EditGoalsEventTearOff();

class _$_updateName implements _updateName {
  const _$_updateName(this.newName) : assert(newName != null);

  @override
  final String newName;

  @override
  String toString() {
    return 'EditGoalsEvent.updateName(newName: $newName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateName &&
            (identical(other.newName, newName) ||
                const DeepCollectionEquality().equals(other.newName, newName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newName);

  @override
  _$_updateName copyWith({
    Object newName = freezed,
  }) {
    return _$_updateName(
      newName == freezed ? this.newName : newName as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateName(newName);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class _updateName implements EditGoalsEvent {
  const factory _updateName(String newName) = _$_updateName;

  String get newName;

  _updateName copyWith({String newName});
}

class _$_updateEmoji implements _updateEmoji {
  const _$_updateEmoji(this.newEmoji) : assert(newEmoji != null);

  @override
  final String newEmoji;

  @override
  String toString() {
    return 'EditGoalsEvent.updateEmoji(newEmoji: $newEmoji)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateEmoji &&
            (identical(other.newEmoji, newEmoji) ||
                const DeepCollectionEquality()
                    .equals(other.newEmoji, newEmoji)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newEmoji);

  @override
  _$_updateEmoji copyWith({
    Object newEmoji = freezed,
  }) {
    return _$_updateEmoji(
      newEmoji == freezed ? this.newEmoji : newEmoji as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateEmoji(newEmoji);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateEmoji != null) {
      return updateEmoji(newEmoji);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateEmoji(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateEmoji != null) {
      return updateEmoji(this);
    }
    return orElse();
  }
}

abstract class _updateEmoji implements EditGoalsEvent {
  const factory _updateEmoji(String newEmoji) = _$_updateEmoji;

  String get newEmoji;

  _updateEmoji copyWith({String newEmoji});
}

class _$_updateAmount implements _updateAmount {
  const _$_updateAmount(this.newAmount) : assert(newAmount != null);

  @override
  final double newAmount;

  @override
  String toString() {
    return 'EditGoalsEvent.updateAmount(newAmount: $newAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateAmount &&
            (identical(other.newAmount, newAmount) ||
                const DeepCollectionEquality()
                    .equals(other.newAmount, newAmount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newAmount);

  @override
  _$_updateAmount copyWith({
    Object newAmount = freezed,
  }) {
    return _$_updateAmount(
      newAmount == freezed ? this.newAmount : newAmount as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateAmount(newAmount);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateAmount != null) {
      return updateAmount(newAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateAmount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateAmount != null) {
      return updateAmount(this);
    }
    return orElse();
  }
}

abstract class _updateAmount implements EditGoalsEvent {
  const factory _updateAmount(double newAmount) = _$_updateAmount;

  double get newAmount;

  _updateAmount copyWith({double newAmount});
}

class _$_updatePeriodicity implements _updatePeriodicity {
  const _$_updatePeriodicity(this.newPeriodicity)
      : assert(newPeriodicity != null);

  @override
  final int newPeriodicity;

  @override
  String toString() {
    return 'EditGoalsEvent.updatePeriodicity(newPeriodicity: $newPeriodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updatePeriodicity &&
            (identical(other.newPeriodicity, newPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.newPeriodicity, newPeriodicity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPeriodicity);

  @override
  _$_updatePeriodicity copyWith({
    Object newPeriodicity = freezed,
  }) {
    return _$_updatePeriodicity(
      newPeriodicity == freezed ? this.newPeriodicity : newPeriodicity as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updatePeriodicity(newPeriodicity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePeriodicity != null) {
      return updatePeriodicity(newPeriodicity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updatePeriodicity(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePeriodicity != null) {
      return updatePeriodicity(this);
    }
    return orElse();
  }
}

abstract class _updatePeriodicity implements EditGoalsEvent {
  const factory _updatePeriodicity(int newPeriodicity) = _$_updatePeriodicity;

  int get newPeriodicity;

  _updatePeriodicity copyWith({int newPeriodicity});
}

class _$_updateSavings implements _updateSavings {
  const _$_updateSavings(this.newSavings) : assert(newSavings != null);

  @override
  final double newSavings;

  @override
  String toString() {
    return 'EditGoalsEvent.updateSavings(newSavings: $newSavings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateSavings &&
            (identical(other.newSavings, newSavings) ||
                const DeepCollectionEquality()
                    .equals(other.newSavings, newSavings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newSavings);

  @override
  _$_updateSavings copyWith({
    Object newSavings = freezed,
  }) {
    return _$_updateSavings(
      newSavings == freezed ? this.newSavings : newSavings as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateSavings(newSavings);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateSavings != null) {
      return updateSavings(newSavings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return updateSavings(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateSavings != null) {
      return updateSavings(this);
    }
    return orElse();
  }
}

abstract class _updateSavings implements EditGoalsEvent {
  const factory _updateSavings(double newSavings) = _$_updateSavings;

  double get newSavings;

  _updateSavings copyWith({double newSavings});
}

class _$_postGoal implements _postGoal {
  const _$_postGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'EditGoalsEvent.postGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _postGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$_postGoal copyWith({
    Object goal = freezed,
  }) {
    return _$_postGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return postGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postGoal != null) {
      return postGoal(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return postGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postGoal != null) {
      return postGoal(this);
    }
    return orElse();
  }
}

abstract class _postGoal implements EditGoalsEvent {
  const factory _postGoal(DashboardGoal goal) = _$_postGoal;

  DashboardGoal get goal;

  _postGoal copyWith({DashboardGoal goal});
}

class _$_setGoal implements _setGoal {
  const _$_setGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'EditGoalsEvent.setGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _setGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$_setGoal copyWith({
    Object goal = freezed,
  }) {
    return _$_setGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return setGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setGoal != null) {
      return setGoal(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return setGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setGoal != null) {
      return setGoal(this);
    }
    return orElse();
  }
}

abstract class _setGoal implements EditGoalsEvent {
  const factory _setGoal(DashboardGoal goal) = _$_setGoal;

  DashboardGoal get goal;

  _setGoal copyWith({DashboardGoal goal});
}

class _$_deleteGoal implements _deleteGoal {
  const _$_deleteGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'EditGoalsEvent.deleteGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _deleteGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$_deleteGoal copyWith({
    Object goal = freezed,
  }) {
    return _$_deleteGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return deleteGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
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
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return deleteGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoal != null) {
      return deleteGoal(this);
    }
    return orElse();
  }
}

abstract class _deleteGoal implements EditGoalsEvent {
  const factory _deleteGoal(DashboardGoal goal) = _$_deleteGoal;

  DashboardGoal get goal;

  _deleteGoal copyWith({DashboardGoal goal});
}

class _$_forceChart implements _forceChart {
  const _$_forceChart();

  @override
  String toString() {
    return 'EditGoalsEvent.forceShowChart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _forceChart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return forceShowChart();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forceShowChart != null) {
      return forceShowChart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return forceShowChart(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forceShowChart != null) {
      return forceShowChart(this);
    }
    return orElse();
  }
}

abstract class _forceChart implements EditGoalsEvent {
  const factory _forceChart() = _$_forceChart;
}

class _$_flagMigration implements _flagMigration {
  const _$_flagMigration(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'EditGoalsEvent.flagMigration(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _flagMigration &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$_flagMigration copyWith({
    Object value = freezed,
  }) {
    return _$_flagMigration(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return flagMigration(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (flagMigration != null) {
      return flagMigration(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return flagMigration(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (flagMigration != null) {
      return flagMigration(this);
    }
    return orElse();
  }
}

abstract class _flagMigration implements EditGoalsEvent {
  const factory _flagMigration(bool value) = _$_flagMigration;

  bool get value;

  _flagMigration copyWith({bool value});
}

class _$_validShowChart implements _validShowChart {
  const _$_validShowChart(this.newSavings, this.newPeriodicity)
      : assert(newSavings != null),
        assert(newPeriodicity != null);

  @override
  final double newSavings;
  @override
  final int newPeriodicity;

  @override
  String toString() {
    return 'EditGoalsEvent.validShowChart(newSavings: $newSavings, newPeriodicity: $newPeriodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _validShowChart &&
            (identical(other.newSavings, newSavings) ||
                const DeepCollectionEquality()
                    .equals(other.newSavings, newSavings)) &&
            (identical(other.newPeriodicity, newPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.newPeriodicity, newPeriodicity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newSavings) ^
      const DeepCollectionEquality().hash(newPeriodicity);

  @override
  _$_validShowChart copyWith({
    Object newSavings = freezed,
    Object newPeriodicity = freezed,
  }) {
    return _$_validShowChart(
      newSavings == freezed ? this.newSavings : newSavings as double,
      newPeriodicity == freezed ? this.newPeriodicity : newPeriodicity as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result updateName(String newName),
    @required Result updateEmoji(String newEmoji),
    @required Result updateAmount(double newAmount),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result updateSavings(double newSavings),
    @required Result postGoal(DashboardGoal goal),
    @required Result setGoal(DashboardGoal goal),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result forceShowChart(),
    @required Result flagMigration(bool value),
    @required Result validShowChart(double newSavings, int newPeriodicity),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return validShowChart(newSavings, newPeriodicity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result updateName(String newName),
    Result updateEmoji(String newEmoji),
    Result updateAmount(double newAmount),
    Result updatePeriodicity(int newPeriodicity),
    Result updateSavings(double newSavings),
    Result postGoal(DashboardGoal goal),
    Result setGoal(DashboardGoal goal),
    Result deleteGoal(DashboardGoal goal),
    Result forceShowChart(),
    Result flagMigration(bool value),
    Result validShowChart(double newSavings, int newPeriodicity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validShowChart != null) {
      return validShowChart(newSavings, newPeriodicity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result updateName(_updateName value),
    @required Result updateEmoji(_updateEmoji value),
    @required Result updateAmount(_updateAmount value),
    @required Result updatePeriodicity(_updatePeriodicity value),
    @required Result updateSavings(_updateSavings value),
    @required Result postGoal(_postGoal value),
    @required Result setGoal(_setGoal value),
    @required Result deleteGoal(_deleteGoal value),
    @required Result forceShowChart(_forceChart value),
    @required Result flagMigration(_flagMigration value),
    @required Result validShowChart(_validShowChart value),
  }) {
    assert(updateName != null);
    assert(updateEmoji != null);
    assert(updateAmount != null);
    assert(updatePeriodicity != null);
    assert(updateSavings != null);
    assert(postGoal != null);
    assert(setGoal != null);
    assert(deleteGoal != null);
    assert(forceShowChart != null);
    assert(flagMigration != null);
    assert(validShowChart != null);
    return validShowChart(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result updateName(_updateName value),
    Result updateEmoji(_updateEmoji value),
    Result updateAmount(_updateAmount value),
    Result updatePeriodicity(_updatePeriodicity value),
    Result updateSavings(_updateSavings value),
    Result postGoal(_postGoal value),
    Result setGoal(_setGoal value),
    Result deleteGoal(_deleteGoal value),
    Result forceShowChart(_forceChart value),
    Result flagMigration(_flagMigration value),
    Result validShowChart(_validShowChart value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validShowChart != null) {
      return validShowChart(this);
    }
    return orElse();
  }
}

abstract class _validShowChart implements EditGoalsEvent {
  const factory _validShowChart(double newSavings, int newPeriodicity) =
      _$_validShowChart;

  double get newSavings;
  int get newPeriodicity;

  _validShowChart copyWith({double newSavings, int newPeriodicity});
}

mixin _$EditGoalsState {
  DashboardGoal get goalData;
  bool get nameError;
  bool get amountError;
  bool get showChart;
  bool get periodicityError;
  bool get cuoteError;
  Map<double, double> get dataUalet;
  Map<double, double> get dataOtros;
  double get maxX;
  double get maxY;
  Map<double, String> get lx;
  Map<double, String> get ly;
  int get numPeriodsUalet;
  bool get buttonActivated;
  bool get isPosting;
  Option<Either<BaseFailure, bool>> get postFailureOrSuccess;
  Option<Either<BaseFailure, bool>> get deleteGoalOrFailure;
  Option<Either<BaseFailure, GoalItem>> get createFailureOrSuccess;
  DashboardGoal get oldGoal;
  int get monthsOthers;
  bool get isMigrating;

  EditGoalsState copyWith(
      {DashboardGoal goalData,
      bool nameError,
      bool amountError,
      bool showChart,
      bool periodicityError,
      bool cuoteError,
      Map<double, double> dataUalet,
      Map<double, double> dataOtros,
      double maxX,
      double maxY,
      Map<double, String> lx,
      Map<double, String> ly,
      int numPeriodsUalet,
      bool buttonActivated,
      bool isPosting,
      Option<Either<BaseFailure, bool>> postFailureOrSuccess,
      Option<Either<BaseFailure, bool>> deleteGoalOrFailure,
      Option<Either<BaseFailure, GoalItem>> createFailureOrSuccess,
      DashboardGoal oldGoal,
      int monthsOthers,
      bool isMigrating});
}

class _$EditGoalsStateTearOff {
  const _$EditGoalsStateTearOff();

  _EditGoalsState call(
      {@required DashboardGoal goalData,
      @required bool nameError,
      @required bool amountError,
      @required bool showChart,
      @required bool periodicityError,
      @required bool cuoteError,
      @required Map<double, double> dataUalet,
      @required Map<double, double> dataOtros,
      @required double maxX,
      @required double maxY,
      @required Map<double, String> lx,
      @required Map<double, String> ly,
      @required int numPeriodsUalet,
      @required bool buttonActivated,
      @required bool isPosting,
      @required Option<Either<BaseFailure, bool>> postFailureOrSuccess,
      Option<Either<BaseFailure, bool>> deleteGoalOrFailure,
      Option<Either<BaseFailure, GoalItem>> createFailureOrSuccess,
      @required DashboardGoal oldGoal,
      @required int monthsOthers,
      bool isMigrating}) {
    return _EditGoalsState(
      goalData: goalData,
      nameError: nameError,
      amountError: amountError,
      showChart: showChart,
      periodicityError: periodicityError,
      cuoteError: cuoteError,
      dataUalet: dataUalet,
      dataOtros: dataOtros,
      maxX: maxX,
      maxY: maxY,
      lx: lx,
      ly: ly,
      numPeriodsUalet: numPeriodsUalet,
      buttonActivated: buttonActivated,
      isPosting: isPosting,
      postFailureOrSuccess: postFailureOrSuccess,
      deleteGoalOrFailure: deleteGoalOrFailure,
      createFailureOrSuccess: createFailureOrSuccess,
      oldGoal: oldGoal,
      monthsOthers: monthsOthers,
      isMigrating: isMigrating,
    );
  }
}

const $EditGoalsState = _$EditGoalsStateTearOff();

class _$_EditGoalsState implements _EditGoalsState {
  const _$_EditGoalsState(
      {@required this.goalData,
      @required this.nameError,
      @required this.amountError,
      @required this.showChart,
      @required this.periodicityError,
      @required this.cuoteError,
      @required this.dataUalet,
      @required this.dataOtros,
      @required this.maxX,
      @required this.maxY,
      @required this.lx,
      @required this.ly,
      @required this.numPeriodsUalet,
      @required this.buttonActivated,
      @required this.isPosting,
      @required this.postFailureOrSuccess,
      this.deleteGoalOrFailure,
      this.createFailureOrSuccess,
      @required this.oldGoal,
      @required this.monthsOthers,
      this.isMigrating})
      : assert(goalData != null),
        assert(nameError != null),
        assert(amountError != null),
        assert(showChart != null),
        assert(periodicityError != null),
        assert(cuoteError != null),
        assert(dataUalet != null),
        assert(dataOtros != null),
        assert(maxX != null),
        assert(maxY != null),
        assert(lx != null),
        assert(ly != null),
        assert(numPeriodsUalet != null),
        assert(buttonActivated != null),
        assert(isPosting != null),
        assert(postFailureOrSuccess != null),
        assert(oldGoal != null),
        assert(monthsOthers != null);

  @override
  final DashboardGoal goalData;
  @override
  final bool nameError;
  @override
  final bool amountError;
  @override
  final bool showChart;
  @override
  final bool periodicityError;
  @override
  final bool cuoteError;
  @override
  final Map<double, double> dataUalet;
  @override
  final Map<double, double> dataOtros;
  @override
  final double maxX;
  @override
  final double maxY;
  @override
  final Map<double, String> lx;
  @override
  final Map<double, String> ly;
  @override
  final int numPeriodsUalet;
  @override
  final bool buttonActivated;
  @override
  final bool isPosting;
  @override
  final Option<Either<BaseFailure, bool>> postFailureOrSuccess;
  @override
  final Option<Either<BaseFailure, bool>> deleteGoalOrFailure;
  @override
  final Option<Either<BaseFailure, GoalItem>> createFailureOrSuccess;
  @override
  final DashboardGoal oldGoal;
  @override
  final int monthsOthers;
  @override
  final bool isMigrating;

  @override
  String toString() {
    return 'EditGoalsState(goalData: $goalData, nameError: $nameError, amountError: $amountError, showChart: $showChart, periodicityError: $periodicityError, cuoteError: $cuoteError, dataUalet: $dataUalet, dataOtros: $dataOtros, maxX: $maxX, maxY: $maxY, lx: $lx, ly: $ly, numPeriodsUalet: $numPeriodsUalet, buttonActivated: $buttonActivated, isPosting: $isPosting, postFailureOrSuccess: $postFailureOrSuccess, deleteGoalOrFailure: $deleteGoalOrFailure, createFailureOrSuccess: $createFailureOrSuccess, oldGoal: $oldGoal, monthsOthers: $monthsOthers, isMigrating: $isMigrating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditGoalsState &&
            (identical(other.goalData, goalData) ||
                const DeepCollectionEquality()
                    .equals(other.goalData, goalData)) &&
            (identical(other.nameError, nameError) ||
                const DeepCollectionEquality()
                    .equals(other.nameError, nameError)) &&
            (identical(other.amountError, amountError) ||
                const DeepCollectionEquality()
                    .equals(other.amountError, amountError)) &&
            (identical(other.showChart, showChart) ||
                const DeepCollectionEquality()
                    .equals(other.showChart, showChart)) &&
            (identical(other.periodicityError, periodicityError) ||
                const DeepCollectionEquality()
                    .equals(other.periodicityError, periodicityError)) &&
            (identical(other.cuoteError, cuoteError) ||
                const DeepCollectionEquality()
                    .equals(other.cuoteError, cuoteError)) &&
            (identical(other.dataUalet, dataUalet) ||
                const DeepCollectionEquality()
                    .equals(other.dataUalet, dataUalet)) &&
            (identical(other.dataOtros, dataOtros) ||
                const DeepCollectionEquality()
                    .equals(other.dataOtros, dataOtros)) &&
            (identical(other.maxX, maxX) ||
                const DeepCollectionEquality().equals(other.maxX, maxX)) &&
            (identical(other.maxY, maxY) ||
                const DeepCollectionEquality().equals(other.maxY, maxY)) &&
            (identical(other.lx, lx) ||
                const DeepCollectionEquality().equals(other.lx, lx)) &&
            (identical(other.ly, ly) ||
                const DeepCollectionEquality().equals(other.ly, ly)) &&
            (identical(other.numPeriodsUalet, numPeriodsUalet) ||
                const DeepCollectionEquality()
                    .equals(other.numPeriodsUalet, numPeriodsUalet)) &&
            (identical(other.buttonActivated, buttonActivated) ||
                const DeepCollectionEquality()
                    .equals(other.buttonActivated, buttonActivated)) &&
            (identical(other.isPosting, isPosting) ||
                const DeepCollectionEquality()
                    .equals(other.isPosting, isPosting)) &&
            (identical(other.postFailureOrSuccess, postFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.postFailureOrSuccess, postFailureOrSuccess)) &&
            (identical(other.deleteGoalOrFailure, deleteGoalOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.deleteGoalOrFailure, deleteGoalOrFailure)) &&
            (identical(other.createFailureOrSuccess, createFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.createFailureOrSuccess, createFailureOrSuccess)) &&
            (identical(other.oldGoal, oldGoal) ||
                const DeepCollectionEquality()
                    .equals(other.oldGoal, oldGoal)) &&
            (identical(other.monthsOthers, monthsOthers) ||
                const DeepCollectionEquality()
                    .equals(other.monthsOthers, monthsOthers)) &&
            (identical(other.isMigrating, isMigrating) ||
                const DeepCollectionEquality()
                    .equals(other.isMigrating, isMigrating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goalData) ^
      const DeepCollectionEquality().hash(nameError) ^
      const DeepCollectionEquality().hash(amountError) ^
      const DeepCollectionEquality().hash(showChart) ^
      const DeepCollectionEquality().hash(periodicityError) ^
      const DeepCollectionEquality().hash(cuoteError) ^
      const DeepCollectionEquality().hash(dataUalet) ^
      const DeepCollectionEquality().hash(dataOtros) ^
      const DeepCollectionEquality().hash(maxX) ^
      const DeepCollectionEquality().hash(maxY) ^
      const DeepCollectionEquality().hash(lx) ^
      const DeepCollectionEquality().hash(ly) ^
      const DeepCollectionEquality().hash(numPeriodsUalet) ^
      const DeepCollectionEquality().hash(buttonActivated) ^
      const DeepCollectionEquality().hash(isPosting) ^
      const DeepCollectionEquality().hash(postFailureOrSuccess) ^
      const DeepCollectionEquality().hash(deleteGoalOrFailure) ^
      const DeepCollectionEquality().hash(createFailureOrSuccess) ^
      const DeepCollectionEquality().hash(oldGoal) ^
      const DeepCollectionEquality().hash(monthsOthers) ^
      const DeepCollectionEquality().hash(isMigrating);

  @override
  _$_EditGoalsState copyWith({
    Object goalData = freezed,
    Object nameError = freezed,
    Object amountError = freezed,
    Object showChart = freezed,
    Object periodicityError = freezed,
    Object cuoteError = freezed,
    Object dataUalet = freezed,
    Object dataOtros = freezed,
    Object maxX = freezed,
    Object maxY = freezed,
    Object lx = freezed,
    Object ly = freezed,
    Object numPeriodsUalet = freezed,
    Object buttonActivated = freezed,
    Object isPosting = freezed,
    Object postFailureOrSuccess = freezed,
    Object deleteGoalOrFailure = freezed,
    Object createFailureOrSuccess = freezed,
    Object oldGoal = freezed,
    Object monthsOthers = freezed,
    Object isMigrating = freezed,
  }) {
    return _$_EditGoalsState(
      goalData: goalData == freezed ? this.goalData : goalData as DashboardGoal,
      nameError: nameError == freezed ? this.nameError : nameError as bool,
      amountError:
          amountError == freezed ? this.amountError : amountError as bool,
      showChart: showChart == freezed ? this.showChart : showChart as bool,
      periodicityError: periodicityError == freezed
          ? this.periodicityError
          : periodicityError as bool,
      cuoteError: cuoteError == freezed ? this.cuoteError : cuoteError as bool,
      dataUalet: dataUalet == freezed
          ? this.dataUalet
          : dataUalet as Map<double, double>,
      dataOtros: dataOtros == freezed
          ? this.dataOtros
          : dataOtros as Map<double, double>,
      maxX: maxX == freezed ? this.maxX : maxX as double,
      maxY: maxY == freezed ? this.maxY : maxY as double,
      lx: lx == freezed ? this.lx : lx as Map<double, String>,
      ly: ly == freezed ? this.ly : ly as Map<double, String>,
      numPeriodsUalet: numPeriodsUalet == freezed
          ? this.numPeriodsUalet
          : numPeriodsUalet as int,
      buttonActivated: buttonActivated == freezed
          ? this.buttonActivated
          : buttonActivated as bool,
      isPosting: isPosting == freezed ? this.isPosting : isPosting as bool,
      postFailureOrSuccess: postFailureOrSuccess == freezed
          ? this.postFailureOrSuccess
          : postFailureOrSuccess as Option<Either<BaseFailure, bool>>,
      deleteGoalOrFailure: deleteGoalOrFailure == freezed
          ? this.deleteGoalOrFailure
          : deleteGoalOrFailure as Option<Either<BaseFailure, bool>>,
      createFailureOrSuccess: createFailureOrSuccess == freezed
          ? this.createFailureOrSuccess
          : createFailureOrSuccess as Option<Either<BaseFailure, GoalItem>>,
      oldGoal: oldGoal == freezed ? this.oldGoal : oldGoal as DashboardGoal,
      monthsOthers:
          monthsOthers == freezed ? this.monthsOthers : monthsOthers as int,
      isMigrating:
          isMigrating == freezed ? this.isMigrating : isMigrating as bool,
    );
  }
}

abstract class _EditGoalsState implements EditGoalsState {
  const factory _EditGoalsState(
      {@required DashboardGoal goalData,
      @required bool nameError,
      @required bool amountError,
      @required bool showChart,
      @required bool periodicityError,
      @required bool cuoteError,
      @required Map<double, double> dataUalet,
      @required Map<double, double> dataOtros,
      @required double maxX,
      @required double maxY,
      @required Map<double, String> lx,
      @required Map<double, String> ly,
      @required int numPeriodsUalet,
      @required bool buttonActivated,
      @required bool isPosting,
      @required Option<Either<BaseFailure, bool>> postFailureOrSuccess,
      Option<Either<BaseFailure, bool>> deleteGoalOrFailure,
      Option<Either<BaseFailure, GoalItem>> createFailureOrSuccess,
      @required DashboardGoal oldGoal,
      @required int monthsOthers,
      bool isMigrating}) = _$_EditGoalsState;

  @override
  DashboardGoal get goalData;
  @override
  bool get nameError;
  @override
  bool get amountError;
  @override
  bool get showChart;
  @override
  bool get periodicityError;
  @override
  bool get cuoteError;
  @override
  Map<double, double> get dataUalet;
  @override
  Map<double, double> get dataOtros;
  @override
  double get maxX;
  @override
  double get maxY;
  @override
  Map<double, String> get lx;
  @override
  Map<double, String> get ly;
  @override
  int get numPeriodsUalet;
  @override
  bool get buttonActivated;
  @override
  bool get isPosting;
  @override
  Option<Either<BaseFailure, bool>> get postFailureOrSuccess;
  @override
  Option<Either<BaseFailure, bool>> get deleteGoalOrFailure;
  @override
  Option<Either<BaseFailure, GoalItem>> get createFailureOrSuccess;
  @override
  DashboardGoal get oldGoal;
  @override
  int get monthsOthers;
  @override
  bool get isMigrating;

  @override
  _EditGoalsState copyWith(
      {DashboardGoal goalData,
      bool nameError,
      bool amountError,
      bool showChart,
      bool periodicityError,
      bool cuoteError,
      Map<double, double> dataUalet,
      Map<double, double> dataOtros,
      double maxX,
      double maxY,
      Map<double, String> lx,
      Map<double, String> ly,
      int numPeriodsUalet,
      bool buttonActivated,
      bool isPosting,
      Option<Either<BaseFailure, bool>> postFailureOrSuccess,
      Option<Either<BaseFailure, bool>> deleteGoalOrFailure,
      Option<Either<BaseFailure, GoalItem>> createFailureOrSuccess,
      DashboardGoal oldGoal,
      int monthsOthers,
      bool isMigrating});
}
