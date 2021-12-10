part of 'goals_bloc.dart';

@freezed
abstract class GoalsState with _$GoalsState {
  const factory GoalsState({
    @required GoalItem goalData,
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
    @required Option<Either<BaseFailure, GoalItem>> postFailureOrSuccess,
    @required
        int monthsOthers, //Meses que le toma con otros, los meses con Ualet estan en goalData
    bool showDialog,
    bool dialogShown,
  }) = _GoalsState;

  factory GoalsState.initial() => GoalsState(
        goalData: GoalItem.empty(),
        nameError: false,
        amountError: false,
        showChart: false,
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
        showDialog: false,
        dialogShown: false,
      );
}
