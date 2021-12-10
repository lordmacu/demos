part of 'investing_mx_id_verification_bloc.dart';

@freezed
abstract class InvestingMxIdVerificationEvent
    with _$InvestingMxIdVerificationEvent {
  const factory InvestingMxIdVerificationEvent.initial() = _initial;
  const factory InvestingMxIdVerificationEvent.setUserIdInfo(
      UserIdInfo newUserIdInfo) = _setUserIdInfo;
}
