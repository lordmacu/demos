part of 'investing_mx_id_verification_bloc.dart';

@freezed
abstract class InvestingMxIdVerificationState
    with _$InvestingMxIdVerificationState {
  const factory InvestingMxIdVerificationState({
    @required UserIdInfo idInfo,
  }) = _InvestingMxIdVerificationState;

  factory InvestingMxIdVerificationState.initial() =>
      InvestingMxIdVerificationState(idInfo: UserIdInfo.empty());
}
