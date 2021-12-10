import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

import '../../../injection.dart';
import 'firebase_events_mx.dart';

// @LazySingleton(
//     as: IFirebaseEventLoggerMX, env: [Environments.devMx, Environments.prodMx])

class FirebaseEventLoggerMx extends IFirebaseEventLoggerMX {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseEventLoggerMx() {
    print('From mx');
  }

  String getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return "Enero";
      case 2:
        return "Febrero";
      case 3:
        return "Marzo";
      case 4:
        return "Abril";
      case 5:
        return "Mayo";
      case 6:
        return "Junio";
      case 7:
        return "Julio";
      case 8:
        return "Agosto";
      case 9:
        return "Septiembre";
      case 10:
        return "Octubre";
      case 11:
        return "Noviembre";
      case 12:
        return "Diciembre";
      default:
        return "Enero";
    }
  }

  Future logEvent(String eventName, Map parameters) async {
    print('----------------------');
    print('Firebase Analytics log event: $eventName');
    print('----------------------');
    if (parameters.isNotEmpty) {
      var map = Map<String, String>.from(parameters);
      await _analytics.logEvent(name: eventName, parameters: map);
    } else {
      await _analytics.logEvent(name: eventName);
    }
  }

  @override
  Future setUserId(int id) async {
    print('----------------------------');
    print('Firebase Analytics Set UserId: $id');
    print('----------------------------');
    await _analytics.setUserId(id.toString());
  }

  @override
  Future singIn() async {
    await _analytics.logLogin();
    await this.logEvent(FirebaseEventsMX.INGRESAR, {});
  }

  @override
  Future confirmEmail() {
    return this.logEvent(FirebaseEventsMX.CONFIRMAR_CORREO, {});
  }

  @override
  Future createGoal(Map parameters) {
    return this.logEvent(FirebaseEventsMX.CREAR_META, parameters);
  }

  @override
  Future createPassword() {
    return this.logEvent(FirebaseEventsMX.CREAR_CONTRASENA, {});
  }

  @override
  Future domiciliacionInvest() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_DOM, {});
  }

  @override
  Future domiciliacionInvestAditionalValue() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_DOM_VALOR_ADICIONAL, {});
  }

  @override
  Future domiciliacionInvestContinue() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_DOM_CONTINUAR, {});
  }

  @override
  Future domiciliacionInvestmentSummary(Map parameters) {
    return this.logEvent(
        FirebaseEventsMX.INVERTIR_DOM_RESUMEN_TRANSACCION, parameters);
  }

  @override
  Future domicilioVerificationSuccess() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_EXITO, {});
  }

  @override
  Future domicilioVerification() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_DOMICILIO, {});
  }

  @override
  Future domicilioVerificationConfirm() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_DOMICILIO_CONFIRMAR, {});
  }

  @override
  Future goalInvest(Map parameters) {
    return this.logEvent(FirebaseEventsMX.INVERTIR_AHORA_META, parameters);
  }

  @override
  Future goalNoInvest() {
    return this.logEvent(FirebaseEventsMX.NO_INVERTIR_AHORA_META, {});
  }

  @override
  Future identityVerification() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_IDENTIDAD, {});
  }

  @override
  Future identityVerificationNext() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_IDENTIDAD_SIGUIENTE, {});
  }

  @override
  Future identityVerificationOmit() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_IDENTIDAD_OMITIR, {});
  }

  @override
  Future identityVerificationPersonalData() {
    return this.logEvent(FirebaseEventsMX.VERIFICAR_IDENTIDAD_DATOS, {});
  }

  @override
  Future profileConfirmed(Map parameters) {
    return this.logEvent(FirebaseEventsMX.PERFIL_CONFIRMAR, parameters);
  }

  @override
  Future profileDiscover() {
    return this.logEvent(FirebaseEventsMX.PERFIL_DESCUBRIR, {});
  }

  @override
  Future question(int number) {
    return this.logEvent("${FirebaseEventsMX.PERFIL_PREGUNTA_N}$number", {});
  }

  @override
  Future registerAccount() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_REGISTRAR_CUENTA, {});
  }

  @override
  Future resendCode() {
    return this.logEvent(FirebaseEventsMX.REENVIAR_CODIGO, {});
  }

  @override
  Future resendEmail() {
    return this.logEvent(FirebaseEventsMX.REENVIAR_CORREO, {});
  }

  @override
  Future signUp() {
    return this.logEvent(FirebaseEventsMX.REGISTRO, {});
  }

  @override
  Future signUpPersonalData() {
    return this.logEvent(FirebaseEventsMX.REGISTRO_DATOS_PERSONALES, {});
  }

  @override
  Future speiInvestment() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_SPEI, {});
  }

  @override
  Future speiInvestmentAditionalValue() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_SPEI_VALOR_ADICIONAL, {});
  }

  @override
  Future speiInvestmentContinue() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_SPEI_CONTINUAR, {});
  }

  @override
  Future speiInvestmentSummary(Map parameters) {
    return this.logEvent(
        FirebaseEventsMX.INVERTIR_SPEI_RESUMEN_TRANSACCION, parameters);
  }

  @override
  Future welcomeClick() {
    return this.logEvent(FirebaseEventsMX.PANTALLA_BIENVENIDO, {});
  }

  @override
  Future about() {
    return this.logEvent(FirebaseEventsMX.MENU_ABOUT, {});
  }

  @override
  Future aboutSelected(String title) {
    return this.logEvent("${FirebaseEventsMX.ABOUT_SELECCIONADO}$title", {});
  }

  @override
  Future certificationsDate(DateTime date) {
    String dateString = "";
    if (date != null) {
      dateString = "${getMonthName(date)}-de-${date.year}";
    }
    return this
        .logEvent("${FirebaseEventsMX.CERTIFICACIONES_FECHA}$dateString", {});
  }

  @override
  Future extractsAndDocs() {
    return this.logEvent(FirebaseEventsMX.MENU_EXTRACTOS_DOCS, {});
  }

  @override
  Future extractsDate(String monthName, String year) {
    return this
        .logEvent("${FirebaseEventsMX.EXTRACTOS_FECHA}$monthName-de-$year", {});
  }

  @override
  Future help() {
    return this.logEvent(FirebaseEventsMX.MENU_AYUDA, {});
  }

  @override
  Future helpFAQSelected(String title) {
    return this
        .logEvent("${FirebaseEventsMX.AYUDA_FAQS_SELECCIONADO}$title", {});
  }

  @override
  Future helpSupportSelected(String title) {
    return this
        .logEvent("${FirebaseEventsMX.AYUDA_SOPORTE_SELECCIONADO}$title", {});
  }

  @override
  Future homeContent(String title) {
    return this.logEvent("${FirebaseEventsMX.HOME_CONTENIDO}$title", {});
  }

  @override
  Future myAccount() {
    return this.logEvent(FirebaseEventsMX.MENU_MI_CUENTA, {});
  }

  @override
  Future myProfileSelected(String title) {
    return this
        .logEvent("${FirebaseEventsMX.MI_PERFIL_SELECCIONADO}$title", {});
  }

  @override
  Future myWallet() {
    return this.logEvent(FirebaseEventsMX.MENU_MI_BILLETERA, {});
  }

  @override
  Future myWalletAccounts() {
    return this.logEvent(FirebaseEventsMX.BILLETERA_CUENTAS, {});
  }

  @override
  Future myWalletAddAccount() {
    return this.logEvent(FirebaseEventsMX.BILLETERA_AGREGAR_CUENTA, {});
  }

  @override
  Future myWalletDebits() {
    return this.logEvent(FirebaseEventsMX.BILLETERA_DEBITOS, {});
  }

  @override
  Future termsAndConditions() {
    return this.logEvent(FirebaseEventsMX.MENU_TERMINOS, {});
  }

  @override
  Future createNewGoal(Map parameters) {
    return this.logEvent(FirebaseEventsMX.CREAR_META_NUEVA, parameters);
  }

  @override
  Future editGoal() {
    return this.logEvent(FirebaseEventsMX.EDITAR_DESDE_META, {});
  }

  @override
  Future editGoalPeriodicity() {
    return this.logEvent(FirebaseEventsMX.EDITAR_META_PERIODO, {});
  }

  @override
  Future editGoalValue() {
    return this.logEvent(FirebaseEventsMX.EDITAR_META_VALOR, {});
  }

  @override
  Future invest() {
    return this.logEvent(FirebaseEventsMX.INVERTIR, {});
  }

  @override
  Future investGoal() {
    return this.logEvent(FirebaseEventsMX.INVERTIR_EN_META, {});
  }

  @override
  Future recalculatePeriodicity(Map parameters) {
    return this.logEvent(FirebaseEventsMX.RECALCULAR_META_PERIODO, parameters);
  }

  @override
  Future recalculateValue(Map parameters) {
    return this.logEvent(FirebaseEventsMX.RECALCULAR_META_VALOR, parameters);
  }

  @override
  Future successTransaccion(Map parameters) {
    return this.logEvent(FirebaseEventsMX.INGRESO_DINERO_EXITOSO, parameters);
  }

  @override
  Future withdrawal() {
    return this.logEvent(FirebaseEventsMX.RETIRAR, {});
  }

  @override
  Future withdrawlGoal() {
    return this.logEvent(FirebaseEventsMX.RETIRAR_DE_META, {});
  }
}

