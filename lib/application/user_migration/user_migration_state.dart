part of 'user_migration_bloc.dart';

@freezed
abstract class UserMigrationState with _$UserMigrationState {
  const factory UserMigrationState({
    @required UserMigrationInfo items,
    @required KtList<UserMigrationItem> mensuales,
    @required KtList<UserMigrationItem> trimestrales,
    @required KtList<UserMigrationItem> quincenales,
    @required bool mensualesDone,
    @required bool quincenalesDone,
    @required bool trimestralesDone,
    @required bool pseDone,
    @required DashboardGoal goalMensuales,
    @required DashboardGoal goalQuincenales,
    @required DashboardGoal goalTrimestrales,
    @required DashboardGoal goalPse,
    @required bool isLoading,
    bool isPosted,
    @required Option<Either<BaseFailure, bool>> fOrSuccess,
    Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure,
    BalanceItem balance,
  }) = _UserMigrationState;

  factory UserMigrationState.initial() => UserMigrationState(
        fOrSuccess: none(),
        isLoading: false,
        goalMensuales: DashboardGoal.empty(),
        goalQuincenales: DashboardGoal.empty(),
        goalTrimestrales: DashboardGoal.empty(),
        goalPse: DashboardGoal.empty(),
        mensualesDone: false,
        quincenalesDone: false,
        trimestralesDone: false,
        pseDone: false,
        items: UserMigrationInfo.empty(),
        mensuales: KtList.empty(),
        quincenales: KtList.empty(),
        trimestrales: KtList.empty(),
        dataOrFailure: none(),
        balance: BalanceItem.empty(),
        isPosted: false,
      );
}
