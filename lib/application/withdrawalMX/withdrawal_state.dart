part of 'withdrawal_bloc.dart';

@freezed
abstract class WithdrawalState with _$WithdrawalState {
  const factory WithdrawalState.initial() = Initial;
  const factory WithdrawalState.loadInProgress() = DataTransferInProgress;
  /*const factory WithdrawalState.loadSuccessSimulation(
      List<DashboardGoal> goals) = LoadSuccessSimulation;*/
  const factory WithdrawalState.loadSuccess(WithdrawalInfo info) = LoadSuccess;
  const factory WithdrawalState.loadFailure(BaseFailure failure) = LoadFailure;
}
