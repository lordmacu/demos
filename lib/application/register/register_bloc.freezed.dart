// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RegisterEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  });
}

class _$RegisterEventTearOff {
  const _$RegisterEventTearOff();

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  ConfirmIdentification confirmIdentification(String identification) {
    return ConfirmIdentification(
      identification,
    );
  }

  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

  ConfirmPasswordChanged confirmPasswordChanged(String confirmPassword) {
    return ConfirmPasswordChanged(
      confirmPassword,
    );
  }

  NameChanged nameChanged(String name) {
    return NameChanged(
      name,
    );
  }

  PhoneNumberChanged phoneNumberChanged(String phoneNumber) {
    return PhoneNumberChanged(
      phoneNumber,
    );
  }

  OTPChanged otpChanged(String otp) {
    return OTPChanged(
      otp,
    );
  }

  AcceptedTermsChanged acceptedTermsChanged(bool checked) {
    return AcceptedTermsChanged(
      checked,
    );
  }

  AcceptedPrivacy acceptedPrivacy(bool checked) {
    return AcceptedPrivacy(
      checked,
    );
  }

  SendEmail sendEmail(
      String email, String phoneNumber, bool privacy, bool medios) {
    return SendEmail(
      email,
      phoneNumber,
      privacy,
      medios,
    );
  }

  SendOTP sendOTP(String phoneNumber, int actionOtpType) {
    return SendOTP(
      phoneNumber,
      actionOtpType,
    );
  }

  ChangeSentOTP changeSentOTP(bool sent) {
    return ChangeSentOTP(
      sent,
    );
  }

  CheckEmailConfirmed checkEmailConfirmed(String email) {
    return CheckEmailConfirmed(
      email,
    );
  }

  ValidateOTP validateOTP(String phoneNumber, String otp, int actionOtpType) {
    return ValidateOTP(
      phoneNumber,
      otp,
      actionOtpType,
    );
  }

  Register register(String name, String email, String phoneNumber,
      String password, bool acceptedTerms, bool acceptedPrivacy) {
    return Register(
      name,
      email,
      phoneNumber,
      password,
      acceptedTerms,
      acceptedPrivacy,
    );
  }

  GetEmailByPhoneNumber getEmailByPhoneNumber(String phoneNumber) {
    return GetEmailByPhoneNumber(
      phoneNumber,
    );
  }

  ChangePassword changePassword(
      String email, String newPassword, String confirmPassword) {
    return ChangePassword(
      email,
      newPassword,
      confirmPassword,
    );
  }

  GetGeoreferenciacionIP getGeoreferenciacionIP() {
    return const GetGeoreferenciacionIP();
  }

  GetGeoreferenciacionGPS getGeoreferenciacionGPS() {
    return const GetGeoreferenciacionGPS();
  }
}

