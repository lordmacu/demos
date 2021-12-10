// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `es`
  String get currentLocale {
    return Intl.message(
      'es',
      name: 'currentLocale',
      desc: '',
      args: [],
    );
  }

  /// `V. {version}\n{copyright}\nTodos los derechos reservados`
  String splashPageVersionLabel(Object version, Object copyright) {
    return Intl.message(
      'V. $version\n$copyright\nTodos los derechos reservados',
      name: 'splashPageVersionLabel',
      desc: '',
      args: [version, copyright],
    );
  }

  /// `{index} de {total} por responder`
  String profilingProgressIndicatorLabel(Object index, Object total) {
    return Intl.message(
      '$index de $total por responder',
      name: 'profilingProgressIndicatorLabel',
      desc: '',
      args: [index, total],
    );
  }

  /// `Siguiente`
  String get nextButton {
    return Intl.message(
      'Siguiente',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `$ 0`
  String get sliderMoneyHintLabel {
    return Intl.message(
      '\$ 0',
      name: 'sliderMoneyHintLabel',
      desc: '',
      args: [],
    );
  }

  /// `0 %`
  String get sliderPercentHintLabel {
    return Intl.message(
      '0 %',
      name: 'sliderPercentHintLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirma el mensaje que hemos enviado a tu correo electrónico `
  String get descriptionConfirmEmail {
    return Intl.message(
      'Confirma el mensaje que hemos enviado a tu correo electrónico ',
      name: 'descriptionConfirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa el código de seguridad que hemos enviado a tu móvil`
  String get descriptionConfirmOtp {
    return Intl.message(
      'Ingresa el código de seguridad que hemos enviado a tu móvil',
      name: 'descriptionConfirmOtp',
      desc: '',
      args: [],
    );
  }

  /// `Tu correo tiene un espacio en blanco al principio.`
  String get emailHasSpaceBeggining {
    return Intl.message(
      'Tu correo tiene un espacio en blanco al principio.',
      name: 'emailHasSpaceBeggining',
      desc: '',
      args: [],
    );
  }

  /// `Le falta un punto a tu correo`
  String get missingdotEmail {
    return Intl.message(
      'Le falta un punto a tu correo',
      name: 'missingdotEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reenviar correo`
  String get alreadyHaveAnResendEmailButton {
    return Intl.message(
      'Reenviar correo',
      name: 'alreadyHaveAnResendEmailButton',
      desc: '',
      args: [],
    );
  }

  /// `Reenviar código`
  String get alreadyHaveAnResendOtpButton {
    return Intl.message(
      'Reenviar código',
      name: 'alreadyHaveAnResendOtpButton',
      desc: '',
      args: [],
    );
  }

  /// `Por favor espere `
  String get errorResendEmail {
    return Intl.message(
      'Por favor espere ',
      name: 'errorResendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Esta operación tiene un valor adicional correspondiente al 2% de tu inversión`
  String get withdrawalDescriptionInvest {
    return Intl.message(
      'Esta operación tiene un valor adicional correspondiente al 2% de tu inversión',
      name: 'withdrawalDescriptionInvest',
      desc: '',
      args: [],
    );
  }

  /// ` segundos para poder reenviar el correo`
  String get errorResendEmailTwo {
    return Intl.message(
      ' segundos para poder reenviar el correo',
      name: 'errorResendEmailTwo',
      desc: '',
      args: [],
    );
  }

  /// `Por favor espere `
  String get errorResendOtp {
    return Intl.message(
      'Por favor espere ',
      name: 'errorResendOtp',
      desc: '',
      args: [],
    );
  }

  /// ` segundos para poder reenviar el otp`
  String get errorResendOtpTwo {
    return Intl.message(
      ' segundos para poder reenviar el otp',
      name: 'errorResendOtpTwo',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error, por favor inténtalo más tarde`
  String get errorSendOtp {
    return Intl.message(
      'Ha ocurrido un error, por favor inténtalo más tarde',
      name: 'errorSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Código enviado correctamente`
  String get successSendOtp {
    return Intl.message(
      'Código enviado correctamente',
      name: 'successSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Código incorrecto`
  String get errorValidOtp {
    return Intl.message(
      'Código incorrecto',
      name: 'errorValidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Número móvil validado con éxito`
  String get successValidOtp {
    return Intl.message(
      'Número móvil validado con éxito',
      name: 'successValidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error, por favor inténtalo más tarde`
  String get errorSendEmail {
    return Intl.message(
      'Ha ocurrido un error, por favor inténtalo más tarde',
      name: 'errorSendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico enviado correctamente`
  String get successSendEmail {
    return Intl.message(
      'Correo electrónico enviado correctamente',
      name: 'successSendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error con la confimación, por favor inténtalo más tarde`
  String get errorValidEmail {
    return Intl.message(
      'Ha ocurrido un error con la confimación, por favor inténtalo más tarde',
      name: 'errorValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Revisa tu correo`
  String get titleConfirmEmail {
    return Intl.message(
      'Revisa tu correo',
      name: 'titleConfirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Activación`
  String get titleConfirmOtp {
    return Intl.message(
      'Activación',
      name: 'titleConfirmOtp',
      desc: '',
      args: [],
    );
  }

  /// `Quiero cambiar mi perfil`
  String get reviewProfilingResultButton {
    return Intl.message(
      'Quiero cambiar mi perfil',
      name: 'reviewProfilingResultButton',
      desc: '',
      args: [],
    );
  }

  /// `Este es tu perfil:`
  String get profilingResultTitleLabel {
    return Intl.message(
      'Este es tu perfil:',
      name: 'profilingResultTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Registrarme`
  String get signUpButton {
    return Intl.message(
      'Registrarme',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get signInButton {
    return Intl.message(
      'Ingresar',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico o celular`
  String get hintCredentialField {
    return Intl.message(
      'Correo electrónico o celular',
      name: 'hintCredentialField',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get hintPasswordField {
    return Intl.message(
      'Contraseña',
      name: 'hintPasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error, intenta nuevamente.`
  String get notExpectedError {
    return Intl.message(
      'Ha ocurrido un error, intenta nuevamente.',
      name: 'notExpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa un correo electrónico válido`
  String get errorEmailField {
    return Intl.message(
      'Ingresa un correo electrónico válido',
      name: 'errorEmailField',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa un número válido`
  String get errorPhoneField {
    return Intl.message(
      'Ingresa un número válido',
      name: 'errorPhoneField',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa una contraseña válida`
  String get errorPasswordField {
    return Intl.message(
      'Ingresa una contraseña válida',
      name: 'errorPasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Recupera tu contraseña`
  String get titleRecoveryPassword {
    return Intl.message(
      'Recupera tu contraseña',
      name: 'titleRecoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Para recuperar tu contraseña debes ingresar tu correo o tu número celular. Haremos una verificación para saber que eres tú.`
  String get descriptionRecoveryPassword {
    return Intl.message(
      'Para recuperar tu contraseña debes ingresar tu correo o tu número celular. Haremos una verificación para saber que eres tú.',
      name: 'descriptionRecoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Escribe aquí tu correo o número de celular`
  String get inputRecoveryPassword {
    return Intl.message(
      'Escribe aquí tu correo o número de celular',
      name: 'inputRecoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Registro Exitoso`
  String get registerDialogTitle {
    return Intl.message(
      'Registro Exitoso',
      name: 'registerDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has completado exitosamente el registro. Continúa para invertir con nosotros.`
  String get registerDialogDescription {
    return Intl.message(
      'Has completado exitosamente el registro. Continúa para invertir con nosotros.',
      name: 'registerDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Efectivo`
  String get cash {
    return Intl.message(
      'Efectivo',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Información financiera`
  String get financialInformation {
    return Intl.message(
      'Información financiera',
      name: 'financialInformation',
      desc: '',
      args: [],
    );
  }

  /// `Adjuntar documentos`
  String get attachDocuments {
    return Intl.message(
      'Adjuntar documentos',
      name: 'attachDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Tu ayuda con los siguientes datos nos ayudará a mantener Ualet como un espacio seguro para tu ahorro. `
  String get finantialInformationSubTitle {
    return Intl.message(
      'Tu ayuda con los siguientes datos nos ayudará a mantener Ualet como un espacio seguro para tu ahorro. ',
      name: 'finantialInformationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Adjunta los siguientes documentos como respaldo de la información que has ingresado en el proceso.`
  String get attachDocumentsSubtitle {
    return Intl.message(
      'Adjunta los siguientes documentos como respaldo de la información que has ingresado en el proceso.',
      name: 'attachDocumentsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Dirección de residencia`
  String get residencyAddress {
    return Intl.message(
      'Dirección de residencia',
      name: 'residencyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ocupación`
  String get ocupation {
    return Intl.message(
      'Ocupación',
      name: 'ocupation',
      desc: '',
      args: [],
    );
  }

  /// `CIIU`
  String get ciiu {
    return Intl.message(
      'CIIU',
      name: 'ciiu',
      desc: '',
      args: [],
    );
  }

  /// `Origen de los fondos`
  String get fundsOrigin {
    return Intl.message(
      'Origen de los fondos',
      name: 'fundsOrigin',
      desc: '',
      args: [],
    );
  }

  /// `Ingresos mes`
  String get monthlyIncome {
    return Intl.message(
      'Ingresos mes',
      name: 'monthlyIncome',
      desc: '',
      args: [],
    );
  }

  /// `Egresos mes`
  String get monthlySpendings {
    return Intl.message(
      'Egresos mes',
      name: 'monthlySpendings',
      desc: '',
      args: [],
    );
  }

  /// `Otros ingresos`
  String get otherIncome {
    return Intl.message(
      'Otros ingresos',
      name: 'otherIncome',
      desc: '',
      args: [],
    );
  }

  /// `Activos`
  String get assets {
    return Intl.message(
      'Activos',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `Pasivos`
  String get liabilities {
    return Intl.message(
      'Pasivos',
      name: 'liabilities',
      desc: '',
      args: [],
    );
  }

  /// `¿Manejas o administras recursos públicos?`
  String get doYouAdminPublicResources {
    return Intl.message(
      '¿Manejas o administras recursos públicos?',
      name: 'doYouAdminPublicResources',
      desc: '',
      args: [],
    );
  }

  /// `¿Eres PEP?`
  String get areYouPep {
    return Intl.message(
      '¿Eres PEP?',
      name: 'areYouPep',
      desc: '',
      args: [],
    );
  }

  /// `¿Tienes familiares PEP?`
  String get yourFamilyPep {
    return Intl.message(
      '¿Tienes familiares PEP?',
      name: 'yourFamilyPep',
      desc: '',
      args: [],
    );
  }

  /// `¿Realizas operaciones en otra moneda?`
  String get doYouUseOtherCurrency {
    return Intl.message(
      '¿Realizas operaciones en otra moneda?',
      name: 'doYouUseOtherCurrency',
      desc: '',
      args: [],
    );
  }

  /// `¿Recibes pagos desde EEUU?`
  String get doYouEEUUPayments {
    return Intl.message(
      '¿Recibes pagos desde EEUU?',
      name: 'doYouEEUUPayments',
      desc: '',
      args: [],
    );
  }

  /// `¿Reciber ingresos por propiedades es EEUU?`
  String get doYouEEUUPropertyPayments {
    return Intl.message(
      '¿Reciber ingresos por propiedades es EEUU?',
      name: 'doYouEEUUPropertyPayments',
      desc: '',
      args: [],
    );
  }

  /// `¿Has permanecido más de 183 días seguidos en los últimos 3 años en los EEUU?`
  String get haveYouStayedEEUU {
    return Intl.message(
      '¿Has permanecido más de 183 días seguidos en los últimos 3 años en los EEUU?',
      name: 'haveYouStayedEEUU',
      desc: '',
      args: [],
    );
  }

  /// `¿Eres ciudadano o residente de EEUU?`
  String get areYouEEUUResident {
    return Intl.message(
      '¿Eres ciudadano o residente de EEUU?',
      name: 'areYouEEUUResident',
      desc: '',
      args: [],
    );
  }

  /// `Si`
  String get yes {
    return Intl.message(
      'Si',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Número de documento`
  String get identification {
    return Intl.message(
      'Número de documento',
      name: 'identification',
      desc: '',
      args: [],
    );
  }

  /// `Cargo`
  String get position {
    return Intl.message(
      'Cargo',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Agregar otro`
  String get addAnother {
    return Intl.message(
      'Agregar otro',
      name: 'addAnother',
      desc: '',
      args: [],
    );
  }

  /// `Cédula de ciudadania`
  String get idColombia {
    return Intl.message(
      'Cédula de ciudadania',
      name: 'idColombia',
      desc: '',
      args: [],
    );
  }

  /// `Declaración de renta`
  String get rentDeclaration {
    return Intl.message(
      'Declaración de renta',
      name: 'rentDeclaration',
      desc: '',
      args: [],
    );
  }

  /// `Certificación laboral último mes`
  String get workCertification {
    return Intl.message(
      'Certificación laboral último mes',
      name: 'workCertification',
      desc: '',
      args: [],
    );
  }

  /// `Certificación de ingresos`
  String get incomeCertification {
    return Intl.message(
      'Certificación de ingresos',
      name: 'incomeCertification',
      desc: '',
      args: [],
    );
  }

  /// `Una ves el total de tus movimientos super los 3 SMMLV debes completar información adicional. Tu seguridad es lo más importante.`
  String get sarlaftPopupSubtitle {
    return Intl.message(
      'Una ves el total de tus movimientos super los 3 SMMLV debes completar información adicional. Tu seguridad es lo más importante.',
      name: 'sarlaftPopupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tus movimientos superaron los 3 SMMLV`
  String get sarlaftPopupTitle {
    return Intl.message(
      'Tus movimientos superaron los 3 SMMLV',
      name: 'sarlaftPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Editar meta de ahorro`
  String get editGoal {
    return Intl.message(
      'Editar meta de ahorro',
      name: 'editGoal',
      desc: '',
      args: [],
    );
  }

  /// `Crea tu contraseña\npara finalizar`
  String get titleCreatePassword {
    return Intl.message(
      'Crea tu contraseña\npara finalizar',
      name: 'titleCreatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Usa mínimo 8 carácteres combinando mayúsculas, minúsculas, números y un carácter especial `
  String get descriptionCreatePassword {
    return Intl.message(
      'Usa mínimo 8 carácteres combinando mayúsculas, minúsculas, números y un carácter especial ',
      name: 'descriptionCreatePassword',
      desc: '',
      args: [],
    );
  }

  /// `(!?@#$%&).`
  String get descriptionCreatePasswordTwo {
    return Intl.message(
      '(!?@#\$%&).',
      name: 'descriptionCreatePasswordTwo',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get createPasswordButton {
    return Intl.message(
      'Continuar',
      name: 'createPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get hintCreatePasswordField {
    return Intl.message(
      'Contraseña',
      name: 'hintCreatePasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar contraseña`
  String get hintCreatePasswordConfirmField {
    return Intl.message(
      'Confirmar contraseña',
      name: 'hintCreatePasswordConfirmField',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas deben coindicir`
  String get errorValidConfirmPassword {
    return Intl.message(
      'Las contraseñas deben coindicir',
      name: 'errorValidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña actualizada correctamente`
  String get successValidConfirmPassword {
    return Intl.message(
      'Contraseña actualizada correctamente',
      name: 'successValidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error al actualizar la contraseña, intenta nuevamente.`
  String get notExpectedErrorSetPassword {
    return Intl.message(
      'Ha ocurrido un error al actualizar la contraseña, intenta nuevamente.',
      name: 'notExpectedErrorSetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error al crear la contraseña, intenta nuevamente.`
  String get notExpectedErrorCreatePassword {
    return Intl.message(
      'Ha ocurrido un error al crear la contraseña, intenta nuevamente.',
      name: 'notExpectedErrorCreatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Validar`
  String get recoveryPasswordButton {
    return Intl.message(
      'Validar',
      name: 'recoveryPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Si ya tienes una cuenta , `
  String get alreadyHaveAnAccountLabel {
    return Intl.message(
      'Si ya tienes una cuenta , ',
      name: 'alreadyHaveAnAccountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesíon`
  String get alreadyHaveAnAccountButton {
    return Intl.message(
      'Iniciar Sesíon',
      name: 'alreadyHaveAnAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `¿Aún no tienes cuenta? `
  String get notHaveAnAccountLabel {
    return Intl.message(
      '¿Aún no tienes cuenta? ',
      name: 'notHaveAnAccountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Regístrate Aquí`
  String get notHaveAnAccountButton {
    return Intl.message(
      'Regístrate Aquí',
      name: 'notHaveAnAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar contraseña`
  String get loginRecoveryPassword {
    return Intl.message(
      'Recuperar contraseña',
      name: 'loginRecoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Preséntate`
  String get titleRegister {
    return Intl.message(
      'Preséntate',
      name: 'titleRegister',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo te llamas?`
  String get hintRegisterNameField {
    return Intl.message(
      '¿Cómo te llamas?',
      name: 'hintRegisterNameField',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu correo electrónico?`
  String get hintRegisterEmailField {
    return Intl.message(
      '¿Cuál es tu correo electrónico?',
      name: 'hintRegisterEmailField',
      desc: '',
      args: [],
    );
  }

  /// `+57 - `
  String get countryCode {
    return Intl.message(
      '+57 - ',
      name: 'countryCode',
      desc: '',
      args: [],
    );
  }

  /// `+52 - `
  String get countryCodeMX {
    return Intl.message(
      '+52 - ',
      name: 'countryCodeMX',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu número celular?`
  String get hintRegisterPhonelField {
    return Intl.message(
      '¿Cuál es tu número celular?',
      name: 'hintRegisterPhonelField',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu número móvil?`
  String get hintRegisterMexico {
    return Intl.message(
      '¿Cuál es tu número móvil?',
      name: 'hintRegisterMexico',
      desc: '',
      args: [],
    );
  }

  /// `Este número ya está registrado.`
  String get phoneNumberAlreadyUsed {
    return Intl.message(
      'Este número ya está registrado.',
      name: 'phoneNumberAlreadyUsed',
      desc: '',
      args: [],
    );
  }

  /// `Le faltan unos números a tu celular, terminalos de ingresar para continuar.`
  String get phoneNumberTooShort {
    return Intl.message(
      'Le faltan unos números a tu celular, terminalos de ingresar para continuar.',
      name: 'phoneNumberTooShort',
      desc: '',
      args: [],
    );
  }

  /// `El número es más largo de lo que debería ser, por favor verifica.`
  String get phoneNumberTooLong {
    return Intl.message(
      'El número es más largo de lo que debería ser, por favor verifica.',
      name: 'phoneNumberTooLong',
      desc: '',
      args: [],
    );
  }

  /// `El número ingresado no corresponde a ningún operador activo de Colombia.`
  String get phoneNumberIncorrectOperator {
    return Intl.message(
      'El número ingresado no corresponde a ningún operador activo de Colombia.',
      name: 'phoneNumberIncorrectOperator',
      desc: '',
      args: [],
    );
  }

  /// `El número ingresado no corresponde a ningún operador activo de México.`
  String get phoneNumberIncorrectOperatorMX {
    return Intl.message(
      'El número ingresado no corresponde a ningún operador activo de México.',
      name: 'phoneNumberIncorrectOperatorMX',
      desc: '',
      args: [],
    );
  }

  /// `Acepto `
  String get notHaveAnTermsLabel {
    return Intl.message(
      'Acepto ',
      name: 'notHaveAnTermsLabel',
      desc: '',
      args: [],
    );
  }

  /// `términos y condiciones`
  String get notHaveAnTermsButton {
    return Intl.message(
      'términos y condiciones',
      name: 'notHaveAnTermsButton',
      desc: '',
      args: [],
    );
  }

  /// `Aviso de uso de privacidad y uso de datos personales.`
  String get privacyAndPersonalDataMX {
    return Intl.message(
      'Aviso de uso de privacidad y uso de datos personales.',
      name: 'privacyAndPersonalDataMX',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda aceptar términos y condiciones`
  String get errorSelectTerms {
    return Intl.message(
      'Recuerda aceptar términos y condiciones',
      name: 'errorSelectTerms',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get continueButton {
    return Intl.message(
      'Continuar',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar y continuar`
  String get acceptAndContinueButton {
    return Intl.message(
      'Aceptar y continuar',
      name: 'acceptAndContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Hola`
  String get greeting {
    return Intl.message(
      'Hola',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Esto es UALET`
  String get thisIsUalet {
    return Intl.message(
      'Esto es UALET',
      name: 'thisIsUalet',
      desc: '',
      args: [],
    );
  }

  /// `Conoce como nuestro RoboAdvisor crea el mejor portafolio de inversión para ti.`
  String get getToKnowRoboAdvisor {
    return Intl.message(
      'Conoce como nuestro RoboAdvisor crea el mejor portafolio de inversión para ti.',
      name: 'getToKnowRoboAdvisor',
      desc: '',
      args: [],
    );
  }

  /// `Tu saldo`
  String get yourBalance {
    return Intl.message(
      'Tu saldo',
      name: 'yourBalance',
      desc: '',
      args: [],
    );
  }

  /// `Saldo en proceso`
  String get yourBalanceProcess {
    return Intl.message(
      'Saldo en proceso',
      name: 'yourBalanceProcess',
      desc: '',
      args: [],
    );
  }

  /// `Rendimiento anual`
  String get performance {
    return Intl.message(
      'Rendimiento anual',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// `Tus metas`
  String get yourGoals {
    return Intl.message(
      'Tus metas',
      name: 'yourGoals',
      desc: '',
      args: [],
    );
  }

  /// `Crear una nueva meta`
  String get createNewGoal {
    return Intl.message(
      'Crear una nueva meta',
      name: 'createNewGoal',
      desc: '',
      args: [],
    );
  }

  /// `Conoce tu portafolio`
  String get knowYourPortfolio {
    return Intl.message(
      'Conoce tu portafolio',
      name: 'knowYourPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `Todo acerca de tu portafolio`
  String get knowAllYourPortfolio {
    return Intl.message(
      'Todo acerca de tu portafolio',
      name: 'knowAllYourPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `Tu dinero se invierte de la forma más eficiente de acuerdo al perfil de riesgo asignado por nuestro RoboAdvisor.`
  String get roboAdvisorDisclamer {
    return Intl.message(
      'Tu dinero se invierte de la forma más eficiente de acuerdo al perfil de riesgo asignado por nuestro RoboAdvisor.',
      name: 'roboAdvisorDisclamer',
      desc: '',
      args: [],
    );
  }

  /// `RoboAdvisor`
  String get roboAdvisor {
    return Intl.message(
      'RoboAdvisor',
      name: 'roboAdvisor',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de activo`
  String get assetClass {
    return Intl.message(
      'Tipo de activo',
      name: 'assetClass',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué invierte?`
  String get investmentTypes {
    return Intl.message(
      '¿En qué invierte?',
      name: 'investmentTypes',
      desc: '',
      args: [],
    );
  }

  /// `Eres`
  String get youAre {
    return Intl.message(
      'Eres',
      name: 'youAre',
      desc: '',
      args: [],
    );
  }

  /// `Más información`
  String get rulesTechSheetsProspects {
    return Intl.message(
      'Más información',
      name: 'rulesTechSheetsProspects',
      desc: '',
      args: [],
    );
  }

  /// `Títulos`
  String get titulosMX {
    return Intl.message(
      'Títulos',
      name: 'titulosMX',
      desc: '',
      args: [],
    );
  }

  /// `Más Información`
  String get moreInfo {
    return Intl.message(
      'Más Información',
      name: 'moreInfo',
      desc: '',
      args: [],
    );
  }

  /// `Crea tu primera meta de`
  String get createYourFirstGoal {
    return Intl.message(
      'Crea tu primera meta de',
      name: 'createYourFirstGoal',
      desc: '',
      args: [],
    );
  }

  /// `ahorro`
  String get ofSavings {
    return Intl.message(
      'ahorro',
      name: 'ofSavings',
      desc: '',
      args: [],
    );
  }

  /// `Crear meta`
  String get createGoal {
    return Intl.message(
      'Crear meta',
      name: 'createGoal',
      desc: '',
      args: [],
    );
  }

  /// `Ver`
  String get view {
    return Intl.message(
      'Ver',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Ver todos`
  String get viewAll {
    return Intl.message(
      'Ver todos',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu meta?`
  String get whatIsYourGoal {
    return Intl.message(
      '¿Cuál es tu meta?',
      name: 'whatIsYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es el valor de tu meta?`
  String get howMuchIsYourGoal {
    return Intl.message(
      '¿Cuál es el valor de tu meta?',
      name: 'howMuchIsYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `Cumple los sueños que antes habías dejado para después.`
  String get achieveYourDreams {
    return Intl.message(
      'Cumple los sueños que antes habías dejado para después.',
      name: 'achieveYourDreams',
      desc: '',
      args: [],
    );
  }

  /// `Escoge la periodicidad`
  String get choosePeriodicity {
    return Intl.message(
      'Escoge la periodicidad',
      name: 'choosePeriodicity',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál emoji se parece más a tu meta? selecciónalo`
  String get whichEmojiSuitsYourGoal {
    return Intl.message(
      '¿Cuál emoji se parece más a tu meta? selecciónalo',
      name: 'whichEmojiSuitsYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `🤔`
  String get thinkingEmoji {
    return Intl.message(
      '🤔',
      name: 'thinkingEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la periodicidad y el valor de tu ahorro para ver la proyección de tu inversión`
  String get plotPlaceholder {
    return Intl.message(
      'Selecciona la periodicidad y el valor de tu ahorro para ver la proyección de tu inversión',
      name: 'plotPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `meses`
  String get months {
    return Intl.message(
      'meses',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `mes`
  String get month {
    return Intl.message(
      'mes',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `quincenas`
  String get fortnights {
    return Intl.message(
      'quincenas',
      name: 'fortnights',
      desc: '',
      args: [],
    );
  }

  /// `trimestres`
  String get trimesters {
    return Intl.message(
      'trimestres',
      name: 'trimesters',
      desc: '',
      args: [],
    );
  }

  /// `El nombre debe tener menos de 30 caracteres`
  String get goalNameError {
    return Intl.message(
      'El nombre debe tener menos de 30 caracteres',
      name: 'goalNameError',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser mayor a  $ 100.000`
  String get goalAmountError {
    return Intl.message(
      'El monto debe ser mayor a  \$ 100.000',
      name: 'goalAmountError',
      desc: '',
      args: [],
    );
  }

  /// `La cuota debe ser de minimo $10.000`
  String get goalFeeError {
    return Intl.message(
      'La cuota debe ser de minimo \$10.000',
      name: 'goalFeeError',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser mayor a  $ 100.00`
  String get goalAmountErrorMx {
    return Intl.message(
      'El monto debe ser mayor a  \$ 100.00',
      name: 'goalAmountErrorMx',
      desc: '',
      args: [],
    );
  }

  /// `La cuota debe ser de minimo $10.00`
  String get goalFeeErrorMx {
    return Intl.message(
      'La cuota debe ser de minimo \$10.00',
      name: 'goalFeeErrorMx',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona el método que quieres usar para invertir esta vez`
  String get selectInvestingOptionMX {
    return Intl.message(
      'Selecciona el método que quieres usar para invertir esta vez',
      name: 'selectInvestingOptionMX',
      desc: '',
      args: [],
    );
  }

  /// `Domiciliación`
  String get domiciliacion {
    return Intl.message(
      'Domiciliación',
      name: 'domiciliacion',
      desc: '',
      args: [],
    );
  }

  /// `Transferencia Interbancaria`
  String get transferenciaBancaria {
    return Intl.message(
      'Transferencia Interbancaria',
      name: 'transferenciaBancaria',
      desc: '',
      args: [],
    );
  }

  /// `Débito automático`
  String get automaticDebit {
    return Intl.message(
      'Débito automático',
      name: 'automaticDebit',
      desc: '',
      args: [],
    );
  }

  /// `Débitos automáticos`
  String get automaticDebits {
    return Intl.message(
      'Débitos automáticos',
      name: 'automaticDebits',
      desc: '',
      args: [],
    );
  }

  /// `PSE`
  String get pse {
    return Intl.message(
      'PSE',
      name: 'pse',
      desc: '',
      args: [],
    );
  }

  /// `Esta meta ya tiene una domiciliación programada`
  String get domiciliacionYaProgramada {
    return Intl.message(
      'Esta meta ya tiene una domiciliación programada',
      name: 'domiciliacionYaProgramada',
      desc: '',
      args: [],
    );
  }

  /// `Esta meta ya tiene un débito automático programado`
  String get debitoYaProgramado {
    return Intl.message(
      'Esta meta ya tiene un débito automático programado',
      name: 'debitoYaProgramado',
      desc: '',
      args: [],
    );
  }

  /// `Esta meta ya tiene una domiciliación programada`
  String get debitoYaProgramadMx {
    return Intl.message(
      'Esta meta ya tiene una domiciliación programada',
      name: 'debitoYaProgramadMx',
      desc: '',
      args: [],
    );
  }

  /// `Crea otra meta de`
  String get createAnotherGoal {
    return Intl.message(
      'Crea otra meta de',
      name: 'createAnotherGoal',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará únicamente para la meta seleccionada`
  String get debitDisclamer {
    return Intl.message(
      'El débito automático se efectuará únicamente para la meta seleccionada',
      name: 'debitDisclamer',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará únicamente para la meta o metas seleccionadas.`
  String get multipleDebitDisclaimer {
    return Intl.message(
      'El débito automático se efectuará únicamente para la meta o metas seleccionadas.',
      name: 'multipleDebitDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `Cuota`
  String get cuota {
    return Intl.message(
      'Cuota',
      name: 'cuota',
      desc: '',
      args: [],
    );
  }

  /// `Meta recalculada`
  String get goalRecalculated {
    return Intl.message(
      'Meta recalculada',
      name: 'goalRecalculated',
      desc: '',
      args: [],
    );
  }

  /// `Metas recalculadas`
  String get goalRecalculatedMultiple {
    return Intl.message(
      'Metas recalculadas',
      name: 'goalRecalculatedMultiple',
      desc: '',
      args: [],
    );
  }

  /// `Has cambiado la periodicidad del débito automático.`
  String get youChangedPeriodicity {
    return Intl.message(
      'Has cambiado la periodicidad del débito automático.',
      name: 'youChangedPeriodicity',
      desc: '',
      args: [],
    );
  }

  /// `Has cambiado la periodicidad de la domiciliación.`
  String get youChangedPeriodicityMx {
    return Intl.message(
      'Has cambiado la periodicidad de la domiciliación.',
      name: 'youChangedPeriodicityMx',
      desc: '',
      args: [],
    );
  }

  /// `Has cambiado la cuota de tu meta.`
  String get youChangedFee {
    return Intl.message(
      'Has cambiado la cuota de tu meta.',
      name: 'youChangedFee',
      desc: '',
      args: [],
    );
  }

  /// `Antes`
  String get before {
    return Intl.message(
      'Antes',
      name: 'before',
      desc: '',
      args: [],
    );
  }

  /// `Ahora`
  String get now {
    return Intl.message(
      'Ahora',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `¿Deseas guardar los cambios en tu meta?`
  String get doYouWantToApplyTheChanges {
    return Intl.message(
      '¿Deseas guardar los cambios en tu meta?',
      name: 'doYouWantToApplyTheChanges',
      desc: '',
      args: [],
    );
  }

  /// `¿Deseas guardar los cambios en tus metas`
  String get doYouWantToApplyTheChangesMultiple {
    return Intl.message(
      '¿Deseas guardar los cambios en tus metas',
      name: 'doYouWantToApplyTheChangesMultiple',
      desc: '',
      args: [],
    );
  }

  /// `Si, continuar`
  String get yesContinue {
    return Intl.message(
      'Si, continuar',
      name: 'yesContinue',
      desc: '',
      args: [],
    );
  }

  /// `Sí, cerrar sesión`
  String get yesSignOut {
    return Intl.message(
      'Sí, cerrar sesión',
      name: 'yesSignOut',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de cerrar sesión?`
  String get areYouSure {
    return Intl.message(
      '¿Estás seguro de cerrar sesión?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Volver`
  String get goBack {
    return Intl.message(
      'Volver',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de inicio`
  String get initialDate {
    return Intl.message(
      'Fecha de inicio',
      name: 'initialDate',
      desc: '',
      args: [],
    );
  }

  /// `Tus domiciliaciones tendrán en cuenta esta fecha y periodicidad.`
  String get autoDebitDateDisclamer {
    return Intl.message(
      'Tus domiciliaciones tendrán en cuenta esta fecha y periodicidad.',
      name: 'autoDebitDateDisclamer',
      desc: '',
      args: [],
    );
  }

  /// `Registro de cuenta`
  String get registerBankAccount {
    return Intl.message(
      'Registro de cuenta',
      name: 'registerBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas inscribir para la domiciliación`
  String get registerBankAccountSubtitle {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas inscribir para la domiciliación',
      name: 'registerBankAccountSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas utilizar para la transferencia interbancaria.`
  String get registerBankAccountBankTransfer {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas utilizar para la transferencia interbancaria.',
      name: 'registerBankAccountBankTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas inscribir para el débito automático.`
  String get registerBankAccountSubtitleCO {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas inscribir para el débito automático.',
      name: 'registerBankAccountSubtitleCO',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas inscribir para la domiciliación.`
  String get registerBankAccountSubtitleMx {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas inscribir para la domiciliación.',
      name: 'registerBankAccountSubtitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas inscribir`
  String get registerBankAccountSubtitleGeneral {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas inscribir',
      name: 'registerBankAccountSubtitleGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de la cuenta bancaria que deseas utilizar para la transferencia por PSE`
  String get registerBankAccountBankTransferCO {
    return Intl.message(
      'Ingresa la información de la cuenta bancaria que deseas utilizar para la transferencia por PSE',
      name: 'registerBankAccountBankTransferCO',
      desc: '',
      args: [],
    );
  }

  /// `Registrar nueva cuenta`
  String get registerBankAccountInkWell {
    return Intl.message(
      'Registrar nueva cuenta',
      name: 'registerBankAccountInkWell',
      desc: '',
      args: [],
    );
  }

  /// `Entidad Bancaria`
  String get bankingEntity {
    return Intl.message(
      'Entidad Bancaria',
      name: 'bankingEntity',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de cuenta`
  String get accountType {
    return Intl.message(
      'Tipo de cuenta',
      name: 'accountType',
      desc: '',
      args: [],
    );
  }

  /// `Número de cuenta Clabe`
  String get clabeAccountNumber {
    return Intl.message(
      'Número de cuenta Clabe',
      name: 'clabeAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Número de cuenta`
  String get accountNumber {
    return Intl.message(
      'Número de cuenta',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `RFC`
  String get rfc {
    return Intl.message(
      'RFC',
      name: 'rfc',
      desc: '',
      args: [],
    );
  }

  /// `Confirmo que soy`
  String get investingConfirmation1 {
    return Intl.message(
      'Confirmo que soy',
      name: 'investingConfirmation1',
      desc: '',
      args: [],
    );
  }

  /// ` el único titular`
  String get investingConfirmation2 {
    return Intl.message(
      ' el único titular',
      name: 'investingConfirmation2',
      desc: '',
      args: [],
    );
  }

  /// ` de esta cuenta, que`
  String get investingConfirmation3 {
    return Intl.message(
      ' de esta cuenta, que',
      name: 'investingConfirmation3',
      desc: '',
      args: [],
    );
  }

  /// ` mis datos son correctos`
  String get investingConfirmation4 {
    return Intl.message(
      ' mis datos son correctos',
      name: 'investingConfirmation4',
      desc: '',
      args: [],
    );
  }

  /// ` y que`
  String get investingConfirmation5 {
    return Intl.message(
      ' y que',
      name: 'investingConfirmation5',
      desc: '',
      args: [],
    );
  }

  /// ` no voy a invertir por cuenta de terceros.`
  String get investingConfirmation6 {
    return Intl.message(
      ' no voy a invertir por cuenta de terceros.',
      name: 'investingConfirmation6',
      desc: '',
      args: [],
    );
  }

  /// `No puedes programar un débito en día festivo.`
  String get errorHolidayAvailable {
    return Intl.message(
      'No puedes programar un débito en día festivo.',
      name: 'errorHolidayAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No puedes programar una domiciliación en día festivo.`
  String get errorHolidayAvailableMx {
    return Intl.message(
      'No puedes programar una domiciliación en día festivo.',
      name: 'errorHolidayAvailableMx',
      desc: '',
      args: [],
    );
  }

  /// `La fecha de inicio del débito debe ser mayor a 4 días hábiles.`
  String get errorValidAvailableDate {
    return Intl.message(
      'La fecha de inicio del débito debe ser mayor a 4 días hábiles.',
      name: 'errorValidAvailableDate',
      desc: '',
      args: [],
    );
  }

  /// `La fecha de inicio de la domiciliación debe ser mayor a 4 días hábiles.`
  String get errorValidAvailableDateMx {
    return Intl.message(
      'La fecha de inicio de la domiciliación debe ser mayor a 4 días hábiles.',
      name: 'errorValidAvailableDateMx',
      desc: '',
      args: [],
    );
  }

  /// `Tu inversión`
  String get yourInvestment {
    return Intl.message(
      'Tu inversión',
      name: 'yourInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Costo bancario`
  String get bankFee {
    return Intl.message(
      'Costo bancario',
      name: 'bankFee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Acepto el `
  String get aceptoEl {
    return Intl.message(
      'Acepto el ',
      name: 'aceptoEl',
      desc: '',
      args: [],
    );
  }

  /// `Acepto la `
  String get aceptoLa {
    return Intl.message(
      'Acepto la ',
      name: 'aceptoLa',
      desc: '',
      args: [],
    );
  }

  /// `Acepto `
  String get acepto {
    return Intl.message(
      'Acepto ',
      name: 'acepto',
      desc: '',
      args: [],
    );
  }

  /// `marco general y la guía de servicios`
  String get marcoGeneral {
    return Intl.message(
      'marco general y la guía de servicios',
      name: 'marcoGeneral',
      desc: '',
      args: [],
    );
  }

  /// `justificación de razonabilidad`
  String get justificacionRacionalidad {
    return Intl.message(
      'justificación de razonabilidad',
      name: 'justificacionRacionalidad',
      desc: '',
      args: [],
    );
  }

  /// `Medios electrónicos`
  String get mediosElectronicos {
    return Intl.message(
      'Medios electrónicos',
      name: 'mediosElectronicos',
      desc: '',
      args: [],
    );
  }

  /// `Acepto Uso de medios electrónicos`
  String get acceptMediosElectronicos {
    return Intl.message(
      'Acepto Uso de medios electrónicos',
      name: 'acceptMediosElectronicos',
      desc: '',
      args: [],
    );
  }

  /// `Hemos terminado`
  String get weAreDone {
    return Intl.message(
      'Hemos terminado',
      name: 'weAreDone',
      desc: '',
      args: [],
    );
  }

  /// `Tu domiciliación se encuentra en proceso. Te informaremos cuando la transacción esté aprobada por tu entidad bancaria.`
  String get investingDomDoneSubtitle {
    return Intl.message(
      'Tu domiciliación se encuentra en proceso. Te informaremos cuando la transacción esté aprobada por tu entidad bancaria.',
      name: 'investingDomDoneSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Finalizar inversión`
  String get finalizeInvestment {
    return Intl.message(
      'Finalizar inversión',
      name: 'finalizeInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Resumen de la \ntransacción`
  String get transactionSummary {
    return Intl.message(
      'Resumen de la \ntransacción',
      name: 'transactionSummary',
      desc: '',
      args: [],
    );
  }

  /// `Resumen`
  String get resumeTitle {
    return Intl.message(
      'Resumen',
      name: 'resumeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has registrado tu cuenta exitósamente. La primera domiciliación se efectuará en la fecha indicada`
  String get transactionSummarySubtitle {
    return Intl.message(
      'Has registrado tu cuenta exitósamente. La primera domiciliación se efectuará en la fecha indicada',
      name: 'transactionSummarySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Has registrado tu cuenta exitósamente. El primer débito automático se efectuará en la fecha indicada.`
  String get transactionSummarySubtitleCo {
    return Intl.message(
      'Has registrado tu cuenta exitósamente. El primer débito automático se efectuará en la fecha indicada.',
      name: 'transactionSummarySubtitleCo',
      desc: '',
      args: [],
    );
  }

  /// `Movimientos en proceso`
  String get movementsInProgress {
    return Intl.message(
      'Movimientos en proceso',
      name: 'movementsInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Verificación de INE o IFE`
  String get ineOrIfeVerification {
    return Intl.message(
      'Verificación de INE o IFE',
      name: 'ineOrIfeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Verificación de identidad`
  String get identityVerificationCardTitle {
    return Intl.message(
      'Verificación de identidad',
      name: 'identityVerificationCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verificación de domicilio`
  String get domicilioVerification {
    return Intl.message(
      'Verificación de domicilio',
      name: 'domicilioVerification',
      desc: '',
      args: [],
    );
  }

  /// `Entrevista`
  String get entrevistaVerification {
    return Intl.message(
      'Entrevista',
      name: 'entrevistaVerification',
      desc: '',
      args: [],
    );
  }

  /// `Verificación`
  String get verification {
    return Intl.message(
      'Verificación',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `¡Gran inversión!`
  String get greatInvestment {
    return Intl.message(
      '¡Gran inversión!',
      name: 'greatInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Antes de continuar debes ingresar la información de tu documento de identitad. \nEn Ualet lo hacemos todo por proteger tu inversión.`
  String get verificationDescription {
    return Intl.message(
      'Antes de continuar debes ingresar la información de tu documento de identitad. \nEn Ualet lo hacemos todo por proteger tu inversión.',
      name: 'verificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Antes de continuar debes ingresar la información de tu INE o IFE y un comprobante de domicilio actual. En UALET lo hacemos todo por proteger tu inversión.`
  String get verificationSubTitle {
    return Intl.message(
      'Antes de continuar debes ingresar la información de tu INE o IFE y un comprobante de domicilio actual. En UALET lo hacemos todo por proteger tu inversión.',
      name: 'verificationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verificación de \nidentidad`
  String get identityVerificationTitle {
    return Intl.message(
      'Verificación de \nidentidad',
      name: 'identityVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verifica todos los datos asociados a tu documento de identidad`
  String get identityVerificationSubTitle {
    return Intl.message(
      'Verifica todos los datos asociados a tu documento de identidad',
      name: 'identityVerificationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verificar mi identidad`
  String get identityVerificationButton {
    return Intl.message(
      'Verificar mi identidad',
      name: 'identityVerificationButton',
      desc: '',
      args: [],
    );
  }

  /// `Verifica todos los datos asociados a tu documento de identidad. Puedes editar la información de ser necesario.`
  String get identityVerificationDescription {
    return Intl.message(
      'Verifica todos los datos asociados a tu documento de identidad. Puedes editar la información de ser necesario.',
      name: 'identityVerificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de documento`
  String get idDocumentType {
    return Intl.message(
      'Tipo de documento',
      name: 'idDocumentType',
      desc: '',
      args: [],
    );
  }

  /// `Número de documento`
  String get documentNumber {
    return Intl.message(
      'Número de documento',
      name: 'documentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Primer apellido`
  String get surname {
    return Intl.message(
      'Primer apellido',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `CURP`
  String get curp {
    return Intl.message(
      'CURP',
      name: 'curp',
      desc: '',
      args: [],
    );
  }

  /// `Nombres`
  String get names {
    return Intl.message(
      'Nombres',
      name: 'names',
      desc: '',
      args: [],
    );
  }

  /// `Primer apellido`
  String get firstLastName {
    return Intl.message(
      'Primer apellido',
      name: 'firstLastName',
      desc: '',
      args: [],
    );
  }

  /// `Segundo apellido`
  String get secondLastName {
    return Intl.message(
      'Segundo apellido',
      name: 'secondLastName',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de nacimiento`
  String get birthDateLabel {
    return Intl.message(
      'Fecha de nacimiento',
      name: 'birthDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Género`
  String get genderLabel {
    return Intl.message(
      'Género',
      name: 'genderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar`
  String get confirm {
    return Intl.message(
      'Confirmar',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Repetir verificación`
  String get repeatVerification {
    return Intl.message(
      'Repetir verificación',
      name: 'repeatVerification',
      desc: '',
      args: [],
    );
  }

  /// `Información de \nDomicilio`
  String get domicilioVerificationTitle {
    return Intl.message(
      'Información de \nDomicilio',
      name: 'domicilioVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verifica todos los datos asociados a tu domicilio`
  String get domicilioVerificationSubtitle {
    return Intl.message(
      'Verifica todos los datos asociados a tu domicilio',
      name: 'domicilioVerificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Calle`
  String get street {
    return Intl.message(
      'Calle',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Número Ext.`
  String get numExt {
    return Intl.message(
      'Número Ext.',
      name: 'numExt',
      desc: '',
      args: [],
    );
  }

  /// `Número Int.`
  String get numInt {
    return Intl.message(
      'Número Int.',
      name: 'numInt',
      desc: '',
      args: [],
    );
  }

  /// `Colonia`
  String get colony {
    return Intl.message(
      'Colonia',
      name: 'colony',
      desc: '',
      args: [],
    );
  }

  /// `Estado`
  String get state {
    return Intl.message(
      'Estado',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Código postal`
  String get postalCode {
    return Intl.message(
      'Código postal',
      name: 'postalCode',
      desc: '',
      args: [],
    );
  }

  /// `Municipio`
  String get municipio {
    return Intl.message(
      'Municipio',
      name: 'municipio',
      desc: '',
      args: [],
    );
  }

  /// `Guardar cambios`
  String get saveChanges {
    return Intl.message(
      'Guardar cambios',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `No puedes modificar la periodicidad de esta meta ya que el débito que tienes asociado está relacionado con otras de tus metas`
  String get periodicityDeactivatedSubtitle {
    return Intl.message(
      'No puedes modificar la periodicidad de esta meta ya que el débito que tienes asociado está relacionado con otras de tus metas',
      name: 'periodicityDeactivatedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No puedes modificar la periodicidad de esta meta ya que la meta fue migrada.`
  String get periodicityDeactivatedSubtitle2 {
    return Intl.message(
      'No puedes modificar la periodicidad de esta meta ya que la meta fue migrada.',
      name: 'periodicityDeactivatedSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `No puedes modificar la cuota de esta meta ya que la meta fue migrada.`
  String get cuoteDeactivatedSubtitle {
    return Intl.message(
      'No puedes modificar la cuota de esta meta ya que la meta fue migrada.',
      name: 'cuoteDeactivatedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No puedes modificar este débito ya que fue migrado.`
  String get cantEditDebit {
    return Intl.message(
      'No puedes modificar este débito ya que fue migrado.',
      name: 'cantEditDebit',
      desc: '',
      args: [],
    );
  }

  /// `Crea una meta para cada grupo de debitos automáticos.`
  String get migrationSubtitle {
    return Intl.message(
      'Crea una meta para cada grupo de debitos automáticos.',
      name: 'migrationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Crea una meta`
  String get migrationDetailTitle {
    return Intl.message(
      'Crea una meta',
      name: 'migrationDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Débitos quincenales`
  String get quincenalDebits {
    return Intl.message(
      'Débitos quincenales',
      name: 'quincenalDebits',
      desc: '',
      args: [],
    );
  }

  /// `Débitos mensuales`
  String get monthlyDebits {
    return Intl.message(
      'Débitos mensuales',
      name: 'monthlyDebits',
      desc: '',
      args: [],
    );
  }

  /// `Débitos trimestrales`
  String get trimestralDebits {
    return Intl.message(
      'Débitos trimestrales',
      name: 'trimestralDebits',
      desc: '',
      args: [],
    );
  }

  /// `Meta creada`
  String get goalCreated {
    return Intl.message(
      'Meta creada',
      name: 'goalCreated',
      desc: '',
      args: [],
    );
  }

  /// `Solo puedes programar débitos en metas con la misma periodicidad`
  String get multiGoalPeriodicityToast {
    return Intl.message(
      'Solo puedes programar débitos en metas con la misma periodicidad',
      name: 'multiGoalPeriodicityToast',
      desc: '',
      args: [],
    );
  }

  /// `Este débito `
  String get debitHasGoals {
    return Intl.message(
      'Este débito ',
      name: 'debitHasGoals',
      desc: '',
      args: [],
    );
  }

  /// `Esta domiciliación `
  String get debitHasGoalsMx {
    return Intl.message(
      'Esta domiciliación ',
      name: 'debitHasGoalsMx',
      desc: '',
      args: [],
    );
  }

  /// ` tiene las siguientes metas asociadas`
  String get debitHasGoals2 {
    return Intl.message(
      ' tiene las siguientes metas asociadas',
      name: 'debitHasGoals2',
      desc: '',
      args: [],
    );
  }

  /// `Monto`
  String get amount {
    return Intl.message(
      'Monto',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Saldo`
  String get balance {
    return Intl.message(
      'Saldo',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Debes editar el débito en cada meta por separado entrando al detalle de la meta.`
  String get debitHasGoalsInstructions {
    return Intl.message(
      'Debes editar el débito en cada meta por separado entrando al detalle de la meta.',
      name: 'debitHasGoalsInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Esta meta`
  String get thisGoal {
    return Intl.message(
      'Esta meta',
      name: 'thisGoal',
      desc: '',
      args: [],
    );
  }

  /// `Formatos aceptados: JPG, JPEG, PNG, PDF`
  String get attatchDocsFormats {
    return Intl.message(
      'Formatos aceptados: JPG, JPEG, PNG, PDF',
      name: 'attatchDocsFormats',
      desc: '',
      args: [],
    );
  }

  /// `Tamaño máximo: `
  String get attatchDocsSize {
    return Intl.message(
      'Tamaño máximo: ',
      name: 'attatchDocsSize',
      desc: '',
      args: [],
    );
  }

  /// `El archivo es muy pesado!`
  String get fileTooBig {
    return Intl.message(
      'El archivo es muy pesado!',
      name: 'fileTooBig',
      desc: '',
      args: [],
    );
  }

  /// `Ya tengo una cuenta `
  String get notHaveAnRegisterLabel {
    return Intl.message(
      'Ya tengo una cuenta ',
      name: 'notHaveAnRegisterLabel',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get alreadyHaveAnRegisterButton {
    return Intl.message(
      'Iniciar Sesión',
      name: 'alreadyHaveAnRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar sesión`
  String get alreadyHaveAnLoginButton {
    return Intl.message(
      'Iniciar sesión',
      name: 'alreadyHaveAnLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Extractos`
  String get extract {
    return Intl.message(
      'Extractos',
      name: 'extract',
      desc: '',
      args: [],
    );
  }

  /// `Se ha enviado correctamente el extracto al correo electronico.`
  String get successExtract {
    return Intl.message(
      'Se ha enviado correctamente el extracto al correo electronico.',
      name: 'successExtract',
      desc: '',
      args: [],
    );
  }

  /// `Se ha enviado correctamente la certificación tributaria.`
  String get successCertification {
    return Intl.message(
      'Se ha enviado correctamente la certificación tributaria.',
      name: 'successCertification',
      desc: '',
      args: [],
    );
  }

  /// `En UALET siempre tienes a la mano toda la información de tu inversión. Aquí puedes solicitar y recibir en tu correo tus extractos, extractos omnibus y certificaciones, cuando lo necesites.`
  String get extractDescription {
    return Intl.message(
      'En UALET siempre tienes a la mano toda la información de tu inversión. Aquí puedes solicitar y recibir en tu correo tus extractos, extractos omnibus y certificaciones, cuando lo necesites.',
      name: 'extractDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mi Extracto`
  String get myExtract {
    return Intl.message(
      'Mi Extracto',
      name: 'myExtract',
      desc: '',
      args: [],
    );
  }

  /// `Certificaciones`
  String get certificate {
    return Intl.message(
      'Certificaciones',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `Cuotas`
  String get monthyCuote {
    return Intl.message(
      'Cuotas',
      name: 'monthyCuote',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo`
  String get monthUalet {
    return Intl.message(
      'Tiempo',
      name: 'monthUalet',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo en otros`
  String get monthOther {
    return Intl.message(
      'Tiempo en otros',
      name: 'monthOther',
      desc: '',
      args: [],
    );
  }

  /// `Tu cuota`
  String get youCuote {
    return Intl.message(
      'Tu cuota',
      name: 'youCuote',
      desc: '',
      args: [],
    );
  }

  /// `Invertir ahora`
  String get investmentNow {
    return Intl.message(
      'Invertir ahora',
      name: 'investmentNow',
      desc: '',
      args: [],
    );
  }

  /// `Continuar sin invertir`
  String get continueWithoutInvestment {
    return Intl.message(
      'Continuar sin invertir',
      name: 'continueWithoutInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get closeSession {
    return Intl.message(
      'Cerrar sesión',
      name: 'closeSession',
      desc: '',
      args: [],
    );
  }

  /// `Mi perfil`
  String get myProfile {
    return Intl.message(
      'Mi perfil',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get navHomeHomeText {
    return Intl.message(
      'Inicio',
      name: 'navHomeHomeText',
      desc: '',
      args: [],
    );
  }

  /// `Historial`
  String get navHomeHistoryText {
    return Intl.message(
      'Historial',
      name: 'navHomeHistoryText',
      desc: '',
      args: [],
    );
  }

  /// `Ahorrar`
  String get navHomeSaveMoneyText {
    return Intl.message(
      'Ahorrar',
      name: 'navHomeSaveMoneyText',
      desc: '',
      args: [],
    );
  }

  /// `Mi perfil`
  String get navHomeProfileText {
    return Intl.message(
      'Mi perfil',
      name: 'navHomeProfileText',
      desc: '',
      args: [],
    );
  }

  /// `Más`
  String get navHomeMoreText {
    return Intl.message(
      'Más',
      name: 'navHomeMoreText',
      desc: '',
      args: [],
    );
  }

  /// `Todo acerca de tu perfil y metas`
  String get faqProfile {
    return Intl.message(
      'Todo acerca de tu perfil y metas',
      name: 'faqProfile',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get welcomeProfilingPageButton {
    return Intl.message(
      'Continuar',
      name: 'welcomeProfilingPageButton',
      desc: '',
      args: [],
    );
  }

  /// `¡Descubramos juntos tu perfil!`
  String get welcomeProfilingPageTitle {
    return Intl.message(
      '¡Descubramos juntos tu perfil!',
      name: 'welcomeProfilingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ualet te ayuda a descubrir tu perfil de inversionista para construir un portafolio de inversión personalizado. Recuerda que una vez aceptes tu perfil, no podrás cambiarlo. \n\n ¿Listo? ¡Empecemos!`
  String get welcomeProfilingPageDescription {
    return Intl.message(
      'Ualet te ayuda a descubrir tu perfil de inversionista para construir un portafolio de inversión personalizado. Recuerda que una vez aceptes tu perfil, no podrás cambiarlo. \n\n ¿Listo? ¡Empecemos!',
      name: 'welcomeProfilingPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get termsTitle {
    return Intl.message(
      'Términos y condiciones',
      name: 'termsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis libero non lacus imperdiet elementum a a augue. Nulla tempus arcu a ante commodo ultricies. In at finibus sem. Aliquam purus velit, maximus aliquet semper in, venenatis non urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam ac mauris finibus est eleifend laoreet. Maecenas laoreet lacus eros, auctor molestie purus finibus a. Maecenas varius turpis vel lorem pulvinar, ac elementum eros ultrices. Curabitur eu tincidunt sapien. Donec ac porttitor felis. Aliquam fringilla sit amet sem ac scelerisque. Proin scelerisque vitae nisl sit amet sagittis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ante nunc, commodo a fringilla at, maximus a sapien. Maecenas sed venenatis purus, vel pretium mi.Nullam suscipit elit sed nisi efficitur accumsan. Proin a bibendum sem, molestie porttitor nibh. Nulla facilisi. Cras eu tellus odio. Nulla euismod vel velit ornare varius. Donec eu urna vulputate, vulputate eros quis, interdum nisi. Curabitur et felis ut est efficitur ultricies. Vivamus aliquet nisl ullamcorper arcu feugiat, id feugiat quam placerat.Vivamus non purus non purus lacinia pharetra. Phasellus sed consequat risus. Phasellus sapien lacus, rhoncus id erat in, dictum accumsan nulla. Donec rhoncus nisl eget quam ornare vulputate. Sed sit amet vulputate lorem. Vestibulum pellentesque, lacus vitae scelerisque molestie, quam nisi varius dolor, non ultrices leo lectus ac velit. Nam risus ex, suscipit non dui maximus, ultrices bibendum velit. Cras congue nisl et magna dignissim, vel feugiat velit mollis. Cras mi dui, pharetra sed neque et, viverra consectetur risus. Duis pellentesque pharetra nisi, non laoreet ipsum porttitor sit amet.Pellentesque efficitur orci in magna rhoncus, sit amet suscipit risus efficitur. Fusce molestie euismod purus ac pretium. Nam velit est, pellentesque vitae pretium vel, iaculis ac neque. Praesent nec pharetra felis. Cras interdum dui in vehicula sollicitudin. Quisque in odio venenatis, feugiat ligula in, volutpat massa. Etiam egestas consectetur fringilla. Donec gravida blandit leo imperdiet viverra. Pellentesque mattis dignissim nisi, eu imperdiet augue faucibus pharetra.Vivamus elementum convallis ligula, at tincidunt massa mattis a. Fusce at porta turpis. Morbi porta ut arcu in dictum. Nulla consequat, elit ac feugiat elementum, velit mi tincidunt libero, vel scelerisque eros felis non eros. Sed ac est vel risus varius efficitur a in tellus. Donec sodales urna dui, nec mollis nunc tristique vitae. Nulla vulputate elit a quam mattis, nec suscipit elit vestibulum.`
  String get termsandconditions {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis libero non lacus imperdiet elementum a a augue. Nulla tempus arcu a ante commodo ultricies. In at finibus sem. Aliquam purus velit, maximus aliquet semper in, venenatis non urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam ac mauris finibus est eleifend laoreet. Maecenas laoreet lacus eros, auctor molestie purus finibus a. Maecenas varius turpis vel lorem pulvinar, ac elementum eros ultrices. Curabitur eu tincidunt sapien. Donec ac porttitor felis. Aliquam fringilla sit amet sem ac scelerisque. Proin scelerisque vitae nisl sit amet sagittis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ante nunc, commodo a fringilla at, maximus a sapien. Maecenas sed venenatis purus, vel pretium mi.Nullam suscipit elit sed nisi efficitur accumsan. Proin a bibendum sem, molestie porttitor nibh. Nulla facilisi. Cras eu tellus odio. Nulla euismod vel velit ornare varius. Donec eu urna vulputate, vulputate eros quis, interdum nisi. Curabitur et felis ut est efficitur ultricies. Vivamus aliquet nisl ullamcorper arcu feugiat, id feugiat quam placerat.Vivamus non purus non purus lacinia pharetra. Phasellus sed consequat risus. Phasellus sapien lacus, rhoncus id erat in, dictum accumsan nulla. Donec rhoncus nisl eget quam ornare vulputate. Sed sit amet vulputate lorem. Vestibulum pellentesque, lacus vitae scelerisque molestie, quam nisi varius dolor, non ultrices leo lectus ac velit. Nam risus ex, suscipit non dui maximus, ultrices bibendum velit. Cras congue nisl et magna dignissim, vel feugiat velit mollis. Cras mi dui, pharetra sed neque et, viverra consectetur risus. Duis pellentesque pharetra nisi, non laoreet ipsum porttitor sit amet.Pellentesque efficitur orci in magna rhoncus, sit amet suscipit risus efficitur. Fusce molestie euismod purus ac pretium. Nam velit est, pellentesque vitae pretium vel, iaculis ac neque. Praesent nec pharetra felis. Cras interdum dui in vehicula sollicitudin. Quisque in odio venenatis, feugiat ligula in, volutpat massa. Etiam egestas consectetur fringilla. Donec gravida blandit leo imperdiet viverra. Pellentesque mattis dignissim nisi, eu imperdiet augue faucibus pharetra.Vivamus elementum convallis ligula, at tincidunt massa mattis a. Fusce at porta turpis. Morbi porta ut arcu in dictum. Nulla consequat, elit ac feugiat elementum, velit mi tincidunt libero, vel scelerisque eros felis non eros. Sed ac est vel risus varius efficitur a in tellus. Donec sodales urna dui, nec mollis nunc tristique vitae. Nulla vulputate elit a quam mattis, nec suscipit elit vestibulum.',
      name: 'termsandconditions',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona el método que quieres usar para invertir esta vez`
  String get invest {
    return Intl.message(
      'Selecciona el método que quieres usar para invertir esta vez',
      name: 'invest',
      desc: '',
      args: [],
    );
  }

  /// `Invertir`
  String get investReturn {
    return Intl.message(
      'Invertir',
      name: 'investReturn',
      desc: '',
      args: [],
    );
  }

  /// `Inversión`
  String get investTextField {
    return Intl.message(
      'Inversión',
      name: 'investTextField',
      desc: '',
      args: [],
    );
  }

  /// `Periodicidad`
  String get investTextFieldPeriodicidad {
    return Intl.message(
      'Periodicidad',
      name: 'investTextFieldPeriodicidad',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de inicio`
  String get investTextFieldDate {
    return Intl.message(
      'Fecha de inicio',
      name: 'investTextFieldDate',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efecturá en esta misma fecha todos los meses.`
  String get selectDebit {
    return Intl.message(
      'El débito automático se efecturá en esta misma fecha todos los meses.',
      name: 'selectDebit',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación se efecturá en esta misma fecha todos los meses.`
  String get selectDebitMx {
    return Intl.message(
      'La domiciliación se efecturá en esta misma fecha todos los meses.',
      name: 'selectDebitMx',
      desc: '',
      args: [],
    );
  }

  /// `Estás listo para ahorrar como los grandes. Recuerda que la transacción puede tomar hasta 3 días hábiles en ser procesada.  `
  String get bankTransferAlmostDescriptionSuccess {
    return Intl.message(
      'Estás listo para ahorrar como los grandes. Recuerda que la transacción puede tomar hasta 3 días hábiles en ser procesada.  ',
      name: 'bankTransferAlmostDescriptionSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Estás listo para ahorrar como los grandes. Recuerda que la transacción puede tomar hasta 5 días hábiles en ser procesada.  `
  String get bankTransferAlmostDescriptionSuccessDebit {
    return Intl.message(
      'Estás listo para ahorrar como los grandes. Recuerda que la transacción puede tomar hasta 5 días hábiles en ser procesada.  ',
      name: 'bankTransferAlmostDescriptionSuccessDebit',
      desc: '',
      args: [],
    );
  }

  /// `Omitir`
  String get omit {
    return Intl.message(
      'Omitir',
      name: 'omit',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero Débito`
  String get addDebitMoney {
    return Intl.message(
      'Agregar dinero Débito',
      name: 'addDebitMoney',
      desc: '',
      args: [],
    );
  }

  /// `Conoce por qué realizamos preguntas de perfilamiento`
  String get titleIntroductoryPage {
    return Intl.message(
      'Conoce por qué realizamos preguntas de perfilamiento',
      name: 'titleIntroductoryPage',
      desc: '',
      args: [],
    );
  }

  /// `Hola 👋👋`
  String get introductoryPageMessage1 {
    return Intl.message(
      'Hola 👋👋',
      name: 'introductoryPageMessage1',
      desc: '',
      args: [],
    );
  }

  /// `Holaaaa 😊`
  String get introductoryPageMessage2 {
    return Intl.message(
      'Holaaaa 😊',
      name: 'introductoryPageMessage2',
      desc: '',
      args: [],
    );
  }

  /// `Me ayudas a aclarar una duda ¿Para qué sirven las preguntas que me vas a hacer?`
  String get introductoryPageMessage3 {
    return Intl.message(
      'Me ayudas a aclarar una duda ¿Para qué sirven las preguntas que me vas a hacer?',
      name: 'introductoryPageMessage3',
      desc: '',
      args: [],
    );
  }

  /// `Es muy sencillo, con las repuestas que me brindes te puedo conocer más, y así sabré cómo prefieres que invierta tu dinero.`
  String get introductoryPageMessage4 {
    return Intl.message(
      'Es muy sencillo, con las repuestas que me brindes te puedo conocer más, y así sabré cómo prefieres que invierta tu dinero.',
      name: 'introductoryPageMessage4',
      desc: '',
      args: [],
    );
  }

  /// `O sea ¿son preguntas para perfilarme?`
  String get introductoryPageMessage5 {
    return Intl.message(
      'O sea ¿son preguntas para perfilarme?',
      name: 'introductoryPageMessage5',
      desc: '',
      args: [],
    );
  }

  /// `Yo te ubico en uno de los 5 perfiles existentes y mido qué tan arriesgado eres, según la regulación de la SFC `
  String get introductoryPageMessage6 {
    return Intl.message(
      'Yo te ubico en uno de los 5 perfiles existentes y mido qué tan arriesgado eres, según la regulación de la SFC ',
      name: 'introductoryPageMessage6',
      desc: '',
      args: [],
    );
  }

  /// `(Superintendencia Financiera de Colombia)`
  String get introductoryPageDisclaimer {
    return Intl.message(
      '(Superintendencia Financiera de Colombia)',
      name: 'introductoryPageDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `¡Gracias! Ahora sí, a ahorrar.`
  String get introductoryPageMessage7 {
    return Intl.message(
      '¡Gracias! Ahora sí, a ahorrar.',
      name: 'introductoryPageMessage7',
      desc: '',
      args: [],
    );
  }

  /// `💪🏻💪🏻💪🏻`
  String get introductoryPageMessage8 {
    return Intl.message(
      '💪🏻💪🏻💪🏻',
      name: 'introductoryPageMessage8',
      desc: '',
      args: [],
    );
  }

  /// `Entiendo, quiero continuar`
  String get introductoryButtonText {
    return Intl.message(
      'Entiendo, quiero continuar',
      name: 'introductoryButtonText',
      desc: '',
      args: [],
    );
  }

  /// `oops... porfa comunicate con nosotros por un problema en tu cuenta`
  String get accountBlocked {
    return Intl.message(
      'oops... porfa comunicate con nosotros por un problema en tu cuenta',
      name: 'accountBlocked',
      desc: '',
      args: [],
    );
  }

  /// `Por favor seleccione una opción de la lista`
  String get selectValidOption {
    return Intl.message(
      'Por favor seleccione una opción de la lista',
      name: 'selectValidOption',
      desc: '',
      args: [],
    );
  }

  /// `Ahora, ¡Olvídalo!`
  String get indexTitleSlide1 {
    return Intl.message(
      'Ahora, ¡Olvídalo!',
      name: 'indexTitleSlide1',
      desc: '',
      args: [],
    );
  }

  /// `Piensa en todo lo que sabes sobre tu ahorro tradicional.`
  String get indexText1Slide1 {
    return Intl.message(
      'Piensa en todo lo que sabes sobre tu ahorro tradicional.',
      name: 'indexText1Slide1',
      desc: '',
      args: [],
    );
  }

  /// `A partir de hoy, tus ahorros podrán darte verdaderos rendimientos.`
  String get indexText2Slied1 {
    return Intl.message(
      'A partir de hoy, tus ahorros podrán darte verdaderos rendimientos.',
      name: 'indexText2Slied1',
      desc: '',
      args: [],
    );
  }

  /// `Una aplicación que te permitirá sentarte a no hacer nada mientras nuestros expertos, con la supervisión de la Superintendencia Financiera de Colombia, trabajan para ti.`
  String get indexTextSlide2 {
    return Intl.message(
      'Una aplicación que te permitirá sentarte a no hacer nada mientras nuestros expertos, con la supervisión de la Superintendencia Financiera de Colombia, trabajan para ti.',
      name: 'indexTextSlide2',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo?`
  String get indexTitleSlide3 {
    return Intl.message(
      '¿Cómo?',
      name: 'indexTitleSlide3',
      desc: '',
      args: [],
    );
  }

  /// `Con un robot que mueve tu dinero en los fondos de inversión más top del país, para que la rentabilidad sea una realidad.`
  String get indexTextSlide3 {
    return Intl.message(
      'Con un robot que mueve tu dinero en los fondos de inversión más top del país, para que la rentabilidad sea una realidad.',
      name: 'indexTextSlide3',
      desc: '',
      args: [],
    );
  }

  /// `Perfil de riesgo`
  String get indexTitleSlide4 {
    return Intl.message(
      'Perfil de riesgo',
      name: 'indexTitleSlide4',
      desc: '',
      args: [],
    );
  }

  /// `Lo que es adecuado para otros, puede no serlo para ti. Averigüemos qué nivel de riesgo estás dispuesto a asumir para elegir los mejores fondos de inversión que moverán tus ahorros.`
  String get indexTextSlide4 {
    return Intl.message(
      'Lo que es adecuado para otros, puede no serlo para ti. Averigüemos qué nivel de riesgo estás dispuesto a asumir para elegir los mejores fondos de inversión que moverán tus ahorros.',
      name: 'indexTextSlide4',
      desc: '',
      args: [],
    );
  }

  /// `¡Empieza ahora!`
  String get indexTitleSlide5 {
    return Intl.message(
      '¡Empieza ahora!',
      name: 'indexTitleSlide5',
      desc: '',
      args: [],
    );
  }

  /// `Activa la opción de ahorro automático y nos vemos en unos días para decirte que tú también haces parte de la comunidad de ahorradores más grande de Colombia.`
  String get indexText1Slide5 {
    return Intl.message(
      'Activa la opción de ahorro automático y nos vemos en unos días para decirte que tú también haces parte de la comunidad de ahorradores más grande de Colombia.',
      name: 'indexText1Slide5',
      desc: '',
      args: [],
    );
  }

  /// `¡Tú decides el monto que quieres ahorrar!`
  String get indexText2Slide5 {
    return Intl.message(
      '¡Tú decides el monto que quieres ahorrar!',
      name: 'indexText2Slide5',
      desc: '',
      args: [],
    );
  }

  /// `Valor mínimo: `
  String get errorValidFieldProfile {
    return Intl.message(
      'Valor mínimo: ',
      name: 'errorValidFieldProfile',
      desc: '',
      args: [],
    );
  }

  /// `Formato inválido.`
  String get errorValidFieldFormatProfile {
    return Intl.message(
      'Formato inválido.',
      name: 'errorValidFieldFormatProfile',
      desc: '',
      args: [],
    );
  }

  /// `Máximo: `
  String get errorValidFieldMaxProfile {
    return Intl.message(
      'Máximo: ',
      name: 'errorValidFieldMaxProfile',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get helpTitle {
    return Intl.message(
      'Ayuda',
      name: 'helpTitle',
      desc: '',
      args: [],
    );
  }

  /// `En UALET siempre tienes a la mano toda la información de tu inversión. Consulta nuestra sección de preguntas frecuentes o escríbenos a través de soporte.`
  String get helpDescription {
    return Intl.message(
      'En UALET siempre tienes a la mano toda la información de tu inversión. Consulta nuestra sección de preguntas frecuentes o escríbenos a través de soporte.',
      name: 'helpDescription',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get helpFAQ {
    return Intl.message(
      'FAQs',
      name: 'helpFAQ',
      desc: '',
      args: [],
    );
  }

  /// `Contáctanos`
  String get helpSupport {
    return Intl.message(
      'Contáctanos',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `Contáctanos ⚠⚠☝🏼👀`
  String get otherSupport {
    return Intl.message(
      'Contáctanos ⚠⚠☝🏼👀',
      name: 'otherSupport',
      desc: '',
      args: [],
    );
  }

  /// `Escribe con el mayor detalle posible tu duda o problema. Puedes adjuntar imágenes para completar la solicitud si lo deseas.`
  String get supportDescription {
    return Intl.message(
      'Escribe con el mayor detalle posible tu duda o problema. Puedes adjuntar imágenes para completar la solicitud si lo deseas.',
      name: 'supportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cuenta con nosotros:`
  String get supportFormLabel {
    return Intl.message(
      'Cuenta con nosotros:',
      name: 'supportFormLabel',
      desc: '',
      args: [],
    );
  }

  /// `Escribe aquí...`
  String get supportFormPlaceHolder {
    return Intl.message(
      'Escribe aquí...',
      name: 'supportFormPlaceHolder',
      desc: '',
      args: [],
    );
  }

  /// `Gracias por escribirnos`
  String get supportPageSuccessTitle {
    return Intl.message(
      'Gracias por escribirnos',
      name: 'supportPageSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Uno de nuestros asesores especializados se pondrá en contacto contigo vía correo electrónico en un periodo no mayor a 24 horas.`
  String get supportPageSuccessSubtitle {
    return Intl.message(
      'Uno de nuestros asesores especializados se pondrá en contacto contigo vía correo electrónico en un periodo no mayor a 24 horas.',
      name: 'supportPageSuccessSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `En UALET estamos para ayudarte siempre.`
  String get supportPageSuccessSubtitle2 {
    return Intl.message(
      'En UALET estamos para ayudarte siempre.',
      name: 'supportPageSuccessSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Finalizar`
  String get supportPageSuccessButton {
    return Intl.message(
      'Finalizar',
      name: 'supportPageSuccessButton',
      desc: '',
      args: [],
    );
  }

  /// `Escribe aquí...`
  String get supportTextFieldHint {
    return Intl.message(
      'Escribe aquí...',
      name: 'supportTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Mi cuenta`
  String get bottomSheetMyAccount {
    return Intl.message(
      'Mi cuenta',
      name: 'bottomSheetMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Mis cuentas inscritas`
  String get bottomSheetMyWallet {
    return Intl.message(
      'Mis cuentas inscritas',
      name: 'bottomSheetMyWallet',
      desc: '',
      args: [],
    );
  }

  /// `Extractos y documentos`
  String get bottomSheetExtracts {
    return Intl.message(
      'Extractos y documentos',
      name: 'bottomSheetExtracts',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get bottomSheetTerms {
    return Intl.message(
      'Términos y condiciones',
      name: 'bottomSheetTerms',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get bottomSheetHelp {
    return Intl.message(
      'Ayuda',
      name: 'bottomSheetHelp',
      desc: '',
      args: [],
    );
  }

  /// `Acerca de UALET`
  String get bottomSheetAbout {
    return Intl.message(
      'Acerca de UALET',
      name: 'bottomSheetAbout',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get bottomSheetLogout {
    return Intl.message(
      'Cerrar sesión',
      name: 'bottomSheetLogout',
      desc: '',
      args: [],
    );
  }

  /// `Ver más`
  String get seeMore {
    return Intl.message(
      'Ver más',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Ver menos`
  String get seeLess {
    return Intl.message(
      'Ver menos',
      name: 'seeLess',
      desc: '',
      args: [],
    );
  }

  /// `Más información`
  String get moreInformation {
    return Intl.message(
      'Más información',
      name: 'moreInformation',
      desc: '',
      args: [],
    );
  }

  /// `Certificados y documentos`
  String get titleModalExtract {
    return Intl.message(
      'Certificados y documentos',
      name: 'titleModalExtract',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo consultar mi certificado para presentar en la declaración de renta?`
  String get textSecundaryModalExtract {
    return Intl.message(
      '¿Cómo consultar mi certificado para presentar en la declaración de renta?',
      name: 'textSecundaryModalExtract',
      desc: '',
      args: [],
    );
  }

  /// `Si haces parte del grupo de personas que deben declarar ante la DIAN, puedes descargar el certificado desde la app. Si no lo puedes hacer, escríbenos a hola@ualet.com.`
  String get descriptionModalExtract {
    return Intl.message(
      'Si haces parte del grupo de personas que deben declarar ante la DIAN, puedes descargar el certificado desde la app. Si no lo puedes hacer, escríbenos a hola@ualet.com.',
      name: 'descriptionModalExtract',
      desc: '',
      args: [],
    );
  }

  /// `Certificaciones`
  String get controlCertifications {
    return Intl.message(
      'Certificaciones',
      name: 'controlCertifications',
      desc: '',
      args: [],
    );
  }

  /// `Acerca de UALET`
  String get aboutTitle {
    return Intl.message(
      'Acerca de UALET',
      name: 'aboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Queremos que lo sepas todo sobre UALET. Aquí encontrarás las respuesta que buscas sobre nosotros y convertirte en un experto del ahorro.`
  String get aboutDescription {
    return Intl.message(
      'Queremos que lo sepas todo sobre UALET. Aquí encontrarás las respuesta que buscas sobre nosotros y convertirte en un experto del ahorro.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Invertir`
  String get investTitle {
    return Intl.message(
      'Invertir',
      name: 'investTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la meta en la que vas a invertir:`
  String get investSelectGoal {
    return Intl.message(
      'Selecciona la meta en la que vas a invertir:',
      name: 'investSelectGoal',
      desc: '',
      args: [],
    );
  }

  /// `Estamos para apoyarte. Cuéntanos que podemos hacer por ti hoy y uno de nuestros agentes se comunicará contigo.`
  String get supportAccountDescription {
    return Intl.message(
      'Estamos para apoyarte. Cuéntanos que podemos hacer por ti hoy y uno de nuestros agentes se comunicará contigo.',
      name: 'supportAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mi Cuenta`
  String get myAccount {
    return Intl.message(
      'Mi Cuenta',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Toda tu información personal en un sólo lugar.`
  String get myAccountDescription {
    return Intl.message(
      'Toda tu información personal en un sólo lugar.',
      name: 'myAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Solicitar Ayuda`
  String get myAccountButton {
    return Intl.message(
      'Solicitar Ayuda',
      name: 'myAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `Completar información financiera`
  String get myAccountFinancialInfo {
    return Intl.message(
      'Completar información financiera',
      name: 'myAccountFinancialInfo',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get myAccountName {
    return Intl.message(
      'Nombre',
      name: 'myAccountName',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get myAccountEmail {
    return Intl.message(
      'Correo',
      name: 'myAccountEmail',
      desc: '',
      args: [],
    );
  }

  /// `Número de celular`
  String get myAccountPhoneNumber {
    return Intl.message(
      'Número de celular',
      name: 'myAccountPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get myAccountPassword {
    return Intl.message(
      'Contraseña',
      name: 'myAccountPassword',
      desc: '',
      args: [],
    );
  }

  /// `•••••••••••••`
  String get myAccountPasswordObfuscated {
    return Intl.message(
      '•••••••••••••',
      name: 'myAccountPasswordObfuscated',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar correo`
  String get changeEmail {
    return Intl.message(
      'Cambiar correo',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar número de celular`
  String get changePhoneNumber {
    return Intl.message(
      'Cambiar número de celular',
      name: 'changePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar contraseña`
  String get changePassword {
    return Intl.message(
      'Cambiar contraseña',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Mis cuentas inscritas`
  String get myWalletHeader {
    return Intl.message(
      'Mis cuentas inscritas',
      name: 'myWalletHeader',
      desc: '',
      args: [],
    );
  }

  /// `Cambio de correo electrónico`
  String get changeEmailTitle {
    return Intl.message(
      'Cambio de correo electrónico',
      name: 'changeEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Para cambiar tu correo electrónico debes tener acceso al correo registrado. Validaremos el cambio a través de tu correo para iniciar.`
  String get changeEmailDescription {
    return Intl.message(
      'Para cambiar tu correo electrónico debes tener acceso al correo registrado. Validaremos el cambio a través de tu correo para iniciar.',
      name: 'changeEmailDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa tu nuevo correo:`
  String get changeEmailInputLabel {
    return Intl.message(
      'Ingresa tu nuevo correo:',
      name: 'changeEmailInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Correo inválido`
  String get changeEmailErrorLabel {
    return Intl.message(
      'Correo inválido',
      name: 'changeEmailErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `El email ya está en uso`
  String get emailAlreadyInUse {
    return Intl.message(
      'El email ya está en uso',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Ya confirmé mi correo`
  String get emailConfirmButton {
    return Intl.message(
      'Ya confirmé mi correo',
      name: 'emailConfirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Cambio de contraseña`
  String get changePasswordTitle {
    return Intl.message(
      'Cambio de contraseña',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Usa mínimo 8 carácteres combinando mayúsculas, minúsculas, números y un carácter especial`
  String get changePasswordDescription {
    return Intl.message(
      'Usa mínimo 8 carácteres combinando mayúsculas, minúsculas, números y un carácter especial',
      name: 'changePasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// ` (!?@#$%&).`
  String get changePasswordDescriptionTrailing {
    return Intl.message(
      ' (!?@#\$%&).',
      name: 'changePasswordDescriptionTrailing',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar contraseña actual`
  String get changePasswordLabelOld {
    return Intl.message(
      'Ingresar contraseña actual',
      name: 'changePasswordLabelOld',
      desc: '',
      args: [],
    );
  }

  /// `Nueva Contraseña`
  String get changePasswordLabelNew {
    return Intl.message(
      'Nueva Contraseña',
      name: 'changePasswordLabelNew',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar nueva contraseña`
  String get changePasswordLabelConfirm {
    return Intl.message(
      'Confirmar nueva contraseña',
      name: 'changePasswordLabelConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña inválida`
  String get changePasswordErrorLabel {
    return Intl.message(
      'Contraseña inválida',
      name: 'changePasswordErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no son iguales`
  String get changePasswordErrorSame {
    return Intl.message(
      'Las contraseñas no son iguales',
      name: 'changePasswordErrorSame',
      desc: '',
      args: [],
    );
  }

  /// `Cambio de número de celular`
  String get changePhoneNumberTitle {
    return Intl.message(
      'Cambio de número de celular',
      name: 'changePhoneNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Para cambiar tu número de celular debes tener acceso al correo registrado. Validaremos el cambio a través de tu correo para iniciar.`
  String get changePhoneNumberDescription {
    return Intl.message(
      'Para cambiar tu número de celular debes tener acceso al correo registrado. Validaremos el cambio a través de tu correo para iniciar.',
      name: 'changePhoneNumberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa el nuevo número de celular`
  String get changePhoneNumberLabel {
    return Intl.message(
      'Ingresa el nuevo número de celular',
      name: 'changePhoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Número invalido`
  String get changePhoneNumberError {
    return Intl.message(
      'Número invalido',
      name: 'changePhoneNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Correo sin confirmar`
  String get modalEmailNotConfirmedTitle {
    return Intl.message(
      'Correo sin confirmar',
      name: 'modalEmailNotConfirmedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa a tu correo para validar tu identidad y continuar con el proceso.`
  String get modalEmailNotConfirmedDescription {
    return Intl.message(
      'Ingresa a tu correo para validar tu identidad y continuar con el proceso.',
      name: 'modalEmailNotConfirmedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Número actualizado`
  String get changePhoneNumberModalTitle {
    return Intl.message(
      'Número actualizado',
      name: 'changePhoneNumberModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has completado el proceso con éxito. Ya puedes seguir ahorrando.`
  String get changePhoneNumberModalDescription {
    return Intl.message(
      'Has completado el proceso con éxito. Ya puedes seguir ahorrando.',
      name: 'changePhoneNumberModalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña actualizada`
  String get changePasswordModalTitle {
    return Intl.message(
      'Contraseña actualizada',
      name: 'changePasswordModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Serás direccionado al login para iniciar sesión de nuevo.`
  String get changePasswordModalDescription {
    return Intl.message(
      'Serás direccionado al login para iniciar sesión de nuevo.',
      name: 'changePasswordModalDescription',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña actual que digitaste es incorrecta.`
  String get changePasswordModalErrorDescription {
    return Intl.message(
      'La contraseña actual que digitaste es incorrecta.',
      name: 'changePasswordModalErrorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Correo Actualizado`
  String get changeEmailModalTitle {
    return Intl.message(
      'Correo Actualizado',
      name: 'changeEmailModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Código inválido`
  String get otpInvalid {
    return Intl.message(
      'Código inválido',
      name: 'otpInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Revisa el código que te enviamos`
  String get otpInvalidDescription {
    return Intl.message(
      'Revisa el código que te enviamos',
      name: 'otpInvalidDescription',
      desc: '',
      args: [],
    );
  }

  /// `El primer paso lo das tú`
  String get registerTitle {
    return Intl.message(
      'El primer paso lo das tú',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `El nombre es muy corto.`
  String get registerNameTooShort {
    return Intl.message(
      'El nombre es muy corto.',
      name: 'registerNameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `El nombre es muy largo.`
  String get registerNameTooLong {
    return Intl.message(
      'El nombre es muy largo.',
      name: 'registerNameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `El nombre no es válido`
  String get registerNameInvalid {
    return Intl.message(
      'El nombre no es válido',
      name: 'registerNameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `El correo tiene espacios entre caractéres.`
  String get registerEmailHasSpaces {
    return Intl.message(
      'El correo tiene espacios entre caractéres.',
      name: 'registerEmailHasSpaces',
      desc: '',
      args: [],
    );
  }

  /// `Te faltó poner un punto después de la extensión`
  String get registerEmailMissingDotAfterExt {
    return Intl.message(
      'Te faltó poner un punto después de la extensión',
      name: 'registerEmailMissingDotAfterExt',
      desc: '',
      args: [],
    );
  }

  /// `Te falta el punto o @`
  String get registerEmailMissingDot {
    return Intl.message(
      'Te falta el punto o @',
      name: 'registerEmailMissingDot',
      desc: '',
      args: [],
    );
  }

  /// `No has confirmado tu correo electrónico`
  String get registerEmailNotConfirmed {
    return Intl.message(
      'No has confirmado tu correo electrónico',
      name: 'registerEmailNotConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Has confirmado tu correo exitosamente`
  String get registerEmailConfirmedSuccess {
    return Intl.message(
      'Has confirmado tu correo exitosamente',
      name: 'registerEmailConfirmedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `El código ingresado es incorrecto`
  String get registerNumberNotConfirmed {
    return Intl.message(
      'El código ingresado es incorrecto',
      name: 'registerNumberNotConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Número móvil validado con éxito`
  String get registerNumberConfirmSucces {
    return Intl.message(
      'Número móvil validado con éxito',
      name: 'registerNumberConfirmSucces',
      desc: '',
      args: [],
    );
  }

  /// `Registrado exitosamente.`
  String get registerSuccess {
    return Intl.message(
      'Registrado exitosamente.',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de expedición inválida`
  String get expDateError {
    return Intl.message(
      'Fecha de expedición inválida',
      name: 'expDateError',
      desc: '',
      args: [],
    );
  }

  /// `Mis metas`
  String get myGoalsTitle {
    return Intl.message(
      'Mis metas',
      name: 'myGoalsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Saldo`
  String get myGoalsBalance {
    return Intl.message(
      'Saldo',
      name: 'myGoalsBalance',
      desc: '',
      args: [],
    );
  }

  /// `Meta`
  String get myGoalsGoal {
    return Intl.message(
      'Meta',
      name: 'myGoalsGoal',
      desc: '',
      args: [],
    );
  }

  /// `Inversión`
  String get myGoalsInvestment {
    return Intl.message(
      'Inversión',
      name: 'myGoalsInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Ahorro mensual`
  String get myGoalsMonthlySavings {
    return Intl.message(
      'Ahorro mensual',
      name: 'myGoalsMonthlySavings',
      desc: '',
      args: [],
    );
  }

  /// `Ahorro Quincenal`
  String get myGoalsQuincenalSavings {
    return Intl.message(
      'Ahorro Quincenal',
      name: 'myGoalsQuincenalSavings',
      desc: '',
      args: [],
    );
  }

  /// `Ahorro Trimestral`
  String get myGoalsTrimestralSavings {
    return Intl.message(
      'Ahorro Trimestral',
      name: 'myGoalsTrimestralSavings',
      desc: '',
      args: [],
    );
  }

  /// `Transcurrido`
  String get myGoalsTimeElapsed {
    return Intl.message(
      'Transcurrido',
      name: 'myGoalsTimeElapsed',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo`
  String get myGoalsTotalTime {
    return Intl.message(
      'Tiempo',
      name: 'myGoalsTotalTime',
      desc: '',
      args: [],
    );
  }

  /// `Movimientos`
  String get myGoalsMovements {
    return Intl.message(
      'Movimientos',
      name: 'myGoalsMovements',
      desc: '',
      args: [],
    );
  }

  /// `Ahorro`
  String get myGoalMovementsSaving {
    return Intl.message(
      'Ahorro',
      name: 'myGoalMovementsSaving',
      desc: '',
      args: [],
    );
  }

  /// `Retiro`
  String get myGoalMovementsWithdrawals {
    return Intl.message(
      'Retiro',
      name: 'myGoalMovementsWithdrawals',
      desc: '',
      args: [],
    );
  }

  /// `Exitosa`
  String get myGoalMovementsSuccessful {
    return Intl.message(
      'Exitosa',
      name: 'myGoalMovementsSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `En proceso`
  String get myGoalMovementsAwaiting {
    return Intl.message(
      'En proceso',
      name: 'myGoalMovementsAwaiting',
      desc: '',
      args: [],
    );
  }

  /// `Rechazada`
  String get myGoalMovementsFailure {
    return Intl.message(
      'Rechazada',
      name: 'myGoalMovementsFailure',
      desc: '',
      args: [],
    );
  }

  /// `Aún no hay movimientos`
  String get myGoalsNoMovements {
    return Intl.message(
      'Aún no hay movimientos',
      name: 'myGoalsNoMovements',
      desc: '',
      args: [],
    );
  }

  /// `No hay movimientos en proceso ahora mismo.`
  String get historyNoProcessMovements {
    return Intl.message(
      'No hay movimientos en proceso ahora mismo.',
      name: 'historyNoProcessMovements',
      desc: '',
      args: [],
    );
  }

  /// `No has hecho ningún movimiento para esta meta ¿Qué estás esperando?`
  String get myGoalsNoMovementsDescription {
    return Intl.message(
      'No has hecho ningún movimiento para esta meta ¿Qué estás esperando?',
      name: 'myGoalsNoMovementsDescription',
      desc: '',
      args: [],
    );
  }

  /// `No has hecho ningún movimiento ¿Qué estás esperando para invertir?`
  String get historyNoMovementsDescription {
    return Intl.message(
      'No has hecho ningún movimiento ¿Qué estás esperando para invertir?',
      name: 'historyNoMovementsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cuando hagas una transaccion tus movimientos pendientes quedarán aquí.`
  String get historyNoProcessMovementsDescription {
    return Intl.message(
      'Cuando hagas una transaccion tus movimientos pendientes quedarán aquí.',
      name: 'historyNoProcessMovementsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Retirar de esta meta`
  String get floatingButtonWithdrawal {
    return Intl.message(
      'Retirar de esta meta',
      name: 'floatingButtonWithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Invertir en esta meta`
  String get floatingButtonInvesting {
    return Intl.message(
      'Invertir en esta meta',
      name: 'floatingButtonInvesting',
      desc: '',
      args: [],
    );
  }

  /// `Editar esta meta`
  String get floatingButtonEdit {
    return Intl.message(
      'Editar esta meta',
      name: 'floatingButtonEdit',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes un débito programado para esta meta`
  String get myGoalsNoDebits {
    return Intl.message(
      'Aún no tienes un débito programado para esta meta',
      name: 'myGoalsNoDebits',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes una domiciliación para esta meta`
  String get myGoalsNoDebitsMx {
    return Intl.message(
      'Aún no tienes una domiciliación para esta meta',
      name: 'myGoalsNoDebitsMx',
      desc: '',
      args: [],
    );
  }

  /// `Elige tu cuenta`
  String get investingGoalsChooseAccountTitle {
    return Intl.message(
      'Elige tu cuenta',
      name: 'investingGoalsChooseAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la cuenta con la que quieres generar el débito automático.`
  String get investingChooseAccountDescription {
    return Intl.message(
      'Selecciona la cuenta con la que quieres generar el débito automático.',
      name: 'investingChooseAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la cuenta con la que quieres generar la domiciliación.`
  String get investingChooseAccountDescriptionMx {
    return Intl.message(
      'Selecciona la cuenta con la que quieres generar la domiciliación.',
      name: 'investingChooseAccountDescriptionMx',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la cuenta con la que quieres generar la transferencia.`
  String get investingChooseAccountDescriptionTransfer {
    return Intl.message(
      'Selecciona la cuenta con la que quieres generar la transferencia.',
      name: 'investingChooseAccountDescriptionTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Inversión total`
  String get investingTotalValue {
    return Intl.message(
      'Inversión total',
      name: 'investingTotalValue',
      desc: '',
      args: [],
    );
  }

  /// `Mis cuentas`
  String get myWalletAccounts {
    return Intl.message(
      'Mis cuentas',
      name: 'myWalletAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Mis débitos`
  String get myWalletDebits {
    return Intl.message(
      'Mis débitos',
      name: 'myWalletDebits',
      desc: '',
      args: [],
    );
  }

  /// `Mis Domiciliaciones`
  String get myWalletDebitsMX {
    return Intl.message(
      'Mis Domiciliaciones',
      name: 'myWalletDebitsMX',
      desc: '',
      args: [],
    );
  }

  /// `Agregar cuenta`
  String get buttonAddAccount {
    return Intl.message(
      'Agregar cuenta',
      name: 'buttonAddAccount',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar cuenta`
  String get deleteAccountTitle {
    return Intl.message(
      'Eliminar cuenta',
      name: 'deleteAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de eliminar esta cuenta?`
  String get deleteAccountDescription {
    return Intl.message(
      '¿Estás seguro de eliminar esta cuenta?',
      name: 'deleteAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sí, eliminar`
  String get deleteAccountTrue {
    return Intl.message(
      'Sí, eliminar',
      name: 'deleteAccountTrue',
      desc: '',
      args: [],
    );
  }

  /// `Volver`
  String get deleteAccountFalse {
    return Intl.message(
      'Volver',
      name: 'deleteAccountFalse',
      desc: '',
      args: [],
    );
  }

  /// `La cuenta ha sido eliminada exitosamente`
  String get deleteAccountToast {
    return Intl.message(
      'La cuenta ha sido eliminada exitosamente',
      name: 'deleteAccountToast',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes extractos`
  String get extractsNotFound {
    return Intl.message(
      'Aún no tienes extractos',
      name: 'extractsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Tus extractos estarán disponibles mes a mes`
  String get extractsNotFoundDescription {
    return Intl.message(
      'Tus extractos estarán disponibles mes a mes',
      name: 'extractsNotFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes certificados disponibles`
  String get documentsNotFound {
    return Intl.message(
      'Aún no tienes certificados disponibles',
      name: 'documentsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Después de 3 meses de tener tu cuenta, tendrás disponible tu primer certificado`
  String get documentsNotFoundDescription {
    return Intl.message(
      'Después de 3 meses de tener tu cuenta, tendrás disponible tu primer certificado',
      name: 'documentsNotFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mi historial`
  String get myHistory {
    return Intl.message(
      'Mi historial',
      name: 'myHistory',
      desc: '',
      args: [],
    );
  }

  /// `Rentabilidad de tu perfil`
  String get myHistoryRentability {
    return Intl.message(
      'Rentabilidad de tu perfil',
      name: 'myHistoryRentability',
      desc: '',
      args: [],
    );
  }

  /// `Movilientos en proceso`
  String get myHistoryMovementsProcess {
    return Intl.message(
      'Movilientos en proceso',
      name: 'myHistoryMovementsProcess',
      desc: '',
      args: [],
    );
  }

  /// `Diaria`
  String get historyDiaria {
    return Intl.message(
      'Diaria',
      name: 'historyDiaria',
      desc: '',
      args: [],
    );
  }

  /// `Mensual`
  String get historyMensual {
    return Intl.message(
      'Mensual',
      name: 'historyMensual',
      desc: '',
      args: [],
    );
  }

  /// `Trimestral`
  String get historyTrimestral {
    return Intl.message(
      'Trimestral',
      name: 'historyTrimestral',
      desc: '',
      args: [],
    );
  }

  /// `Anual`
  String get historyAnual {
    return Intl.message(
      'Anual',
      name: 'historyAnual',
      desc: '',
      args: [],
    );
  }

  /// `Movimientos`
  String get movements {
    return Intl.message(
      'Movimientos',
      name: 'movements',
      desc: '',
      args: [],
    );
  }

  /// `Exitosa`
  String get aprobada {
    return Intl.message(
      'Exitosa',
      name: 'aprobada',
      desc: '',
      args: [],
    );
  }

  /// `Rechazada`
  String get rechazada {
    return Intl.message(
      'Rechazada',
      name: 'rechazada',
      desc: '',
      args: [],
    );
  }

  /// `Fallida`
  String get failed {
    return Intl.message(
      'Fallida',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `En proceso`
  String get pendient {
    return Intl.message(
      'En proceso',
      name: 'pendient',
      desc: '',
      args: [],
    );
  }

  /// `Pendiente por distribucion`
  String get pendingByDistribution {
    return Intl.message(
      'Pendiente por distribucion',
      name: 'pendingByDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Distribuido`
  String get distributed {
    return Intl.message(
      'Distribuido',
      name: 'distributed',
      desc: '',
      args: [],
    );
  }

  /// `Distribución Confirmada`
  String get confirmedDistribution {
    return Intl.message(
      'Distribución Confirmada',
      name: 'confirmedDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Agregar \n dinero`
  String get homeInvertir {
    return Intl.message(
      'Agregar \n dinero',
      name: 'homeInvertir',
      desc: '',
      args: [],
    );
  }

  /// `Retirar \n dinero`
  String get homeRetirar {
    return Intl.message(
      'Retirar \n dinero',
      name: 'homeRetirar',
      desc: '',
      args: [],
    );
  }

  /// `Editar débito \nautomático`
  String get editDebitTitle {
    return Intl.message(
      'Editar débito \nautomático',
      name: 'editDebitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Editar domiciliación`
  String get editDebitTitleMx {
    return Intl.message(
      'Editar domiciliación',
      name: 'editDebitTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Próximo débito`
  String get nextDebit {
    return Intl.message(
      'Próximo débito',
      name: 'nextDebit',
      desc: '',
      args: [],
    );
  }

  /// `Próxima domiciliación`
  String get nextDebitMx {
    return Intl.message(
      'Próxima domiciliación',
      name: 'nextDebitMx',
      desc: '',
      args: [],
    );
  }

  /// `Archivo adjunto`
  String get attachedFile {
    return Intl.message(
      'Archivo adjunto',
      name: 'attachedFile',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido a Ualet`
  String get homeIntroTitle {
    return Intl.message(
      'Bienvenido a Ualet',
      name: 'homeIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `En el home podrás ver la información más importante para que nunca te pierdas de nada.`
  String get homeIntroSubtitle1 {
    return Intl.message(
      'En el home podrás ver la información más importante para que nunca te pierdas de nada.',
      name: 'homeIntroSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Sigue haciendo lo que te gusta, mientas nosotros nos encargamos del resto.`
  String get homeIntroSubtitle2 {
    return Intl.message(
      'Sigue haciendo lo que te gusta, mientas nosotros nos encargamos del resto.',
      name: 'homeIntroSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `TAP PARA EMPEZAR`
  String get homeIntroBottom {
    return Intl.message(
      'TAP PARA EMPEZAR',
      name: 'homeIntroBottom',
      desc: '',
      args: [],
    );
  }

  /// `Retirar dinero`
  String get withdrawalTitle {
    return Intl.message(
      'Retirar dinero',
      name: 'withdrawalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Esta operación tiene un valor adicional de $10.00 correspondientes al costo bancario.`
  String get withdrawalDescriptionMX {
    return Intl.message(
      'Esta operación tiene un valor adicional de \$10.00 correspondientes al costo bancario.',
      name: 'withdrawalDescriptionMX',
      desc: '',
      args: [],
    );
  }

  /// `Esta operación tiene un valor adicional de $1.600 COP correspondientes al costo bancario.`
  String get withdrawalDescriptionCO {
    return Intl.message(
      'Esta operación tiene un valor adicional de \$1.600 COP correspondientes al costo bancario.',
      name: 'withdrawalDescriptionCO',
      desc: '',
      args: [],
    );
  }

  /// `Esta operación tiene un valor adicional de $950 COP correspondientes al costo bancario.`
  String get withdrawalDescriptionCO2 {
    return Intl.message(
      'Esta operación tiene un valor adicional de \$950 COP correspondientes al costo bancario.',
      name: 'withdrawalDescriptionCO2',
      desc: '',
      args: [],
    );
  }

  /// `Saldo total`
  String get withdrawalTotalBalance {
    return Intl.message(
      'Saldo total',
      name: 'withdrawalTotalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Retirar todo el dinero`
  String get withdrawalRadioAll {
    return Intl.message(
      'Retirar todo el dinero',
      name: 'withdrawalRadioAll',
      desc: '',
      args: [],
    );
  }

  /// `Retirar un valor diferente`
  String get withdrawalRadioParcial {
    return Intl.message(
      'Retirar un valor diferente',
      name: 'withdrawalRadioParcial',
      desc: '',
      args: [],
    );
  }

  /// `Debes invertir para poder retirar dinero`
  String get withdrawalErrorToast {
    return Intl.message(
      'Debes invertir para poder retirar dinero',
      name: 'withdrawalErrorToast',
      desc: '',
      args: [],
    );
  }

  /// `Retirar todo el dinero`
  String get withdrawalModalTitle {
    return Intl.message(
      'Retirar todo el dinero',
      name: 'withdrawalModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `El valor total a retirar es aproximado al cierre del mercado de valores y puede variar.`
  String get withdrawalModalDescription {
    return Intl.message(
      'El valor total a retirar es aproximado al cierre del mercado de valores y puede variar.',
      name: 'withdrawalModalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona las metas e ingresa el valor que quieres retirar.`
  String get withdrawalChooseGoalDescription {
    return Intl.message(
      'Selecciona las metas e ingresa el valor que quieres retirar.',
      name: 'withdrawalChooseGoalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la cuenta a la que quieres enviar tu dinero.`
  String get withdrawalChooseAccountDescription {
    return Intl.message(
      'Selecciona la cuenta a la que quieres enviar tu dinero.',
      name: 'withdrawalChooseAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Retiro`
  String get withdrawal {
    return Intl.message(
      'Retiro',
      name: 'withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Retiro total`
  String get withdrawalMx {
    return Intl.message(
      'Retiro total',
      name: 'withdrawalMx',
      desc: '',
      args: [],
    );
  }

  /// `Costo bancario`
  String get withdrawalFee {
    return Intl.message(
      'Costo bancario',
      name: 'withdrawalFee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get withdrawTotal {
    return Intl.message(
      'Total',
      name: 'withdrawTotal',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa un valor`
  String get withdrawalHint {
    return Intl.message(
      'Ingresa un valor',
      name: 'withdrawalHint',
      desc: '',
      args: [],
    );
  }

  /// `El saldo restante de esta meta debe ser de al menos $100.00`
  String get withdrawalError {
    return Intl.message(
      'El saldo restante de esta meta debe ser de al menos \$100.00',
      name: 'withdrawalError',
      desc: '',
      args: [],
    );
  }

  /// `El retiro no puede ser mayor al saldo actual.`
  String get withdrawalErrorCO {
    return Intl.message(
      'El retiro no puede ser mayor al saldo actual.',
      name: 'withdrawalErrorCO',
      desc: '',
      args: [],
    );
  }

  /// `El retiro debe ser de minimo $10.000`
  String get withdrawalErrorMin {
    return Intl.message(
      'El retiro debe ser de minimo \$10.000',
      name: 'withdrawalErrorMin',
      desc: '',
      args: [],
    );
  }

  /// `Meta con saldo insuficiente`
  String get withdrawalDialogMinTitle {
    return Intl.message(
      'Meta con saldo insuficiente',
      name: 'withdrawalDialogMinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mínimo debes tener $10.000 en alguna de tus metas para poder retirar dinero.`
  String get withdrawalDialogMinDescription {
    return Intl.message(
      'Mínimo debes tener \$10.000 en alguna de tus metas para poder retirar dinero.',
      name: 'withdrawalDialogMinDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cuenta de ahorros`
  String get accountType1 {
    return Intl.message(
      'Cuenta de ahorros',
      name: 'accountType1',
      desc: '',
      args: [],
    );
  }

  /// `Cuenta corriente`
  String get accountType2 {
    return Intl.message(
      'Cuenta corriente',
      name: 'accountType2',
      desc: '',
      args: [],
    );
  }

  /// `Tu dinero será transferido a la cuenta:`
  String get withdrawalSummaryAccount {
    return Intl.message(
      'Tu dinero será transferido a la cuenta:',
      name: 'withdrawalSummaryAccount',
      desc: '',
      args: [],
    );
  }

  /// `Estado de tus meta`
  String get withdrawalSummaryGoal {
    return Intl.message(
      'Estado de tus meta',
      name: 'withdrawalSummaryGoal',
      desc: '',
      args: [],
    );
  }

  /// `Estado de tus metas`
  String get withdrawalSummaryGoals {
    return Intl.message(
      'Estado de tus metas',
      name: 'withdrawalSummaryGoals',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar retiro`
  String get withdrawalSummaryButton {
    return Intl.message(
      'Confirmar retiro',
      name: 'withdrawalSummaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirmo que soy el único titular de esta cuenta, que mis datos son correctos y que no voy a invertir por cuenta de terceros.`
  String get withdrawalSummaryCheckText {
    return Intl.message(
      'Confirmo que soy el único titular de esta cuenta, que mis datos son correctos y que no voy a invertir por cuenta de terceros.',
      name: 'withdrawalSummaryCheckText',
      desc: '',
      args: [],
    );
  }

  /// `Número de RFC`
  String get withdrawalSummaryRFC {
    return Intl.message(
      'Número de RFC',
      name: 'withdrawalSummaryRFC',
      desc: '',
      args: [],
    );
  }

  /// `Finalizar transacción`
  String get withdrawalTransactionSummaryButton {
    return Intl.message(
      'Finalizar transacción',
      name: 'withdrawalTransactionSummaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Retiro exitoso`
  String get withdrawalSuccessTitle {
    return Intl.message(
      'Retiro exitoso',
      name: 'withdrawalSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has superado exitosamente todos nuestros protocolos de seguridad`
  String get withdrawalSuccessDescription {
    return Intl.message(
      'Has superado exitosamente todos nuestros protocolos de seguridad',
      name: 'withdrawalSuccessDescription',
      desc: '',
      args: [],
    );
  }

  /// `Resumen de la transacción`
  String get withdrawalTransactionSummaryTitle {
    return Intl.message(
      'Resumen de la transacción',
      name: 'withdrawalTransactionSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu retiro ha sido exitoso. La transferencia puede tomar hasta 5 días hábiles en verse reflejada en tu cuenta.`
  String get withdrawalTransactionSummaryDescription {
    return Intl.message(
      'Tu retiro ha sido exitoso. La transferencia puede tomar hasta 5 días hábiles en verse reflejada en tu cuenta.',
      name: 'withdrawalTransactionSummaryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Movimientos en proceso`
  String get withdrawalTransactionSummaryMovements {
    return Intl.message(
      'Movimientos en proceso',
      name: 'withdrawalTransactionSummaryMovements',
      desc: '',
      args: [],
    );
  }

  /// `Retiro total de dinero`
  String get withdrawalTransactionSummaryAll {
    return Intl.message(
      'Retiro total de dinero',
      name: 'withdrawalTransactionSummaryAll',
      desc: '',
      args: [],
    );
  }

  /// `¡No olvides tus débitos!`
  String get withdrawalSummaryDialogDebitTitle {
    return Intl.message(
      '¡No olvides tus débitos!',
      name: 'withdrawalSummaryDialogDebitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu meta name tiene un debito automático programado.`
  String get withdrawalDialogSingle {
    return Intl.message(
      'Tu meta name tiene un debito automático programado.',
      name: 'withdrawalDialogSingle',
      desc: '',
      args: [],
    );
  }

  /// `Tus metas name tienen un debito automático programado.`
  String get withdrawalDialogMultiple {
    return Intl.message(
      'Tus metas name tienen un debito automático programado.',
      name: 'withdrawalDialogMultiple',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar o mantener el débito automático programado para esta meta?`
  String get withdrawalSummaryDialogDescription2 {
    return Intl.message(
      '¿Quieres eliminar o mantener el débito automático programado para esta meta?',
      name: 'withdrawalSummaryDialogDescription2',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar o mantener el débito automático programado para estas metas?`
  String get withdrawalSummaryDialogDescription3 {
    return Intl.message(
      '¿Quieres eliminar o mantener el débito automático programado para estas metas?',
      name: 'withdrawalSummaryDialogDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar débitos`
  String get withdrawalSummaryDialogButtonDelete {
    return Intl.message(
      'Eliminar débitos',
      name: 'withdrawalSummaryDialogButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar domiciliación`
  String get withdrawalSummaryDialogButtonDeleteMx {
    return Intl.message(
      'Eliminar domiciliación',
      name: 'withdrawalSummaryDialogButtonDeleteMx',
      desc: '',
      args: [],
    );
  }

  /// `Mantener débitos`
  String get withdrawalSummaryDialogButtonKeep {
    return Intl.message(
      'Mantener débitos',
      name: 'withdrawalSummaryDialogButtonKeep',
      desc: '',
      args: [],
    );
  }

  /// `Mantener domiciliación`
  String get withdrawalSummaryDialogButtonKeepMx {
    return Intl.message(
      'Mantener domiciliación',
      name: 'withdrawalSummaryDialogButtonKeepMx',
      desc: '',
      args: [],
    );
  }

  /// `¿Seguiras con nosotros?`
  String get withdrawalGoalsDeleteTitle {
    return Intl.message(
      '¿Seguiras con nosotros?',
      name: 'withdrawalGoalsDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has eliminado los débitos automáticos.`
  String get withdrawalGoalsDeleteDescription1 {
    return Intl.message(
      'Has eliminado los débitos automáticos.',
      name: 'withdrawalGoalsDeleteDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Has eliminado las domiciliaciónes.`
  String get withdrawalGoalsDeleteDescription1Mx {
    return Intl.message(
      'Has eliminado las domiciliaciónes.',
      name: 'withdrawalGoalsDeleteDescription1Mx',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar tus metas creadas en UALET?`
  String get withdrawalGoalsDeleteDescription2 {
    return Intl.message(
      '¿Quieres eliminar tus metas creadas en UALET?',
      name: 'withdrawalGoalsDeleteDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Metas`
  String get withdrawalGoalsDeleteButtonDelete {
    return Intl.message(
      'Eliminar Metas',
      name: 'withdrawalGoalsDeleteButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Mantener metas`
  String get withdrawalGoalsDeleteButtonKeep {
    return Intl.message(
      'Mantener metas',
      name: 'withdrawalGoalsDeleteButtonKeep',
      desc: '',
      args: [],
    );
  }

  /// `Metas recalculadas`
  String get goalsRecalculated {
    return Intl.message(
      'Metas recalculadas',
      name: 'goalsRecalculated',
      desc: '',
      args: [],
    );
  }

  /// `Volver`
  String get goalsRecalculatedButtonBack {
    return Intl.message(
      'Volver',
      name: 'goalsRecalculatedButtonBack',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get goalsRecalculatedButtonUnderstood {
    return Intl.message(
      'Entendido',
      name: 'goalsRecalculatedButtonUnderstood',
      desc: '',
      args: [],
    );
  }

  /// `Transferencia interbancaria PSE`
  String get bankTransferDialogTitle {
    return Intl.message(
      'Transferencia interbancaria PSE',
      name: 'bankTransferDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transferencia interbancaria`
  String get bankTransferDialogTitleMx {
    return Intl.message(
      'Transferencia interbancaria',
      name: 'bankTransferDialogTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Serás redireccionado fuera de UALET para poder completar tu transferencia a través de PSE. Te esperamos de vuelta en cuanto termines el proceso.`
  String get bankTransferDialogDescription {
    return Intl.message(
      'Serás redireccionado fuera de UALET para poder completar tu transferencia a través de PSE. Te esperamos de vuelta en cuanto termines el proceso.',
      name: 'bankTransferDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Serás redireccionado fuera de UALET para poder completar tu transferencia interbancaria. Te esperamos de vuelta en cuanto termines el proceso.`
  String get bankTransferDialogDescriptionMx {
    return Intl.message(
      'Serás redireccionado fuera de UALET para poder completar tu transferencia interbancaria. Te esperamos de vuelta en cuanto termines el proceso.',
      name: 'bankTransferDialogDescriptionMx',
      desc: '',
      args: [],
    );
  }

  /// `Transferencia Interbancaria`
  String get bankTransferMovement {
    return Intl.message(
      'Transferencia Interbancaria',
      name: 'bankTransferMovement',
      desc: '',
      args: [],
    );
  }

  /// `Estamos a un paso`
  String get bankTransferAlmostTitle {
    return Intl.message(
      'Estamos a un paso',
      name: 'bankTransferAlmostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has superado exitosamente todos nuestros protocolos de seguridad y estás listo para inscribir tu cuenta bancaria y ahorrar como los grandes.`
  String get bankTransferAlmostDescription {
    return Intl.message(
      'Has superado exitosamente todos nuestros protocolos de seguridad y estás listo para inscribir tu cuenta bancaria y ahorrar como los grandes.',
      name: 'bankTransferAlmostDescription',
      desc: '',
      args: [],
    );
  }

  /// `El valor total de tu inversión puede tomar hasta 5 días hábiles en verse reflejado en tu cuenta bancaria.`
  String get bankTransferSummaryDescription {
    return Intl.message(
      'El valor total de tu inversión puede tomar hasta 5 días hábiles en verse reflejado en tu cuenta bancaria.',
      name: 'bankTransferSummaryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Resumen de la transacción`
  String get bankTransferSummaryTitle {
    return Intl.message(
      'Resumen de la transacción',
      name: 'bankTransferSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero PSE`
  String get bankTransferPSEDialogTitle {
    return Intl.message(
      'Agregar dinero PSE',
      name: 'bankTransferPSEDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero Transferencia Interbancaria`
  String get bankTransferPSEDialogTitleMx {
    return Intl.message(
      'Agregar dinero Transferencia Interbancaria',
      name: 'bankTransferPSEDialogTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Débito automático recalculado`
  String get debitRecalculated {
    return Intl.message(
      'Débito automático recalculado',
      name: 'debitRecalculated',
      desc: '',
      args: [],
    );
  }

  /// `Has cambiado el valor de las cuotas de tu meta`
  String get debitRecalculatedSubtitle {
    return Intl.message(
      'Has cambiado el valor de las cuotas de tu meta',
      name: 'debitRecalculatedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu meta está asociada a un débito automático que tiene más metas asociadas`
  String get multiGoalDebitRecalculatedSubtitle {
    return Intl.message(
      'Tu meta está asociada a un débito automático que tiene más metas asociadas',
      name: 'multiGoalDebitRecalculatedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué ciudad vives?`
  String get whereDoYouLive {
    return Intl.message(
      '¿En qué ciudad vives?',
      name: 'whereDoYouLive',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué empresa trabajas?`
  String get whichCompanyDoYouWork {
    return Intl.message(
      '¿En qué empresa trabajas?',
      name: 'whichCompanyDoYouWork',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué ciudad está la empresa?`
  String get companyCity {
    return Intl.message(
      '¿En qué ciudad está la empresa?',
      name: 'companyCity',
      desc: '',
      args: [],
    );
  }

  /// `Dirección de la empresa`
  String get companyAddress {
    return Intl.message(
      'Dirección de la empresa',
      name: 'companyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Teléfono de la empresa`
  String get companyPhone {
    return Intl.message(
      'Teléfono de la empresa',
      name: 'companyPhone',
      desc: '',
      args: [],
    );
  }

  /// `¿Pagas impuestos en un país distinto a Colombia?`
  String get taxesInOtherCountries {
    return Intl.message(
      '¿Pagas impuestos en un país distinto a Colombia?',
      name: 'taxesInOtherCountries',
      desc: '',
      args: [],
    );
  }

  /// `País`
  String get country {
    return Intl.message(
      'País',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Documento de identidad en ese país`
  String get idInSaidCountry {
    return Intl.message(
      'Documento de identidad en ese país',
      name: 'idInSaidCountry',
      desc: '',
      args: [],
    );
  }

  /// `Apellido`
  String get lastName {
    return Intl.message(
      'Apellido',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar meta`
  String get deleteGoal {
    return Intl.message(
      'Eliminar meta',
      name: 'deleteGoal',
      desc: '',
      args: [],
    );
  }

  /// `Sí, eliminar`
  String get deleteGoalButtonNoBalance {
    return Intl.message(
      'Sí, eliminar',
      name: 'deleteGoalButtonNoBalance',
      desc: '',
      args: [],
    );
  }

  /// `Volver`
  String get deleteGoalgoBackButton {
    return Intl.message(
      'Volver',
      name: 'deleteGoalgoBackButton',
      desc: '',
      args: [],
    );
  }

  /// `La meta aún no tiene saldo acumulado ¿Estás seguro de eliminarla?`
  String get deleteGoalDialogDescriptionNoBalance {
    return Intl.message(
      'La meta aún no tiene saldo acumulado ¿Estás seguro de eliminarla?',
      name: 'deleteGoalDialogDescriptionNoBalance',
      desc: '',
      args: [],
    );
  }

  /// `Para poder eliminar esta meta debes retirar la totalidad del saldo acumulado en ella.`
  String get deleteGoalDialogDescriptionBalance {
    return Intl.message(
      'Para poder eliminar esta meta debes retirar la totalidad del saldo acumulado en ella.',
      name: 'deleteGoalDialogDescriptionBalance',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres retirar el dinero de esta meta`
  String get deleteGoalDialogQuestion {
    return Intl.message(
      '¿Quieres retirar el dinero de esta meta',
      name: 'deleteGoalDialogQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Sí, retirar dinero`
  String get deleteGoalButtonBalance {
    return Intl.message(
      'Sí, retirar dinero',
      name: 'deleteGoalButtonBalance',
      desc: '',
      args: [],
    );
  }

  /// `¡Tu meta tiene un débito asociado!`
  String get forgotDebitDialogTitle {
    return Intl.message(
      '¡Tu meta tiene un débito asociado!',
      name: 'forgotDebitDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Tu meta tiene una domiciliación asociada!`
  String get forgotDebitDialogTitleMX {
    return Intl.message(
      '¡Tu meta tiene una domiciliación asociada!',
      name: 'forgotDebitDialogTitleMX',
      desc: '',
      args: [],
    );
  }

  /// `Tu meta name tiene un débito automático programado.`
  String get forgotDebitDialogDescription {
    return Intl.message(
      'Tu meta name tiene un débito automático programado.',
      name: 'forgotDebitDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tu meta name tiene una domiciliación programada.`
  String get forgotDebitDialogDescriptionMX {
    return Intl.message(
      'Tu meta name tiene una domiciliación programada.',
      name: 'forgotDebitDialogDescriptionMX',
      desc: '',
      args: [],
    );
  }

  /// `Al eliminar tu meta, también se eliminara tu débito automático.`
  String get forgotDebitDialogQuestion {
    return Intl.message(
      'Al eliminar tu meta, también se eliminara tu débito automático.',
      name: 'forgotDebitDialogQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Al eliminar tu meta, también se eliminará tu domiciliación`
  String get forgotDebitDialogQuestionMX {
    return Intl.message(
      'Al eliminar tu meta, también se eliminará tu domiciliación',
      name: 'forgotDebitDialogQuestionMX',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Débito`
  String get forgotDebitDialogButton {
    return Intl.message(
      'Eliminar Débito',
      name: 'forgotDebitDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Domiciliación`
  String get forgotDebitDialogButtonMX {
    return Intl.message(
      'Eliminar Domiciliación',
      name: 'forgotDebitDialogButtonMX',
      desc: '',
      args: [],
    );
  }

  /// `La meta ha sido eliminada`
  String get deleteGoalSuccess {
    return Intl.message(
      'La meta ha sido eliminada',
      name: 'deleteGoalSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Ingreso exitoso de tu dinero`
  String get depositDialogTitle {
    return Intl.message(
      'Ingreso exitoso de tu dinero',
      name: 'depositDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `La inversión que realizaste ya se encuentra reflejado en tu saldo`
  String get depositDialogDescription {
    return Intl.message(
      'La inversión que realizaste ya se encuentra reflejado en tu saldo',
      name: 'depositDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Primer nombre`
  String get firstName {
    return Intl.message(
      'Primer nombre',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Segundo Nombre`
  String get secondName {
    return Intl.message(
      'Segundo Nombre',
      name: 'secondName',
      desc: '',
      args: [],
    );
  }

  /// `País de nacimiento`
  String get birthCountry {
    return Intl.message(
      'País de nacimiento',
      name: 'birthCountry',
      desc: '',
      args: [],
    );
  }

  /// `Ciudad de nacimiento`
  String get cityBirth {
    return Intl.message(
      'Ciudad de nacimiento',
      name: 'cityBirth',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de expedición`
  String get expeditionDate {
    return Intl.message(
      'Fecha de expedición',
      name: 'expeditionDate',
      desc: '',
      args: [],
    );
  }

  /// `Lugar de expedición`
  String get expeditionPlace {
    return Intl.message(
      'Lugar de expedición',
      name: 'expeditionPlace',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de expedición`
  String get expeditionDateLabel {
    return Intl.message(
      'Fecha de expedición',
      name: 'expeditionDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Notificaciones`
  String get notifications {
    return Intl.message(
      'Notificaciones',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes notificaciones\n ¿Que esperas para invertir?`
  String get noNotificationsTitle {
    return Intl.message(
      'Aún no tienes notificaciones\n ¿Que esperas para invertir?',
      name: 'noNotificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mes`
  String get graphSelectorLeft {
    return Intl.message(
      'Mes',
      name: 'graphSelectorLeft',
      desc: '',
      args: [],
    );
  }

  /// `Trimestre`
  String get graphSelectorMiddle {
    return Intl.message(
      'Trimestre',
      name: 'graphSelectorMiddle',
      desc: '',
      args: [],
    );
  }

  /// `Semestre`
  String get graphSelectorRight {
    return Intl.message(
      'Semestre',
      name: 'graphSelectorRight',
      desc: '',
      args: [],
    );
  }

  /// `No has hecho transacciones en este rango de tiempo`
  String get showgraphMessage {
    return Intl.message(
      'No has hecho transacciones en este rango de tiempo',
      name: 'showgraphMessage',
      desc: '',
      args: [],
    );
  }

  /// `¡No olvides agregar un emoji!`
  String get missingEmojiTitle {
    return Intl.message(
      '¡No olvides agregar un emoji!',
      name: 'missingEmojiTitle',
      desc: '',
      args: [],
    );
  }

  /// `Escoje un emoji que describa tu meta.`
  String get missingEmojiDescription {
    return Intl.message(
      'Escoje un emoji que describa tu meta.',
      name: 'missingEmojiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ver proyección`
  String get buttonShowChart {
    return Intl.message(
      'Ver proyección',
      name: 'buttonShowChart',
      desc: '',
      args: [],
    );
  }

  /// `TRANSFORMAMOS TUS DÉBITOS Y TU SALDO EN METAS`
  String get onBoardingTitle1 {
    return Intl.message(
      'TRANSFORMAMOS TUS DÉBITOS Y TU SALDO EN METAS',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `TRANSFORMAMOS TUS DOMICILIACIONES Y TU SALDO EN METAS`
  String get onBoardingTitle1mX {
    return Intl.message(
      'TRANSFORMAMOS TUS DOMICILIACIONES Y TU SALDO EN METAS',
      name: 'onBoardingTitle1mX',
      desc: '',
      args: [],
    );
  }

  /// `EL TIEMPO AHORA ES UNA META`
  String get onBoardingTitle2 {
    return Intl.message(
      'EL TIEMPO AHORA ES UNA META',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `REVISA TUS METAS`
  String get onBoardingTitle3 {
    return Intl.message(
      'REVISA TUS METAS',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Queremos acompañarte en la construcción de tu futuro, por eso transformamos los débitos y tu saldo en metas para que alcances más rápido tus objetivos.`
  String get onBoardingDescription1 {
    return Intl.message(
      'Queremos acompañarte en la construcción de tu futuro, por eso transformamos los débitos y tu saldo en metas para que alcances más rápido tus objetivos.',
      name: 'onBoardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Queremos acompañarte en la construcción de tu futuro, por eso transformamos las domiciliacines y tu saldo en metas para que alcances más rápido tus objetivos.`
  String get onBoardingDescription1Mx {
    return Intl.message(
      'Queremos acompañarte en la construcción de tu futuro, por eso transformamos las domiciliacines y tu saldo en metas para que alcances más rápido tus objetivos.',
      name: 'onBoardingDescription1Mx',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona tus débitos por periodo de tiempo y conviértelos en metas. Define tus metas por periodos quincenales, mensuales o trimestrales.`
  String get onBoardingDescription2 {
    return Intl.message(
      'Selecciona tus débitos por periodo de tiempo y conviértelos en metas. Define tus metas por periodos quincenales, mensuales o trimestrales.',
      name: 'onBoardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona tus domiciliaciones por periodo de tiempo y conviértelos en metas. Define tus metas por periodos quincenales, mensuales o trimestrales.`
  String get onBoardingDescription2Mx {
    return Intl.message(
      'Selecciona tus domiciliaciones por periodo de tiempo y conviértelos en metas. Define tus metas por periodos quincenales, mensuales o trimestrales.',
      name: 'onBoardingDescription2Mx',
      desc: '',
      args: [],
    );
  }

  /// `Después de crear tus metas, asegúrate de revisar que todo haya quedado tal y como querías. Recuerda que puedes editar tus metas cada vez que quieras.`
  String get onBoardingDescription3 {
    return Intl.message(
      'Después de crear tus metas, asegúrate de revisar que todo haya quedado tal y como querías. Recuerda que puedes editar tus metas cada vez que quieras.',
      name: 'onBoardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Agrupa tus débitos automáticos para crear tus métas.`
  String get migrationDescriptionChoose {
    return Intl.message(
      'Agrupa tus débitos automáticos para crear tus métas.',
      name: 'migrationDescriptionChoose',
      desc: '',
      args: [],
    );
  }

  /// `Agrupa tus domiciliaciones para crear tus métas.`
  String get migrationDescriptionChooseMx {
    return Intl.message(
      'Agrupa tus domiciliaciones para crear tus métas.',
      name: 'migrationDescriptionChooseMx',
      desc: '',
      args: [],
    );
  }

  /// `Quincenal`
  String get quincenal {
    return Intl.message(
      'Quincenal',
      name: 'quincenal',
      desc: '',
      args: [],
    );
  }

  /// `Mensual`
  String get mensual {
    return Intl.message(
      'Mensual',
      name: 'mensual',
      desc: '',
      args: [],
    );
  }

  /// `Trimestral`
  String get trimestral {
    return Intl.message(
      'Trimestral',
      name: 'trimestral',
      desc: '',
      args: [],
    );
  }

  /// `Tus débitos en esta meta`
  String get yourDebits {
    return Intl.message(
      'Tus débitos en esta meta',
      name: 'yourDebits',
      desc: '',
      args: [],
    );
  }

  /// `Tus domiciliaciones en esta meta`
  String get yourDebitsMx {
    return Intl.message(
      'Tus domiciliaciones en esta meta',
      name: 'yourDebitsMx',
      desc: '',
      args: [],
    );
  }

  /// `Crea tu primera meta de ahorro`
  String get createFirstGoal {
    return Intl.message(
      'Crea tu primera meta de ahorro',
      name: 'createFirstGoal',
      desc: '',
      args: [],
    );
  }

  /// `Resumen de mis metas`
  String get resumeGoals {
    return Intl.message(
      'Resumen de mis metas',
      name: 'resumeGoals',
      desc: '',
      args: [],
    );
  }

  /// `No puedes crear otro débito automático en esta meta, ya que tiene un débito automático`
  String get errorCantInvest {
    return Intl.message(
      'No puedes crear otro débito automático en esta meta, ya que tiene un débito automático',
      name: 'errorCantInvest',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar débito automático`
  String get updateDebitDialogTitle {
    return Intl.message(
      'Actualizar débito automático',
      name: 'updateDebitDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar domiciliación`
  String get updateDebitDialogTitleMx {
    return Intl.message(
      'Actualizar domiciliación',
      name: 'updateDebitDialogTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Este débito automático está relacionado con las siguientes metas:`
  String get updateDebitDialogDescription {
    return Intl.message(
      'Este débito automático está relacionado con las siguientes metas:',
      name: 'updateDebitDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Esta domiciliación está relacionada con las siguientes metas:`
  String get updateDebitDialogDescriptionMx {
    return Intl.message(
      'Esta domiciliación está relacionada con las siguientes metas:',
      name: 'updateDebitDialogDescriptionMx',
      desc: '',
      args: [],
    );
  }

  /// `¿Deseas guardar los cambios en el débito automático?`
  String get updateDebitDialogQuestion {
    return Intl.message(
      '¿Deseas guardar los cambios en el débito automático?',
      name: 'updateDebitDialogQuestion',
      desc: '',
      args: [],
    );
  }

  /// `¿Deseas guardar los cambios en la domiciliación?`
  String get updateDebitDialogQuestionMx {
    return Intl.message(
      '¿Deseas guardar los cambios en la domiciliación?',
      name: 'updateDebitDialogQuestionMx',
      desc: '',
      args: [],
    );
  }

  /// `Tu cuota no puede ser mayor que el valor de tu meta.`
  String get errorFeeGreaterThanTotal {
    return Intl.message(
      'Tu cuota no puede ser mayor que el valor de tu meta.',
      name: 'errorFeeGreaterThanTotal',
      desc: '',
      args: [],
    );
  }

  /// `Error validando identidad`
  String get errorEvidenteTitle {
    return Intl.message(
      'Error validando identidad',
      name: 'errorEvidenteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Volver a intentar`
  String get errorEvidenteButton {
    return Intl.message(
      'Volver a intentar',
      name: 'errorEvidenteButton',
      desc: '',
      args: [],
    );
  }

  /// `Nombre de la ciudad`
  String get cityName {
    return Intl.message(
      'Nombre de la ciudad',
      name: 'cityName',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar débito automático`
  String get deleteDebitTitle {
    return Intl.message(
      'Eliminar débito automático',
      name: 'deleteDebitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar domiciliación`
  String get deleteDebitTitleMx {
    return Intl.message(
      'Eliminar domiciliación',
      name: 'deleteDebitTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de eliminar este débito automático?`
  String get deleteDebitSubTitle {
    return Intl.message(
      '¿Estás seguro de eliminar este débito automático?',
      name: 'deleteDebitSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de eliminar esta domiciliación?`
  String get deleteDebitSubTitleMx {
    return Intl.message(
      '¿Estás seguro de eliminar esta domiciliación?',
      name: 'deleteDebitSubTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Este débito automático está relacionado con estas metas:`
  String get deleteDebitRelatedGoals {
    return Intl.message(
      'Este débito automático está relacionado con estas metas:',
      name: 'deleteDebitRelatedGoals',
      desc: '',
      args: [],
    );
  }

  /// `Esta domiciliacióno está relacionada con estas metas:`
  String get deleteDebitRelatedGoalsMx {
    return Intl.message(
      'Esta domiciliacióno está relacionada con estas metas:',
      name: 'deleteDebitRelatedGoalsMx',
      desc: '',
      args: [],
    );
  }

  /// `El débito ha sido eliminado con éxito`
  String get debitDeleted {
    return Intl.message(
      'El débito ha sido eliminado con éxito',
      name: 'debitDeleted',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación ha sido eliminada con éxito`
  String get debitDeletedMx {
    return Intl.message(
      'La domiciliación ha sido eliminada con éxito',
      name: 'debitDeletedMx',
      desc: '',
      args: [],
    );
  }

  /// `¡La nueva versión de Ualet \n ya está disponible!`
  String get updateVersionTitle {
    return Intl.message(
      '¡La nueva versión de Ualet \n ya está disponible!',
      name: 'updateVersionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sorpréndete con esta experiencia \n y sus nuevas funcionalidades.`
  String get updateVersionSubTitle {
    return Intl.message(
      'Sorpréndete con esta experiencia \n y sus nuevas funcionalidades.',
      name: 'updateVersionSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar ahora`
  String get updateVersionButton {
    return Intl.message(
      'Actualizar ahora',
      name: 'updateVersionButton',
      desc: '',
      args: [],
    );
  }

  /// `¡Dinero añadido de forma exitosa!`
  String get titlePopUpInvestingSuccess {
    return Intl.message(
      '¡Dinero añadido de forma exitosa!',
      name: 'titlePopUpInvestingSuccess',
      desc: '',
      args: [],
    );
  }

  /// ` La inversión que realizaste ya se encuentra reflejado en tu saldo.`
  String get bodyPopUpInvestingSuccess {
    return Intl.message(
      ' La inversión que realizaste ya se encuentra reflejado en tu saldo.',
      name: 'bodyPopUpInvestingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get buttonPopUpInvestingSuccess {
    return Intl.message(
      'Continuar',
      name: 'buttonPopUpInvestingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tu migración ha sido completada`
  String get migratePopUpWithoutTitle {
    return Intl.message(
      'Tu migración ha sido completada',
      name: 'migratePopUpWithoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que debes esperar hasta 48 horas para ver tu saldo y tampoco podrás eliminar tu meta hasta que tu saldo se vea reflejado en la aplicación.`
  String get migratePopUpWithoutBody {
    return Intl.message(
      'Recuerda que debes esperar hasta 48 horas para ver tu saldo y tampoco podrás eliminar tu meta hasta que tu saldo se vea reflejado en la aplicación.',
      name: 'migratePopUpWithoutBody',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get migratePopUpWithoutButton {
    return Intl.message(
      'Entendido',
      name: 'migratePopUpWithoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Saldo Disponible`
  String get migratePopUpWithTitle {
    return Intl.message(
      'Saldo Disponible',
      name: 'migratePopUpWithTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu saldo ya se encuentra disponible en la aplicación.`
  String get migratePopUpWithBody {
    return Intl.message(
      'Tu saldo ya se encuentra disponible en la aplicación.',
      name: 'migratePopUpWithBody',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get migratePopUpWithButton {
    return Intl.message(
      'Entendido',
      name: 'migratePopUpWithButton',
      desc: '',
      args: [],
    );
  }

  /// `Estado Retiro`
  String get validateTransactionPopUpTitle {
    return Intl.message(
      'Estado Retiro',
      name: 'validateTransactionPopUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get validateTransactionPopUpButton {
    return Intl.message(
      'Entendido',
      name: 'validateTransactionPopUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Importante`
  String get nameGeoreferenciacionPermission {
    return Intl.message(
      'Importante',
      name: 'nameGeoreferenciacionPermission',
      desc: '',
      args: [],
    );
  }

  /// `Por temas de regulación  necesitamos conocer tu ubicación.`
  String get descriptionGeoreferenciacionPermission {
    return Intl.message(
      'Por temas de regulación  necesitamos conocer tu ubicación.',
      name: 'descriptionGeoreferenciacionPermission',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar`
  String get buttonAGeoreferenciacionPermission {
    return Intl.message(
      'Aceptar',
      name: 'buttonAGeoreferenciacionPermission',
      desc: '',
      args: [],
    );
  }

  /// `Rechazar`
  String get buttonRGeoreferenciacionPermission {
    return Intl.message(
      'Rechazar',
      name: 'buttonRGeoreferenciacionPermission',
      desc: '',
      args: [],
    );
  }

  /// `Agregar beneficiarios`
  String get myAccountBeneficiariesButton {
    return Intl.message(
      'Agregar beneficiarios',
      name: 'myAccountBeneficiariesButton',
      desc: '',
      args: [],
    );
  }

  /// `Agregar beneficiario`
  String get addBeneficiaryButton {
    return Intl.message(
      'Agregar beneficiario',
      name: 'addBeneficiaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar beneficiario`
  String get removeBeneficiaryButton {
    return Intl.message(
      'Eliminar beneficiario',
      name: 'removeBeneficiaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Nombre - Beneficiario`
  String get beneficiaryName {
    return Intl.message(
      'Nombre - Beneficiario',
      name: 'beneficiaryName',
      desc: '',
      args: [],
    );
  }

  /// `Número de contacto del beneficiario`
  String get beneficiaryNumber {
    return Intl.message(
      'Número de contacto del beneficiario',
      name: 'beneficiaryNumber',
      desc: '',
      args: [],
    );
  }

  /// `% de la inversión del beneficiario`
  String get beneficiaryPercentage {
    return Intl.message(
      '% de la inversión del beneficiario',
      name: 'beneficiaryPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Agrega los beneficiarios`
  String get beneficiariesTitle {
    return Intl.message(
      'Agrega los beneficiarios',
      name: 'beneficiariesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa la información de los beneficiarios a quienes deseas heredar tu cuenta UALET en caso de fallecimiento.`
  String get beneficiariesSubTitle {
    return Intl.message(
      'Ingresa la información de los beneficiarios a quienes deseas heredar tu cuenta UALET en caso de fallecimiento.',
      name: 'beneficiariesSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiario agregado`
  String get beneficiaryAdded {
    return Intl.message(
      'Beneficiario agregado',
      name: 'beneficiaryAdded',
      desc: '',
      args: [],
    );
  }

  /// `Has completado el proceso con éxito. Ya puedes seguir ahorrando.`
  String get beneficiaryPopupSubtitle {
    return Intl.message(
      'Has completado el proceso con éxito. Ya puedes seguir ahorrando.',
      name: 'beneficiaryPopupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ingrese un valor superior a $10.000`
  String get errorFeeLowerThanMin {
    return Intl.message(
      'Ingrese un valor superior a \$10.000',
      name: 'errorFeeLowerThanMin',
      desc: '',
      args: [],
    );
  }

  /// `Ingrese un valor superior a $100.00`
  String get errorFeeLowerThanMinMx {
    return Intl.message(
      'Ingrese un valor superior a \$100.00',
      name: 'errorFeeLowerThanMinMx',
      desc: '',
      args: [],
    );
  }

  /// `Ingrese un valor`
  String get errorAmountIsZero {
    return Intl.message(
      'Ingrese un valor',
      name: 'errorAmountIsZero',
      desc: '',
      args: [],
    );
  }

  /// `Prueba de Vida`
  String get regulationTextVideoRecordingTitle {
    return Intl.message(
      'Prueba de Vida',
      name: 'regulationTextVideoRecordingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Por temas de regulación vamos a grabar tu rostro por unos segundos, también grabaremos tu voz por lo que deberás mencionar tu nombre y apellidos completos y finalmente deberás mostrar tu INE/IFE en el video por el frente y por el reverso.`
  String get regulationTextVideoRecording {
    return Intl.message(
      'Por temas de regulación vamos a grabar tu rostro por unos segundos, también grabaremos tu voz por lo que deberás mencionar tu nombre y apellidos completos y finalmente deberás mostrar tu INE/IFE en el video por el frente y por el reverso.',
      name: 'regulationTextVideoRecording',
      desc: '',
      args: [],
    );
  }

  /// `https://www.skandia.com.mx/aviso-de-privacidad/Paginas/Aviso-de-Privacidad-skandia-Operadora.aspx`
  String get urlMediosElectronicos {
    return Intl.message(
      'https://www.skandia.com.mx/aviso-de-privacidad/Paginas/Aviso-de-Privacidad-skandia-Operadora.aspx',
      name: 'urlMediosElectronicos',
      desc: '',
      args: [],
    );
  }

  /// `Instrucciones`
  String get instructions {
    return Intl.message(
      'Instrucciones',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Por temas de regulación debemos grabar lo siguiente:`
  String get videoVerificationDesc1 {
    return Intl.message(
      'Por temas de regulación debemos grabar lo siguiente:',
      name: 'videoVerificationDesc1',
      desc: '',
      args: [],
    );
  }

  /// `1. Vamos a grabar tu rostro por unos segundos y a continuación grabaremos tu voz por lo que deberás mencionar tu nombre y apellidos completos. Es importante que le permitas a UALET grabar tu audio, pues sin esto no podremos continuar la vinculación.`
  String get videoVerificationDesc2 {
    return Intl.message(
      '1. Vamos a grabar tu rostro por unos segundos y a continuación grabaremos tu voz por lo que deberás mencionar tu nombre y apellidos completos. Es importante que le permitas a UALET grabar tu audio, pues sin esto no podremos continuar la vinculación.',
      name: 'videoVerificationDesc2',
      desc: '',
      args: [],
    );
  }

  /// `2. Deberás mostrar tu documento INE e IFE en el video por el frente y por el reverso.`
  String get videoVerificationDesc3 {
    return Intl.message(
      '2. Deberás mostrar tu documento INE e IFE en el video por el frente y por el reverso.',
      name: 'videoVerificationDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Autorizo la grabación del siguiente video para la prueba de vida y acepto el almacenamiento del material con fines regulatorios.`
  String get videoVerificationCheck {
    return Intl.message(
      'Autorizo la grabación del siguiente video para la prueba de vida y acepto el almacenamiento del material con fines regulatorios.',
      name: 'videoVerificationCheck',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar`
  String get accept {
    return Intl.message(
      'Aceptar',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Grabación rostro y voz`
  String get videoFaceAndVoice {
    return Intl.message(
      'Grabación rostro y voz',
      name: 'videoFaceAndVoice',
      desc: '',
      args: [],
    );
  }

  /// `En esta primera parte deberás grabar claramente tu rostro (no se permiten videos de otros dispositivos o sostener una imagen). Para esto deberás también mencionar tu nombre ya que grabaremos tu voz.`
  String get videoFaceSubtitle {
    return Intl.message(
      'En esta primera parte deberás grabar claramente tu rostro (no se permiten videos de otros dispositivos o sostener una imagen). Para esto deberás también mencionar tu nombre ya que grabaremos tu voz.',
      name: 'videoFaceSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Grabación de INE/IFE`
  String get videoINEIFE {
    return Intl.message(
      'Grabación de INE/IFE',
      name: 'videoINEIFE',
      desc: '',
      args: [],
    );
  }

  /// `Ahora deberás grabar tu documento INE o IFE por el frente y por el reverso.`
  String get videoINEIFESubtitle {
    return Intl.message(
      'Ahora deberás grabar tu documento INE o IFE por el frente y por el reverso.',
      name: 'videoINEIFESubtitle',
      desc: '',
      args: [],
    );
  }

  /// `INE / IFE`
  String get indexTitleSlide6 {
    return Intl.message(
      'INE / IFE',
      name: 'indexTitleSlide6',
      desc: '',
      args: [],
    );
  }

  /// `Ten listos tus documentos INE o IFE, ya que serán los únicos documentos permitidos y los necesitaremos para tu proceso de vinculación.`
  String get indexTextSlide6 {
    return Intl.message(
      'Ten listos tus documentos INE o IFE, ya que serán los únicos documentos permitidos y los necesitaremos para tu proceso de vinculación.',
      name: 'indexTextSlide6',
      desc: '',
      args: [],
    );
  }

  /// `Ubicación`
  String get geoReferencingDialogTitle {
    return Intl.message(
      'Ubicación',
      name: 'geoReferencingDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que para vincularte a Ualet debes permitir el uso de la ubicación, de lo contrario no podremos continuar con el proceso de registro. Esto se debe a unos temas regulatorios de México.`
  String get geoReferencingDialogDescription {
    return Intl.message(
      'Recuerda que para vincularte a Ualet debes permitir el uso de la ubicación, de lo contrario no podremos continuar con el proceso de registro. Esto se debe a unos temas regulatorios de México.',
      name: 'geoReferencingDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lo sentimos, no podemos vincularte a Ualet`
  String get geoReferencingMessageError {
    return Intl.message(
      'Lo sentimos, no podemos vincularte a Ualet',
      name: 'geoReferencingMessageError',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña actualizada`
  String get passwordResetDialogTitle {
    return Intl.message(
      'Contraseña actualizada',
      name: 'passwordResetDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Serás direccionado al login para iniciar sesión de nuevo.`
  String get passwordResetDialogDescription {
    return Intl.message(
      'Serás direccionado al login para iniciar sesión de nuevo.',
      name: 'passwordResetDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Vinculación fallida`
  String get dialogBlockBlackListTitle {
    return Intl.message(
      'Vinculación fallida',
      name: 'dialogBlockBlackListTitle',
      desc: '',
      args: [],
    );
  }

  /// `No podemos continuar con tu vinculación, por favor ponte en contacto con Ualet o tu banco`
  String get dialogBlockBlackListDescription {
    return Intl.message(
      'No podemos continuar con tu vinculación, por favor ponte en contacto con Ualet o tu banco',
      name: 'dialogBlockBlackListDescription',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get dialogBlockBlackListButton {
    return Intl.message(
      'Entendido',
      name: 'dialogBlockBlackListButton',
      desc: '',
      args: [],
    );
  }

  /// `No podemos continuar con tu vinculación, por favor ponte en contacto con Ualet o tu banco`
  String get blackListText {
    return Intl.message(
      'No podemos continuar con tu vinculación, por favor ponte en contacto con Ualet o tu banco',
      name: 'blackListText',
      desc: '',
      args: [],
    );
  }

  /// `vinculación fallida`
  String get blackListTextTitle {
    return Intl.message(
      'vinculación fallida',
      name: 'blackListTextTitle',
      desc: '',
      args: [],
    );
  }

  /// `Importante`
  String get popUpConfirmProfileTitle {
    return Intl.message(
      'Importante',
      name: 'popUpConfirmProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Si continuas con este perfil de inversión, no podrás cambiarlo más adelante.`
  String get popUpConfirmProfileBody {
    return Intl.message(
      'Si continuas con este perfil de inversión, no podrás cambiarlo más adelante.',
      name: 'popUpConfirmProfileBody',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get popUpConfirmProfileButtonSuccess {
    return Intl.message(
      'Continuar',
      name: 'popUpConfirmProfileButtonSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar perfil`
  String get popUpConfirmProfileButtonReject {
    return Intl.message(
      'Cambiar perfil',
      name: 'popUpConfirmProfileButtonReject',
      desc: '',
      args: [],
    );
  }

  /// `¡Hola!`
  String get introductoryPageTitle {
    return Intl.message(
      '¡Hola!',
      name: 'introductoryPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Somos Ualet, una app de`
  String get introductoryPageText1 {
    return Intl.message(
      'Somos Ualet, una app de',
      name: 'introductoryPageText1',
      desc: '',
      args: [],
    );
  }

  /// ` ahorro e inversión`
  String get introductoryPageText2 {
    return Intl.message(
      ' ahorro e inversión',
      name: 'introductoryPageText2',
      desc: '',
      args: [],
    );
  }

  /// ` que te ayuda a que tu dinero genere`
  String get introductoryPageText3 {
    return Intl.message(
      ' que te ayuda a que tu dinero genere',
      name: 'introductoryPageText3',
      desc: '',
      args: [],
    );
  }

  /// ` rentabilidad.`
  String get introductoryPageText4 {
    return Intl.message(
      ' rentabilidad.',
      name: 'introductoryPageText4',
      desc: '',
      args: [],
    );
  }

  /// `¡Empezar ahora!`
  String get onBoardingIndexTextButtonNext {
    return Intl.message(
      '¡Empezar ahora!',
      name: 'onBoardingIndexTextButtonNext',
      desc: '',
      args: [],
    );
  }

  /// `Ya tengo una cuenta `
  String get onBoardingIndexTextInfoNext {
    return Intl.message(
      'Ya tengo una cuenta ',
      name: 'onBoardingIndexTextInfoNext',
      desc: '',
      args: [],
    );
  }

  /// `Omitir   `
  String get onBoardingIndexTitleButtonHeader {
    return Intl.message(
      'Omitir   ',
      name: 'onBoardingIndexTitleButtonHeader',
      desc: '',
      args: [],
    );
  }

  /// `Vamos por partes...`
  String get onBoardingIndexTitle1 {
    return Intl.message(
      'Vamos por partes...',
      name: 'onBoardingIndexTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Primero, te conocemos bien para encontrar tu plan de inversión ideal.`
  String get onBoardingIndexText1 {
    return Intl.message(
      'Primero, te conocemos bien para encontrar tu plan de inversión ideal.',
      name: 'onBoardingIndexText1',
      desc: '',
      args: [],
    );
  }

  /// `¿Y luego?`
  String get onBoardingIndexTitle2 {
    return Intl.message(
      '¿Y luego?',
      name: 'onBoardingIndexTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Un robot experto lleva \ntu plata a los fondos de inversión más top del país.`
  String get onBoardingIndexText2 {
    return Intl.message(
      'Un robot experto lleva \ntu plata a los fondos de inversión más top del país.',
      name: 'onBoardingIndexText2',
      desc: '',
      args: [],
    );
  }

  /// `¿Es seguro?`
  String get onBoardingIndexTitle3 {
    return Intl.message(
      '¿Es seguro?',
      name: 'onBoardingIndexTitle3',
      desc: '',
      args: [],
    );
  }

  /// `¡100%! Supervisado \npor la Superintendencia Financiera de Colombia.`
  String get onBoardingIndexText3 {
    return Intl.message(
      '¡100%! Supervisado \npor la Superintendencia Financiera de Colombia.',
      name: 'onBoardingIndexText3',
      desc: '',
      args: [],
    );
  }

  /// `Muuuy sencillo`
  String get onBoardingIndexTitle4 {
    return Intl.message(
      'Muuuy sencillo',
      name: 'onBoardingIndexTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Tu única tarea: Escoger el monto \ny la opción de ahorro automático. \n¡Y listo, ya eres del parche!`
  String get onBoardingIndexText4 {
    return Intl.message(
      'Tu única tarea: Escoger el monto \ny la opción de ahorro automático. \n¡Y listo, ya eres del parche!',
      name: 'onBoardingIndexText4',
      desc: '',
      args: [],
    );
  }

  /// `Esto es UALET`
  String get onBoardingIndexTitle1Mx {
    return Intl.message(
      'Esto es UALET',
      name: 'onBoardingIndexTitle1Mx',
      desc: '',
      args: [],
    );
  }

  /// `Somos Ualet, una app de ahorro e inversión que te ayuda a que tu dinero genere rentabilidad`
  String get onBoardingIndexText1Mx {
    return Intl.message(
      'Somos Ualet, una app de ahorro e inversión que te ayuda a que tu dinero genere rentabilidad',
      name: 'onBoardingIndexText1Mx',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo?`
  String get onBoardingIndexTitle2Mx {
    return Intl.message(
      '¿Cómo?',
      name: 'onBoardingIndexTitle2Mx',
      desc: '',
      args: [],
    );
  }

  /// `Un robot experto lleva tu plata a los fondos de inversión más top del país.`
  String get onBoardingIndexText2Mx {
    return Intl.message(
      'Un robot experto lleva tu plata a los fondos de inversión más top del país.',
      name: 'onBoardingIndexText2Mx',
      desc: '',
      args: [],
    );
  }

  /// `Perfil de riesgo`
  String get onBoardingIndexTitle3Mx {
    return Intl.message(
      'Perfil de riesgo',
      name: 'onBoardingIndexTitle3Mx',
      desc: '',
      args: [],
    );
  }

  /// `Primero por medio de unas cortas preguntas, te conocemos bien para encontrar tu plan de inversión ideal.`
  String get onBoardingIndexText3Mx {
    return Intl.message(
      'Primero por medio de unas cortas preguntas, te conocemos bien para encontrar tu plan de inversión ideal.',
      name: 'onBoardingIndexText3Mx',
      desc: '',
      args: [],
    );
  }

  /// `INE / IFE`
  String get onBoardingIndexTitle4Mx {
    return Intl.message(
      'INE / IFE',
      name: 'onBoardingIndexTitle4Mx',
      desc: '',
      args: [],
    );
  }

  /// `Queremos que UALET sea un lugar seguro para tu dinero, es por ello que durante el proceso de vinculación te solicitaremos tu identificación.`
  String get onBoardingIndexText4Mx {
    return Intl.message(
      'Queremos que UALET sea un lugar seguro para tu dinero, es por ello que durante el proceso de vinculación te solicitaremos tu identificación.',
      name: 'onBoardingIndexText4Mx',
      desc: '',
      args: [],
    );
  }

  /// `¡Empieza ahora!`
  String get onBoardingIndexTitle5Mx {
    return Intl.message(
      '¡Empieza ahora!',
      name: 'onBoardingIndexTitle5Mx',
      desc: '',
      args: [],
    );
  }

  /// `Es muy sencillo. Tu única tarea: Escoger el monto y la opción de ahorro automático.`
  String get onBoardingIndexText5Mx {
    return Intl.message(
      'Es muy sencillo. Tu única tarea: Escoger el monto y la opción de ahorro automático.',
      name: 'onBoardingIndexText5Mx',
      desc: '',
      args: [],
    );
  }

  /// `Al eliminar esta cuenta se eliminaran todos los débitos automáticos asociados a ella \n\n ¿Estás seguro de eliminar esta cuenta?`
  String get descriptionTextMyWallet {
    return Intl.message(
      'Al eliminar esta cuenta se eliminaran todos los débitos automáticos asociados a ella \n\n ¿Estás seguro de eliminar esta cuenta?',
      name: 'descriptionTextMyWallet',
      desc: '',
      args: [],
    );
  }

  /// `Por favor vuelve a intentar`
  String get recordError {
    return Intl.message(
      'Por favor vuelve a intentar',
      name: 'recordError',
      desc: '',
      args: [],
    );
  }

  /// `Error en grabación`
  String get recordErrorTitle {
    return Intl.message(
      'Error en grabación',
      name: 'recordErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Proyección recalculada`
  String get goalRecalculatedVersionTwo {
    return Intl.message(
      'Proyección recalculada',
      name: 'goalRecalculatedVersionTwo',
      desc: '',
      args: [],
    );
  }

  /// `Actualiza tus datos`
  String get verifyUpdateSarlaftInfoTitle {
    return Intl.message(
      'Actualiza tus datos',
      name: 'verifyUpdateSarlaftInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Por temas regulatorios, debes actualizar tus datos ya que `
  String get verifyUpdateSarlaftInfoSubTitleOne {
    return Intl.message(
      'Por temas regulatorios, debes actualizar tus datos ya que ',
      name: 'verifyUpdateSarlaftInfoSubTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `han pasado 3 años desde la última vez que llenaste tus datos.`
  String get verifyUpdateSarlaftInfoSubTitleOneBold {
    return Intl.message(
      'han pasado 3 años desde la última vez que llenaste tus datos.',
      name: 'verifyUpdateSarlaftInfoSubTitleOneBold',
      desc: '',
      args: [],
    );
  }

  /// `Si no actualizas información no podrás seguir invirtiendo en UALET, sin embargo, si podrás hacer retiro de dinero.`
  String get verifyUpdateSarlaftInfoSubTitleTwo {
    return Intl.message(
      'Si no actualizas información no podrás seguir invirtiendo en UALET, sin embargo, si podrás hacer retiro de dinero.',
      name: 'verifyUpdateSarlaftInfoSubTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar datos financieros`
  String get verifyUpdateSarlaftInfoButtonTextPrimary {
    return Intl.message(
      'Actualizar datos financieros',
      name: 'verifyUpdateSarlaftInfoButtonTextPrimary',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar en otro momento`
  String get verifyUpdateSarlaftInfoButtonTextSecondary {
    return Intl.message(
      'Actualizar en otro momento',
      name: 'verifyUpdateSarlaftInfoButtonTextSecondary',
      desc: '',
      args: [],
    );
  }

  /// `Bloqueo por actualización de datos`
  String get verifyUpdateSarlaftInfoBlockTitle {
    return Intl.message(
      'Bloqueo por actualización de datos',
      name: 'verifyUpdateSarlaftInfoBlockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Quedarás `
  String get verifyUpdateSarlaftInfoBlockSubTitleOne {
    return Intl.message(
      'Quedarás ',
      name: 'verifyUpdateSarlaftInfoBlockSubTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `bloqueado para hacer inversiones hasta que no actualices tus datos. `
  String get verifyUpdateSarlaftInfoBlockSubTitleOneBold {
    return Intl.message(
      'bloqueado para hacer inversiones hasta que no actualices tus datos. ',
      name: 'verifyUpdateSarlaftInfoBlockSubTitleOneBold',
      desc: '',
      args: [],
    );
  }

  /// `Sin embargo, si podrás hacer retiros.`
  String get verifyUpdateSarlaftInfoBlockSubTitleOneNext {
    return Intl.message(
      'Sin embargo, si podrás hacer retiros.',
      name: 'verifyUpdateSarlaftInfoBlockSubTitleOneNext',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que para hacer tu actualización de datos debes dirigirte al menú más -> Mi cuenta -> Completar información financiera`
  String get verifyUpdateSarlaftInfoBlockSubTitleTwo {
    return Intl.message(
      'Recuerda que para hacer tu actualización de datos debes dirigirte al menú más -> Mi cuenta -> Completar información financiera',
      name: 'verifyUpdateSarlaftInfoBlockSubTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Datos actualizados`
  String get updateSarlaftSuccessTitle {
    return Intl.message(
      'Datos actualizados',
      name: 'updateSarlaftSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ya puedes volver a invertir en Ualet, gracias por actualizar tus datos.`
  String get updateSarlaftSuccessDescription {
    return Intl.message(
      'Ya puedes volver a invertir en Ualet, gracias por actualizar tus datos.',
      name: 'updateSarlaftSuccessDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cuotas`
  String get cuotes {
    return Intl.message(
      'Cuotas',
      name: 'cuotes',
      desc: '',
      args: [],
    );
  }

  /// `Registrar cuenta`
  String get registerAccount {
    return Intl.message(
      'Registrar cuenta',
      name: 'registerAccount',
      desc: '',
      args: [],
    );
  }

  /// `😅`
  String get noaccountEmoji {
    return Intl.message(
      '😅',
      name: 'noaccountEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes cuentas registradas`
  String get titleDontHaveAccount {
    return Intl.message(
      'Aún no tienes cuentas registradas',
      name: 'titleDontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Para retirar dinero de UALET debes tener al menos una cuenta registrada.`
  String get titleDontHaveAccountDescription {
    return Intl.message(
      'Para retirar dinero de UALET debes tener al menos una cuenta registrada.',
      name: 'titleDontHaveAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Pro tip: `
  String get titleDontHaveAccountDescriptionTwopro {
    return Intl.message(
      'Pro tip: ',
      name: 'titleDontHaveAccountDescriptionTwopro',
      desc: '',
      args: [],
    );
  }

  /// ` También puedes usar las cuentas registradas para programar débitos automáticos y ahorrar en grande.`
  String get titleDontHaveAccountDescriptionTwo {
    return Intl.message(
      ' También puedes usar las cuentas registradas para programar débitos automáticos y ahorrar en grande.',
      name: 'titleDontHaveAccountDescriptionTwo',
      desc: '',
      args: [],
    );
  }

  /// ` También puedes usar las cuentas registradas para programar domiciliaciones y ahorrar en grande.`
  String get titleDontHaveAccountDescriptionTwoMx {
    return Intl.message(
      ' También puedes usar las cuentas registradas para programar domiciliaciones y ahorrar en grande.',
      name: 'titleDontHaveAccountDescriptionTwoMx',
      desc: '',
      args: [],
    );
  }

  /// `El valor de la cuota no puede mayor al valor de la meta`
  String get goalvalueGreater {
    return Intl.message(
      'El valor de la cuota no puede mayor al valor de la meta',
      name: 'goalvalueGreater',
      desc: '',
      args: [],
    );
  }

  /// `Este número de documento ya se encuentra registrado en nuestra base de datos`
  String get userAlreadyRegistered {
    return Intl.message(
      'Este número de documento ya se encuentra registrado en nuestra base de datos',
      name: 'userAlreadyRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Aplicación en mantenimiento.`
  String get maintenanceTitle {
    return Intl.message(
      'Aplicación en mantenimiento.',
      name: 'maintenanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disculpa las molestias, estamos trabajando para que tengas una mejor experiencia. Vuelve mas tarde`
  String get maintenanceSubTitle {
    return Intl.message(
      'Disculpa las molestias, estamos trabajando para que tengas una mejor experiencia. Vuelve mas tarde',
      name: 'maintenanceSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes ahorros en Ualet`
  String get subTitleCardFoundsNot {
    return Intl.message(
      'Aún no tienes ahorros en Ualet',
      name: 'subTitleCardFoundsNot',
      desc: '',
      args: [],
    );
  }

  /// `Podrás ver el comportamiento de tus ahorros y metas aquí cuando agregues dinero a tu cuenta`
  String get subTitleTwoCardFoundsNot {
    return Intl.message(
      'Podrás ver el comportamiento de tus ahorros y metas aquí cuando agregues dinero a tu cuenta',
      name: 'subTitleTwoCardFoundsNot',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero`
  String get buttonCardFoundsNot {
    return Intl.message(
      'Agregar dinero',
      name: 'buttonCardFoundsNot',
      desc: '',
      args: [],
    );
  }

  /// `Tu Ahorro`
  String get yourGoalsHome {
    return Intl.message(
      'Tu Ahorro',
      name: 'yourGoalsHome',
      desc: '',
      args: [],
    );
  }

  /// `Últimos Movimientos`
  String get latestMovements {
    return Intl.message(
      'Últimos Movimientos',
      name: 'latestMovements',
      desc: '',
      args: [],
    );
  }

  /// `Crear una meta`
  String get createNewGoalHome {
    return Intl.message(
      'Crear una meta',
      name: 'createNewGoalHome',
      desc: '',
      args: [],
    );
  }

  /// `Movimientos`
  String get navHomeMovementsText {
    return Intl.message(
      'Movimientos',
      name: 'navHomeMovementsText',
      desc: '',
      args: [],
    );
  }

  /// `Opciones`
  String get navHomeMoreOptionsText {
    return Intl.message(
      'Opciones',
      name: 'navHomeMoreOptionsText',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero`
  String get addMoney {
    return Intl.message(
      'Agregar dinero',
      name: 'addMoney',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser de al menos $10.000`
  String get lowInvestmentError {
    return Intl.message(
      'El monto debe ser de al menos \$10.000',
      name: 'lowInvestmentError',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser de al menos $100.00`
  String get lowInvestmentErrorMexico {
    return Intl.message(
      'El monto debe ser de al menos \$100.00',
      name: 'lowInvestmentErrorMexico',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser de al menos $100.00`
  String get lowInvestmentErrorMx {
    return Intl.message(
      'El monto debe ser de al menos \$100.00',
      name: 'lowInvestmentErrorMx',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser máximo de $10.000.000`
  String get highInvestmentError {
    return Intl.message(
      'El monto debe ser máximo de \$10.000.000',
      name: 'highInvestmentError',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará cada 15 días calendario a partir de la fecha de inicio`
  String get periodicityMessageQuincenal {
    return Intl.message(
      'El débito automático se efectuará cada 15 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageQuincenal',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación se efectuará cada 15 días calendario a partir de la fecha de inicio`
  String get periodicityMessageQuincenalMx {
    return Intl.message(
      'La domiciliación se efectuará cada 15 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageQuincenalMx',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará cada 30 días calendario a partir de la fecha de inicio`
  String get periodicityMessageMensual {
    return Intl.message(
      'El débito automático se efectuará cada 30 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageMensual',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación se efectuará cada 30 días calendario a partir de la fecha de inicio`
  String get periodicityMessageMensualMx {
    return Intl.message(
      'La domiciliación se efectuará cada 30 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageMensualMx',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará cada 90 días calendario a partir de la fecha de inicio`
  String get periodicityMessageTrimestral {
    return Intl.message(
      'El débito automático se efectuará cada 90 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageTrimestral',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación se efectuará cada 90 días calendario a partir de la fecha de inicio`
  String get periodicityMessageTrimestralMx {
    return Intl.message(
      'La domiciliación se efectuará cada 90 días calendario a partir de la fecha de inicio',
      name: 'periodicityMessageTrimestralMx',
      desc: '',
      args: [],
    );
  }

  /// `Valor del débito`
  String get debitValue {
    return Intl.message(
      'Valor del débito',
      name: 'debitValue',
      desc: '',
      args: [],
    );
  }

  /// `Valor de la domiciliación`
  String get debitValueMx {
    return Intl.message(
      'Valor de la domiciliación',
      name: 'debitValueMx',
      desc: '',
      args: [],
    );
  }

  /// `Estas a un paso de poder invertir`
  String get introEvidenteTitle {
    return Intl.message(
      'Estas a un paso de poder invertir',
      name: 'introEvidenteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Antes de finalizar tu inversión, debes responder algunas preguntas de seguridad`
  String get introEvidenteDescription {
    return Intl.message(
      'Antes de finalizar tu inversión, debes responder algunas preguntas de seguridad',
      name: 'introEvidenteDescription',
      desc: '',
      args: [],
    );
  }

  /// `- Debes ser el titular de la cuenta a inscribir`
  String get accountRegistrationDebitSubtitle1 {
    return Intl.message(
      '- Debes ser el titular de la cuenta a inscribir',
      name: 'accountRegistrationDebitSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `- Los futuros retiros serán efectuados a la misma cuenta del débito`
  String get accountRegistrationDebitSubtitle2 {
    return Intl.message(
      '- Los futuros retiros serán efectuados a la misma cuenta del débito',
      name: 'accountRegistrationDebitSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `- Los futuros retiros serán efectuados a la misma cuenta Clabe`
  String get accountRegistrationDebitSubtitle2Mx {
    return Intl.message(
      '- Los futuros retiros serán efectuados a la misma cuenta Clabe',
      name: 'accountRegistrationDebitSubtitle2Mx',
      desc: '',
      args: [],
    );
  }

  /// `- Solo puedes inscribir una cuenta bancaria`
  String get accountRegistrationDebitSubtitle3Mx {
    return Intl.message(
      '- Solo puedes inscribir una cuenta bancaria',
      name: 'accountRegistrationDebitSubtitle3Mx',
      desc: '',
      args: [],
    );
  }

  /// `Inscribir Cuenta Bancaria`
  String get inscribeAccount {
    return Intl.message(
      'Inscribir Cuenta Bancaria',
      name: 'inscribeAccount',
      desc: '',
      args: [],
    );
  }

  /// `La inscripción de la cuenta puede tomar 3 días hábiles. Este tiempo depende de la entidad bancaria.`
  String get accountRegistrationDebitWarning {
    return Intl.message(
      'La inscripción de la cuenta puede tomar 3 días hábiles. Este tiempo depende de la entidad bancaria.',
      name: 'accountRegistrationDebitWarning',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda`
  String get addAccountDialogTitle {
    return Intl.message(
      'Recuerda',
      name: 'addAccountDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `La inscripción de la cuenta puede tomar 3 días hábiles. Este tiempo depende de la entidad bancaria.`
  String get addAccountDialogSubtitle {
    return Intl.message(
      'La inscripción de la cuenta puede tomar 3 días hábiles. Este tiempo depende de la entidad bancaria.',
      name: 'addAccountDialogSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Podrás revisar el estado de la inscripción en la pantalla de inicio.`
  String get addAccountDialogSubtitle2 {
    return Intl.message(
      'Podrás revisar el estado de la inscripción en la pantalla de inicio.',
      name: 'addAccountDialogSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Una vez inscrita tu cuenta, tu dinero se verá reflejado en el saldo global en los 2 días hábiles siguientes.`
  String get addMoneyNoAccountsMessage {
    return Intl.message(
      'Una vez inscrita tu cuenta, tu dinero se verá reflejado en el saldo global en los 2 días hábiles siguientes.',
      name: 'addMoneyNoAccountsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Una vez efectuado tu débito, el dinero se vera reflejado en tu saldo hasta en 2 días hábiles.`
  String get addMoneyAccountMessage {
    return Intl.message(
      'Una vez efectuado tu débito, el dinero se vera reflejado en tu saldo hasta en 2 días hábiles.',
      name: 'addMoneyAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Una vez efectuada la transacción, el dinero se vera reflejado en tu saldo hasta en 2 días hábiles.`
  String get addMoneyAccountMessageMx {
    return Intl.message(
      'Una vez efectuada la transacción, el dinero se vera reflejado en tu saldo hasta en 2 días hábiles.',
      name: 'addMoneyAccountMessageMx',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero`
  String get addMoneySubtitle {
    return Intl.message(
      'Agregar dinero',
      name: 'addMoneySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `2 días hábiles`
  String get businessDays {
    return Intl.message(
      '2 días hábiles',
      name: 'businessDays',
      desc: '',
      args: [],
    );
  }

  /// `Para hacer efectivo tu débito automático primero debemos inscribir la cuenta y luego ejecutar el débito.`
  String get rememberDialogFinish {
    return Intl.message(
      'Para hacer efectivo tu débito automático primero debemos inscribir la cuenta y luego ejecutar el débito.',
      name: 'rememberDialogFinish',
      desc: '',
      args: [],
    );
  }

  /// `Para hacer efectivo tu domiciliación primero debemos inscribir la cuenta y luego ejecutar la domiciliación.`
  String get rememberDialogFinishMx {
    return Intl.message(
      'Para hacer efectivo tu domiciliación primero debemos inscribir la cuenta y luego ejecutar la domiciliación.',
      name: 'rememberDialogFinishMx',
      desc: '',
      args: [],
    );
  }

  /// `2 días hábiles`
  String get twoDays {
    return Intl.message(
      '2 días hábiles',
      name: 'twoDays',
      desc: '',
      args: [],
    );
  }

  /// `3 días hábiles`
  String get threeDays {
    return Intl.message(
      '3 días hábiles',
      name: 'threeDays',
      desc: '',
      args: [],
    );
  }

  /// `5 días hábiles`
  String get fiveDays {
    return Intl.message(
      '5 días hábiles',
      name: 'fiveDays',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que la transacción PSE puede tomar hasta 1 día hábil en verse reflejada en el saldo global.`
  String get pseTimeDialogDescription1 {
    return Intl.message(
      'Recuerda que la transacción PSE puede tomar hasta 1 día hábil en verse reflejada en el saldo global.',
      name: 'pseTimeDialogDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que la transacción de transferencia interbancaria puede tomar hasta 1 día hábil en verse reflejada en el saldo global.`
  String get pseTimeDialogDescription1Mx {
    return Intl.message(
      'Recuerda que la transacción de transferencia interbancaria puede tomar hasta 1 día hábil en verse reflejada en el saldo global.',
      name: 'pseTimeDialogDescription1Mx',
      desc: '',
      args: [],
    );
  }

  /// `Podrás revisar el estado del abono desde el home.`
  String get pseTimeDialogDescription2 {
    return Intl.message(
      'Podrás revisar el estado del abono desde el home.',
      name: 'pseTimeDialogDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Solo nos queda ingresar a tu banco a través de PSE para finalizar la transacción.`
  String get almostPSEDescription {
    return Intl.message(
      'Solo nos queda ingresar a tu banco a través de PSE para finalizar la transacción.',
      name: 'almostPSEDescription',
      desc: '',
      args: [],
    );
  }

  /// `Solo nos queda ingresar a tu banco a través de transferencia interbancaria para finalizar la transacción.`
  String get almostPSEDescriptionMx {
    return Intl.message(
      'Solo nos queda ingresar a tu banco a través de transferencia interbancaria para finalizar la transacción.',
      name: 'almostPSEDescriptionMx',
      desc: '',
      args: [],
    );
  }

  /// `Ir a PSE`
  String get almostPSEButton {
    return Intl.message(
      'Ir a PSE',
      name: 'almostPSEButton',
      desc: '',
      args: [],
    );
  }

  /// `Ir a Transferencia Interbancaria`
  String get almostPSEButtonMx {
    return Intl.message(
      'Ir a Transferencia Interbancaria',
      name: 'almostPSEButtonMx',
      desc: '',
      args: [],
    );
  }

  /// `El valor total de tu inversión puede tomar hasta 1 día hábil en verse reflejado en tu saldo.`
  String get pseSummaryDescription {
    return Intl.message(
      'El valor total de tu inversión puede tomar hasta 1 día hábil en verse reflejado en tu saldo.',
      name: 'pseSummaryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dinero PSE`
  String get pseMovementTitle {
    return Intl.message(
      'Agregar dinero PSE',
      name: 'pseMovementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Dinero Transferencia Interbancaria`
  String get pseMovementTitleMx {
    return Intl.message(
      'Agregar Dinero Transferencia Interbancaria',
      name: 'pseMovementTitleMx',
      desc: '',
      args: [],
    );
  }

  /// `Registrar nueva cuenta`
  String get registerNewAccount {
    return Intl.message(
      'Registrar nueva cuenta',
      name: 'registerNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que la transacción por PSE puede tomar hasta 1 día hábil en verse reflejada en el saldo global.`
  String get pseWarningDialogDescription1 {
    return Intl.message(
      'Recuerda que la transacción por PSE puede tomar hasta 1 día hábil en verse reflejada en el saldo global.',
      name: 'pseWarningDialogDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda que la transacción por Transferencia Interbancaria puede tomar hasta 1 día hábil en verse reflejada en el saldo global.`
  String get pseWarningDialogDescription1Mx {
    return Intl.message(
      'Recuerda que la transacción por Transferencia Interbancaria puede tomar hasta 1 día hábil en verse reflejada en el saldo global.',
      name: 'pseWarningDialogDescription1Mx',
      desc: '',
      args: [],
    );
  }

  /// `Podrás revisar el estado del abono desde el home.`
  String get pseWarningDialogDescription2 {
    return Intl.message(
      'Podrás revisar el estado del abono desde el home.',
      name: 'pseWarningDialogDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Experiencia de inversión simplificada`
  String get sliderIntroductoryMigrationOneTitle {
    return Intl.message(
      'Experiencia de inversión simplificada',
      name: 'sliderIntroductoryMigrationOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ahora podrás hacer abonos de dinero o retiros sin necesidad de tener una meta. Podrás hacerlo de forma más sencilla, ya que ahora las metas serán opcionales.`
  String get sliderIntroductoryMigrationOneSubtitle {
    return Intl.message(
      'Ahora podrás hacer abonos de dinero o retiros sin necesidad de tener una meta. Podrás hacerlo de forma más sencilla, ya que ahora las metas serán opcionales.',
      name: 'sliderIntroductoryMigrationOneSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Planifica tus metas`
  String get sliderIntroductoryMigrationTwoTitle {
    return Intl.message(
      'Planifica tus metas',
      name: 'sliderIntroductoryMigrationTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Podrás crear metas que te ayuden a llegar más rápido a tus objetivos de ahorro e inversión. `
  String get sliderIntroductoryMigrationTwoSubtitle {
    return Intl.message(
      'Podrás crear metas que te ayuden a llegar más rápido a tus objetivos de ahorro e inversión. ',
      name: 'sliderIntroductoryMigrationTwoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Visualiza la distribución de tu dinero`
  String get sliderIntroductoryMigrationThreeTitle {
    return Intl.message(
      'Visualiza la distribución de tu dinero',
      name: 'sliderIntroductoryMigrationThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Podrás conocer exactamente cómo está distribuido tu dinero desde el home, para mayor control de tu cuenta Ualet.`
  String get sliderIntroductoryMigrationThreeSubtitle {
    return Intl.message(
      'Podrás conocer exactamente cómo está distribuido tu dinero desde el home, para mayor control de tu cuenta Ualet.',
      name: 'sliderIntroductoryMigrationThreeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Todas tus transacciones a la vista`
  String get sliderIntroductoryMigrationFourTitle {
    return Intl.message(
      'Todas tus transacciones a la vista',
      name: 'sliderIntroductoryMigrationFourTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tendrás mayor visibilidad de los movimientos transaccionales en proceso tales como inversión, retiro e inscripción de cuentas, para que conozcas los tiempos exactos de cada una. Todo desde la pantalla de inicio.`
  String get sliderIntroductoryMigrationFourSubtitle {
    return Intl.message(
      'Tendrás mayor visibilidad de los movimientos transaccionales en proceso tales como inversión, retiro e inscripción de cuentas, para que conozcas los tiempos exactos de cada una. Todo desde la pantalla de inicio.',
      name: 'sliderIntroductoryMigrationFourSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Finalizar`
  String get endProcess {
    return Intl.message(
      'Finalizar',
      name: 'endProcess',
      desc: '',
      args: [],
    );
  }

  /// `Editar`
  String get edit {
    return Intl.message(
      'Editar',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar`
  String get delete {
    return Intl.message(
      'Eliminar',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Finalizar`
  String get transfer {
    return Intl.message(
      'Finalizar',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Recuerda`
  String get remember {
    return Intl.message(
      'Recuerda',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Dinero sin asignar`
  String get moneyNotAssignInBalance {
    return Intl.message(
      'Dinero sin asignar',
      name: 'moneyNotAssignInBalance',
      desc: '',
      args: [],
    );
  }

  /// `Asignar`
  String get asign {
    return Intl.message(
      'Asignar',
      name: 'asign',
      desc: '',
      args: [],
    );
  }

  /// `¿Desde donde quieres asignar el dinero?`
  String get assignToGoal {
    return Intl.message(
      '¿Desde donde quieres asignar el dinero?',
      name: 'assignToGoal',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona de donde quieres asignar el dinero a esta meta`
  String get assignDialogSubtitle {
    return Intl.message(
      'Selecciona de donde quieres asignar el dinero a esta meta',
      name: 'assignDialogSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Dinero sin asignar`
  String get unAssignBalance {
    return Intl.message(
      'Dinero sin asignar',
      name: 'unAssignBalance',
      desc: '',
      args: [],
    );
  }

  /// `Puedes asignar minimo $10.000`
  String get assignErrorLow {
    return Intl.message(
      'Puedes asignar minimo \$10.000',
      name: 'assignErrorLow',
      desc: '',
      args: [],
    );
  }

  /// `Puedes asignar minimo $100.00`
  String get assignErrorLowMx {
    return Intl.message(
      'Puedes asignar minimo \$100.00',
      name: 'assignErrorLowMx',
      desc: '',
      args: [],
    );
  }

  /// `No puedes asignar un monto superior al saldo que tienes disponible`
  String get assignErrorHigh {
    return Intl.message(
      'No puedes asignar un monto superior al saldo que tienes disponible',
      name: 'assignErrorHigh',
      desc: '',
      args: [],
    );
  }

  /// `Estado de tus metas`
  String get goalState {
    return Intl.message(
      'Estado de tus metas',
      name: 'goalState',
      desc: '',
      args: [],
    );
  }

  /// `Asignación Existosa`
  String get assignedSuccessTitle {
    return Intl.message(
      'Asignación Existosa',
      name: 'assignedSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `La transferencia de meta a meta ha sido exitosa.`
  String get assignedSuccessGoalToGoal {
    return Intl.message(
      'La transferencia de meta a meta ha sido exitosa.',
      name: 'assignedSuccessGoalToGoal',
      desc: '',
      args: [],
    );
  }

  /// `La transferencia desde dinero sin asignar a la meta ha sido exitosa`
  String get assignedSuccessBalanceToGoal {
    return Intl.message(
      'La transferencia desde dinero sin asignar a la meta ha sido exitosa',
      name: 'assignedSuccessBalanceToGoal',
      desc: '',
      args: [],
    );
  }

  /// `Asignación`
  String get assignation {
    return Intl.message(
      'Asignación',
      name: 'assignation',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar emoji`
  String get changeEmoji {
    return Intl.message(
      'Cambiar emoji',
      name: 'changeEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Valor de cada cuota`
  String get feeTextHint {
    return Intl.message(
      'Valor de cada cuota',
      name: 'feeTextHint',
      desc: '',
      args: [],
    );
  }

  /// `La cuota minima es de $10.000`
  String get editGoalMinFee {
    return Intl.message(
      'La cuota minima es de \$10.000',
      name: 'editGoalMinFee',
      desc: '',
      args: [],
    );
  }

  /// `La cuota minima es de $100.00`
  String get editGoalMinFeeMx {
    return Intl.message(
      'La cuota minima es de \$100.00',
      name: 'editGoalMinFeeMx',
      desc: '',
      args: [],
    );
  }

  /// `Cambios guardados con éxito`
  String get toastEditGoalSuccess {
    return Intl.message(
      'Cambios guardados con éxito',
      name: 'toastEditGoalSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Haz realizado modificaciones a tu meta:`
  String get editGoalDialog {
    return Intl.message(
      'Haz realizado modificaciones a tu meta:',
      name: 'editGoalDialog',
      desc: '',
      args: [],
    );
  }

  /// `Proyección`
  String get project {
    return Intl.message(
      'Proyección',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `Sí, eliminar meta`
  String get deleteGoalButton {
    return Intl.message(
      'Sí, eliminar meta',
      name: 'deleteGoalButton',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de eliminar esta meta?`
  String get deleteGoalQuestion {
    return Intl.message(
      '¿Estás seguro de eliminar esta meta?',
      name: 'deleteGoalQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Si eliminas esta meta el dinero se transferirá automáticamente a Dinero sin asignar.`
  String get deleteGoalDisclaimer {
    return Intl.message(
      'Si eliminas esta meta el dinero se transferirá automáticamente a Dinero sin asignar.',
      name: 'deleteGoalDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `En proceso`
  String get inProgress {
    return Intl.message(
      'En proceso',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona un emoji`
  String get selectEmoji {
    return Intl.message(
      'Selecciona un emoji',
      name: 'selectEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Valor de cada cuota`
  String get valueEveryCoute {
    return Intl.message(
      'Valor de cada cuota',
      name: 'valueEveryCoute',
      desc: '',
      args: [],
    );
  }

  /// `El débito automático se efectuará en esta misma fecha todos los meses.`
  String get dateInversionDisclaimer {
    return Intl.message(
      'El débito automático se efectuará en esta misma fecha todos los meses.',
      name: 'dateInversionDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `La domiciliación se efectuará en esta misma fecha todos los meses.`
  String get dateInversionDisclaimerMx {
    return Intl.message(
      'La domiciliación se efectuará en esta misma fecha todos los meses.',
      name: 'dateInversionDisclaimerMx',
      desc: '',
      args: [],
    );
  }

  /// `Inversión Sugerida`
  String get sugestedInvestmentTitle {
    return Intl.message(
      'Inversión Sugerida',
      name: 'sugestedInvestmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Para empezar a invertir en Ualet te sugerimos iniciar con $250.000.`
  String get sugestedInvestmentMessage1 {
    return Intl.message(
      'Para empezar a invertir en Ualet te sugerimos iniciar con \$250.000.',
      name: 'sugestedInvestmentMessage1',
      desc: '',
      args: [],
    );
  }

  /// `Para empezar a invertir en Ualet te sugerimos iniciar con $100.00.`
  String get sugestedInvestmentMessageMx {
    return Intl.message(
      'Para empezar a invertir en Ualet te sugerimos iniciar con \$100.00.',
      name: 'sugestedInvestmentMessageMx',
      desc: '',
      args: [],
    );
  }

  /// `A continuación verás la pantalla de inversión donde podrás empezar a invertir a través de un "Débito automático" con tu entidad bancaria o PSE.`
  String get sugestedInvestmentMessage2 {
    return Intl.message(
      'A continuación verás la pantalla de inversión donde podrás empezar a invertir a través de un "Débito automático" con tu entidad bancaria o PSE.',
      name: 'sugestedInvestmentMessage2',
      desc: '',
      args: [],
    );
  }

  /// `A continuación verás la pantalla de inversión donde podrás empezar a invertir a través de una "Domiciliación" con tu entidad bancaria o una transferencia interbancaria.`
  String get sugestedInvestmentMessage2Mx {
    return Intl.message(
      'A continuación verás la pantalla de inversión donde podrás empezar a invertir a través de una "Domiciliación" con tu entidad bancaria o una transferencia interbancaria.',
      name: 'sugestedInvestmentMessage2Mx',
      desc: '',
      args: [],
    );
  }

  /// `Ten en cuenta que el valor que te sugerimos podrás cambiarlo, no es una camisa de fuerza 👔.`
  String get sugestedInvestmentMessage3 {
    return Intl.message(
      'Ten en cuenta que el valor que te sugerimos podrás cambiarlo, no es una camisa de fuerza 👔.',
      name: 'sugestedInvestmentMessage3',
      desc: '',
      args: [],
    );
  }

  /// `Valor del débito (Puedes cambiar el valor)`
  String get hintValueDebit {
    return Intl.message(
      'Valor del débito (Puedes cambiar el valor)',
      name: 'hintValueDebit',
      desc: '',
      args: [],
    );
  }

  /// `Valor de la domiciliación (Puedes cambiar el valor)`
  String get hintValueDebitMx {
    return Intl.message(
      'Valor de la domiciliación (Puedes cambiar el valor)',
      name: 'hintValueDebitMx',
      desc: '',
      args: [],
    );
  }

  /// `Inversión (Puedes cambiar el valor)`
  String get hintValuePSERegister {
    return Intl.message(
      'Inversión (Puedes cambiar el valor)',
      name: 'hintValuePSERegister',
      desc: '',
      args: [],
    );
  }

  /// `Inversión (Puedes cambiar el valor)`
  String get hintValuePSE {
    return Intl.message(
      'Inversión (Puedes cambiar el valor)',
      name: 'hintValuePSE',
      desc: '',
      args: [],
    );
  }

  /// `El valor de la cuota no puede ser mayor al valor de tu meta.`
  String get errorFeeHigh {
    return Intl.message(
      'El valor de la cuota no puede ser mayor al valor de tu meta.',
      name: 'errorFeeHigh',
      desc: '',
      args: [],
    );
  }

  /// `El retiro no puede ser mayor al saldo actual.`
  String get messageErrorRetire {
    return Intl.message(
      'El retiro no puede ser mayor al saldo actual.',
      name: 'messageErrorRetire',
      desc: '',
      args: [],
    );
  }

  /// `Debes dejar $ 11.600 que corresponden a $ 10.000 de inversión mínima y $ 1.600 del costo transaccional`
  String get minimunMessageRetire {
    return Intl.message(
      'Debes dejar \$ 11.600 que corresponden a \$ 10.000 de inversión mínima y \$ 1.600 del costo transaccional',
      name: 'minimunMessageRetire',
      desc: '',
      args: [],
    );
  }

  /// `Debes dejar $ 110.00 que corresponden a $ 100.00 de inversión mínima y $ 10.00 del costo transaccional`
  String get minimunMessageRetireMx {
    return Intl.message(
      'Debes dejar \$ 110.00 que corresponden a \$ 100.00 de inversión mínima y \$ 10.00 del costo transaccional',
      name: 'minimunMessageRetireMx',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get understand {
    return Intl.message(
      'Entendido',
      name: 'understand',
      desc: '',
      args: [],
    );
  }

  /// `Valor a retirar`
  String get valueToRetire {
    return Intl.message(
      'Valor a retirar',
      name: 'valueToRetire',
      desc: '',
      args: [],
    );
  }

  /// `Esta cuenta está relacionada con un débito automático, al eliminar la cuenta tu débito también se eliminará.`
  String get deleteAccountAsociatedSingle {
    return Intl.message(
      'Esta cuenta está relacionada con un débito automático, al eliminar la cuenta tu débito también se eliminará.',
      name: 'deleteAccountAsociatedSingle',
      desc: '',
      args: [],
    );
  }

  /// `Esta cuenta está relacionada con varios débitos automáticos, al eliminar la cuenta tus débitos también se eliminarán.`
  String get deleteAccountAsociatedMultiple {
    return Intl.message(
      'Esta cuenta está relacionada con varios débitos automáticos, al eliminar la cuenta tus débitos también se eliminarán.',
      name: 'deleteAccountAsociatedMultiple',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de eliminar la cuenta?`
  String get deleteAccountDescription2 {
    return Intl.message(
      '¿Estás seguro de eliminar la cuenta?',
      name: 'deleteAccountDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Tu dinero ingresará a tu saldo UALET en 2 días hábiles después de la fecha de inicio del débito.`
  String get editDebitDialogText1 {
    return Intl.message(
      'Tu dinero ingresará a tu saldo UALET en 2 días hábiles después de la fecha de inicio del débito.',
      name: 'editDebitDialogText1',
      desc: '',
      args: [],
    );
  }

  /// `Tu dinero ingresará a tu saldo UALET en 2 días hábiles después de la fecha de inicio de la domiciliación.`
  String get editDebitDialogText1Mx {
    return Intl.message(
      'Tu dinero ingresará a tu saldo UALET en 2 días hábiles después de la fecha de inicio de la domiciliación.',
      name: 'editDebitDialogText1Mx',
      desc: '',
      args: [],
    );
  }

  /// `Podrás ver esta transacción en la pantalla de home en mis últimos movimientos como "Edición del débito".`
  String get editDebitDialogText2 {
    return Intl.message(
      'Podrás ver esta transacción en la pantalla de home en mis últimos movimientos como "Edición del débito".',
      name: 'editDebitDialogText2',
      desc: '',
      args: [],
    );
  }

  /// `Podrás ver esta transacción en la pantalla de home en mis últimos movimientos como "Edición de la domiciliación".`
  String get editDebitDialogText2Mx {
    return Intl.message(
      'Podrás ver esta transacción en la pantalla de home en mis últimos movimientos como "Edición de la domiciliación".',
      name: 'editDebitDialogText2Mx',
      desc: '',
      args: [],
    );
  }

  /// `Esta operación tomará 5 días hábiles en verse reflejada en tu cuenta bancaria`
  String get questionPartialValue {
    return Intl.message(
      'Esta operación tomará 5 días hábiles en verse reflejada en tu cuenta bancaria',
      name: 'questionPartialValue',
      desc: '',
      args: [],
    );
  }

  /// `Tu retiro ha sido exitoso. La transferencia puede tomar hasta 5 días hábiles en verse reflejada en tu cuenta`
  String get bankTransferAlmostDescriptionv2 {
    return Intl.message(
      'Tu retiro ha sido exitoso. La transferencia puede tomar hasta 5 días hábiles en verse reflejada en tu cuenta',
      name: 'bankTransferAlmostDescriptionv2',
      desc: '',
      args: [],
    );
  }

  /// `El retiro de tu dinero puede tomar hasta 7 días hábiles en verse reflejado en tu cuenta bancaria.`
  String get withdrawFinishText {
    return Intl.message(
      'El retiro de tu dinero puede tomar hasta 7 días hábiles en verse reflejado en tu cuenta bancaria.',
      name: 'withdrawFinishText',
      desc: '',
      args: [],
    );
  }

  /// `Estado de tus metas`
  String get withdrawalSummaryGoalsv2 {
    return Intl.message(
      'Estado de tus metas',
      name: 'withdrawalSummaryGoalsv2',
      desc: '',
      args: [],
    );
  }

  /// `¿Seguirás con tus metas?`
  String get questionFollowGoals {
    return Intl.message(
      '¿Seguirás con tus metas?',
      name: 'questionFollowGoals',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar tus metas creadas en UALET?`
  String get questionFollowGoalsText {
    return Intl.message(
      '¿Quieres eliminar tus metas creadas en UALET?',
      name: 'questionFollowGoalsText',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar los débitos automáticos que tienes actualmente en UALET?`
  String get deletedebitstext {
    return Intl.message(
      '¿Quieres eliminar los débitos automáticos que tienes actualmente en UALET?',
      name: 'deletedebitstext',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres eliminar las domiciliaciones que tienes actualmente en UALET?`
  String get deletedebitstextMx {
    return Intl.message(
      '¿Quieres eliminar las domiciliaciones que tienes actualmente en UALET?',
      name: 'deletedebitstextMx',
      desc: '',
      args: [],
    );
  }

  /// `Metas eliminadas`
  String get goalsdeleted {
    return Intl.message(
      'Metas eliminadas',
      name: 'goalsdeleted',
      desc: '',
      args: [],
    );
  }

  /// `Retiro`
  String get isValidPopUpAccountPendingTitleR {
    return Intl.message(
      'Retiro',
      name: 'isValidPopUpAccountPendingTitleR',
      desc: '',
      args: [],
    );
  }

  /// `El dinero será retirado de:`
  String get retiredGoals {
    return Intl.message(
      'El dinero será retirado de:',
      name: 'retiredGoals',
      desc: '',
      args: [],
    );
  }

  /// `Inversión`
  String get isValidPopUpAccountPendingTitleI {
    return Intl.message(
      'Inversión',
      name: 'isValidPopUpAccountPendingTitleI',
      desc: '',
      args: [],
    );
  }

  /// `Ten presente que esta cuenta está en proceso de inscripción y puede tardar hasta 3 días hábiles desde que la inscribiste`
  String get isValidPopUpAccountPendingDescription {
    return Intl.message(
      'Ten presente que esta cuenta está en proceso de inscripción y puede tardar hasta 3 días hábiles desde que la inscribiste',
      name: 'isValidPopUpAccountPendingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get isValidPopUpAccountPendingButton {
    return Intl.message(
      'Entendido',
      name: 'isValidPopUpAccountPendingButton',
      desc: '',
      args: [],
    );
  }

  /// `Entrevista`
  String get entrevistaTitle {
    return Intl.message(
      'Entrevista',
      name: 'entrevistaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Para poder continuar, `
  String get entrevistaSubTitle {
    return Intl.message(
      'Para poder continuar, ',
      name: 'entrevistaSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `por regulación, es necesario realizar una Video Conferencia `
  String get entrevistaSubTitleBold {
    return Intl.message(
      'por regulación, es necesario realizar una Video Conferencia ',
      name: 'entrevistaSubTitleBold',
      desc: '',
      args: [],
    );
  }

  /// `para validar tu información personal. `
  String get entrevistaSubTitle2 {
    return Intl.message(
      'para validar tu información personal. ',
      name: 'entrevistaSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Puedes continuar con tu proceso de inversión y registro, al finalizar la Video Conferencia.`
  String get entrevistaDescription {
    return Intl.message(
      'Puedes continuar con tu proceso de inversión y registro, al finalizar la Video Conferencia.',
      name: 'entrevistaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Agendar cita virtual`
  String get entrevistaButton {
    return Intl.message(
      'Agendar cita virtual',
      name: 'entrevistaButton',
      desc: '',
      args: [],
    );
  }

  /// `Video de validación`
  String get videoValidation {
    return Intl.message(
      'Video de validación',
      name: 'videoValidation',
      desc: '',
      args: [],
    );
  }

  /// `Por seguridad vas a tener `
  String get textHelperSecutiryVideo1 {
    return Intl.message(
      'Por seguridad vas a tener ',
      name: 'textHelperSecutiryVideo1',
      desc: '',
      args: [],
    );
  }

  /// ` 10 segundos para registrar en video tu documento de identidad y rostro.`
  String get textHelperSecutiryVideo2 {
    return Intl.message(
      ' 10 segundos para registrar en video tu documento de identidad y rostro.',
      name: 'textHelperSecutiryVideo2',
      desc: '',
      args: [],
    );
  }

  /// `Paso 1: `
  String get stepOneVideo {
    return Intl.message(
      'Paso 1: ',
      name: 'stepOneVideo',
      desc: '',
      args: [],
    );
  }

  /// `Muestra tu cédula por el frente y el reverso de la camara`
  String get stepOneVideoText {
    return Intl.message(
      'Muestra tu cédula por el frente y el reverso de la camara',
      name: 'stepOneVideoText',
      desc: '',
      args: [],
    );
  }

  /// `Paso 2: `
  String get stepTwoVideo {
    return Intl.message(
      'Paso 2: ',
      name: 'stepTwoVideo',
      desc: '',
      args: [],
    );
  }

  /// `Muestra tu rostro a la cámara`
  String get stepTwoVideoText {
    return Intl.message(
      'Muestra tu rostro a la cámara',
      name: 'stepTwoVideoText',
      desc: '',
      args: [],
    );
  }

  /// `Registrar video`
  String get registerVideo {
    return Intl.message(
      'Registrar video',
      name: 'registerVideo',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancelVideo {
    return Intl.message(
      'Cancelar',
      name: 'cancelVideo',
      desc: '',
      args: [],
    );
  }

  /// `Enviar video`
  String get sendVideo {
    return Intl.message(
      'Enviar video',
      name: 'sendVideo',
      desc: '',
      args: [],
    );
  }

  /// `Para continuar es necesario que repitas el video de validación`
  String get sendVideoError {
    return Intl.message(
      'Para continuar es necesario que repitas el video de validación',
      name: 'sendVideoError',
      desc: '',
      args: [],
    );
  }

  /// `Se ha presentado un error durante la grabación`
  String get sendVideoErrorTitle {
    return Intl.message(
      'Se ha presentado un error durante la grabación',
      name: 'sendVideoErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Grabar video de nuevo`
  String get recordVideoAgain {
    return Intl.message(
      'Grabar video de nuevo',
      name: 'recordVideoAgain',
      desc: '',
      args: [],
    );
  }

  /// `No lograste pasar los estándares de aceptación en el video, es necesario repetirlo.`
  String get recordVideoAgainError {
    return Intl.message(
      'No lograste pasar los estándares de aceptación en el video, es necesario repetirlo.',
      name: 'recordVideoAgainError',
      desc: '',
      args: [],
    );
  }

  /// `Video de validación fallido`
  String get recordVideoAgainErrorTitle {
    return Intl.message(
      'Video de validación fallido',
      name: 'recordVideoAgainErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ha comenzado la grabación del video`
  String get startRecordMessage {
    return Intl.message(
      'Ha comenzado la grabación del video',
      name: 'startRecordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Comenzar grabación`
  String get startVideoRecording {
    return Intl.message(
      'Comenzar grabación',
      name: 'startVideoRecording',
      desc: '',
      args: [],
    );
  }

  /// `Reintentar grabación`
  String get retryVideoRecording {
    return Intl.message(
      'Reintentar grabación',
      name: 'retryVideoRecording',
      desc: '',
      args: [],
    );
  }

  /// `Familiares o socios PEP`
  String get pepTitle {
    return Intl.message(
      'Familiares o socios PEP',
      name: 'pepTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Eres considerado PEP nacional, extranjero o de organizaciones internacionales?`
  String get pepText1 {
    return Intl.message(
      '¿Eres considerado PEP nacional, extranjero o de organizaciones internacionales?',
      name: 'pepText1',
      desc: '',
      args: [],
    );
  }

  /// `¿Mi cónyuge o algún familiar (Abuelo, hermanos, padres, hijos, nietos) es considerado PEP nacional, extranjero o de organizaciones internacionales?`
  String get pepText2 {
    return Intl.message(
      '¿Mi cónyuge o algún familiar (Abuelo, hermanos, padres, hijos, nietos) es considerado PEP nacional, extranjero o de organizaciones internacionales?',
      name: 'pepText2',
      desc: '',
      args: [],
    );
  }

  /// `¿Eres socio o propietario de una empresa en donde hay un PEP como socio o dueño? Donde el PEP tiene más del 5% de participación en la empresa. `
  String get pepText3 {
    return Intl.message(
      '¿Eres socio o propietario de una empresa en donde hay un PEP como socio o dueño? Donde el PEP tiene más del 5% de participación en la empresa. ',
      name: 'pepText3',
      desc: '',
      args: [],
    );
  }

  /// `¿Realizas operaciones en otra moneda? `
  String get pepText4 {
    return Intl.message(
      '¿Realizas operaciones en otra moneda? ',
      name: 'pepText4',
      desc: '',
      args: [],
    );
  }

  /// `¿Pagas impuestos en un país distinto a Colombia?`
  String get pepText5 {
    return Intl.message(
      '¿Pagas impuestos en un país distinto a Colombia?',
      name: 'pepText5',
      desc: '',
      args: [],
    );
  }

  /// `¿Recibes pagos desde EEUU?`
  String get pepText6 {
    return Intl.message(
      '¿Recibes pagos desde EEUU?',
      name: 'pepText6',
      desc: '',
      args: [],
    );
  }

  /// `¿Recibes ingresos por propiedades es EEUU?`
  String get pepText7 {
    return Intl.message(
      '¿Recibes ingresos por propiedades es EEUU?',
      name: 'pepText7',
      desc: '',
      args: [],
    );
  }

  /// `¿Has permanecido más de 183 días seguidos en los últimos 3 años en los EEUU?`
  String get pepText8 {
    return Intl.message(
      '¿Has permanecido más de 183 días seguidos en los últimos 3 años en los EEUU?',
      name: 'pepText8',
      desc: '',
      args: [],
    );
  }

  /// `¿Eres ciudadano o residente  de EEUU?`
  String get pepText9 {
    return Intl.message(
      '¿Eres ciudadano o residente  de EEUU?',
      name: 'pepText9',
      desc: '',
      args: [],
    );
  }

  /// `¿Tienes familiares PEP en el extranjero?`
  String get pepText11 {
    return Intl.message(
      '¿Tienes familiares PEP en el extranjero?',
      name: 'pepText11',
      desc: '',
      args: [],
    );
  }

  /// `¿Como PEP Existen cuentas  financieras en algún país extranjero donde tenga derecho o poder de firma?`
  String get pepText10 {
    return Intl.message(
      '¿Como PEP Existen cuentas  financieras en algún país extranjero donde tenga derecho o poder de firma?',
      name: 'pepText10',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de documento`
  String get documentTypePep {
    return Intl.message(
      'Tipo de documento',
      name: 'documentTypePep',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de parentesco`
  String get parentTypePep {
    return Intl.message(
      'Tipo de parentesco',
      name: 'parentTypePep',
      desc: '',
      args: [],
    );
  }

  /// `País`
  String get countryPep {
    return Intl.message(
      'País',
      name: 'countryPep',
      desc: '',
      args: [],
    );
  }

  /// `# de identificación de la persona jurídica`
  String get juridicPerson {
    return Intl.message(
      '# de identificación de la persona jurídica',
      name: 'juridicPerson',
      desc: '',
      args: [],
    );
  }

  /// `Número de RFC`
  String get rfcText {
    return Intl.message(
      'Número de RFC',
      name: 'rfcText',
      desc: '',
      args: [],
    );
  }

  /// `Verificar la extensión del archivo`
  String get errorExtension {
    return Intl.message(
      'Verificar la extensión del archivo',
      name: 'errorExtension',
      desc: '',
      args: [],
    );
  }

  /// `Verificar el tamaño del archivo`
  String get errorSize {
    return Intl.message(
      'Verificar el tamaño del archivo',
      name: 'errorSize',
      desc: '',
      args: [],
    );
  }

  /// `El monto debe ser mayor a  $ 10.000`
  String get goalAmountErrorAmount {
    return Intl.message(
      'El monto debe ser mayor a  \$ 10.000',
      name: 'goalAmountErrorAmount',
      desc: '',
      args: [],
    );
  }

  /// `Inversión máxima mensual de $20,700.00`
  String get invertionMexico {
    return Intl.message(
      'Inversión máxima mensual de \$20,700.00',
      name: 'invertionMexico',
      desc: '',
      args: [],
    );
  }

  /// `Limite de inversión mensual`
  String get limitInvestionText {
    return Intl.message(
      'Limite de inversión mensual',
      name: 'limitInvestionText',
      desc: '',
      args: [],
    );
  }

  /// `¿Por qué existe un limite de inversión mensual?`
  String get questionTextLink {
    return Intl.message(
      '¿Por qué existe un limite de inversión mensual?',
      name: 'questionTextLink',
      desc: '',
      args: [],
    );
  }

  /// `Por normas regulatorias no puedes invertir más de $20,700.00 mensualmente.`
  String get limitInvestionTextDescription {
    return Intl.message(
      'Por normas regulatorias no puedes invertir más de \$20,700.00 mensualmente.',
      name: 'limitInvestionTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `Te invitamos a realizar el máximo disponible y el próximo mes, invertir más dinero.`
  String get limitInvestionTextDescriptionTwo {
    return Intl.message(
      'Te invitamos a realizar el máximo disponible y el próximo mes, invertir más dinero.',
      name: 'limitInvestionTextDescriptionTwo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'MX'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}