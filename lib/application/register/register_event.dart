part of 'register_bloc.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.emailChanged(String email) = EmailChanged;
  const factory RegisterEvent.confirmIdentification(String identification) =
      ConfirmIdentification;
  const factory RegisterEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory RegisterEvent.confirmPasswordChanged(String confirmPassword) =
      ConfirmPasswordChanged;
  const factory RegisterEvent.nameChanged(String name) = NameChanged;
  const factory RegisterEvent.phoneNumberChanged(String phoneNumber) =
      PhoneNumberChanged;
  const factory RegisterEvent.otpChanged(String otp) = OTPChanged;
  const factory RegisterEvent.acceptedTermsChanged(bool checked) =
      AcceptedTermsChanged;
  const factory RegisterEvent.acceptedPrivacy(bool checked) = AcceptedPrivacy;
  const factory RegisterEvent.sendEmail(String email, String phoneNumber, bool privacy, bool medios) =
      SendEmail;
  const factory RegisterEvent.sendOTP(String phoneNumber, int actionOtpType) = SendOTP;
  const factory RegisterEvent.changeSentOTP(bool sent) = ChangeSentOTP;
  const factory RegisterEvent.checkEmailConfirmed(String email) =
      CheckEmailConfirmed;
  const factory RegisterEvent.validateOTP(String phoneNumber, String otp, int actionOtpType) =
      ValidateOTP;
  const factory RegisterEvent.register(String name, String email,
      String phoneNumber, String password, bool acceptedTerms, bool acceptedPrivacy) = Register;
  const factory RegisterEvent.getEmailByPhoneNumber(String phoneNumber) =
      GetEmailByPhoneNumber;
  const factory RegisterEvent.changePassword(
          String email, String newPassword, String confirmPassword) =
      ChangePassword;
  const factory RegisterEvent.getGeoreferenciacionIP() = GetGeoreferenciacionIP;
  const factory RegisterEvent.getGeoreferenciacionGPS() =
      GetGeoreferenciacionGPS;
}
