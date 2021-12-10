import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/value_failures.dart';
import 'package:ualet/domain/core/value_objects.dart';
import 'package:ualet/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    assert(input != null);
    if (getIt<IEnv>().isColombia())
      return PhoneNumber._(validatePhoneNumber(input));
    else
      return PhoneNumber._(validatePhoneNumberMX(input));
  }

  const PhoneNumber._(this.value);
}

class PhoneNumberMX extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumberMX(String input) {
    assert(input != null);
    return PhoneNumberMX._(validatePhoneNumberMX(input));
  }
  const PhoneNumberMX._(this.value);
}

class OTP extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OTP(String input) {
    assert(input != null);
    return OTP._(validateInteger(input));
  }

  const OTP._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String input) {
    assert(input != null);
    return Name._(validateName(input));
  }

  const Name._(this.value);
}
