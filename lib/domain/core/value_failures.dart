import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.invalidNumber({
    @required T failedValue,
  }) = InvalidNumber<T>;
  const factory ValueFailure.numberToLow({
    @required T failedValue,
  }) = NumberToLow<T>;
  const factory ValueFailure.numberToBig({
    @required T failedValue,
  }) = NumberToBig<T>;
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.emailMissingDot({
    @required T failedValue,
  }) = EmailMissingDot<T>;
  const factory ValueFailure.emailHasSpace({
    @required T failedValue,
  }) = EmailHasSpace<T>;
  const factory ValueFailure.invalidPassword({
    @required T failedValue,
  }) = InvalidPassword<T>;
  const factory ValueFailure.invalidPhoneNumber({
    @required T failedValue,
  }) = InvalidPhoneNumber<T>;
  const factory ValueFailure.phoneNumberNotStartsWith3({
    @required T failedValue,
  }) = PhoneNumberNotStartsWith3<T>;
  const factory ValueFailure.notValidOperatorMX({
    @required T failedValue,
  }) = NotValidOperatorMX<T>;
  const factory ValueFailure.invalidName({
    @required T failedValue,
  }) = InvalidName<T>;
  const factory ValueFailure.nameTooShort({
    @required T failedValue,
  }) = NameTooShort<T>;
  const factory ValueFailure.nameTooLong({
    @required T failedValue,
  }) = NameTooLong<T>;
  const factory ValueFailure.phoneNumberToShort({
    @required T failedValue,
  }) = PhoneNumberTooShort<T>;
  const factory ValueFailure.goalMinPassed({
    @required T failedValue,
  }) = GoalMinPassed<T>;
  const factory ValueFailure.underMin({
    @required T failedValue,
  }) = UnderMin<T>;
  const factory ValueFailure.emailHasSpaceBeginning({
    @required T failedValue,
  }) = EmailHasSpaceBeginning<T>;
  const factory ValueFailure.missingDotAfterExt({
    @required T failedValue,
  }) = MissingDotAfterExt<T>;
}
