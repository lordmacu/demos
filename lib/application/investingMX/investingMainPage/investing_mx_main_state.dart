part of 'investing_mx_main_bloc.dart';

@freezed
abstract class InvestingMxMainState with _$InvestingMxMainState {
  const factory InvestingMxMainState({
    @required int selectedGoalIndex,
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
    String messageErrorNextProcess
  }) = _InvestingMxMainState;

  factory InvestingMxMainState.initial() => InvestingMxMainState(
        selectedGoalIndex: -1,
        goal: DashboardGoal.empty(),
        periodicityList: ['None', 'Quincenal', 'Mensual', 'Trimestral'],
        oldMonths: 0,
        oldFee: 0,
        oldPeriodicity: 1,
        showDialog: false,
        initialDate: DateTime.fromMicrosecondsSinceEpoch(1000),
        newGoals: [],
        valuesChosen: [],
        oldGoals: [],
        isSubmitting: false,
        isAvailableDate: false,
        isAvailableDateValidation: false,
        oldmultiplePeriodicity: 0,
        multiplePeriodicity: 0,
        nextProcess: false,
        messageErrorNextProcess: ''
      );
}