abstract class IFirebaseEventLoggerMX {
  Future setUserId(int userId);

  ///Event 1 Fase 1 Parte 1
  Future singIn();

  ///Event 2 Fase 1 Parte 1
  Future signUp();

  ///Event 3 Fase 1 Parte 1
  Future signUpPersonalData();

  ///Event 4 Fase 1 Parte 1
  Future confirmEmail();

  ///Event 5 Fase 1 Parte 1
  Future resendEmail();

  ///Event 6 Fase 1 Parte 1
  Future resendCode();

  ///Event 7 Fase 1 Parte 1
  Future createPassword();

  ///Event 8 Fase 1 Parte 1
  Future welcomeClick();

  ///Event 9 Fase 1 Parte 1
  Future profileDiscover();

  ///Event 10,11,12,13 Fase 1 Parte 1
  ///Es dinámico obtiene el numero de la pregunta y con eso modifica
  /// el evento.
  Future question(int number);

  /// Event 17 Fase 1 Parte 1
  /// Parameters: Tipo-Perfil
  Future profileConfirmed(Map parameters);

  /// Event 18 Fase 1 Parte 1
  /// Parameters: Price, Currency, nombre meta
  Future createGoal(Map parameters);

  /// Event 19 Fase 1 Parte 1
  /// Parameters: Price, Currency
  Future goalInvest(Map parameters);

