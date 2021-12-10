part of 'edit_goals_bloc.dart';

@freezed
abstract class EditGoalsState with _$EditGoalsState {
  const factory EditGoalsState({
    @required DashboardGoal goalData,
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
    bool
        isMigrating, //Meses que le toma con otros, los meses con Ualet estan en goalData
  }) = _EditGoalsState;

  factory EditGoalsState.initial() => EditGoalsState(
        goalData: DashboardGoal.empty(),
        nameError: false,
        amountError: false,
        showChart: true,
        cuoteError: false,
        monthsOthers: 0,
        periodicityError: false,
        dataUalet: {0: 0},
        dataOtros: {0: 0},
        maxX: 0.0,
        maxY: 0.0,
        lx: Map<double, String>(),
        ly: Map<double, String>(),
        numPeriodsUalet: 0,
        isPosting: false,
        buttonActivated: false,
        postFailureOrSuccess: none(),
        oldGoal: DashboardGoal.empty(),
        deleteGoalOrFailure: none(),
        createFailureOrSuccess: none(),
        isMigrating: false,
      );
}
