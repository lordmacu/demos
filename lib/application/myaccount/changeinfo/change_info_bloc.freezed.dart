// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'change_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ChangeInfoEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  });
}

class _$ChangeInfoEventTearOff {
  const _$ChangeInfoEventTearOff();

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  ConfirmIdentification confirmIdentification(String email) {
    return ConfirmIdentification(
      email,
    );
  }

  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

  NewPasswordChanged newPasswordChanged(String password) {
    return NewPasswordChanged(
      password,
    );
  }

  NewPasswordConfirmChanged newPasswordConfirmChanged(String password) {
    return NewPasswordConfirmChanged(
      password,
    );
  }

  PhoneNumberChanged phoneNumberChanged(String phoneNumber) {
    return PhoneNumberChanged(
      phoneNumber,
    );
  }

  UpdatePhoneNumber updatePhoneNumber(String phoneNumber) {
    return UpdatePhoneNumber(
      phoneNumber,
    );
  }

  OTPChanged otpChanged(String otp) {
    return OTPChanged(
      otp,
    );
  }

  SendEmail sendEmail(String email, String phoneNumber) {
    return SendEmail(
      email,
      phoneNumber,
    );
  }

  SendOTP sendOTP(String phoneNumber) {
    return SendOTP(
      phoneNumber,
    );
  }

  CheckEmailConfirmed checkEmailConfirmed(String email) {
    return CheckEmailConfirmed(
      email,
    );
  }

  ValidateOTP validateOTP(String phoneNumber, String otp) {
    return ValidateOTP(
      phoneNumber,
      otp,
    );
  }

  ChangeEmail changeEmail(String email) {
    return ChangeEmail(
      email,
    );
  }

  ChangePassword changePassword(
      String password, String newPassword, String confirmPassword) {
    return ChangePassword(
      password,
      newPassword,
      confirmPassword,
    );
  }

  ChangePhoneNumber changePhoneNumber(String phoneNumber) {
    return ChangePhoneNumber(
      phoneNumber,
    );
  }
}

const $ChangeInfoEvent = _$ChangeInfoEventTearOff();

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ChangeInfoEvent.emailChanged(email: $email)';
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
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
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements ChangeInfoEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;

  EmailChanged copyWith({String email});
}

