import 'package:ualet/generated/l10n.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';

String isNumeric(String s) {
  if (s.isEmpty) return 'Campo requerido';

  final n = num.tryParse(s);

  return (n == null) ? 'Campo requerido' : null;
}

String validateName(String value) {
  RegExp regExp = RegExp(r'^[A-Za-z ]+$');

  if (value != "") {
    if (regExp.hasMatch(value)) {
      if (value.length < 3) {
        return 'Mínimo 3 caracteres';
      } else {
        if (value.length > 20) {
          return 'Máximo 20 caracteres';
        } else {
          return null;
        }
      }
    }
    return 'Formato inválido';
  } else {
    return null;
  }
}

String validateCredential(String input, String locale) {
  const numberRegex = r'^[0-9]+$';
  if (RegExp(numberRegex).hasMatch(input)) {
    return validatePhoneNumber(input, locale);
  } else {
    return validateEmail(input);
  }
}

String validateEmail(String value) {
  if (EmailValidator.validate(value) || value == "") {
    return null;
  } else {
    return "El correo electrónico es inválido";
  }
}

String validatePhoneNumber(String value, String locale) {
  RegExp regExp = RegExp(r'^[0-9 ]*$');
  if (locale == "CO") {
    if (value != "") {
      if (regExp.hasMatch(value)) {
        if (value[0] == "3") {
          // Indicativo de Colombia, para iniciar nro de celular.
          if (value.length < 10) {
            return S.current.phoneNumberTooShort;
          } else if (value.length > 10) {
            return S.current.phoneNumberTooLong;
          } else {
            return null;
          }
        } else {
          return getIt<IEnv>().isColombia()
              ? S.current.phoneNumberIncorrectOperator
              : S.current.phoneNumberIncorrectOperatorMX;
        }
      } else {
        return 'El número celular no es válido';
      }
    } else {
      return null;
    }
  } else if (locale == "MX") {
    if (value != "") {
      if (regExp.hasMatch(value)) {
        if (value.length < 10) {
          return S.current.phoneNumberTooShort;
        } else if (value.length > 10) {
          return S.current.phoneNumberTooLong;
        } else {
          return null;
        }
      } else {
        return 'El número celular no es válido';
      }
    } else {
      return null;
    }
  } else {
    return 'El número celular no es válido';
  }
}

String validateCurrency(String value) {
  RegExp regExp = RegExp("^-?(?:\\d+|\\d{1,3}(?:.\\d{3})+)(?:(\\.)\\d+)?\$");

  if (value != "") {
    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return 'El valor no es válido';
    }
  } else {
    return 'Campo requerido';
  }
}

String validateCheckPassword(String value) {
  RegExp regExp = RegExp(
      r"^(?=[\D]*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=[^a-zA-Z]*[a-zA-Z])(?=.{8,15})(?!.*(\d)\1{2}).*$");

  if (value != "") {
    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return 'Formato invalido.';
    }
  } else {
    return null;
  }
}

String validateEmpty(String value) {
  if (value == "") {
    return 'Campo requerido';
  } else {
    return null;
  }
}
