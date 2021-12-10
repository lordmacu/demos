import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

import '../../../injection.dart';

@LazySingleton(
    as: IFireBaseEventLogger,
    env: [Environments.dev, Environments.prod, Environments.devMx, Environments.prodReplica])
class FireBaseEventLogger extends IFireBaseEventLogger {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FireBaseEventLogger() {
    print('From col');
  }

  Future logEvent(String eventName, Map parameters) async {
    print('------------------------');
    print('FireBase Analytics log event: $eventName');
    print('------------------------');
    if (parameters.isNotEmpty) {
      var map = Map<String, String>.from(parameters);
      await _analytics.logEvent(name: eventName, parameters: map);
    } else
      await _analytics.logEvent(name: eventName);
  }

  Future setUserId(int id) async {
    print('------------------------');
    print('FireBase Analytics Set UserId: $id');
    print('------------------------');
    await _analytics.setUserId(id.toString());
  }

  //Taxonomia Etapa 01 - Parte 01
  @override
  Future singIn() async {
    await _analytics.logLogin();
    await this.logEvent('Event_Ingresar', {});
  }

  @override
  Future singUp() {
    return this.logEvent('Event_Registro', {});
  }

  @override
  Future registerNextData() {
    return this.logEvent('Event_Registro_datos_personales', {});
  }

  @override
  Future registerConfirmEmail() {
    return this.logEvent('Event_Registro_confirmar_email', {});
  }

  @override
  Future registerResendEmail() {
    return this.logEvent('Event_Registro_reenviar_correo', {});
  }

  @override
  Future registerResendCode() {
    return this.logEvent('Event_Registro_reenviar_codigo', {});
  }

  @override
  Future registerCreatePassword() {
    return this.logEvent('Event_Registro_crear_contrasena', {});
  }

  @override
  Future registerWelcomePage() {
    return this.logEvent('Event_Registro_completo_bienvenido', {});
  }

  @override
  Future profileFind() {
    return this.logEvent('Event_Perfil_descubrir', {});
  }

  @override
  Future profileQuestion(int number) {
    return this.logEvent('Event_Perfil_pregunta_' + number.toString(), {});
  }

  @override
  Future profileDiscovered() {
    return this.logEvent('Event_Perfil_descubierto', {});
  }

  @override
  Future profileUpdate() {
    return this.logEvent('Event_Perfil_cambiar', {});
  }

  @override
  Future profileUpdatePopUp() {
    return this.logEvent('Event_Perfil_cambiar_popup', {});
  }

  @override
  Future profileConfirm(Map parameters) {
    return this.logEvent('Event_Perfil_confirmado', parameters);
  }

  @override
  Future goalCreate(Map parameters) {
    return this.logEvent('Event_Meta_crear', parameters);
  }

  @override
  Future goalInvestment(Map parameters) {
    return this.logEvent('Event_Meta_invertir', parameters);
  }

  @override
  Future goalNotInvestment() {
    return this.logEvent('Event_Meta_no_invertir', {});
  }

  @override
  Future investmentDebit() {
    return this.logEvent('Event_Inversion_debito', {});
  }

  @override
  Future investmentDebitNext() {
    return this.logEvent('Event_Inversion_debito_continuar', {});
  }

  @override
  Future accountRegister() {
    return this.logEvent('Event_Registrar_cuenta', {});
  }

  //Fue reemplazado en la Taxonomia Etapa 03(2.1)
  // @override
  // Future investmentDebitResume(Map parameters) {
  //   return this.logEvent('Event_Inversion_debito_resumen_transaccion', parameters);
  // }

  @override
  Future investmentPse() {
    return this.logEvent('Event_Inversion_pse', {});
  }

  @override
  Future investmentPseNext() {
    return this.logEvent('Event_Inversion_pse_continuar', {});
  }

  @override
  Future investmentPseGoBank() {
    return this.logEvent('Event_Inversion_pse_ir_banco', {});
  }

  @override
  Future investmentPseResume(Map parameters) {
    return this.logEvent('Event_Inversion_pse_resumen_transaccion', parameters);
  }