class _$ConfirmIdentification implements ConfirmIdentification {
  const _$ConfirmIdentification(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ChangeInfoEvent.confirmIdentification(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmIdentification &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$ConfirmIdentification copyWith({
    Object email = freezed,
  }) {
    return _$ConfirmIdentification(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return confirmIdentification(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmIdentification != null) {
      return confirmIdentification(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return confirmIdentification(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmIdentification != null) {
      return confirmIdentification(this);
    }
    return orElse();
  }
}

abstract class ConfirmIdentification implements ChangeInfoEvent {
  const factory ConfirmIdentification(String email) = _$ConfirmIdentification;

  String get email;

  ConfirmIdentification copyWith({String email});
}

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'ChangeInfoEvent.passwordChanged(password: $password)';
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
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
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements ChangeInfoEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password;

  PasswordChanged copyWith({String password});
}

class _$NewPasswordChanged implements NewPasswordChanged {
  const _$NewPasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'ChangeInfoEvent.newPasswordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewPasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$NewPasswordChanged copyWith({
    Object password = freezed,
  }) {
    return _$NewPasswordChanged(
      password == freezed ? this.password : password as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return newPasswordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newPasswordChanged != null) {
      return newPasswordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return newPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newPasswordChanged != null) {
      return newPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class NewPasswordChanged implements ChangeInfoEvent {
  const factory NewPasswordChanged(String password) = _$NewPasswordChanged;

  String get password;

  NewPasswordChanged copyWith({String password});
}

class _$NewPasswordConfirmChanged implements NewPasswordConfirmChanged {
  const _$NewPasswordConfirmChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'ChangeInfoEvent.newPasswordConfirmChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewPasswordConfirmChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$NewPasswordConfirmChanged copyWith({
    Object password = freezed,
  }) {
    return _$NewPasswordConfirmChanged(
      password == freezed ? this.password : password as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return newPasswordConfirmChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newPasswordConfirmChanged != null) {
      return newPasswordConfirmChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return newPasswordConfirmChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newPasswordConfirmChanged != null) {
      return newPasswordConfirmChanged(this);
    }
    return orElse();
  }
}

abstract class NewPasswordConfirmChanged implements ChangeInfoEvent {
  const factory NewPasswordConfirmChanged(String password) =
      _$NewPasswordConfirmChanged;

  String get password;

  NewPasswordConfirmChanged copyWith({String password});
}

class _$PhoneNumberChanged implements PhoneNumberChanged {
  const _$PhoneNumberChanged(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ChangeInfoEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
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
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberChanged implements ChangeInfoEvent {
  const factory PhoneNumberChanged(String phoneNumber) = _$PhoneNumberChanged;

  String get phoneNumber;

  PhoneNumberChanged copyWith({String phoneNumber});
}

class _$UpdatePhoneNumber implements UpdatePhoneNumber {
  const _$UpdatePhoneNumber(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ChangeInfoEvent.updatePhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$UpdatePhoneNumber copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$UpdatePhoneNumber(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return updatePhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePhoneNumber != null) {
      return updatePhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return updatePhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePhoneNumber != null) {
      return updatePhoneNumber(this);
    }
    return orElse();
  }
}

abstract class UpdatePhoneNumber implements ChangeInfoEvent {
  const factory UpdatePhoneNumber(String phoneNumber) = _$UpdatePhoneNumber;

  String get phoneNumber;

  UpdatePhoneNumber copyWith({String phoneNumber});
}

class _$OTPChanged implements OTPChanged {
  const _$OTPChanged(this.otp) : assert(otp != null);

  @override
  final String otp;

  @override
  String toString() {
    return 'ChangeInfoEvent.otpChanged(otp: $otp)';
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return otpChanged(otp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
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
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return otpChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (otpChanged != null) {
      return otpChanged(this);
    }
    return orElse();
  }
}

abstract class OTPChanged implements ChangeInfoEvent {
  const factory OTPChanged(String otp) = _$OTPChanged;

  String get otp;

  OTPChanged copyWith({String otp});
}

class _$SendEmail implements SendEmail {
  const _$SendEmail(this.email, this.phoneNumber)
      : assert(email != null),
        assert(phoneNumber != null);

  @override
  final String email;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ChangeInfoEvent.sendEmail(email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$SendEmail copyWith({
    Object email = freezed,
    Object phoneNumber = freezed,
  }) {
    return _$SendEmail(
      email == freezed ? this.email : email as String,
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return sendEmail(email, phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(email, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return sendEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(this);
    }
    return orElse();
  }
}

abstract class SendEmail implements ChangeInfoEvent {
  const factory SendEmail(String email, String phoneNumber) = _$SendEmail;

  String get email;
  String get phoneNumber;

  SendEmail copyWith({String email, String phoneNumber});
}

class _$SendOTP implements SendOTP {
  const _$SendOTP(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ChangeInfoEvent.sendOTP(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$SendOTP copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$SendOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return sendOTP(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return sendOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(this);
    }
    return orElse();
  }
}

abstract class SendOTP implements ChangeInfoEvent {
  const factory SendOTP(String phoneNumber) = _$SendOTP;

  String get phoneNumber;

  SendOTP copyWith({String phoneNumber});
}

class _$CheckEmailConfirmed implements CheckEmailConfirmed {
  const _$CheckEmailConfirmed(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ChangeInfoEvent.checkEmailConfirmed(email: $email)';
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return checkEmailConfirmed(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
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
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return checkEmailConfirmed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkEmailConfirmed != null) {
      return checkEmailConfirmed(this);
    }
    return orElse();
  }
}

abstract class CheckEmailConfirmed implements ChangeInfoEvent {
  const factory CheckEmailConfirmed(String email) = _$CheckEmailConfirmed;

  String get email;

  CheckEmailConfirmed copyWith({String email});
}

class _$ValidateOTP implements ValidateOTP {
  const _$ValidateOTP(this.phoneNumber, this.otp)
      : assert(phoneNumber != null),
        assert(otp != null);

  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'ChangeInfoEvent.validateOTP(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp);

  @override
  _$ValidateOTP copyWith({
    Object phoneNumber = freezed,
    Object otp = freezed,
  }) {
    return _$ValidateOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      otp == freezed ? this.otp : otp as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return validateOTP(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(phoneNumber, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return validateOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(this);
    }
    return orElse();
  }
}

abstract class ValidateOTP implements ChangeInfoEvent {
  const factory ValidateOTP(String phoneNumber, String otp) = _$ValidateOTP;

  String get phoneNumber;
  String get otp;

  ValidateOTP copyWith({String phoneNumber, String otp});
}

class _$ChangeEmail implements ChangeEmail {
  const _$ChangeEmail(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ChangeInfoEvent.changeEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$ChangeEmail copyWith({
    Object email = freezed,
  }) {
    return _$ChangeEmail(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changeEmail(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeEmail != null) {
      return changeEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeEmail != null) {
      return changeEmail(this);
    }
    return orElse();
  }
}

abstract class ChangeEmail implements ChangeInfoEvent {
  const factory ChangeEmail(String email) = _$ChangeEmail;

  String get email;

  ChangeEmail copyWith({String email});
}

class _$ChangePassword implements ChangePassword {
  const _$ChangePassword(this.password, this.newPassword, this.confirmPassword)
      : assert(password != null),
        assert(newPassword != null),
        assert(confirmPassword != null);

  @override
  final String password;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ChangeInfoEvent.changePassword(password: $password, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePassword &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
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
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(confirmPassword);

  @override
  _$ChangePassword copyWith({
    Object password = freezed,
    Object newPassword = freezed,
    Object confirmPassword = freezed,
  }) {
    return _$ChangePassword(
      password == freezed ? this.password : password as String,
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
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changePassword(password, newPassword, confirmPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(password, newPassword, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePassword implements ChangeInfoEvent {
  const factory ChangePassword(
          String password, String newPassword, String confirmPassword) =
      _$ChangePassword;

  String get password;
  String get newPassword;
  String get confirmPassword;

  ChangePassword copyWith(
      {String password, String newPassword, String confirmPassword});
}

class _$ChangePhoneNumber implements ChangePhoneNumber {
  const _$ChangePhoneNumber(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ChangeInfoEvent.changePhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$ChangePhoneNumber copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$ChangePhoneNumber(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result confirmIdentification(String email),
    @required Result passwordChanged(String password),
    @required Result newPasswordChanged(String password),
    @required Result newPasswordConfirmChanged(String password),
    @required Result phoneNumberChanged(String phoneNumber),
    @required Result updatePhoneNumber(String phoneNumber),
    @required Result otpChanged(String otp),
    @required Result sendEmail(String email, String phoneNumber),
    @required Result sendOTP(String phoneNumber),
    @required Result checkEmailConfirmed(String email),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result changeEmail(String email),
    @required
        Result changePassword(
            String password, String newPassword, String confirmPassword),
    @required Result changePhoneNumber(String phoneNumber),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changePhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result confirmIdentification(String email),
    Result passwordChanged(String password),
    Result newPasswordChanged(String password),
    Result newPasswordConfirmChanged(String password),
    Result phoneNumberChanged(String phoneNumber),
    Result updatePhoneNumber(String phoneNumber),
    Result otpChanged(String otp),
    Result sendEmail(String email, String phoneNumber),
    Result sendOTP(String phoneNumber),
    Result checkEmailConfirmed(String email),
    Result validateOTP(String phoneNumber, String otp),
    Result changeEmail(String email),
    Result changePassword(
        String password, String newPassword, String confirmPassword),
    Result changePhoneNumber(String phoneNumber),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePhoneNumber != null) {
      return changePhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result confirmIdentification(ConfirmIdentification value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result newPasswordChanged(NewPasswordChanged value),
    @required Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    @required Result phoneNumberChanged(PhoneNumberChanged value),
    @required Result updatePhoneNumber(UpdatePhoneNumber value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendEmail(SendEmail value),
    @required Result sendOTP(SendOTP value),
    @required Result checkEmailConfirmed(CheckEmailConfirmed value),
    @required Result validateOTP(ValidateOTP value),
    @required Result changeEmail(ChangeEmail value),
    @required Result changePassword(ChangePassword value),
    @required Result changePhoneNumber(ChangePhoneNumber value),
  }) {
    assert(emailChanged != null);
    assert(confirmIdentification != null);
    assert(passwordChanged != null);
    assert(newPasswordChanged != null);
    assert(newPasswordConfirmChanged != null);
    assert(phoneNumberChanged != null);
    assert(updatePhoneNumber != null);
    assert(otpChanged != null);
    assert(sendEmail != null);
    assert(sendOTP != null);
    assert(checkEmailConfirmed != null);
    assert(validateOTP != null);
    assert(changeEmail != null);
    assert(changePassword != null);
    assert(changePhoneNumber != null);
    return changePhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result confirmIdentification(ConfirmIdentification value),
    Result passwordChanged(PasswordChanged value),
    Result newPasswordChanged(NewPasswordChanged value),
    Result newPasswordConfirmChanged(NewPasswordConfirmChanged value),
    Result phoneNumberChanged(PhoneNumberChanged value),
    Result updatePhoneNumber(UpdatePhoneNumber value),
    Result otpChanged(OTPChanged value),
    Result sendEmail(SendEmail value),
    Result sendOTP(SendOTP value),
    Result checkEmailConfirmed(CheckEmailConfirmed value),
    Result validateOTP(ValidateOTP value),
    Result changeEmail(ChangeEmail value),
    Result changePassword(ChangePassword value),
    Result changePhoneNumber(ChangePhoneNumber value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePhoneNumber != null) {
      return changePhoneNumber(this);
    }
    return orElse();
  }
}

abstract class ChangePhoneNumber implements ChangeInfoEvent {
  const factory ChangePhoneNumber(String phoneNumber) = _$ChangePhoneNumber;

  String get phoneNumber;

  ChangePhoneNumber copyWith({String phoneNumber});
}

mixin _$ChangeInfoState {
  EmailAddress get emailAddress;
  Password get password;
  Password get newPassword;
  Password get newPasswordConfirm;
  PhoneNumber get phoneNumber;
  OTP get otp;
  bool get isSubmitting;
  bool get emailAvailable;
  bool get phoneNumberAvailable;
  bool get arePasswordsSame;
  bool get sendOtp;
  Option<Either<BaseFailure, bool>> get changePasswordOption;
  Option<Either<BaseFailure, bool>> get changeEmailOption;
  Option<Either<BaseFailure, bool>> get changePhoneNumberOption;
  Option<Either<BaseFailure, bool>> get emailConfirmedOption;
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  bool get saveUpdatephoneNumber;

  ChangeInfoState copyWith(
      {EmailAddress emailAddress,
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
      bool saveUpdatephoneNumber});
}

class _$ChangeInfoStateTearOff {
  const _$ChangeInfoStateTearOff();

  _ChangeInfoState call(
      {EmailAddress emailAddress,
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
      bool saveUpdatephoneNumber}) {
    return _ChangeInfoState(
      emailAddress: emailAddress,
      password: password,
      newPassword: newPassword,
      newPasswordConfirm: newPasswordConfirm,
      phoneNumber: phoneNumber,
      otp: otp,
      isSubmitting: isSubmitting,
      emailAvailable: emailAvailable,
      phoneNumberAvailable: phoneNumberAvailable,
      arePasswordsSame: arePasswordsSame,
      sendOtp: sendOtp,
      changePasswordOption: changePasswordOption,
      changeEmailOption: changeEmailOption,
      changePhoneNumberOption: changePhoneNumberOption,
      emailConfirmedOption: emailConfirmedOption,
      phoneConfirmedOption: phoneConfirmedOption,
      saveUpdatephoneNumber: saveUpdatephoneNumber,
    );
  }
}

const $ChangeInfoState = _$ChangeInfoStateTearOff();

class _$_ChangeInfoState implements _ChangeInfoState {
  const _$_ChangeInfoState(
      {this.emailAddress,
      this.password,
      this.newPassword,
      this.newPasswordConfirm,
      this.phoneNumber,
      this.otp,
      this.isSubmitting,
      this.emailAvailable,
      this.phoneNumberAvailable,
      this.arePasswordsSame,
      this.sendOtp,
      this.changePasswordOption,
      this.changeEmailOption,
      this.changePhoneNumberOption,
      this.emailConfirmedOption,
      this.phoneConfirmedOption,
      this.saveUpdatephoneNumber});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Password newPassword;
  @override
  final Password newPasswordConfirm;
  @override
  final PhoneNumber phoneNumber;
  @override
  final OTP otp;
  @override
  final bool isSubmitting;
  @override
  final bool emailAvailable;
  @override
  final bool phoneNumberAvailable;
  @override
  final bool arePasswordsSame;
  @override
  final bool sendOtp;
  @override
  final Option<Either<BaseFailure, bool>> changePasswordOption;
  @override
  final Option<Either<BaseFailure, bool>> changeEmailOption;
  @override
  final Option<Either<BaseFailure, bool>> changePhoneNumberOption;
  @override
  final Option<Either<BaseFailure, bool>> emailConfirmedOption;
  @override
  final Option<Either<BaseFailure, bool>> phoneConfirmedOption;
  @override
  final bool saveUpdatephoneNumber;

  @override
  String toString() {
    return 'ChangeInfoState(emailAddress: $emailAddress, password: $password, newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm, phoneNumber: $phoneNumber, otp: $otp, isSubmitting: $isSubmitting, emailAvailable: $emailAvailable, phoneNumberAvailable: $phoneNumberAvailable, arePasswordsSame: $arePasswordsSame, sendOtp: $sendOtp, changePasswordOption: $changePasswordOption, changeEmailOption: $changeEmailOption, changePhoneNumberOption: $changePhoneNumberOption, emailConfirmedOption: $emailConfirmedOption, phoneConfirmedOption: $phoneConfirmedOption, saveUpdatephoneNumber: $saveUpdatephoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeInfoState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.newPasswordConfirm, newPasswordConfirm) ||
                const DeepCollectionEquality()
                    .equals(other.newPasswordConfirm, newPasswordConfirm)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.emailAvailable, emailAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.emailAvailable, emailAvailable)) &&
            (identical(other.phoneNumberAvailable, phoneNumberAvailable) ||
                const DeepCollectionEquality().equals(
                    other.phoneNumberAvailable, phoneNumberAvailable)) &&
            (identical(other.arePasswordsSame, arePasswordsSame) ||
                const DeepCollectionEquality()
                    .equals(other.arePasswordsSame, arePasswordsSame)) &&
            (identical(other.sendOtp, sendOtp) ||
                const DeepCollectionEquality()
                    .equals(other.sendOtp, sendOtp)) &&
            (identical(other.changePasswordOption, changePasswordOption) ||
                const DeepCollectionEquality().equals(
                    other.changePasswordOption, changePasswordOption)) &&
            (identical(other.changeEmailOption, changeEmailOption) ||
                const DeepCollectionEquality()
                    .equals(other.changeEmailOption, changeEmailOption)) &&
            (identical(
                    other.changePhoneNumberOption, changePhoneNumberOption) ||
                const DeepCollectionEquality().equals(
                    other.changePhoneNumberOption, changePhoneNumberOption)) &&
            (identical(other.emailConfirmedOption, emailConfirmedOption) ||
                const DeepCollectionEquality().equals(
                    other.emailConfirmedOption, emailConfirmedOption)) &&
            (identical(other.phoneConfirmedOption, phoneConfirmedOption) ||
                const DeepCollectionEquality().equals(
                    other.phoneConfirmedOption, phoneConfirmedOption)) &&
            (identical(other.saveUpdatephoneNumber, saveUpdatephoneNumber) ||
                const DeepCollectionEquality().equals(
                    other.saveUpdatephoneNumber, saveUpdatephoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(newPasswordConfirm) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(emailAvailable) ^
      const DeepCollectionEquality().hash(phoneNumberAvailable) ^
      const DeepCollectionEquality().hash(arePasswordsSame) ^
      const DeepCollectionEquality().hash(sendOtp) ^
      const DeepCollectionEquality().hash(changePasswordOption) ^
      const DeepCollectionEquality().hash(changeEmailOption) ^
      const DeepCollectionEquality().hash(changePhoneNumberOption) ^
      const DeepCollectionEquality().hash(emailConfirmedOption) ^
      const DeepCollectionEquality().hash(phoneConfirmedOption) ^
      const DeepCollectionEquality().hash(saveUpdatephoneNumber);

  @override
  _$_ChangeInfoState copyWith({
    Object emailAddress = freezed,
    Object password = freezed,
    Object newPassword = freezed,
    Object newPasswordConfirm = freezed,
    Object phoneNumber = freezed,
    Object otp = freezed,
    Object isSubmitting = freezed,
    Object emailAvailable = freezed,
    Object phoneNumberAvailable = freezed,
    Object arePasswordsSame = freezed,
    Object sendOtp = freezed,
    Object changePasswordOption = freezed,
    Object changeEmailOption = freezed,
    Object changePhoneNumberOption = freezed,
    Object emailConfirmedOption = freezed,
    Object phoneConfirmedOption = freezed,
    Object saveUpdatephoneNumber = freezed,
  }) {
    return _$_ChangeInfoState(
      emailAddress: emailAddress == freezed
          ? this.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? this.password : password as Password,
      newPassword:
          newPassword == freezed ? this.newPassword : newPassword as Password,
      newPasswordConfirm: newPasswordConfirm == freezed
          ? this.newPasswordConfirm
          : newPasswordConfirm as Password,
      phoneNumber: phoneNumber == freezed
          ? this.phoneNumber
          : phoneNumber as PhoneNumber,
      otp: otp == freezed ? this.otp : otp as OTP,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      emailAvailable: emailAvailable == freezed
          ? this.emailAvailable
          : emailAvailable as bool,
      phoneNumberAvailable: phoneNumberAvailable == freezed
          ? this.phoneNumberAvailable
          : phoneNumberAvailable as bool,
      arePasswordsSame: arePasswordsSame == freezed
          ? this.arePasswordsSame
          : arePasswordsSame as bool,
      sendOtp: sendOtp == freezed ? this.sendOtp : sendOtp as bool,
      changePasswordOption: changePasswordOption == freezed
          ? this.changePasswordOption
          : changePasswordOption as Option<Either<BaseFailure, bool>>,
      changeEmailOption: changeEmailOption == freezed
          ? this.changeEmailOption
          : changeEmailOption as Option<Either<BaseFailure, bool>>,
      changePhoneNumberOption: changePhoneNumberOption == freezed
          ? this.changePhoneNumberOption
          : changePhoneNumberOption as Option<Either<BaseFailure, bool>>,
      emailConfirmedOption: emailConfirmedOption == freezed
          ? this.emailConfirmedOption
          : emailConfirmedOption as Option<Either<BaseFailure, bool>>,
      phoneConfirmedOption: phoneConfirmedOption == freezed
          ? this.phoneConfirmedOption
          : phoneConfirmedOption as Option<Either<BaseFailure, bool>>,
      saveUpdatephoneNumber: saveUpdatephoneNumber == freezed
          ? this.saveUpdatephoneNumber
          : saveUpdatephoneNumber as bool,
    );
  }
}

abstract class _ChangeInfoState implements ChangeInfoState {
  const factory _ChangeInfoState(
      {EmailAddress emailAddress,
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
      bool saveUpdatephoneNumber}) = _$_ChangeInfoState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Password get newPassword;
  @override
  Password get newPasswordConfirm;
  @override
  PhoneNumber get phoneNumber;
  @override
  OTP get otp;
  @override
  bool get isSubmitting;
  @override
  bool get emailAvailable;
  @override
  bool get phoneNumberAvailable;
  @override
  bool get arePasswordsSame;
  @override
  bool get sendOtp;
  @override
  Option<Either<BaseFailure, bool>> get changePasswordOption;
  @override
  Option<Either<BaseFailure, bool>> get changeEmailOption;
  @override
  Option<Either<BaseFailure, bool>> get changePhoneNumberOption;
  @override
  Option<Either<BaseFailure, bool>> get emailConfirmedOption;
  @override
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  @override
  bool get saveUpdatephoneNumber;

  @override
  _ChangeInfoState copyWith(
      {EmailAddress emailAddress,
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
      bool saveUpdatephoneNumber});
}
