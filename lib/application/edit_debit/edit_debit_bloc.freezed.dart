// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'edit_debit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$EditDebitEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  });
}

class _$EditDebitEventTearOff {
  const _$EditDebitEventTearOff();

  _selectGoal selectGoal(DashboardGoal newGoal, int newSelectedIndex) {
    return _selectGoal(
      newGoal,
      newSelectedIndex,
    );
  }

  _selectDebit selectDebit(DebitItem newDebitItem) {
    return _selectDebit(
      newDebitItem,
    );
  }

  _selectDebitInfo selectDebitInfo(DebitInfo newDebitItem) {
    return _selectDebitInfo(
      newDebitItem,
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

  _newPeriodicity updatePeriodicity(int newPeriodicity) {
    return _newPeriodicity(
      newPeriodicity,
    );
  }

  _undoChange undoChange() {
    return const _undoChange();
  }

  _acceptChange acceptChange() {
    return const _acceptChange();
  }

  _forceShowDialog forceShowDialog() {
    return const _forceShowDialog();
  }

  _updateInitialDate updateInitialDate(DateTime newInitialDate) {
    return _updateInitialDate(
      newInitialDate,
    );
  }

  _isSubmitting isSubmitting(bool value) {
    return _isSubmitting(
      value,
    );
  }
}

const $EditDebitEvent = _$EditDebitEventTearOff();

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
    return 'EditDebitEvent.selectGoal(newGoal: $newGoal, newSelectedIndex: $newSelectedIndex)';
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
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectGoal(newGoal, newSelectedIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectGoal != null) {
      return selectGoal(this);
    }
    return orElse();
  }
}

abstract class _selectGoal implements EditDebitEvent {
  const factory _selectGoal(DashboardGoal newGoal, int newSelectedIndex) =
      _$_selectGoal;

  DashboardGoal get newGoal;
  int get newSelectedIndex;

  _selectGoal copyWith({DashboardGoal newGoal, int newSelectedIndex});
}

class _$_selectDebit implements _selectDebit {
  const _$_selectDebit(this.newDebitItem) : assert(newDebitItem != null);

  @override
  final DebitItem newDebitItem;

