part of 'edit_debit_bloc.dart';

@freezed
abstract class EditDebitState with _$EditDebitState {
  const factory EditDebitState({
    @required int selectedGoalIndex,
    @required DashboardGoal goal,
    @required List<String> periodicityList,
    @required int oldMonths,
    @required int oldPeriodicity,
    @required double oldFee,
    @required bool showDialog,
    bool isSubmitting,
    @required DateTime initialDate,
    @required DebitItem debitItem,
    @required DebitInfo debitInfo,
  }) = _EditDebitState;

  factory EditDebitState.initial() => EditDebitState(
        selectedGoalIndex: -1,
        goal: DashboardGoal.empty(),
        periodicityList: ['Quincenal', 'Mensual', 'Trimestral'],
        oldMonths: 0,
        oldFee: 0,
        oldPeriodicity: 0,
        showDialog: false,
        initialDate: DateTime.fromMicrosecondsSinceEpoch(1000),
        debitItem: DebitItem.empty(),
        debitInfo: DebitInfo.empty(),
        isSubmitting: false,
      );
}
