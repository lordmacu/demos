import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateDoubleNumber(String input) {
  if (double.tryParse(input) == null) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateNumberInRange(
    String input, Tuple2<double, double> limits) {
  final num = double.tryParse(input) ?? 0;
  if (limits.value1 != null && num < limits.value1) {
    return left(ValueFailure.numberToLow(failedValue: input));
  } else if (limits.value2 != null && num > limits.value2) {
    return left(ValueFailure.numberToBig(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  const phoneNumberRegex = r'^\d\d\d\d\d\d\d\d\d\d$';

  if (RegExp(phoneNumberRegex).hasMatch(input)) {
    if (input[0] == '3' || input[0] == '4')
      return right(input);
    else
      return left(ValueFailure.phoneNumberNotStartsWith3(failedValue: input));
  } else {
    if (input.length < 10) {
      return left(ValueFailure.phoneNumberToShort(failedValue: input));
    } else {
      return left(ValueFailure.invalidPhoneNumber(failedValue: input));
    }
  }
}

const List<String> codigosMx = [
  "744",
  "449",
  "833",
  "81",
  "624",
  "981",
  "998",
  "461",
  "983",
  "614",
  "747",
  "877",
  "938",
  "656",
  "871",
  "833",
  "644",
  "834",
  "921",
  "312",
  "963",
  "271",
  "777",
  "667",
  "646",
  "871",
  "33",
  "473",
  "662",
  "715",
  "777",
  "612",
  "477",
  "314",
  "868",
  "999",
  "686",
  "55",
  "81",
  "443",
  "867",
  "951",
  "771",
  "984",
  "222",
  "322",
  "899",
  "464"
];

bool validateStartingCodeMx(String input) {
  for (String s in codigosMx) {
    if (input.startsWith(s)) {
      return true;
    }
  }
  return false;
}

Either<ValueFailure<String>, String> validatePhoneNumberMX(String input) {
  const phoneNumberRegex = r'^\d\d\d\d\d\d\d\d\d\d$';
  print("validPhonemx");

  if (RegExp(phoneNumberRegex).hasMatch(input)) {
    if (validateStartingCodeMx(input))
      return right(input);
    else
      return left(ValueFailure.notValidOperatorMX(failedValue: input));
  } else {
    if (input.length < 10) {
      return left(ValueFailure.phoneNumberToShort(failedValue: input));
    } else {
      return left(ValueFailure.invalidPhoneNumber(failedValue: input));
    }
  }
}

Either<ValueFailure<String>, String> validateCredential(String input) {
  const numberRegex = r'^[0-9]+$';
  if (RegExp(numberRegex).hasMatch(input)) {
    return validatePhoneNumber(input);
  } else {
    return validateEmailAddress(input);
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  if (input.length > 0 && input[0] == " ") {
    return left(ValueFailure.emailHasSpaceBeginning(failedValue: input));
  }
  if (input.contains(" ")) {
    return left(ValueFailure.emailHasSpace(failedValue: input));
  }
  if (input.contains("@")) {
    if (!input.contains(".")) {
      return left(ValueFailure.missingDotAfterExt(failedValue: input));
    } else {
      int indexofAt = input.lastIndexOf("@");
      int indexofDot = input.lastIndexOf(".");
      if (indexofAt > indexofDot) {
        return left(ValueFailure.missingDotAfterExt(failedValue: input));
      }
    }
  }
  if (!input.contains(".")) {
    return left(ValueFailure.emailMissingDot(failedValue: input));
  } else {
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else
      return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegex =
      r"^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$";

  if (RegExp(passwordRegex).hasMatch(input) &&
      !hasNumbersRepeated(input) &&
      !hasSequential(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateInteger(String input) {
  if (int.tryParse(input) == null) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateName(String input) {
  const nameRegex =
      r"^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð '-]+$";
  if (RegExp(nameRegex).hasMatch(input)) {
    if (input.length < 3) {
      return left(ValueFailure.nameTooShort(failedValue: input));
    } else if (input.length > 50) {
      return left(ValueFailure.nameTooLong(failedValue: input));
    } else
      return right(input);
  } else {
    return left(ValueFailure.invalidName(failedValue: input));
  }
}

Either<ValueFailure<double>, double> validateWithdrawal(
    double input, double goalValue, double min) {
  if (goalValue - input < min) {
    return left(ValueFailure.goalMinPassed(failedValue: input));
  } else if (input < 10000) {
    return left(ValueFailure.underMin(failedValue: input));
  } else if (input <= 0) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  } else {
    return right(input);
  }
}

bool hasSequential(String input) {
  int current;
  int sequentialCount = 0;
  int maxSequentialCount = 0;
  int previous;
  for (var i = 0; i < input.length; i++) {
    current = int.tryParse(input[i]);
    if (current != null) {
      if (previous != null) {
        if (current == previous + 1) {
          sequentialCount++;
          previous = current;
        } else {
          maxSequentialCount = sequentialCount > maxSequentialCount
              ? sequentialCount
              : maxSequentialCount;
          sequentialCount = 1;
          previous = current;
          current = null;
        }
      } else {
        previous = current;
        sequentialCount = 1;
      }
    } else {
      current = null;
      previous = null;
      maxSequentialCount = sequentialCount > maxSequentialCount
          ? sequentialCount
          : maxSequentialCount;
      sequentialCount = 1;
    }
    if (i == input.length - 1) {
      maxSequentialCount = sequentialCount > maxSequentialCount
          ? sequentialCount
          : maxSequentialCount;
      sequentialCount = 1;
    }
  }
  return maxSequentialCount > 3;
}

bool hasNumbersRepeated(String input) {
  int current;
  int repeatedCount = 0;
  int maxRepeatedCount = 0;
  int previous;
  for (var i = 0; i < input.length; i++) {
    current = int.tryParse(input[i]);
    if (current != null) {
      if (previous != null) {
        if (current == previous) {
          repeatedCount++;
          previous = current;
        } else {
          maxRepeatedCount = repeatedCount > maxRepeatedCount
              ? repeatedCount
              : maxRepeatedCount;
          previous = current;
          current = null;
          repeatedCount = 1;
        }
      } else {
        previous = current;
        repeatedCount = 1;
      }
    } else {
      current = null;
      previous = null;
      maxRepeatedCount =
          repeatedCount > maxRepeatedCount ? repeatedCount : maxRepeatedCount;
      repeatedCount = 1;
    }
    if (i == input.length - 1) {
      maxRepeatedCount =
          repeatedCount > maxRepeatedCount ? repeatedCount : maxRepeatedCount;
      repeatedCount = 1;
    }
  }
  return maxRepeatedCount > 2;
}