  @override
  String toString() {
    return 'EditDebitEvent.selectDebit(newDebitItem: $newDebitItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _selectDebit &&
            (identical(other.newDebitItem, newDebitItem) ||
                const DeepCollectionEquality()
                    .equals(other.newDebitItem, newDebitItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newDebitItem);

  @override
  _$_selectDebit copyWith({
    Object newDebitItem = freezed,
  }) {
    return _$_selectDebit(
      newDebitItem == freezed ? this.newDebitItem : newDebitItem as DebitItem,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectDebit(newDebitItem);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectDebit != null) {
      return selectDebit(newDebitItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectDebit(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectDebit != null) {
      return selectDebit(this);
    }
    return orElse();
  }
}

abstract class _selectDebit implements EditDebitEvent {
  const factory _selectDebit(DebitItem newDebitItem) = _$_selectDebit;

  DebitItem get newDebitItem;

  _selectDebit copyWith({DebitItem newDebitItem});
}

class _$_selectDebitInfo implements _selectDebitInfo {
  const _$_selectDebitInfo(this.newDebitItem) : assert(newDebitItem != null);

  @override
  final DebitInfo newDebitItem;

  @override
  String toString() {
    return 'EditDebitEvent.selectDebitInfo(newDebitItem: $newDebitItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _selectDebitInfo &&
            (identical(other.newDebitItem, newDebitItem) ||
                const DeepCollectionEquality()
                    .equals(other.newDebitItem, newDebitItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newDebitItem);

  @override
  _$_selectDebitInfo copyWith({
    Object newDebitItem = freezed,
  }) {
    return _$_selectDebitInfo(
      newDebitItem == freezed ? this.newDebitItem : newDebitItem as DebitInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectDebitInfo(newDebitItem);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectDebitInfo != null) {
      return selectDebitInfo(newDebitItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return selectDebitInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (selectDebitInfo != null) {
      return selectDebitInfo(this);
    }
    return orElse();
  }
}

abstract class _selectDebitInfo implements EditDebitEvent {
  const factory _selectDebitInfo(DebitInfo newDebitItem) = _$_selectDebitInfo;

  DebitInfo get newDebitItem;

  _selectDebitInfo copyWith({DebitInfo newDebitItem});
}

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'EditDebitEvent.inicial()';
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
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return inicial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return inicial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inicial != null) {
      return inicial(this);
    }
    return orElse();
  }
}

abstract class _initial implements EditDebitEvent {
  const factory _initial() = _$_initial;
}

class _$_updateFee implements _updateFee {
  const _$_updateFee(this.newFee) : assert(newFee != null);

  @override
  final double newFee;

  @override
  String toString() {
    return 'EditDebitEvent.updateFee(newFee: $newFee)';
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
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updateFee(newFee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updateFee(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateFee != null) {
      return updateFee(this);
    }
    return orElse();
  }
}

abstract class _updateFee implements EditDebitEvent {
  const factory _updateFee(double newFee) = _$_updateFee;

  double get newFee;

  _updateFee copyWith({double newFee});
}

class _$_newPeriodicity implements _newPeriodicity {
  const _$_newPeriodicity(this.newPeriodicity) : assert(newPeriodicity != null);

  @override
  final int newPeriodicity;

  @override
  String toString() {
    return 'EditDebitEvent.updatePeriodicity(newPeriodicity: $newPeriodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _newPeriodicity &&
            (identical(other.newPeriodicity, newPeriodicity) ||
                const DeepCollectionEquality()
                    .equals(other.newPeriodicity, newPeriodicity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPeriodicity);

  @override
  _$_newPeriodicity copyWith({
    Object newPeriodicity = freezed,
  }) {
    return _$_newPeriodicity(
      newPeriodicity == freezed ? this.newPeriodicity : newPeriodicity as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updatePeriodicity(newPeriodicity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updatePeriodicity(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePeriodicity != null) {
      return updatePeriodicity(this);
    }
    return orElse();
  }
}

abstract class _newPeriodicity implements EditDebitEvent {
  const factory _newPeriodicity(int newPeriodicity) = _$_newPeriodicity;

  int get newPeriodicity;

  _newPeriodicity copyWith({int newPeriodicity});
}

class _$_undoChange implements _undoChange {
  const _$_undoChange();

  @override
  String toString() {
    return 'EditDebitEvent.undoChange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _undoChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return undoChange();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undoChange != null) {
      return undoChange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return undoChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undoChange != null) {
      return undoChange(this);
    }
    return orElse();
  }
}

abstract class _undoChange implements EditDebitEvent {
  const factory _undoChange() = _$_undoChange;
}

class _$_acceptChange implements _acceptChange {
  const _$_acceptChange();

  @override
  String toString() {
    return 'EditDebitEvent.acceptChange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _acceptChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return acceptChange();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptChange != null) {
      return acceptChange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return acceptChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptChange != null) {
      return acceptChange(this);
    }
    return orElse();
  }
}

abstract class _acceptChange implements EditDebitEvent {
  const factory _acceptChange() = _$_acceptChange;
}

class _$_forceShowDialog implements _forceShowDialog {
  const _$_forceShowDialog();

  @override
  String toString() {
    return 'EditDebitEvent.forceShowDialog()';
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
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return forceShowDialog();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return forceShowDialog(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forceShowDialog != null) {
      return forceShowDialog(this);
    }
    return orElse();
  }
}

abstract class _forceShowDialog implements EditDebitEvent {
  const factory _forceShowDialog() = _$_forceShowDialog;
}

class _$_updateInitialDate implements _updateInitialDate {
  const _$_updateInitialDate(this.newInitialDate)
      : assert(newInitialDate != null);

  @override
  final DateTime newInitialDate;

  @override
  String toString() {
    return 'EditDebitEvent.updateInitialDate(newInitialDate: $newInitialDate)';
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
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updateInitialDate(newInitialDate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
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
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return updateInitialDate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateInitialDate != null) {
      return updateInitialDate(this);
    }
    return orElse();
  }
}

abstract class _updateInitialDate implements EditDebitEvent {
  const factory _updateInitialDate(DateTime newInitialDate) =
      _$_updateInitialDate;

  DateTime get newInitialDate;

  _updateInitialDate copyWith({DateTime newInitialDate});
}

class _$_isSubmitting implements _isSubmitting {
  const _$_isSubmitting(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'EditDebitEvent.isSubmitting(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _isSubmitting &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$_isSubmitting copyWith({
    Object value = freezed,
  }) {
    return _$_isSubmitting(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    @required Result selectDebit(DebitItem newDebitItem),
    @required Result selectDebitInfo(DebitInfo newDebitItem),
    @required Result inicial(),
    @required Result updateFee(double newFee),
    @required Result updatePeriodicity(int newPeriodicity),
    @required Result undoChange(),
    @required Result acceptChange(),
    @required Result forceShowDialog(),
    @required Result updateInitialDate(DateTime newInitialDate),
    @required Result isSubmitting(bool value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return isSubmitting(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result selectGoal(DashboardGoal newGoal, int newSelectedIndex),
    Result selectDebit(DebitItem newDebitItem),
    Result selectDebitInfo(DebitInfo newDebitItem),
    Result inicial(),
    Result updateFee(double newFee),
    Result updatePeriodicity(int newPeriodicity),
    Result undoChange(),
    Result acceptChange(),
    Result forceShowDialog(),
    Result updateInitialDate(DateTime newInitialDate),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isSubmitting != null) {
      return isSubmitting(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result selectGoal(_selectGoal value),
    @required Result selectDebit(_selectDebit value),
    @required Result selectDebitInfo(_selectDebitInfo value),
    @required Result inicial(_initial value),
    @required Result updateFee(_updateFee value),
    @required Result updatePeriodicity(_newPeriodicity value),
    @required Result undoChange(_undoChange value),
    @required Result acceptChange(_acceptChange value),
    @required Result forceShowDialog(_forceShowDialog value),
    @required Result updateInitialDate(_updateInitialDate value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(selectGoal != null);
    assert(selectDebit != null);
    assert(selectDebitInfo != null);
    assert(inicial != null);
    assert(updateFee != null);
    assert(updatePeriodicity != null);
    assert(undoChange != null);
    assert(acceptChange != null);
    assert(forceShowDialog != null);
    assert(updateInitialDate != null);
    assert(isSubmitting != null);
    return isSubmitting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result selectGoal(_selectGoal value),
    Result selectDebit(_selectDebit value),
    Result selectDebitInfo(_selectDebitInfo value),
    Result inicial(_initial value),
    Result updateFee(_updateFee value),
    Result updatePeriodicity(_newPeriodicity value),
    Result undoChange(_undoChange value),
    Result acceptChange(_acceptChange value),
    Result forceShowDialog(_forceShowDialog value),
    Result updateInitialDate(_updateInitialDate value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isSubmitting != null) {
      return isSubmitting(this);
    }
    return orElse();
  }
}

abstract class _isSubmitting implements EditDebitEvent {
  const factory _isSubmitting(bool value) = _$_isSubmitting;

  bool get value;

  _isSubmitting copyWith({bool value});
}

mixin _$EditDebitState {
  int get selectedGoalIndex;
  DashboardGoal get goal;
  List<String> get periodicityList;
  int get oldMonths;
  int get oldPeriodicity;
  double get oldFee;
  bool get showDialog;
  bool get isSubmitting;
  DateTime get initialDate;
  DebitItem get debitItem;
  DebitInfo get debitInfo;

  EditDebitState copyWith(
      {int selectedGoalIndex,
      DashboardGoal goal,
      List<String> periodicityList,
      int oldMonths,
      int oldPeriodicity,
      double oldFee,
      bool showDialog,
      bool isSubmitting,
      DateTime initialDate,
      DebitItem debitItem,
      DebitInfo debitInfo});
}

class _$EditDebitStateTearOff {
  const _$EditDebitStateTearOff();

  _EditDebitState call(
      {@required int selectedGoalIndex,
      @required DashboardGoal goal,
      @required List<String> periodicityList,
      @required int oldMonths,
      @required int oldPeriodicity,
      @required double oldFee,
      @required bool showDialog,
      bool isSubmitting,
      @required DateTime initialDate,
      @required DebitItem debitItem,
      @required DebitInfo debitInfo}) {
    return _EditDebitState(
      selectedGoalIndex: selectedGoalIndex,
      goal: goal,
      periodicityList: periodicityList,
      oldMonths: oldMonths,
      oldPeriodicity: oldPeriodicity,
      oldFee: oldFee,
      showDialog: showDialog,
      isSubmitting: isSubmitting,
      initialDate: initialDate,
      debitItem: debitItem,
      debitInfo: debitInfo,
    );
  }
}

const $EditDebitState = _$EditDebitStateTearOff();

class _$_EditDebitState implements _EditDebitState {
  const _$_EditDebitState(
      {@required this.selectedGoalIndex,
      @required this.goal,
      @required this.periodicityList,
      @required this.oldMonths,
      @required this.oldPeriodicity,
      @required this.oldFee,
      @required this.showDialog,
      this.isSubmitting,
      @required this.initialDate,
      @required this.debitItem,
      @required this.debitInfo})
      : assert(selectedGoalIndex != null),
        assert(goal != null),
        assert(periodicityList != null),
        assert(oldMonths != null),
        assert(oldPeriodicity != null),
        assert(oldFee != null),
        assert(showDialog != null),
        assert(initialDate != null),
        assert(debitItem != null),
        assert(debitInfo != null);

  @override
  final int selectedGoalIndex;
  @override
  final DashboardGoal goal;
  @override
  final List<String> periodicityList;
  @override
  final int oldMonths;
  @override
  final int oldPeriodicity;
  @override
  final double oldFee;
  @override
  final bool showDialog;
  @override
  final bool isSubmitting;
  @override
  final DateTime initialDate;
  @override
  final DebitItem debitItem;
  @override
  final DebitInfo debitInfo;

  @override
  String toString() {
    return 'EditDebitState(selectedGoalIndex: $selectedGoalIndex, goal: $goal, periodicityList: $periodicityList, oldMonths: $oldMonths, oldPeriodicity: $oldPeriodicity, oldFee: $oldFee, showDialog: $showDialog, isSubmitting: $isSubmitting, initialDate: $initialDate, debitItem: $debitItem, debitInfo: $debitInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditDebitState &&
            (identical(other.selectedGoalIndex, selectedGoalIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedGoalIndex, selectedGoalIndex)) &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.periodicityList, periodicityList) ||
                const DeepCollectionEquality()
                    .equals(other.periodicityList, periodicityList)) &&
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
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.initialDate, initialDate) ||
                const DeepCollectionEquality()
                    .equals(other.initialDate, initialDate)) &&
            (identical(other.debitItem, debitItem) ||
                const DeepCollectionEquality()
                    .equals(other.debitItem, debitItem)) &&
            (identical(other.debitInfo, debitInfo) ||
                const DeepCollectionEquality()
                    .equals(other.debitInfo, debitInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedGoalIndex) ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(periodicityList) ^
      const DeepCollectionEquality().hash(oldMonths) ^
      const DeepCollectionEquality().hash(oldPeriodicity) ^
      const DeepCollectionEquality().hash(oldFee) ^
      const DeepCollectionEquality().hash(showDialog) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(initialDate) ^
      const DeepCollectionEquality().hash(debitItem) ^
      const DeepCollectionEquality().hash(debitInfo);

  @override
  _$_EditDebitState copyWith({
    Object selectedGoalIndex = freezed,
    Object goal = freezed,
    Object periodicityList = freezed,
    Object oldMonths = freezed,
    Object oldPeriodicity = freezed,
    Object oldFee = freezed,
    Object showDialog = freezed,
    Object isSubmitting = freezed,
    Object initialDate = freezed,
    Object debitItem = freezed,
    Object debitInfo = freezed,
  }) {
    return _$_EditDebitState(
      selectedGoalIndex: selectedGoalIndex == freezed
          ? this.selectedGoalIndex
          : selectedGoalIndex as int,
      goal: goal == freezed ? this.goal : goal as DashboardGoal,
      periodicityList: periodicityList == freezed
          ? this.periodicityList
          : periodicityList as List<String>,
      oldMonths: oldMonths == freezed ? this.oldMonths : oldMonths as int,
      oldPeriodicity: oldPeriodicity == freezed
          ? this.oldPeriodicity
          : oldPeriodicity as int,
      oldFee: oldFee == freezed ? this.oldFee : oldFee as double,
      showDialog: showDialog == freezed ? this.showDialog : showDialog as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      initialDate:
          initialDate == freezed ? this.initialDate : initialDate as DateTime,
      debitItem: debitItem == freezed ? this.debitItem : debitItem as DebitItem,
      debitInfo: debitInfo == freezed ? this.debitInfo : debitInfo as DebitInfo,
    );
  }
}

abstract class _EditDebitState implements EditDebitState {
  const factory _EditDebitState(
      {@required int selectedGoalIndex,
      @required DashboardGoal goal,
      @required List<String> periodicityList,
      @required int oldMonths,
      @required int oldPeriodicity,
      @required double oldFee,
      @required bool showDialog,
      bool isSubmitting,
      @required DateTime initialDate,
      @required DebitItem debitItem,
      @required DebitInfo debitInfo}) = _$_EditDebitState;

  @override
  int get selectedGoalIndex;
  @override
  DashboardGoal get goal;
  @override
  List<String> get periodicityList;
  @override
  int get oldMonths;
  @override
  int get oldPeriodicity;
  @override
  double get oldFee;
  @override
  bool get showDialog;
  @override
  bool get isSubmitting;
  @override
  DateTime get initialDate;
  @override
  DebitItem get debitItem;
  @override
  DebitInfo get debitInfo;

  @override
  _EditDebitState copyWith(
      {int selectedGoalIndex,
      DashboardGoal goal,
      List<String> periodicityList,
      int oldMonths,
      int oldPeriodicity,
      double oldFee,
      bool showDialog,
      bool isSubmitting,
      DateTime initialDate,
      DebitItem debitItem,
      DebitInfo debitInfo});
}
