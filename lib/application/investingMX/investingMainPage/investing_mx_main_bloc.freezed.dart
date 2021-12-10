// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'investing_mx_main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$InvestingMxMainEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  });
}

class _$InvestingMxMainEventTearOff {
  const _$InvestingMxMainEventTearOff();

  _selectGoal selectGoal(DashboardGoal newGoal, int newSelectedIndex) {
    return _selectGoal(
      newGoal,
      newSelectedIndex,
    );
  }

  _initial inicial() {
    return const _initial();
  }

  _updateFee updateFee(double newFee) {
    return _updateFee(
      newFee,
    );
  }

  _newPeriodicity updatePeriodicity(int newPeriodicity, bool multiple) {
    return _newPeriodicity(
      newPeriodicity,
      multiple,
    );
  }

  _undoChange undoChange(bool multiple) {
    return _undoChange(
      multiple,
    );
  }

  _acceptChange acceptChange(bool multiple) {
    return _acceptChange(
      multiple,
    );
  }

  _forceShowDialog forceShowDialog() {
    return const _forceShowDialog();
  }

  _updateInitialDate updateInitialDate(DateTime newInitialDate) {
    return _updateInitialDate(
      newInitialDate,
    );
  }

  _GetMultipleFata getMultipleData(
      List<DashboardGoal> goals, List<double> values) {
    return _GetMultipleFata(
      goals,
      values,
    );
  }

  _NextPage nextPage(bool isSubmitting) {
    return _NextPage(
      isSubmitting,
    );
  }

  _NextProcessAwait nextProcessAwait(BankAccountItem item, DashboardGoal goal,
      bool multiple, List<DashboardGoal> goals, double totalValue) {
    return _NextProcessAwait(
      item,
      goal,
      multiple,
      goals,
      totalValue,
    );
  }
}

const $InvestingMxMainEvent = _$InvestingMxMainEventTearOff();

class _$_selectGoal implements _selectGoal {
  const _$_selectGoal(this.newGoal, this.newSelectedIndex)
      : assert(newGoal != null),
        assert(newSelectedIndex != null);

  @override
  final DashboardGoal newGoal;
  @override
  final int newSelectedIndex;

  @override
  String toString() {
    return 'InvestingMxMainEvent.selectGoal(newGoal: $newGoal, newSelectedIndex: $newSelectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _selectGoal &&
            (identical(other.newGoal, newGoal) ||
                const DeepCollectionEquality()
                    .equals(other.newGoal, newGoal)) &&
            (identical(other.newSelectedIndex, newSelectedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.newSelectedIndex, newSelectedIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newGoal) ^
      const DeepCollectionEquality().hash(newSelectedIndex);

  @override
  _$_selectGoal copyWith({
    Object newGoal = freezed,
    Object newSelectedIndex = freezed,
  }) {
    return _$_selectGoal(
      newGoal == freezed ? this.newGoal : newGoal as DashboardGoal,
      newSelectedIndex == freezed
          ? this.newSelectedIndex
          : newSelectedIndex as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return selectGoal(newGoal, newSelectedIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectGoal != null) {
      return selectGoal(newGoal, newSelectedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return selectGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectGoal != null) {
      return selectGoal(this);
    }
    return orElse();
  }
}

abstract class _selectGoal implements InvestingMxMainEvent {
  const factory _selectGoal(DashboardGoal newGoal, int newSelectedIndex) =
      _$_selectGoal;

  DashboardGoal get newGoal;
  int get newSelectedIndex;

  _selectGoal copyWith({DashboardGoal newGoal, int newSelectedIndex});
}

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'InvestingMxMainEvent.inicial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return inicial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inicial != null) {
      return inicial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return inicial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inicial != null) {
      return inicial(this);
    }
    return orElse();
  }
}

abstract class _initial implements InvestingMxMainEvent {
  const factory _initial() = _$_initial;
}

class _$_updateFee implements _updateFee {
  const _$_updateFee(this.newFee) : assert(newFee != null);

  @override
  final double newFee;

