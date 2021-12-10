import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:injectable/injectable.dart';

abstract class IAppsFlyerEventLogger {
  Future logEvent(String eventName, Map parameters);
  Future setUserId(int userId);
  Future initConfig(Map options);
}

@LazySingleton(as: IAppsFlyerEventLogger)
class AppsFlyerEventLoggerMX implements IAppsFlyerEventLogger {
  bool initialized = false;
  AppsflyerSdk _appsflyerSdk;

  @override
  Future initConfig(Map options) async {
    if (!initialized) {
      _appsflyerSdk = AppsflyerSdk(options)
        ..initSdk(
            registerConversionDataCallback: true,
            registerOnAppOpenAttributionCallback: true,
            registerOnDeepLinkingCallback: true);
      await _appsflyerSdk.initSdk();
      _appsflyerSdk.setPushNotification(true);
      initialized = true;
      print('------------------------');
      print('AppFlayer Config Init ');
      print('------------------------');
    }
  }

  @override
  Future logEvent(String eventName, Map parameters) async {
    if (!initialized) {
      await _appsflyerSdk.initSdk();
      initialized = true;
    }
    print('------------------------');
    print('apssFlyer log event: $eventName');
    print('------------------------');
    _appsflyerSdk.logEvent(eventName, parameters);
  }

  @override
  Future setUserId(int userId) async {
    if (!initialized) {
      await _appsflyerSdk.initSdk();
      initialized = true;
    }
    print('------------------------');
    print('apssFlyer User Id: $userId');
    print('------------------------');
    _appsflyerSdk.setCustomerUserId(userId.toString());
  }
}

//@LazySingleton(as: IAppsFlyerEventLogger)
class MockAppsflyer implements IAppsFlyerEventLogger {
  static const Map options = {"afDevKey": "", "afAppId": "", "isDebug": true};

  // AppsflyerSdk _appsflyerSdk = AppsflyerSdk(options)..initSdk();

  @override
  Future initConfig(Map options) async {
    return;
  }

  @override
  Future logEvent(String eventName, Map parameters) async {
    return;
  }

  @override
  Future setUserId(int userId) async {
    return;
  }
}

class AFEvents {
  /// Event 1 Fase 1 Parte 1
  ///af_login
  static const String LOGIN = 'af_login';

  /// Event 8 Fase 1 Parte 1
  ///af_complete_registration
  static const String COMPLETE_REGISTRATION = 'af_complete_registration';

  /// Event 17 Fase 1 Parte 1
  ///Event_Perfil_confirmado
  static const String PERFIL_REGISTRADO = 'Event_Perfil_confirmado';
  static const String EVENT_AHORRO_EDITAR_META = 'Event_Ahorro_editar_meta';

  /// Event 18 Fase 1 Parte 1
  ///Event_Meta_crear
  static const String EVENT_INVEST_DBT_CONTINUE_RESUME =
      'Event_Inversion_debito_resumen_transaccion';
  static const String EVENT_RETIRE_GOAL_SUCCESS =
      'Event_Retirar_dinero_exitoso';

  ///Event_Meta_crear
  static const String META_CREADA = 'Event_Meta_crear';
  //Event_Meta_crear_nueva
  static const String CREAR_META_NEW = 'Event_Meta_crear_nueva';

  ///Event_Meta_invertir
  static const String META_INVERTIR = 'Event_Meta_invertir';

  /// Event 20 Fase 1 Parte 1
  ///Event_Meta_no_invertir
  static const String META_NO_INVERTIR = 'Event_Meta_no_invertir';

  /// Event 25 Fase 1 Parte 1
  ///Event_Inversion_debito_resumen_transaccion
  static const String RESUMEN_INVERSION_DOMICILIACION =
      'Event_Inversion_domiciliacion_resumen_transaccion';

  ///Event_Inversion_pse_resumen_transaccion
  static const String RESUMEN_INVERSION_PSE =
      'Event_Inversion_spei_resumen_transaccion';

  /// Event 30 Fase 1 Parte 1
  static const String RESUMEN_INVERSION_SPEI =
      'Event_Inversion_spei_resumen_transaccion';

  /// Event 42 Fase 1 Parte 1
  ///Event_Verificacion_exitosa
  static const String VERIFICACION_EXITO = 'Event_Verificacion_exitosa';

  /// Event 1 Fase 2 Parte 1
  ///Event_Ingreso_exitoso_dinero
  static const String INGRESO_EXITOSO_DINERO = 'Event_Ingreso_exitoso_dinero';


  static const String RESUMEN_INVERSION_DEBITO =
      'Event_Inversion_debito_resumen_transaccion';
}
