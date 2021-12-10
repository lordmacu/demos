part of 'account_bloc.dart';

@freezed
abstract class AccountEvent with _$AccountEvent {
  const factory AccountEvent.getUserInfo() = _GetUserInfo;
  const factory AccountEvent.userInfoReceived(
      Either<BaseFailure, UserInfo> failureOrInfo) = _UserInfoReceived;
}
