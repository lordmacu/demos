part of 'account_bloc.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState.initial() = Initial;
  const factory AccountState.loadInProgress() = DataTransferInProgress;
  const factory AccountState.loadSuccess(UserInfo info) = LoadSuccess;
  const factory AccountState.loadFailure(BaseFailure failure) = LoadFailure;
}