  /// Event 20 Fase 1 Parte 1
  Future goalNoInvest();

  /// Event 21 Fase 1 Parte 1
  Future domiciliacionInvest();

  /// Event 22 Fase 1 Parte 1
  Future domiciliacionInvestContinue();

  /// Event 23 Fase 1 Parte 1
  Future registerAccount();

  /// Event 24 Fase 1 Parte 1
  Future domiciliacionInvestAditionalValue();

  /// Event 25 Fase 1 Parte 1
  /// Parameters: Price, Currency, periodiciad
  Future domiciliacionInvestmentSummary(Map parameters);

  /// Event 26 Fase 1 Parte 1
  Future speiInvestment();

  /// Event 27 Fase 1 Parte 1
  Future speiInvestmentContinue();

  /// Event 28 Fase 1 Parte 1
  Future speiInvestmentAditionalValue();

  /// Event 30 Fase 1 Parte 1
  /// Parameters: Price, Currency
  Future speiInvestmentSummary(Map parameters);

  /// Event 35 Fase 1 Parte 1
  Future identityVerification();

  /// Event 36 Fase 1 Parte 1
  Future identityVerificationOmit();

  /// Event 37 Fase 1 Parte 1
  Future identityVerificationNext();

  /// Event 38 Fase 1 Parte 1
  Future identityVerificationPersonalData();

  /// Event 39 Fase 1 Parte 1
  Future domicilioVerification();

  /// Event 41 Fase 1 Parte 1
  Future domicilioVerificationConfirm();

  /// Event 42 Fase 1 Parte 1
  Future domicilioVerificationSuccess();

  // Taxonomia Fase 1 Parte 2

  /// Event 1 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo del articulo
  Future homeContent(String title);

  /// Event 2 Fase 1 Parte 2
  Future myAccount();

  /// Event 3 Fase 1 Parte 2
  Future myWallet();

  /// Event 4 Fase 1 Parte 2
  Future extractsAndDocs();

  /// Event 5 Fase 1 Parte 2
  Future termsAndConditions();

  /// Event 6 Fase 1 Parte 2
  Future help();

  /// Event 7 Fase 1 Parte 2
  Future about();

  /// Event 8 Fase 1 Parte 2
  Future myWalletAccounts();

  /// Event 9 Fase 1 Parte 2
  Future myWalletDebits();

  /// Event 10 Fase 1 Parte 2
  Future myWalletAddAccount();

  /// Event 11 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el mes y el año
  /// de la siguiente manera Event_Extractos_Marzo-de-2020
  Future extractsDate(String monthName, String year);

  /// Event 12 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el mes y el año
  /// de la siguiente manera Event_Certificaciones_Marzo-de-2020
  Future certificationsDate(DateTime date);

  /// Event 13 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Acerca_Ualet_Ahorras como los putas
  Future aboutSelected(String title);

  /// Event 14 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Mi_perfil_Como se asigno mi perfil
  Future myProfileSelected(String title);

  /// Event 15 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Ayuda_FAQS_Como se asigno mi perfil
  Future helpFAQSelected(String title);

  /// Event 16 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Ayuda_FAQS_Tengo duda sobre los fondos
  Future helpSupportSelected(String title);

  //Taxonomia Fase 2 Parte 1

  /// Event 1 Fase 2 Parte 1
  /// Parameters: Tipo transaccion, Revenue, Currency
  Future successTransaccion(Map parameters);

  /// Event 2 Fase 2 Parte 1
  /// Parameters: Price, Currency, nombre meta
  Future createNewGoal(Map parameters);

  /// Event 3 Fase 2 Parte 1
  Future withdrawlGoal();

  /// Event 4 Fase 2 Parte 1
  Future editGoal();

  /// Event 5 Fase 2 Parte 1
  Future investGoal();

  /// Event 6 Fase 2 Parte 1
  Future withdrawal();

  /// Event 7 Fase 2 Parte 1
  Future invest();

  /// Event 8 Fase 2 Parte 1
  Future editGoalValue();

  /// Event 9 Fase 2 Parte 1
  /// Parameters: Price anterior, price nuevo, currency
  Future recalculateValue(Map parameters);

  /// Event 10: Fase 2 Parte 1
  Future editGoalPeriodicity();

  /// Event 11: Fase 2 Parte 1
  /// Parameters: Price anterior, price nuevo, currency
  Future recalculatePeriodicity(Map parameters);
}