const $RegisterEvent = _$RegisterEventTearOff();

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailChanged copyWith({
    Object email = freezed,
  }) {
    return _$EmailChanged(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegisterEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;

  EmailChanged copyWith({String email});
}

class _$ConfirmIdentification implements ConfirmIdentification {
  const _$ConfirmIdentification(this.identification)
      : assert(identification != null);

  @override
  final String identification;

  @override
  String toString() {
    return 'RegisterEvent.confirmIdentification(identification: $identification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmIdentification &&
            (identical(other.identification, identification) ||
                const DeepCollectionEquality()
                    .equals(other.identification, identification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(identification);

  @override
  _$ConfirmIdentification copyWith({
    Object identification = freezed,
  }) {
    return _$ConfirmIdentification(
      identification == freezed
          ? this.identification
          : identification as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return confirmIdentification(identification);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmIdentification != null) {
      return confirmIdentification(identification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return confirmIdentification(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmIdentification != null) {
      return confirmIdentification(this);
    }
    return orElse();
  }
}

abstract class ConfirmIdentification implements RegisterEvent {
  const factory ConfirmIdentification(String identification) =
      _$ConfirmIdentification;

  String get identification;

  ConfirmIdentification copyWith({String identification});
}

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$PasswordChanged copyWith({
    Object password = freezed,
  }) {
    return _$PasswordChanged(
      password == freezed ? this.password : password as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements RegisterEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password;

  PasswordChanged copyWith({String password});
}

class _$ConfirmPasswordChanged implements ConfirmPasswordChanged {
  const _$ConfirmPasswordChanged(this.confirmPassword)
      : assert(confirmPassword != null);

  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterEvent.confirmPasswordChanged(confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmPasswordChanged &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(confirmPassword);

  @override
  _$ConfirmPasswordChanged copyWith({
    Object confirmPassword = freezed,
  }) {
    return _$ConfirmPasswordChanged(
      confirmPassword == freezed
          ? this.confirmPassword
          : confirmPassword as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return confirmPasswordChanged(confirmPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return confirmPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class ConfirmPasswordChanged implements RegisterEvent {
  const factory ConfirmPasswordChanged(String confirmPassword) =
      _$ConfirmPasswordChanged;

  String get confirmPassword;

  ConfirmPasswordChanged copyWith({String confirmPassword});
}

class _$NameChanged implements NameChanged {
  const _$NameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString() {
    return 'RegisterEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$NameChanged copyWith({
    Object name = freezed,
  }) {
    return _$NameChanged(
      name == freezed ? this.name : name as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements RegisterEvent {
  const factory NameChanged(String name) = _$NameChanged;

  String get name;

  NameChanged copyWith({String name});
}

class _$PhoneNumberChanged implements PhoneNumberChanged {
  const _$PhoneNumberChanged(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneNumberChanged &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$PhoneNumberChanged copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$PhoneNumberChanged(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberChanged implements RegisterEvent {
  const factory PhoneNumberChanged(String phoneNumber) = _$PhoneNumberChanged;

  String get phoneNumber;

  PhoneNumberChanged copyWith({String phoneNumber});
}

class _$OTPChanged implements OTPChanged {
  const _$OTPChanged(this.otp) : assert(otp != null);

  @override
  final String otp;

  @override
  String toString() {
    return 'RegisterEvent.otpChanged(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OTPChanged &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @override
  _$OTPChanged copyWith({
    Object otp = freezed,
  }) {
    return _$OTPChanged(
      otp == freezed ? this.otp : otp as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return otpChanged(otp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (otpChanged != null) {
      return otpChanged(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return otpChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (otpChanged != null) {
      return otpChanged(this);
    }
    return orElse();
  }
}

abstract class OTPChanged implements RegisterEvent {
  const factory OTPChanged(String otp) = _$OTPChanged;

  String get otp;

  OTPChanged copyWith({String otp});
}

class _$AcceptedTermsChanged implements AcceptedTermsChanged {
  const _$AcceptedTermsChanged(this.checked) : assert(checked != null);

  @override
  final bool checked;

  @override
  String toString() {
    return 'RegisterEvent.acceptedTermsChanged(checked: $checked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcceptedTermsChanged &&
            (identical(other.checked, checked) ||
                const DeepCollectionEquality().equals(other.checked, checked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(checked);

  @override
  _$AcceptedTermsChanged copyWith({
    Object checked = freezed,
  }) {
    return _$AcceptedTermsChanged(
      checked == freezed ? this.checked : checked as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return acceptedTermsChanged(checked);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptedTermsChanged != null) {
      return acceptedTermsChanged(checked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return acceptedTermsChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptedTermsChanged != null) {
      return acceptedTermsChanged(this);
    }
    return orElse();
  }
}

abstract class AcceptedTermsChanged implements RegisterEvent {
  const factory AcceptedTermsChanged(bool checked) = _$AcceptedTermsChanged;

  bool get checked;

  AcceptedTermsChanged copyWith({bool checked});
}

class _$AcceptedPrivacy implements AcceptedPrivacy {
  const _$AcceptedPrivacy(this.checked) : assert(checked != null);

  @override
  final bool checked;

  @override
  String toString() {
    return 'RegisterEvent.acceptedPrivacy(checked: $checked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcceptedPrivacy &&
            (identical(other.checked, checked) ||
                const DeepCollectionEquality().equals(other.checked, checked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(checked);

  @override
  _$AcceptedPrivacy copyWith({
    Object checked = freezed,
  }) {
    return _$AcceptedPrivacy(
      checked == freezed ? this.checked : checked as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return acceptedPrivacy(checked);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptedPrivacy != null) {
      return acceptedPrivacy(checked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return acceptedPrivacy(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptedPrivacy != null) {
      return acceptedPrivacy(this);
    }
    return orElse();
  }
}

abstract class AcceptedPrivacy implements RegisterEvent {
  const factory AcceptedPrivacy(bool checked) = _$AcceptedPrivacy;

  bool get checked;

  AcceptedPrivacy copyWith({bool checked});
}

class _$SendEmail implements SendEmail {
  const _$SendEmail(this.email, this.phoneNumber, this.privacy, this.medios)
      : assert(email != null),
        assert(phoneNumber != null),
        assert(privacy != null),
        assert(medios != null);

  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final bool privacy;
  @override
  final bool medios;

  @override
  String toString() {
    return 'RegisterEvent.sendEmail(email: $email, phoneNumber: $phoneNumber, privacy: $privacy, medios: $medios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.privacy, privacy) ||
                const DeepCollectionEquality()
                    .equals(other.privacy, privacy)) &&
            (identical(other.medios, medios) ||
                const DeepCollectionEquality().equals(other.medios, medios)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(privacy) ^
      const DeepCollectionEquality().hash(medios);

  @override
  _$SendEmail copyWith({
    Object email = freezed,
    Object phoneNumber = freezed,
    Object privacy = freezed,
    Object medios = freezed,
  }) {
    return _$SendEmail(
      email == freezed ? this.email : email as String,
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      privacy == freezed ? this.privacy : privacy as bool,
      medios == freezed ? this.medios : medios as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return sendEmail(email, phoneNumber, privacy, medios);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(email, phoneNumber, privacy, medios);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return sendEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(this);
    }
    return orElse();
  }
}

abstract class SendEmail implements RegisterEvent {
  const factory SendEmail(
          String email, String phoneNumber, bool privacy, bool medios) =
      _$SendEmail;

  String get email;
  String get phoneNumber;
  bool get privacy;
  bool get medios;

  SendEmail copyWith(
      {String email, String phoneNumber, bool privacy, bool medios});
}

class _$SendOTP implements SendOTP {
  const _$SendOTP(this.phoneNumber, this.actionOtpType)
      : assert(phoneNumber != null),
        assert(actionOtpType != null);

  @override
  final String phoneNumber;
  @override
  final int actionOtpType;

  @override
  String toString() {
    return 'RegisterEvent.sendOTP(phoneNumber: $phoneNumber, actionOtpType: $actionOtpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.actionOtpType, actionOtpType) ||
                const DeepCollectionEquality()
                    .equals(other.actionOtpType, actionOtpType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(actionOtpType);

  @override
  _$SendOTP copyWith({
    Object phoneNumber = freezed,
    Object actionOtpType = freezed,
  }) {
    return _$SendOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      actionOtpType == freezed ? this.actionOtpType : actionOtpType as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return sendOTP(phoneNumber, actionOtpType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(phoneNumber, actionOtpType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return sendOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(this);
    }
    return orElse();
  }
}

abstract class SendOTP implements RegisterEvent {
  const factory SendOTP(String phoneNumber, int actionOtpType) = _$SendOTP;

  String get phoneNumber;
  int get actionOtpType;

  SendOTP copyWith({String phoneNumber, int actionOtpType});
}

class _$ChangeSentOTP implements ChangeSentOTP {
  const _$ChangeSentOTP(this.sent) : assert(sent != null);

  @override
  final bool sent;

  @override
  String toString() {
    return 'RegisterEvent.changeSentOTP(sent: $sent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeSentOTP &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sent);

  @override
  _$ChangeSentOTP copyWith({
    Object sent = freezed,
  }) {
    return _$ChangeSentOTP(
      sent == freezed ? this.sent : sent as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return changeSentOTP(sent);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeSentOTP != null) {
      return changeSentOTP(sent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return changeSentOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeSentOTP != null) {
      return changeSentOTP(this);
    }
    return orElse();
  }
}

abstract class ChangeSentOTP implements RegisterEvent {
  const factory ChangeSentOTP(bool sent) = _$ChangeSentOTP;

  bool get sent;

  ChangeSentOTP copyWith({bool sent});
}

class _$CheckEmailConfirmed implements CheckEmailConfirmed {
  const _$CheckEmailConfirmed(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterEvent.checkEmailConfirmed(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CheckEmailConfirmed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$CheckEmailConfirmed copyWith({
    Object email = freezed,
  }) {
    return _$CheckEmailConfirmed(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return checkEmailConfirmed(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkEmailConfirmed != null) {
      return checkEmailConfirmed(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return checkEmailConfirmed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkEmailConfirmed != null) {
      return checkEmailConfirmed(this);
    }
    return orElse();
  }
}

abstract class CheckEmailConfirmed implements RegisterEvent {
  const factory CheckEmailConfirmed(String email) = _$CheckEmailConfirmed;

  String get email;

  CheckEmailConfirmed copyWith({String email});
}

class _$ValidateOTP implements ValidateOTP {
  const _$ValidateOTP(this.phoneNumber, this.otp, this.actionOtpType)
      : assert(phoneNumber != null),
        assert(otp != null),
        assert(actionOtpType != null);

  @override
  final String phoneNumber;
  @override
  final String otp;
  @override
  final int actionOtpType;

  @override
  String toString() {
    return 'RegisterEvent.validateOTP(phoneNumber: $phoneNumber, otp: $otp, actionOtpType: $actionOtpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.actionOtpType, actionOtpType) ||
                const DeepCollectionEquality()
                    .equals(other.actionOtpType, actionOtpType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(actionOtpType);

  @override
  _$ValidateOTP copyWith({
    Object phoneNumber = freezed,
    Object otp = freezed,
    Object actionOtpType = freezed,
  }) {
    return _$ValidateOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      otp == freezed ? this.otp : otp as String,
      actionOtpType == freezed ? this.actionOtpType : actionOtpType as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return validateOTP(phoneNumber, otp, actionOtpType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(phoneNumber, otp, actionOtpType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return validateOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(this);
    }
    return orElse();
  }
}

abstract class ValidateOTP implements RegisterEvent {
  const factory ValidateOTP(String phoneNumber, String otp, int actionOtpType) =
      _$ValidateOTP;

  String get phoneNumber;
  String get otp;
  int get actionOtpType;

  ValidateOTP copyWith({String phoneNumber, String otp, int actionOtpType});
}

class _$Register implements Register {
  const _$Register(this.name, this.email, this.phoneNumber, this.password,
      this.acceptedTerms, this.acceptedPrivacy)
      : assert(name != null),
        assert(email != null),
        assert(phoneNumber != null),
        assert(password != null),
        assert(acceptedTerms != null),
        assert(acceptedPrivacy != null);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final bool acceptedTerms;
  @override
  final bool acceptedPrivacy;

  @override
  String toString() {
    return 'RegisterEvent.register(name: $name, email: $email, phoneNumber: $phoneNumber, password: $password, acceptedTerms: $acceptedTerms, acceptedPrivacy: $acceptedPrivacy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Register &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedTerms, acceptedTerms)) &&
            (identical(other.acceptedPrivacy, acceptedPrivacy) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedPrivacy, acceptedPrivacy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(acceptedTerms) ^
      const DeepCollectionEquality().hash(acceptedPrivacy);

  @override
  _$Register copyWith({
    Object name = freezed,
    Object email = freezed,
    Object phoneNumber = freezed,
    Object password = freezed,
    Object acceptedTerms = freezed,
    Object acceptedPrivacy = freezed,
  }) {
    return _$Register(
      name == freezed ? this.name : name as String,
      email == freezed ? this.email : email as String,
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      password == freezed ? this.password : password as String,
      acceptedTerms == freezed ? this.acceptedTerms : acceptedTerms as bool,
      acceptedPrivacy == freezed
          ? this.acceptedPrivacy
          : acceptedPrivacy as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return register(name, email, phoneNumber, password, acceptedTerms,
        this.acceptedPrivacy);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(name, email, phoneNumber, password, acceptedTerms,
          this.acceptedPrivacy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements RegisterEvent {
  const factory Register(String name, String email, String phoneNumber,
      String password, bool acceptedTerms, bool acceptedPrivacy) = _$Register;

  String get name;
  String get email;
  String get phoneNumber;
  String get password;
  bool get acceptedTerms;
  bool get acceptedPrivacy;

  Register copyWith(
      {String name,
      String email,
      String phoneNumber,
      String password,
      bool acceptedTerms,
      bool acceptedPrivacy});
}

class _$GetEmailByPhoneNumber implements GetEmailByPhoneNumber {
  const _$GetEmailByPhoneNumber(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterEvent.getEmailByPhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetEmailByPhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$GetEmailByPhoneNumber copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$GetEmailByPhoneNumber(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getEmailByPhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getEmailByPhoneNumber != null) {
      return getEmailByPhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getEmailByPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getEmailByPhoneNumber != null) {
      return getEmailByPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class GetEmailByPhoneNumber implements RegisterEvent {
  const factory GetEmailByPhoneNumber(String phoneNumber) =
      _$GetEmailByPhoneNumber;

  String get phoneNumber;

  GetEmailByPhoneNumber copyWith({String phoneNumber});
}

class _$ChangePassword implements ChangePassword {
  const _$ChangePassword(this.email, this.newPassword, this.confirmPassword)
      : assert(email != null),
        assert(newPassword != null),
        assert(confirmPassword != null);

  @override
  final String email;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterEvent.changePassword(email: $email, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(confirmPassword);

  @override
  _$ChangePassword copyWith({
    Object email = freezed,
    Object newPassword = freezed,
    Object confirmPassword = freezed,
  }) {
    return _$ChangePassword(
      email == freezed ? this.email : email as String,
      newPassword == freezed ? this.newPassword : newPassword as String,
      confirmPassword == freezed
          ? this.confirmPassword
          : confirmPassword as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return changePassword(email, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(email, newPassword, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePassword implements RegisterEvent {
  const factory ChangePassword(
          String email, String newPassword, String confirmPassword) =
      _$ChangePassword;

  String get email;
  String get newPassword;
  String get confirmPassword;

  ChangePassword copyWith(
      {String email, String newPassword, String confirmPassword});
}

class _$GetGeoreferenciacionIP implements GetGeoreferenciacionIP {
  const _$GetGeoreferenciacionIP();

  @override
  String toString() {
    return 'RegisterEvent.getGeoreferenciacionIP()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetGeoreferenciacionIP);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getGeoreferenciacionIP();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGeoreferenciacionIP != null) {
      return getGeoreferenciacionIP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getGeoreferenciacionIP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGeoreferenciacionIP != null) {
      return getGeoreferenciacionIP(this);
    }
    return orElse();
  }
}

abstract class GetGeoreferenciacionIP implements RegisterEvent {
  const factory GetGeoreferenciacionIP() = _$GetGeoreferenciacionIP;
}

class _$GetGeoreferenciacionGPS implements GetGeoreferenciacionGPS {
  const _$GetGeoreferenciacionGPS();

  @override
  String toString() {
    return 'RegisterEvent.getGeoreferenciacionGPS()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetGeoreferenciacionGPS);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String identification),
    @required Result passwordChanged(String password),
    @required Result confirmPasswordChanged(String confirmPassword),
    @required Result nameChanged(String name),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result acceptedTermsChanged(bool checked),
    @required Result acceptedPrivacy(bool checked),
    @required
        Result sendEmail(
            String email, String phoneNumber, bool privacy, bool medios),
    @required Result sendOTP(String phoneNumber, int actionOtpType),
    @required Result changeSentOTP(bool sent),
    @required Result checkEmailConfirmed(String email),
    @required
        Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    @required
        Result register(String name, String email, String phoneNumber,
            String password, bool acceptedTerms, bool acceptedPrivacy),
    @required Result getEmailByPhoneNumber(String phoneNumber),
    @required
        Result changePassword(
            String email, String newPassword, String confirmPassword),
    @required Result getGeoreferenciacionIP(),
    @required Result getGeoreferenciacionGPS(),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getGeoreferenciacionGPS();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String identification),
    Result passwordChanged(String password),
    Result confirmPasswordChanged(String confirmPassword),
    Result nameChanged(String name),
    Result phoneNumberChanged(String phoneNumber),
    Result otpChanged(String otp),
    Result acceptedTermsChanged(bool checked),
    Result acceptedPrivacy(bool checked),
    Result sendEmail(
        String email, String phoneNumber, bool privacy, bool medios),
    Result sendOTP(String phoneNumber, int actionOtpType),
    Result changeSentOTP(bool sent),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp, int actionOtpType),
    Result register(String name, String email, String phoneNumber,
        String password, bool acceptedTerms, bool acceptedPrivacy),
    Result getEmailByPhoneNumber(String phoneNumber),
    Result changePassword(
        String email, String newPassword, String confirmPassword),
    Result getGeoreferenciacionIP(),
    Result getGeoreferenciacionGPS(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGeoreferenciacionGPS != null) {
      return getGeoreferenciacionGPS();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result confirmPasswordChanged(ConfirmPasswordChanged value),
    @required Result nameChanged(NameChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result otpChanged(OTPChanged value),
    @required Result acceptedTermsChanged(AcceptedTermsChanged value),
    @required Result acceptedPrivacy(AcceptedPrivacy value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result changeSentOTP(ChangeSentOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result register(Register value),
    @required Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    @required Result changePassword(ChangePassword value),
    @required Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    @required Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(confirmPasswordChanged != null);
    assert(nameChanged != null);
    assert(phoneNumberChanged != null);
    assert(otpChanged != null);
    assert(acceptedTermsChanged != null);
    assert(acceptedPrivacy != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(changeSentOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(register != null);
    assert(getEmailByPhoneNumber != null);
    assert(changePassword != null);
    assert(getGeoreferenciacionIP != null);
    assert(getGeoreferenciacionGPS != null);
    return getGeoreferenciacionGPS(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result confirmPasswordChanged(ConfirmPasswordChanged value),
    Result nameChanged(NameChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result otpChanged(OTPChanged value),
    Result acceptedTermsChanged(AcceptedTermsChanged value),
    Result acceptedPrivacy(AcceptedPrivacy value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result changeSentOTP(ChangeSentOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result register(Register value),
    Result getEmailByPhoneNumber(GetEmailByPhoneNumber value),
    Result changePassword(ChangePassword value),
    Result getGeoreferenciacionIP(GetGeoreferenciacionIP value),
    Result getGeoreferenciacionGPS(GetGeoreferenciacionGPS value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGeoreferenciacionGPS != null) {
      return getGeoreferenciacionGPS(this);
    }
    return orElse();
  }
}

abstract class GetGeoreferenciacionGPS implements RegisterEvent {
  const factory GetGeoreferenciacionGPS() = _$GetGeoreferenciacionGPS;
}

mixin _$RegisterState {
  EmailAddress get emailAddress;
  Password get password;
  Password get confirmPassword;
  PhoneNumber get phoneNumber;
  OTP get otp;
  Name get name;
  bool get acceptedTerms;
  bool get acceptedPrivacy;
  bool get isSubmitting;
  bool get emailAvailable;
  bool get phoneNumberAvailable;
  bool get privacy;
  bool get medios;
  bool get arePasswordsSame;
  bool get finishedRegister;
  bool get otpSent;
  bool get isRetrieving;
  bool get allowedGeoreferencing;
  int get timesAskedGeo;
  String get emailByPhone;
  Option<Either<BaseFailure, bool>> get emailConfirmedOption;
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  Option<Either<BaseFailure, bool>> get registerOption;
  Option<Either<BaseFailure, bool>> get changePasswordOption;

  RegisterState copyWith(
      {EmailAddress emailAddress,
      Password password,
      Password confirmPassword,
      PhoneNumber phoneNumber,
      OTP otp,
      Name name,
      bool acceptedTerms,
      bool acceptedPrivacy,
      bool isSubmitting,
      bool emailAvailable,
      bool phoneNumberAvailable,
      bool privacy,
      bool medios,
      bool arePasswordsSame,
      bool finishedRegister,
      bool otpSent,
      bool isRetrieving,
      bool allowedGeoreferencing,
      int timesAskedGeo,
      String emailByPhone,
      Option<Either<BaseFailure, bool>> emailConfirmedOption,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> registerOption,
      Option<Either<BaseFailure, bool>> changePasswordOption});
}

class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {EmailAddress emailAddress,
      Password password,
      Password confirmPassword,
      PhoneNumber phoneNumber,
      OTP otp,
      Name name,
      bool acceptedTerms,
      bool acceptedPrivacy,
      bool isSubmitting,
      bool emailAvailable,
      bool phoneNumberAvailable,
      bool privacy,
      bool medios,
      bool arePasswordsSame,
      bool finishedRegister,
      bool otpSent,
      bool isRetrieving,
      bool allowedGeoreferencing,
      int timesAskedGeo,
      String emailByPhone,
      Option<Either<BaseFailure, bool>> emailConfirmedOption,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> registerOption,
      Option<Either<BaseFailure, bool>> changePasswordOption}) {
    return _RegisterState(
      emailAddress: emailAddress,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
      otp: otp,
      name: name,
      acceptedTerms: acceptedTerms,
      acceptedPrivacy: acceptedPrivacy,
      isSubmitting: isSubmitting,
      emailAvailable: emailAvailable,
      phoneNumberAvailable: phoneNumberAvailable,
      privacy: privacy,
      medios: medios,
      arePasswordsSame: arePasswordsSame,
      finishedRegister: finishedRegister,
      otpSent: otpSent,
      isRetrieving: isRetrieving,
      allowedGeoreferencing: allowedGeoreferencing,
      timesAskedGeo: timesAskedGeo,
      emailByPhone: emailByPhone,
      emailConfirmedOption: emailConfirmedOption,
      phoneConfirmedOption: phoneConfirmedOption,
      registerOption: registerOption,
      changePasswordOption: changePasswordOption,
    );
  }
}

const $RegisterState = _$RegisterStateTearOff();

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {this.emailAddress,
      this.password,
      this.confirmPassword,
      this.phoneNumber,
      this.otp,
      this.name,
      this.acceptedTerms,
      this.acceptedPrivacy,
      this.isSubmitting,
      this.emailAvailable,
      this.phoneNumberAvailable,
      this.privacy,
      this.medios,
      this.arePasswordsSame,
      this.finishedRegister,
      this.otpSent,
      this.isRetrieving,
      this.allowedGeoreferencing,
      this.timesAskedGeo,
      this.emailByPhone,
      this.emailConfirmedOption,
      this.phoneConfirmedOption,
      this.registerOption,
      this.changePasswordOption});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Password confirmPassword;
  @override
  final PhoneNumber phoneNumber;
  @override
  final OTP otp;
  @override
  final Name name;
  @override
  final bool acceptedTerms;
  @override
  final bool acceptedPrivacy;
  @override
  final bool isSubmitting;
  @override
  final bool emailAvailable;
  @override
  final bool phoneNumberAvailable;
  @override
  final bool privacy;
  @override
  final bool medios;
  @override
  final bool arePasswordsSame;
  @override
  final bool finishedRegister;
  @override
  final bool otpSent;
  @override
  final bool isRetrieving;
  @override
  final bool allowedGeoreferencing;
  @override
  final int timesAskedGeo;
  @override
  final String emailByPhone;
  @override
  final Option<Either<BaseFailure, bool>> emailConfirmedOption;
  @override
  final Option<Either<BaseFailure, bool>> phoneConfirmedOption;
  @override
  final Option<Either<BaseFailure, bool>> registerOption;
  @override
  final Option<Either<BaseFailure, bool>> changePasswordOption;

  @override
  String toString() {
    return 'RegisterState(emailAddress: $emailAddress, password: $password, confirmPassword: $confirmPassword, phoneNumber: $phoneNumber, otp: $otp, name: $name, acceptedTerms: $acceptedTerms, acceptedPrivacy: $acceptedPrivacy, isSubmitting: $isSubmitting, emailAvailable: $emailAvailable, phoneNumberAvailable: $phoneNumberAvailable, privacy: $privacy, medios: $medios, arePasswordsSame: $arePasswordsSame, finishedRegister: $finishedRegister, otpSent: $otpSent, isRetrieving: $isRetrieving, allowedGeoreferencing: $allowedGeoreferencing, timesAskedGeo: $timesAskedGeo, emailByPhone: $emailByPhone, emailConfirmedOption: $emailConfirmedOption, phoneConfirmedOption: $phoneConfirmedOption, registerOption: $registerOption, changePasswordOption: $changePasswordOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedTerms, acceptedTerms)) &&
            (identical(other.acceptedPrivacy, acceptedPrivacy) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedPrivacy, acceptedPrivacy)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.emailAvailable, emailAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.emailAvailable, emailAvailable)) &&
            (identical(other.phoneNumberAvailable, phoneNumberAvailable) ||
                const DeepCollectionEquality().equals(
                    other.phoneNumberAvailable, phoneNumberAvailable)) &&
            (identical(other.privacy, privacy) ||
                const DeepCollectionEquality()
                    .equals(other.privacy, privacy)) &&
            (identical(other.medios, medios) ||
                const DeepCollectionEquality().equals(other.medios, medios)) &&
            (identical(other.arePasswordsSame, arePasswordsSame) ||
                const DeepCollectionEquality()
                    .equals(other.arePasswordsSame, arePasswordsSame)) &&
            (identical(other.finishedRegister, finishedRegister) ||
                const DeepCollectionEquality()
                    .equals(other.finishedRegister, finishedRegister)) &&
            (identical(other.otpSent, otpSent) ||
                const DeepCollectionEquality()
                    .equals(other.otpSent, otpSent)) &&
            (identical(other.isRetrieving, isRetrieving) ||
                const DeepCollectionEquality()
                    .equals(other.isRetrieving, isRetrieving)) &&
            (identical(other.allowedGeoreferencing, allowedGeoreferencing) ||
                const DeepCollectionEquality().equals(
                    other.allowedGeoreferencing, allowedGeoreferencing)) &&
            (identical(other.timesAskedGeo, timesAskedGeo) ||
                const DeepCollectionEquality()
                    .equals(other.timesAskedGeo, timesAskedGeo)) &&
            (identical(other.emailByPhone, emailByPhone) ||
                const DeepCollectionEquality()
                    .equals(other.emailByPhone, emailByPhone)) &&
            (identical(other.emailConfirmedOption, emailConfirmedOption) ||
                const DeepCollectionEquality().equals(
                    other.emailConfirmedOption, emailConfirmedOption)) &&
            (identical(other.phoneConfirmedOption, phoneConfirmedOption) ||
                const DeepCollectionEquality().equals(
                    other.phoneConfirmedOption, phoneConfirmedOption)) &&
            (identical(other.registerOption, registerOption) || const DeepCollectionEquality().equals(other.registerOption, registerOption)) &&
            (identical(other.changePasswordOption, changePasswordOption) || const DeepCollectionEquality().equals(other.changePasswordOption, changePasswordOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(acceptedTerms) ^
      const DeepCollectionEquality().hash(acceptedPrivacy) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(emailAvailable) ^
      const DeepCollectionEquality().hash(phoneNumberAvailable) ^
      const DeepCollectionEquality().hash(privacy) ^
      const DeepCollectionEquality().hash(medios) ^
      const DeepCollectionEquality().hash(arePasswordsSame) ^
      const DeepCollectionEquality().hash(finishedRegister) ^
      const DeepCollectionEquality().hash(otpSent) ^
      const DeepCollectionEquality().hash(isRetrieving) ^
      const DeepCollectionEquality().hash(allowedGeoreferencing) ^
      const DeepCollectionEquality().hash(timesAskedGeo) ^
      const DeepCollectionEquality().hash(emailByPhone) ^
      const DeepCollectionEquality().hash(emailConfirmedOption) ^
      const DeepCollectionEquality().hash(phoneConfirmedOption) ^
      const DeepCollectionEquality().hash(registerOption) ^
      const DeepCollectionEquality().hash(changePasswordOption);

  @override
  _$_RegisterState copyWith({
    Object emailAddress = freezed,
    Object password = freezed,
    Object confirmPassword = freezed,
    Object phoneNumber = freezed,
    Object otp = freezed,
    Object name = freezed,
    Object acceptedTerms = freezed,
    Object acceptedPrivacy = freezed,
    Object isSubmitting = freezed,
    Object emailAvailable = freezed,
    Object phoneNumberAvailable = freezed,
    Object privacy = freezed,
    Object medios = freezed,
    Object arePasswordsSame = freezed,
    Object finishedRegister = freezed,
    Object otpSent = freezed,
    Object isRetrieving = freezed,
    Object allowedGeoreferencing = freezed,
    Object timesAskedGeo = freezed,
    Object emailByPhone = freezed,
    Object emailConfirmedOption = freezed,
    Object phoneConfirmedOption = freezed,
    Object registerOption = freezed,
    Object changePasswordOption = freezed,
  }) {
    return _$_RegisterState(
      emailAddress: emailAddress == freezed
          ? this.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? this.password : password as Password,
      confirmPassword: confirmPassword == freezed
          ? this.confirmPassword
          : confirmPassword as Password,
      phoneNumber: phoneNumber == freezed
          ? this.phoneNumber
          : phoneNumber as PhoneNumber,
      otp: otp == freezed ? this.otp : otp as OTP,
      name: name == freezed ? this.name : name as Name,
      acceptedTerms:
          acceptedTerms == freezed ? this.acceptedTerms : acceptedTerms as bool,
      acceptedPrivacy: acceptedPrivacy == freezed
          ? this.acceptedPrivacy
          : acceptedPrivacy as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      emailAvailable: emailAvailable == freezed
          ? this.emailAvailable
          : emailAvailable as bool,
      phoneNumberAvailable: phoneNumberAvailable == freezed
          ? this.phoneNumberAvailable
          : phoneNumberAvailable as bool,
      privacy: privacy == freezed ? this.privacy : privacy as bool,
      medios: medios == freezed ? this.medios : medios as bool,
      arePasswordsSame: arePasswordsSame == freezed
          ? this.arePasswordsSame
          : arePasswordsSame as bool,
      finishedRegister: finishedRegister == freezed
          ? this.finishedRegister
          : finishedRegister as bool,
      otpSent: otpSent == freezed ? this.otpSent : otpSent as bool,
      isRetrieving:
          isRetrieving == freezed ? this.isRetrieving : isRetrieving as bool,
      allowedGeoreferencing: allowedGeoreferencing == freezed
          ? this.allowedGeoreferencing
          : allowedGeoreferencing as bool,
      timesAskedGeo:
          timesAskedGeo == freezed ? this.timesAskedGeo : timesAskedGeo as int,
      emailByPhone:
          emailByPhone == freezed ? this.emailByPhone : emailByPhone as String,
      emailConfirmedOption: emailConfirmedOption == freezed
          ? this.emailConfirmedOption
          : emailConfirmedOption as Option<Either<BaseFailure, bool>>,
      phoneConfirmedOption: phoneConfirmedOption == freezed
          ? this.phoneConfirmedOption
          : phoneConfirmedOption as Option<Either<BaseFailure, bool>>,
      registerOption: registerOption == freezed
          ? this.registerOption
          : registerOption as Option<Either<BaseFailure, bool>>,
      changePasswordOption: changePasswordOption == freezed
          ? this.changePasswordOption
          : changePasswordOption as Option<Either<BaseFailure, bool>>,
    );
  }
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
          {EmailAddress emailAddress,
          Password password,
          Password confirmPassword,
          PhoneNumber phoneNumber,
          OTP otp,
          Name name,
          bool acceptedTerms,
          bool acceptedPrivacy,
          bool isSubmitting,
          bool emailAvailable,
          bool phoneNumberAvailable,
          bool privacy,
          bool medios,
          bool arePasswordsSame,
          bool finishedRegister,
          bool otpSent,
          bool isRetrieving,
          bool allowedGeoreferencing,
          int timesAskedGeo,
          String emailByPhone,
          Option<Either<BaseFailure, bool>> emailConfirmedOption,
          Option<Either<BaseFailure, bool>> phoneConfirmedOption,
          Option<Either<BaseFailure, bool>> registerOption,
          Option<Either<BaseFailure, bool>> changePasswordOption}) =
      _$_RegisterState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  PhoneNumber get phoneNumber;
  @override
  OTP get otp;
  @override
  Name get name;
  @override
  bool get acceptedTerms;
  @override
  bool get acceptedPrivacy;
  @override
  bool get isSubmitting;
  @override
  bool get emailAvailable;
  @override
  bool get phoneNumberAvailable;
  @override
  bool get privacy;
  @override
  bool get medios;
  @override
  bool get arePasswordsSame;
  @override
  bool get finishedRegister;
  @override
  bool get otpSent;
  @override
  bool get isRetrieving;
  @override
  bool get allowedGeoreferencing;
  @override
  int get timesAskedGeo;
  @override
  String get emailByPhone;
  @override
  Option<Either<BaseFailure, bool>> get emailConfirmedOption;
  @override
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  @override
  Option<Either<BaseFailure, bool>> get registerOption;
  @override
  Option<Either<BaseFailure, bool>> get changePasswordOption;

  @override
  _RegisterState copyWith(
      {EmailAddress emailAddress,
      Password password,
      Password confirmPassword,
      PhoneNumber phoneNumber,
      OTP otp,
      Name name,
      bool acceptedTerms,
      bool acceptedPrivacy,
      bool isSubmitting,
      bool emailAvailable,
      bool phoneNumberAvailable,
      bool privacy,
      bool medios,
      bool arePasswordsSame,
      bool finishedRegister,
      bool otpSent,
      bool isRetrieving,
      bool allowedGeoreferencing,
      int timesAskedGeo,
      String emailByPhone,
      Option<Either<BaseFailure, bool>> emailConfirmedOption,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> registerOption,
      Option<Either<BaseFailure, bool>> changePasswordOption});
}