  @override
  Future investmentMovementsTop() {
    return this.logEvent('Event_Inversion_movimientos_superiores', {});
  }

  //Fueron reemplazadas en la Taxonomia Etapa 03(2.1)
  // @override
  // Future investmentMovementsTopForm1() {
  //   return this
  //       .logEvent('Event_Inversion_movimientos_superiores_datosF_1', {});
  // }

  // @override
  // Future investmentMovementsTopForm2() {
  //   return this
  //       .logEvent('Event_Inversion_movimientos_superiores_datosF_2', {});
  // }

  // @override
  // Future investmentMovementsTopDocuments() {
  //   return this.logEvent('Event_Inversion_movimientos_superiores_documentos', {});
  // }

  @override
  Future verification() {
    return this.logEvent('Event_Verificacion', {});
  }

  @override
  Future verificationData() {
    return this.logEvent('Event_Verificacion_datos_personales', {});
  }

  @override
  Future verificationDataIdentification() {
    return this.logEvent('Event_Verificacion_datos_documento_identidad', {});
  }

  @override
  Future verificationSuccess() {
    return this.logEvent('Event_Verificacion_exitosa', {});
  }

  @override
  Future withdrawalTypePartial() {
    return this.logEvent('Event_Retirar_dinero_parcial', {});
  }

  @override
  Future withdrawalTypeFull() {
    return this.logEvent('Event_Retirar_dinero_total', {});
  }

  @override
  Future withdrallMoneyConfirm() {
    return this.logEvent('Event_Retirar_dinero_confirmar', {});
  }

  @override
  Future withdrawalSuccess(Map parameters) {
    return this.logEvent('Event_Retirar_dinero_exitoso', parameters);
  }

  @override
  Future withdrawalResume(Map parameters) {
    return this
        .logEvent('Event_Retirar_dinero_resumen_transaccion', parameters);
  }

  //Taxonomia Etapa 01 - Parte 02
  @override
  Future menuMyAccount() {
    return this.logEvent('Event_Menu_mi_cuenta', {});
  }

  @override
  Future menuMyWallet() {
    return this.logEvent('Event_Menu_mi_billetera', {});
  }

  @override
  Future menuExtractDocuments() {
    return this.logEvent('Event_Menu_extractos_documentos', {});
  }

  @override
  Future menuTermsConditions() {
    return this.logEvent('Event_Menu_terminos_condiciones', {});
  }

  @override
  Future menuHelp() {
    return this.logEvent('Event_Menu_ayuda', {});
  }

  @override
  Future menuAboutUalet() {
    return this.logEvent('Event_Menu_acerca_ualet', {});
  }

  @override
  Future walletMyAccounts() {
    return this.logEvent('Event_Billetera_mis_cuentas', {});
  }

  @override
  Future walletMyDebits() {
    return this.logEvent('Event_Billetera_mis_debitos', {});
  }

  @override
  Future menuAddAccount() {
    return this.logEvent('Event_Billetera_agregar_cuenta', {});
  }

  @override
  Future extracts(String mouth, String year) {
    mouth = mouth.replaceAll('.', '');
    return this.logEvent('Event_Extractos_' + mouth + '_' + year, {});
  }

  @override
  Future certifications(String mouth, String year) {
    return this.logEvent('Event_Certificaciones_' + year, {});
  }

  @override
  Future aboutUalet(String value) {
    String valueReplace =
        value.replaceAll('¿', '').replaceAll('?', '').replaceAll(' ', '_');
    if (valueReplace.length >= 21) {
      valueReplace = valueReplace.substring(0, 21);
    }

    return this.logEvent('Event_Acerca_Ualet_' + valueReplace, {});
  }

  @override
  Future myProfile(String value) {
    String valueReplace =
        value.replaceAll('¿', '').replaceAll('?', '').replaceAll(' ', '_');
    if (valueReplace.length >= 18) {
      valueReplace = valueReplace.substring(0, 18);
    }
    return this.logEvent('Event_Mi_perfil_' + valueReplace, {});
  }

