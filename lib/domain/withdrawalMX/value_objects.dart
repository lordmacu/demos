import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/value_failures.dart';
import 'package:ualet/domain/core/value_objects.dart';
import 'package:ualet/domain/core/value_validators.dart';

class Withdrawal extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  final double min = 100.0;

  factory Withdrawal(double input, double goalValue, double min) {
    assert(input != null);
    return Withdrawal._(validateWithdrawal(input, goalValue, min));
  }

  const Withdrawal._(this.value);
}