  @override
  String toString() {
    return 'InvestingMxMainEvent.updateFee(newFee: $newFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateFee &&
            (identical(other.newFee, newFee) ||
                const DeepCollectionEquality().equals(other.newFee, newFee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newFee);

  @override
  _$_updateFee copyWith({
    Object newFee = freezed,
  }) {
    return _$_updateFee(
      newFee == freezed ? this.newFee : newFee as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updateFee(newFee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateFee != null) {
      return updateFee(newFee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updateFee(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateFee != null) {
      return updateFee(this);
    }
    return orElse();
  }
}

abstract class _updateFee implements InvestingMxMainEvent {
  const factory _updateFee(double newFee) = _$_updateFee;

  double get newFee;

  _updateFee copyWith({double newFee});
}

class _$_newPeriodicity implements _newPeriodicity {
  const _$_newPeriodicity(this.newPeriodicity, this.multiple)
      : assert(newPeriodicity != null),
        assert(multiple != null);

  @override
  final int newPeriodicity;
  @override
  final bool multiple;

  @override
  String toString() {
    return 'InvestingMxMainEvent.updatePeriodicity(newPeriodicity: $newPeriodicity, multiple: $multiple)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _newPeriodicity &&
            (identical(other.newPeriodicity, newPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.newPeriodicity, newPeriodicity)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPeriodicity) ^
      const DeepCollectionEquality().hash(multiple);

  @override
  _$_newPeriodicity copyWith({
    Object newPeriodicity = freezed,
    Object multiple = freezed,
  }) {
    return _$_newPeriodicity(
      newPeriodicity == freezed ? this.newPeriodicity : newPeriodicity as int,
      multiple == freezed ? this.multiple : multiple as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updatePeriodicity(newPeriodicity, multiple);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePeriodicity != null) {
      return updatePeriodicity(newPeriodicity, multiple);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updatePeriodicity(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePeriodicity != null) {
      return updatePeriodicity(this);
    }
    return orElse();
  }
}

abstract class _newPeriodicity implements InvestingMxMainEvent {
  const factory _newPeriodicity(int newPeriodicity, bool multiple) =
      _$_newPeriodicity;

  int get newPeriodicity;
  bool get multiple;

  _newPeriodicity copyWith({int newPeriodicity, bool multiple});
}

class _$_undoChange implements _undoChange {
  const _$_undoChange(this.multiple) : assert(multiple != null);

  @override
  final bool multiple;

  @override
  String toString() {
    return 'InvestingMxMainEvent.undoChange(multiple: $multiple)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _undoChange &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(multiple);

  @override
  _$_undoChange copyWith({
    Object multiple = freezed,
  }) {
    return _$_undoChange(
      multiple == freezed ? this.multiple : multiple as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return undoChange(multiple);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undoChange != null) {
      return undoChange(multiple);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return undoChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undoChange != null) {
      return undoChange(this);
    }
    return orElse();
  }
}

abstract class _undoChange implements InvestingMxMainEvent {
  const factory _undoChange(bool multiple) = _$_undoChange;

  bool get multiple;

  _undoChange copyWith({bool multiple});
}

class _$_acceptChange implements _acceptChange {
  const _$_acceptChange(this.multiple) : assert(multiple != null);

  @override
  final bool multiple;

  @override
  String toString() {
    return 'InvestingMxMainEvent.acceptChange(multiple: $multiple)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _acceptChange &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(multiple);

  @override
  _$_acceptChange copyWith({
    Object multiple = freezed,
  }) {
    return _$_acceptChange(
      multiple == freezed ? this.multiple : multiple as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return acceptChange(multiple);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptChange != null) {
      return acceptChange(multiple);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return acceptChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptChange != null) {
      return acceptChange(this);
    }
    return orElse();
  }
}

abstract class _acceptChange implements InvestingMxMainEvent {
  const factory _acceptChange(bool multiple) = _$_acceptChange;

  bool get multiple;

  _acceptChange copyWith({bool multiple});
}

class _$_forceShowDialog implements _forceShowDialog {
  const _$_forceShowDialog();

  @override
  String toString() {
    return 'InvestingMxMainEvent.forceShowDialog()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _forceShowDialog);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return forceShowDialog();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forceShowDialog != null) {
      return forceShowDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return forceShowDialog(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forceShowDialog != null) {
      return forceShowDialog(this);
    }
    return orElse();
  }
}

abstract class _forceShowDialog implements InvestingMxMainEvent {
  const factory _forceShowDialog() = _$_forceShowDialog;
}

class _$_updateInitialDate implements _updateInitialDate {
  const _$_updateInitialDate(this.newInitialDate)
      : assert(newInitialDate != null);

  @override
  final DateTime newInitialDate;

  @override
  String toString() {
    return 'InvestingMxMainEvent.updateInitialDate(newInitialDate: $newInitialDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _updateInitialDate &&
            (identical(other.newInitialDate, newInitialDate) ||
                const DeepCollectionEquality()
                    .equals(other.newInitialDate, newInitialDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newInitialDate);

  @override
  _$_updateInitialDate copyWith({
    Object newInitialDate = freezed,
  }) {
    return _$_updateInitialDate(
      newInitialDate == freezed
          ? this.newInitialDate
          : newInitialDate as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updateInitialDate(newInitialDate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateInitialDate != null) {
      return updateInitialDate(newInitialDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return updateInitialDate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateInitialDate != null) {
      return updateInitialDate(this);
    }
    return orElse();
  }
}

abstract class _updateInitialDate implements InvestingMxMainEvent {
  const factory _updateInitialDate(DateTime newInitialDate) =
      _$_updateInitialDate;

  DateTime get newInitialDate;

  _updateInitialDate copyWith({DateTime newInitialDate});
}

class _$_GetMultipleFata implements _GetMultipleFata {
  const _$_GetMultipleFata(this.goals, this.values)
      : assert(goals != null),
        assert(values != null);

  @override
  final List<DashboardGoal> goals;
  @override
  final List<double> values;

  @override
  String toString() {
    return 'InvestingMxMainEvent.getMultipleData(goals: $goals, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetMultipleFata &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)) &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goals) ^
      const DeepCollectionEquality().hash(values);

  @override
  _$_GetMultipleFata copyWith({
    Object goals = freezed,
    Object values = freezed,
  }) {
    return _$_GetMultipleFata(
      goals == freezed ? this.goals : goals as List<DashboardGoal>,
      values == freezed ? this.values : values as List<double>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return getMultipleData(goals, values);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getMultipleData != null) {
      return getMultipleData(goals, values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return getMultipleData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getMultipleData != null) {
      return getMultipleData(this);
    }
    return orElse();
  }
}

abstract class _GetMultipleFata implements InvestingMxMainEvent {
  const factory _GetMultipleFata(
      List<DashboardGoal> goals, List<double> values) = _$_GetMultipleFata;

  List<DashboardGoal> get goals;
  List<double> get values;

  _GetMultipleFata copyWith({List<DashboardGoal> goals, List<double> values});
}

class _$_NextPage implements _NextPage {
  const _$_NextPage(this.isSubmitting) : assert(isSubmitting != null);

  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'InvestingMxMainEvent.nextPage(isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NextPage &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isSubmitting);

  @override
  _$_NextPage copyWith({
    Object isSubmitting = freezed,
  }) {
    return _$_NextPage(
      isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return nextPage(isSubmitting);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextPage != null) {
      return nextPage(isSubmitting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return nextPage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextPage != null) {
      return nextPage(this);
    }
    return orElse();
  }
}

abstract class _NextPage implements InvestingMxMainEvent {
  const factory _NextPage(bool isSubmitting) = _$_NextPage;

  bool get isSubmitting;

  _NextPage copyWith({bool isSubmitting});
}

class _$_NextProcessAwait implements _NextProcessAwait {
  const _$_NextProcessAwait(
      this.item, this.goal, this.multiple, this.goals, this.totalValue)
      : assert(item != null),
        assert(goal != null),
        assert(multiple != null),
        assert(goals != null),
        assert(totalValue != null);

  @override
  final BankAccountItem item;
  @override
  final DashboardGoal goal;
  @override
  final bool multiple;
  @override
  final List<DashboardGoal> goals;
  @override
  final double totalValue;

  @override
  String toString() {
    return 'InvestingMxMainEvent.nextProcessAwait(item: $item, goal: $goal, multiple: $multiple, goals: $goals, totalValue: $totalValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NextProcessAwait &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)) &&
            (identical(other.totalValue, totalValue) ||
                const DeepCollectionEquality()
                    .equals(other.totalValue, totalValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(goals) ^
      const DeepCollectionEquality().hash(totalValue);

  @override
  _$_NextProcessAwait copyWith({
    Object item = freezed,
    Object goal = freezed,
    Object multiple = freezed,
    Object goals = freezed,
    Object totalValue = freezed,
  }) {
    return _$_NextProcessAwait(
      item == freezed ? this.item : item as BankAccountItem,
      goal == freezed ? this.goal : goal as DashboardGoal,
      multiple == freezed ? this.multiple : multiple as bool,
      goals == freezed ? this.goals : goals as List<DashboardGoal>,
      totalValue == freezed ? this.totalValue : totalValue as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity, bool multiple),
    @required Result undoChange(bool multiple),
    @required Result acceptChange(bool multiple),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required
        Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    @required Result nextPage(bool isSubmitting),
    @required
        Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
            bool multiple, List<DashboardGoal> goals, double totalValue),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return nextProcessAwait(item, goal, multiple, goals, totalValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity, bool multiple),
    Result undoChange(bool multiple),
    Result acceptChange(bool multiple),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result getMultipleData(List<DashboardGoal> goals, List<double> values),
    Result nextPage(bool isSubmitting),
    Result nextProcessAwait(BankAccountItem item, DashboardGoal goal,
        bool multiple, List<DashboardGoal> goals, double totalValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextProcessAwait != null) {
      return nextProcessAwait(item, goal, multiple, goals, totalValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result getMultipleData(_GetMultipleFata value),
    @required Result nextPage(_NextPage value),
    @required Result nextProcessAwait(_NextProcessAwait value),
  }) {
    assert(selectGoal != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(getMultipleData != null);
    assert(nextPage != null);
    assert(nextProcessAwait != null);
    return nextProcessAwait(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result getMultipleData(_GetMultipleFata value),
    Result nextPage(_NextPage value),
    Result nextProcessAwait(_NextProcessAwait value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextProcessAwait != null) {
      return nextProcessAwait(this);
    }
    return orElse();
  }
}

abstract class _NextProcessAwait implements InvestingMxMainEvent {
  const factory _NextProcessAwait(
      BankAccountItem item,
      DashboardGoal goal,
      bool multiple,
      List<DashboardGoal> goals,
      double totalValue) = _$_NextProcessAwait;

  BankAccountItem get item;
  DashboardGoal get goal;
  bool get multiple;
  List<DashboardGoal> get goals;
  double get totalValue;

  _NextProcessAwait copyWith(
      {BankAccountItem item,
      DashboardGoal goal,
      bool multiple,
      List<DashboardGoal> goals,
      double totalValue});
}

mixin _$InvestingMxMainState {
  int get selectedGoalIndex;
  DashboardGoal get goal;
  List<String> get periodicityList;
  List<DashboardGoal> get newGoals;
  List<DashboardGoal> get oldGoals;
  List<double> get valuesChosen;
  int get oldMonths;
  int get oldPeriodicity;
  double get oldFee;
  bool get showDialog;
  DateTime get initialDate;
  bool get isAvailableDate;
  bool get isAvailableDateValidation;
  bool get isSubmitting;
  int get multiplePeriodicity;
  int get oldmultiplePeriodicity;
  bool get nextProcess;
  String get messageErrorNextProcess;

  InvestingMxMainState copyWith(
      {int selectedGoalIndex,
      DashboardGoal goal,
      List<String> periodicityList,
      List<DashboardGoal> newGoals,
      List<DashboardGoal> oldGoals,
      List<double> valuesChosen,
      int oldMonths,
      int oldPeriodicity,
      double oldFee,
      bool showDialog,
      DateTime initialDate,
      bool isAvailableDate,
      bool isAvailableDateValidation,
      bool isSubmitting,
      int multiplePeriodicity,
      int oldmultiplePeriodicity,
      bool nextProcess,
      String messageErrorNextProcess});
}

class _$InvestingMxMainStateTearOff {
  const _$InvestingMxMainStateTearOff();

  _InvestingMxMainState call(
      {@required int selectedGoalIndex,
      @required DashboardGoal goal,
      @required List<String> periodicityList,
      List<DashboardGoal> newGoals,
      List<DashboardGoal> oldGoals,
      List<double> valuesChosen,
      @required int oldMonths,
      @required int oldPeriodicity,
      @required double oldFee,
      @required bool showDialog,
      @required DateTime initialDate,
      @required bool isAvailableDate,
      @required bool isAvailableDateValidation,
      bool isSubmitting,
      int multiplePeriodicity,
      int oldmultiplePeriodicity,
      bool nextProcess,
      String messageErrorNextProcess}) {
    return _InvestingMxMainState(
      selectedGoalIndex: selectedGoalIndex,
      goal: goal,
      periodicityList: periodicityList,
      newGoals: newGoals,
      oldGoals: oldGoals,
      valuesChosen: valuesChosen,
      oldMonths: oldMonths,
      oldPeriodicity: oldPeriodicity,
      oldFee: oldFee,
      showDialog: showDialog,
      initialDate: initialDate,
      isAvailableDate: isAvailableDate,
      isAvailableDateValidation: isAvailableDateValidation,
      isSubmitting: isSubmitting,
      multiplePeriodicity: multiplePeriodicity,
      oldmultiplePeriodicity: oldmultiplePeriodicity,
      nextProcess: nextProcess,
      messageErrorNextProcess: messageErrorNextProcess,
    );
  }
}

const $InvestingMxMainState = _$InvestingMxMainStateTearOff();

class _$_InvestingMxMainState implements _InvestingMxMainState {
  const _$_InvestingMxMainState(
      {@required this.selectedGoalIndex,
      @required this.goal,
      @required this.periodicityList,
      this.newGoals,
      this.oldGoals,
      this.valuesChosen,
      @required this.oldMonths,
      @required this.oldPeriodicity,
      @required this.oldFee,
      @required this.showDialog,
      @required this.initialDate,
      @required this.isAvailableDate,
      @required this.isAvailableDateValidation,
      this.isSubmitting,
      this.multiplePeriodicity,
      this.oldmultiplePeriodicity,
      this.nextProcess,
      this.messageErrorNextProcess})
      : assert(selectedGoalIndex != null),
        assert(goal != null),
        assert(periodicityList != null),
        assert(oldMonths != null),
        assert(oldPeriodicity != null),
        assert(oldFee != null),
        assert(showDialog != null),
        assert(initialDate != null),
        assert(isAvailableDate != null),
        assert(isAvailableDateValidation != null);

  @override
  final int selectedGoalIndex;
  @override
  final DashboardGoal goal;
  @override
  final List<String> periodicityList;
  @override
  final List<DashboardGoal> newGoals;
  @override
  final List<DashboardGoal> oldGoals;
  @override
  final List<double> valuesChosen;
  @override
  final int oldMonths;
  @override
  final int oldPeriodicity;
  @override
  final double oldFee;
  @override
  final bool showDialog;
  @override
  final DateTime initialDate;
  @override
  final bool isAvailableDate;
  @override
  final bool isAvailableDateValidation;
  @override
  final bool isSubmitting;
  @override
  final int multiplePeriodicity;
  @override
  final int oldmultiplePeriodicity;
  @override
  final bool nextProcess;
  @override
  final String messageErrorNextProcess;

  @override
  String toString() {
    return 'InvestingMxMainState(selectedGoalIndex: $selectedGoalIndex, goal: $goal, periodicityList: $periodicityList, newGoals: $newGoals, oldGoals: $oldGoals, valuesChosen: $valuesChosen, oldMonths: $oldMonths, oldPeriodicity: $oldPeriodicity, oldFee: $oldFee, showDialog: $showDialog, initialDate: $initialDate, isAvailableDate: $isAvailableDate, isAvailableDateValidation: $isAvailableDateValidation, isSubmitting: $isSubmitting, multiplePeriodicity: $multiplePeriodicity, oldmultiplePeriodicity: $oldmultiplePeriodicity, nextProcess: $nextProcess, messageErrorNextProcess: $messageErrorNextProcess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvestingMxMainState &&
            (identical(other.selectedGoalIndex, selectedGoalIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedGoalIndex, selectedGoalIndex)) &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.periodicityList, periodicityList) ||
                const DeepCollectionEquality()
                    .equals(other.periodicityList, periodicityList)) &&
            (identical(other.newGoals, newGoals) ||
                const DeepCollectionEquality()
                    .equals(other.newGoals, newGoals)) &&
            (identical(other.oldGoals, oldGoals) ||
                const DeepCollectionEquality()
                    .equals(other.oldGoals, oldGoals)) &&
            (identical(other.valuesChosen, valuesChosen) ||
                const DeepCollectionEquality()
                    .equals(other.valuesChosen, valuesChosen)) &&
            (identical(other.oldMonths, oldMonths) ||
                const DeepCollectionEquality()
                    .equals(other.oldMonths, oldMonths)) &&
            (identical(other.oldPeriodicity, oldPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.oldPeriodicity, oldPeriodicity)) &&
            (identical(other.oldFee, oldFee) ||
                const DeepCollectionEquality().equals(other.oldFee, oldFee)) &&
            (identical(other.showDialog, showDialog) ||
                const DeepCollectionEquality()
                    .equals(other.showDialog, showDialog)) &&
            (identical(other.initialDate, initialDate) ||
                const DeepCollectionEquality()
                    .equals(other.initialDate, initialDate)) &&
            (identical(other.isAvailableDate, isAvailableDate) ||
                const DeepCollectionEquality()
                    .equals(other.isAvailableDate, isAvailableDate)) &&
            (identical(other.isAvailableDateValidation,
                    isAvailableDateValidation) ||
                const DeepCollectionEquality().equals(
                    other.isAvailableDateValidation,
                    isAvailableDateValidation)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.multiplePeriodicity, multiplePeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.multiplePeriodicity, multiplePeriodicity)) &&
            (identical(other.oldmultiplePeriodicity, oldmultiplePeriodicity) ||
                const DeepCollectionEquality().equals(
                    other.oldmultiplePeriodicity, oldmultiplePeriodicity)) &&
            (identical(other.nextProcess, nextProcess) ||
                const DeepCollectionEquality()
                    .equals(other.nextProcess, nextProcess)) &&
            (identical(
                    other.messageErrorNextProcess, messageErrorNextProcess) ||
                const DeepCollectionEquality().equals(
                    other.messageErrorNextProcess, messageErrorNextProcess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedGoalIndex) ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(periodicityList) ^
      const DeepCollectionEquality().hash(newGoals) ^
      const DeepCollectionEquality().hash(oldGoals) ^
      const DeepCollectionEquality().hash(valuesChosen) ^
      const DeepCollectionEquality().hash(oldMonths) ^
      const DeepCollectionEquality().hash(oldPeriodicity) ^
      const DeepCollectionEquality().hash(oldFee) ^
      const DeepCollectionEquality().hash(showDialog) ^
      const DeepCollectionEquality().hash(initialDate) ^
      const DeepCollectionEquality().hash(isAvailableDate) ^
      const DeepCollectionEquality().hash(isAvailableDateValidation) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(multiplePeriodicity) ^
      const DeepCollectionEquality().hash(oldmultiplePeriodicity) ^
      const DeepCollectionEquality().hash(nextProcess) ^
      const DeepCollectionEquality().hash(messageErrorNextProcess);

  @override
  _$_InvestingMxMainState copyWith({
    Object selectedGoalIndex = freezed,
    Object goal = freezed,
    Object periodicityList = freezed,
    Object newGoals = freezed,
    Object oldGoals = freezed,
    Object valuesChosen = freezed,
    Object oldMonths = freezed,
    Object oldPeriodicity = freezed,
    Object oldFee = freezed,
    Object showDialog = freezed,
    Object initialDate = freezed,
    Object isAvailableDate = freezed,
    Object isAvailableDateValidation = freezed,
    Object isSubmitting = freezed,
    Object multiplePeriodicity = freezed,
    Object oldmultiplePeriodicity = freezed,
    Object nextProcess = freezed,
    Object messageErrorNextProcess = freezed,
  }) {
    return _$_InvestingMxMainState(
      selectedGoalIndex: selectedGoalIndex == freezed
          ? this.selectedGoalIndex
          : selectedGoalIndex as int,
      goal: goal == freezed ? this.goal : goal as DashboardGoal,
      periodicityList: periodicityList == freezed
          ? this.periodicityList
          : periodicityList as List<String>,
      newGoals:
          newGoals == freezed ? this.newGoals : newGoals as List<DashboardGoal>,
      oldGoals:
          oldGoals == freezed ? this.oldGoals : oldGoals as List<DashboardGoal>,
      valuesChosen: valuesChosen == freezed
          ? this.valuesChosen
          : valuesChosen as List<double>,
      oldMonths: oldMonths == freezed ? this.oldMonths : oldMonths as int,
      oldPeriodicity: oldPeriodicity == freezed
          ? this.oldPeriodicity
          : oldPeriodicity as int,
      oldFee: oldFee == freezed ? this.oldFee : oldFee as double,
      showDialog: showDialog == freezed ? this.showDialog : showDialog as bool,
      initialDate:
          initialDate == freezed ? this.initialDate : initialDate as DateTime,
      isAvailableDate: isAvailableDate == freezed
          ? this.isAvailableDate
          : isAvailableDate as bool,
      isAvailableDateValidation: isAvailableDateValidation == freezed
          ? this.isAvailableDateValidation
          : isAvailableDateValidation as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      multiplePeriodicity: multiplePeriodicity == freezed
          ? this.multiplePeriodicity
          : multiplePeriodicity as int,
      oldmultiplePeriodicity: oldmultiplePeriodicity == freezed
          ? this.oldmultiplePeriodicity
          : oldmultiplePeriodicity as int,
      nextProcess:
          nextProcess == freezed ? this.nextProcess : nextProcess as bool,
      messageErrorNextProcess: messageErrorNextProcess == freezed
          ? this.messageErrorNextProcess
          : messageErrorNextProcess as String,
    );
  }
}

abstract class _InvestingMxMainState implements InvestingMxMainState {
  const factory _InvestingMxMainState(
      {@required int selectedGoalIndex,
      @required DashboardGoal goal,
      @required List<String> periodicityList,
      List<DashboardGoal> newGoals,
      List<DashboardGoal> oldGoals,
      List<double> valuesChosen,
      @required int oldMonths,
      @required int oldPeriodicity,
      @required double oldFee,
      @required bool showDialog,
      @required DateTime initialDate,
      @required bool isAvailableDate,
      @required bool isAvailableDateValidation,
      bool isSubmitting,
      int multiplePeriodicity,
      int oldmultiplePeriodicity,
      bool nextProcess,
      String messageErrorNextProcess}) = _$_InvestingMxMainState;

  @override
  int get selectedGoalIndex;
  @override
  DashboardGoal get goal;
  @override
  List<String> get periodicityList;
  @override
  List<DashboardGoal> get newGoals;
  @override
  List<DashboardGoal> get oldGoals;
  @override
  List<double> get valuesChosen;
  @override
  int get oldMonths;
  @override
  int get oldPeriodicity;
  @override
  double get oldFee;
  @override
  bool get showDialog;
  @override
  DateTime get initialDate;
  @override
  bool get isAvailableDate;
  @override
  bool get isAvailableDateValidation;
  @override
  bool get isSubmitting;
  @override
  int get multiplePeriodicity;
  @override
  int get oldmultiplePeriodicity;
  @override
  bool get nextProcess;
  @override
  String get messageErrorNextProcess;

  @override
  _InvestingMxMainState copyWith(
      {int selectedGoalIndex,
      DashboardGoal goal,
      List<String> periodicityList,
      List<DashboardGoal> newGoals,
      List<DashboardGoal> oldGoals,
      List<double> valuesChosen,
      int oldMonths,
      int oldPeriodicity,
      double oldFee,
      bool showDialog,
      DateTime initialDate,
      bool isAvailableDate,
      bool isAvailableDateValidation,
      bool isSubmitting,
      int multiplePeriodicity,
      int oldmultiplePeriodicity,
      bool nextProcess,
      String messageErrorNextProcess});
}
