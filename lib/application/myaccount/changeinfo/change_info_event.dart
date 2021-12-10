part of 'change_info_bloc.dart';

@freezed
abstract class ChangeInfoEvent with _$ChangeInfoEvent {
  const factory ChangeInfoEvent.emailChanged(String email) = EmailChanged;
  const factory ChangeInfoEvent.confirmIdentification(String email) =
      ConfirmIdentification;
  const factory ChangeInfoEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory ChangeInfoEvent.newPasswordChanged(String password) =
      NewPasswordChanged;
  const factory ChangeInfoEvent.newPasswordConfirmChanged(String password) =
      NewPasswordConfirmChanged;
  const factory ChangeInfoEvent.phoneNumberChanged(String phoneNumber) =
      PhoneNumberChanged;
  const factory ChangeInfoEvent.updatePhoneNumber(String phoneNumber) =
      UpdatePhoneNumber;
  const factory ChangeInfoEvent.otpChanged(String otp) = OTPChanged;
  const factory ChangeInfoEvent.sendEmail(String email, String phoneNumber) =
      SendEmail;
  const factory ChangeInfoEvent.sendOTP(String phoneNumber) = SendOTP;
  const factory ChangeInfoEvent.checkEmailConfirmed(String email) =
      CheckEmailConfirmed;
  const factory ChangeInfoEvent.validateOTP(String phoneNumber, String otp) =
      ValidateOTP;
  const factory ChangeInfoEvent.changeEmail(String email) = ChangeEmail;
  const factory ChangeInfoEvent.changePassword(
          String password, String newPassword, String confirmPassword) =
      ChangePassword;
  const factory ChangeInfoEvent.changePhoneNumber(String phoneNumber) =
      ChangePhoneNumber;
}
