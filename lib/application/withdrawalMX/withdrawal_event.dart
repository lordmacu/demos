part of 'withdrawal_bloc.dart';

@freezed
abstract class WithdrawalEvent with _$WithdrawalEvent {
  const factory WithdrawalEvent.getItems(bool needsBankInfo) = _GetItems;
  const factory WithdrawalEvent.getSimulation(
      double value, double bankAccountId) = _GetSimulation;
  const factory WithdrawalEvent.withdrawalInfoReceived(
          Either<BaseFailure, WithdrawalInfo> failureOrInfo) =
      _WithdrawalInfoReceived;
}
