import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_goal.freezed.dart';

@freezed
abstract class DashboardGoal with _$DashboardGoal {
  /**
   * periodicidad quincenal
   */
  static const int QUINCENCAL = 1;

  /**
   * periodicidad mensual
   */
  static const int MENSUAL = 2;

  /**
   * periodicidad trimestral
   */
  static const int TRIMESTRAL = 3;

  const factory DashboardGoal(
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
      List goalBalance,
      List goalTransactions,
      @required DateTime created,
      @required int id,
      String color,
      double percentColor,
      double assignedBalanceValue}) = _DashboardGoal;

  factory DashboardGoal.empty() => DashboardGoal(
      id: 0,
      name: '',
      goalAmt: 0,
      currentAmt: 0,
      emoji: '',
      tieneDomiciliacionprogramada: false,
      fee: 0,
      periodicity: 1,
      numMonths: 0,
      percentComplete: 0.0,
      goalBalance: [],
      goalTransactions: [],
      migrate: false,
      created: DateTime.now(),
      color: '',
      percentColor: 0,
      assignedBalanceValue: 0);

  factory DashboardGoal.mock() => DashboardGoal(
        created: DateTime.now(),
        id: 111111,
        name: "Mock Goal",
        goalAmt: 100000.0,
        currentAmt: 0,
        emoji: "desert_island",
        tieneDomiciliacionprogramada: false,
        fee: 1000.0,
        periodicity: 1,
        numMonths: 10,
        migrate: false,
      );
}
