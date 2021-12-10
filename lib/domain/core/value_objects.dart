import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/error.dart';
import 'package:ualet/domain/core/value_validators.dart';
import 'common_interfaces.dart';
import 'value_failures.dart';

@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrElse(T dflt) {
    return value.getOrElse(() => dflt);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class StringNotEmpty extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringNotEmpty(String input) {
    assert(input != null);
    return StringNotEmpty._(
      validateStringNotEmpty(input),
    );
  }

  const StringNotEmpty._(this.value);
}

class StringSingleLine extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringSingleLine(String input) {
    assert(input != null);
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    assert(input != null);
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
}

class DoubleNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DoubleNumber(String input,
      {Either<ValueFailure<String>, String> Function(String) validator}) {
    assert(input != null);
    return DoubleNumber._(
      validateDoubleNumber(input).flatMap((a) => validator(a)),
    );
  }

  const DoubleNumber._(this.value);
}