  @override
  Future helpFaqs(String value) {
    String valueReplace =
        value.replaceAll('¿', '').replaceAll('?', '').replaceAll(' ', '_');
    if (valueReplace.length >= 19) {
      valueReplace = valueReplace.substring(0, 19);
    }
    return this.logEvent('Event_Ayuda_FAQS_' + valueReplace, {});
  }

  @override
  Future helpSupport(String value) {
    String valueReplace =
        value.replaceAll('¿', '').replaceAll('?', '').replaceAll(' ', '_');
    if (valueReplace.length >= 20) {
      valueReplace = valueReplace.substring(0, 20);
    }
    return this.logEvent('Event_Ayuda_soporte_' + valueReplace, {});
  }

  //Taxonomia Etapa 02 - Parte 01
  @override
  Future successEntryMoney(Map parameters) {
    return this.logEvent('Event_Ingreso_exitoso_dinero', parameters);
  }

  @override
  Future goalNew(Map parameters) {
    return this.logEvent('Event_Meta_crear_nueva', parameters);
  }

  @override
  Future goalSavingsEdit() {
    return this.logEvent('Event_Ahorro_editar_meta', {});
  }

  @override
  Future savingsWithdrall() {
    return this.logEvent('Event_Ahorro_retirar', {});
  }

  @override
  Future savingsInvestment() {
    return this.logEvent('Event_Ahorro_invertir', {});
  }

  @override
  Future debitEditValue() {
    return this.logEvent('Event_Debito_editar_valor', {});
  }

  //Taxonomia Etapa 03 (2.1)
  @override
  Future assignMoney() {
    return this.logEvent('Event_Asignar_dinero', {});
  }

  @override
  Future assignMoneyToGoal(Map parameters) {
    return this.logEvent('Event_Asignar_dinero_a_meta', parameters);
  }

  @override
  Future assignMoneyToGoalSuccess(Map parameters) {
    return this.logEvent('Event_Asignar_dinero_a_meta_exitoso', parameters);
  }

  @override
  Future investmentDebitNextCost() {
    return this.logEvent('Event_Inversion_DBT_continuar_CostoBanco', {});
  }

  @override
  Future investmentDebitResume(Map parameters) {
    return this.logEvent('Event_Inversion-DBT_resumen_transaccion', parameters);
  }

  @override
  Future investmentPseNextCost() {
    return this.logEvent('Event_Inversion_pse_continuar_CostoBanco', {});
  }

  @override
  Future goalEdit() {
    return this.logEvent('Event_Meta_editar', {});
  }

  @override
  Future goalEditAdd(Map parameters) {
    return this.logEvent('Event_Meta_editar_guardar', parameters);
  }

  @override
  Future goalEditConfirm() {
    return this.logEvent('Event_Meta_editar_confirmar', {});
  }

  @override
  Future goalDelete() {
    return this.logEvent('Event_Meta_eliminar', {});
  }

  @override
  Future goalDeleteConfirm(Map parameters) {
    return this.logEvent('Event_Meta_eliminar_confirmar', parameters);
  }

  @override
  Future goalDeleteNoConfirm() {
    return this.logEvent('Event_Meta_eliminar_no_confirmar', {});
  }

  @override
  Future investmentMovementsTop1() {
    return this.logEvent('Event_Inversion_movimientos_superioresF1', {});
  }

  @override
  Future investmentMovementsTop2() {
    return this.logEvent('Event_Inversion_movimientos_superioresF2', {});
  }

  @override
  Future investmentMovementsTopDocuments() {
    return this.logEvent('Event_Inversion_movimientos_superiores_D', {});
  }

  @override
  Future withdrallMoneyDeleteDebit() {
    return this.logEvent('Event_Retirar_dinero_eliminar_debito', {});
  }

  @override
  Future withdrallMoneyKeepDebit() {
    return this.logEvent('Event_Retirar_dinero_mantener_debito', {});
  }

  @override
  Future withdrallMoneyDeleteGoals() {
    return this.logEvent('Event_Retirar_dinero_eliminar_metas', {});
  }

