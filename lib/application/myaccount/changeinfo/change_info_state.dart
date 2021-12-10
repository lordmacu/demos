part of 'change_info_bloc.dart';

@freezed
abstract class ChangeInfoState with _$ChangeInfoState {
  const factory ChangeInfoState({
    EmailAddress emailAddress,
    Password password,
    Password newPassword,
    Password newPasswordConfirm,
    PhoneNumber phoneNumber,
    OTP otp,
    bool isSubmitting,
    bool emailAvailable,
    bool phoneNumberAvailable,
    bool arePasswordsSame,
    bool sendOtp,
    Option<Either<BaseFailure, bool>> changePasswordOption,
    Option<Either<BaseFailure, bool>> changeEmailOption,
    Option<Either<BaseFailure, bool>> changePhoneNumberOption,
    Option<Either<BaseFailure, bool>> emailConfirmedOption,
    Option<Either<BaseFailure, bool>> phoneConfirmedOption,
    bool saveUpdatephoneNumber
  }) = _ChangeInfoState;

  factory ChangeInfoState.initial() => ChangeInfoState(
      emailAddress: EmailAddress(''),
      otp: OTP(''),
      password: Password(''),
      newPassword: Password(''),
      newPasswordConfirm: Password(''),
      phoneNumber: PhoneNumber(''),
      isSubmitting: false,
      emailAvailable: true,
      arePasswordsSame: true,
      sendOtp: false,
      phoneNumberAvailable: true,
      changeEmailOption: none(),
      changePasswordOption: none(),
      changePhoneNumberOption: none(),
      emailConfirmedOption: none(),
      phoneConfirmedOption: none(),
      saveUpdatephoneNumber: false);
}