  @override
  Future withdrallMoneyKeepGoals() {
    return this.logEvent('Event_Retirar_dinero_mantener_metas', {});
  }

  @override
  Future myDebitsDelete() {
    return this.logEvent('Event_Mis_debitos_eliminar', {});
  }

  @override
  Future myDebitsEdit() {
    return this.logEvent('Event_Mis_debitos_editar', {});
  }

  @override
  Future myDebitsDeleteConfirm() {
    return this.logEvent('Event_Mis_debitos_eliminar_confirmar', {});
  }

  @override
  Future myDebitsDeleteNoReturn() {
    return this.logEvent('Event_Mis_debitos_eliminar_no_volver', {});
  }

  @override
  Future myDebitsEditSave() {
    return this.logEvent('Event_Mis_debitos_editar_guardar', {});
  }

  @override
  Future myDebitsEditConfirm() {
    return this.logEvent('Event_Mis_debitos_editar_confirmar', {});
  }


}

///interface con los metodos para firebase
abstract class IFireBaseEventLogger {
  //Taxonomia Etapa 01 - Parte 01
  Future singIn();
  Future singUp();
  Future registerNextData();
  Future registerConfirmEmail();
  Future registerResendEmail();
  Future registerResendCode();
  Future registerCreatePassword();
  Future registerWelcomePage();
  Future profileFind();
  Future profileQuestion(int number);
  Future profileDiscovered();
  Future profileUpdate();
  Future profileUpdatePopUp();
  Future profileConfirm(Map parameters);
  Future goalCreate(Map parameters);
  Future goalInvestment(Map parameters);
  Future goalNotInvestment();
  Future investmentDebit();
  Future investmentDebitNext();
  Future accountRegister();
  Future investmentPse();
  Future investmentPseNext();
  Future investmentPseGoBank();
  Future investmentPseResume(Map parameters);
  Future investmentMovementsTop();
  Future verification();
  Future verificationData();
  Future verificationDataIdentification();
  Future verificationSuccess();
  Future withdrawalTypePartial();
  Future withdrawalTypeFull();
  Future withdrallMoneyConfirm();
  Future withdrawalSuccess(Map parameters);
  Future withdrawalResume(Map parameters);

  //Taxonomia Etapa 01 - Parte 02
  Future menuMyAccount();
  Future menuMyWallet();
  Future menuExtractDocuments();
  Future menuTermsConditions();
  Future menuHelp();
  Future menuAboutUalet();
  Future walletMyAccounts();
  Future walletMyDebits();
  Future menuAddAccount();
  Future extracts(String mouth, String year);
  Future certifications(String mouth, String year);
  Future aboutUalet(String value);
  Future myProfile(String value);
  Future helpFaqs(String value);
  Future helpSupport(String value);

  //Taxonomia Etapa 02 - Parte 01
  Future successEntryMoney(Map parameters);
  Future goalNew(Map parameters);
  Future goalSavingsEdit();
  Future savingsWithdrall();
  Future savingsInvestment();
  Future debitEditValue();

  //Taxonomia Etapa 03 (2.1)
  Future assignMoney();
  Future assignMoneyToGoal(Map parameters);
  Future assignMoneyToGoalSuccess(Map parameters);
  Future investmentDebitNextCost();
  Future investmentDebitResume(Map parameters);
  Future investmentPseNextCost();
  Future goalEdit();
  Future goalEditAdd(Map parameters);
  Future goalEditConfirm();
  Future goalDelete();
  Future goalDeleteConfirm(Map parameters);
  Future goalDeleteNoConfirm();
  Future investmentMovementsTop1();
  Future investmentMovementsTop2();
  Future investmentMovementsTopDocuments();
  Future withdrallMoneyDeleteDebit();
  Future withdrallMoneyKeepDebit();
  Future withdrallMoneyDeleteGoals();
  Future withdrallMoneyKeepGoals();
  Future myDebitsDelete();
  Future myDebitsEdit();
  Future myDebitsDeleteConfirm();
  Future myDebitsDeleteNoReturn();
  Future myDebitsEditSave();
  Future myDebitsEditConfirm();
}
