///Clase con los eventos de firebase
class FirebaseEventsMX {
  // Taxonomia Fase 1 Parte 1

  //Registro/Ingresar

  ///Event 1 Fase 1 Parte 1
  ///Event_Ingresar
  static const String INGRESAR = 'Event_Ingresar';

  ///Event 2 Fase 1 Parte 1
  ///Event_Registro
  static const String REGISTRO = 'Event_Registro';

  ///Event 3 Fase 1 Parte 1
  ///Event_Registro_datos_personales
  static const String REGISTRO_DATOS_PERSONALES =
      'Event_Registro_datos_personales';

  ///Event 4 Fase 1 Parte 1
  ///Event_Registro_confirmar_email
  static const String CONFIRMAR_CORREO = 'Event_Registro_confirmar_email';

  ///Event 5 Fase 1 Parte 1
  ///Event_Registro_reenviar_correo
  static const String REENVIAR_CORREO = 'Event_Registro_reenviar_correo';

  ///Event 6 Fase 1 Parte 1
  ///Event_Registro_reenviar_codigo
  static const String REENVIAR_CODIGO = 'Event_Registro_reenviar_codigo';

  ///Event 7 Fase 1 Parte 1
  ///Event_Registro_crear_contrasena
  static const String CREAR_CONTRASENA = 'Event_Registro_crear_contrasena';

  ///Event 8 Fase 1 Parte 1
  ///Event_Registro_completo_bienvenido
  static const String PANTALLA_BIENVENIDO =
      'Event_Registro_completo_bienvenido';

  //Perfilamiento

  ///Event 9 Fase 1 Parte 1
  ///Event_Perfil_descubrir
  static const String PERFIL_DESCUBRIR = 'Event_Perfil_descubrir';

  ///Event 10, 11, 12 y 13 Fase 1 Parte 1
  ///Event_Perfil_pregunta + N!!!
  static const String PERFIL_PREGUNTA_N = 'Event_Perfil_pregunta';

  ///Event 17 Fase 1 Parte 1
  ///Event_Perfil_confirmado
  static const String PERFIL_CONFIRMAR = 'Event_Perfil_confirmado';

  //Metas

  ///Event 18 Fase 1 Parte 1
  ///Event_Meta_crear
  static const String CREAR_META = 'Event_Meta_crear';

  ///Event 19 Fase 1 Parte 1
  ///Event_Meta_invertir
  static const String INVERTIR_AHORA_META = 'Event_Meta_invertir';

  ///Event 20 Fase 1 Parte 1
  ///Event_Meta_no_invertir
  static const String NO_INVERTIR_AHORA_META = 'Event_Meta_no_invertir';

  //Invertir

  ///Event 21 Fase 1 Parte 1
  ///Event_Inversion_domiciliacion
  static const String INVERTIR_DOM = 'Event_Inversion_domiciliacion';

  ///Event 22 Fase 1 Parte 1
  ///Event_Inversion_domiciliacion_continuar
  static const String INVERTIR_DOM_CONTINUAR =
      'Event_Inversion_domiciliacion_continuar';

  ///Event 23 Fase 1 Parte 1
  ///Event_Registrar_cuenta
  static const String INVERTIR_REGISTRAR_CUENTA = 'Event_Registrar_cuenta';

  ///Event 24 Fase 1 Parte 1
  ///Event_Inversion_domiciliacion_valor_adicional
  static const String INVERTIR_DOM_VALOR_ADICIONAL =
      'Event_Inversion_domiciliacion_valor_adicional';

  ///Event 25 Fase 1 Parte 1
  ///Event_Inversion_resumen_transaccion
  static const String INVERTIR_DOM_RESUMEN_TRANSACCION =
      'Event_Inversion_domiciliacion_resumen_transaccion';

  ///Event 26 Fase 1 Parte 1
  ///Event_Inversion_spei
  static const String INVERTIR_SPEI = 'Event_Inversion_spei';

  /// Event 27 Fase 1 Parte 1
  ///Event_Inversion_spei_continuar
  static const String INVERTIR_SPEI_CONTINUAR =
      'Event_Inversion_spei_continuar';

  ///Event 28 Fase 1 Parte 1
  ///Event_Inversion_spei_valor_adicional
  static const String INVERTIR_SPEI_VALOR_ADICIONAL =
      'Event_Inversion_spei_valor_adicional';

  ///Event 30 Fase 1 Parte 1
  ///Event_Inversion_spei_resumen_transaccion
  static const String INVERTIR_SPEI_RESUMEN_TRANSACCION =
      'Event_Inversion_spei_resumen_transaccion';

  //Verificacion

  ///Event 35 Fase 1 Parte 1
  ///Event_Verificacion
  static const String VERIFICAR_IDENTIDAD = 'Event_Verificacion';

  ///Event 36 Fase 1 Parte 1
  ///Event_Verificacion_credencial_votar_omitir
  static const String VERIFICAR_IDENTIDAD_OMITIR =
      'Event_Verificacion_credencial_votar_omitir';

  ///Event 37 Fase 1 Parte 1
  ///Event_Verificacion_credencial_votar_siguiente
  static const String VERIFICAR_IDENTIDAD_SIGUIENTE =
      'Event_Verificacion_credencial_votar_siguiente';

  ///Event 38 Fase 1 Parte 1
  ///Event_Verificacion_datos_personales
  static const String VERIFICAR_IDENTIDAD_DATOS =
      'Event_Verificacion_datos_personales';

  ///Event 39 Fase 1 Parte 1
  ///Event_Verificacion_domicilio
  static const String VERIFICAR_DOMICILIO = 'Event_Verificacion_domicilio';

  /// Event 41 Fase 1 Parte 1
  ///Event_Verification_domicilio_confirmar
  static const String VERIFICAR_DOMICILIO_CONFIRMAR =
      'Event_Verificacion_domicilio_confirmar';

  /// Event 42 Fase 1 Parte 1
  ///Event_Verificacion_exitosa
  static const String VERIFICAR_EXITO = 'Event_Verificacion_exitosa';

  // Taxonomia Fase 1 Parte 2

  /// Event 1 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo del articulo
  static const String HOME_CONTENIDO = 'Event_Home_contenido_';

  /// Event 2 Fase 1 Parte 2
  static const String MENU_MI_CUENTA = 'Event_Menu_mi_cuenta';

  /// Event 3 Fase 1 Parte 2
  static const String MENU_MI_BILLETERA = 'Event_Menu_mi_billetera';

  /// Event 4 Fase 1 Parte 2
  static const String MENU_EXTRACTOS_DOCS = 'Event_Menu_extractos_documentos';

  /// Event 5 Fase 1 Parte 2
  static const String MENU_TERMINOS = 'Event_Menu_terminos_condiciones';

  /// Event 6 Fase 1 Parte 2
  static const String MENU_AYUDA = 'Event_Menu_ayuda';

  /// Event 7 Fase 1 Parte 2
  static const String MENU_ABOUT = 'Event_Menu_acerca_ualet';

  /// Event 8 Fase 1 Parte 2
  static const String BILLETERA_CUENTAS = 'Event_Billetera_mis_cuentas';

  /// Event 9 Fase 1 Parte 2
  static const String BILLETERA_DEBITOS = 'Event_Billetera_mis_debitos';

  /// Event 10 Fase 1 Parte 2
  static const String BILLETERA_AGREGAR_CUENTA =
      'Event_Billetera_agregar_cuenta';

  /// Event 11 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el mes y el año
  /// de la siguiente manera Event_Extractos_Marzo-de-2020
  static const String EXTRACTOS_FECHA = 'Event_Extractos_';

  /// Event 12 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el mes y el año
  /// de la siguiente manera Event_Certificaciones_Marzo-de-2020
  static const String CERTIFICACIONES_FECHA = 'Event_Certificaciones_';

  /// Event 13 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Acerca_Ualet_Ahorras como los putas
  static const String ABOUT_SELECCIONADO = 'Event_Acerca_Ualet_';

  /// Event 14 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Mi_perfil_Como se asigno mi perfil
  static const String MI_PERFIL_SELECCIONADO = 'Event_Mi_perfil_';

  /// Event 15 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Ayuda_FAQS_Como se asigno mi perfil
  static const String AYUDA_FAQS_SELECCIONADO = 'Event_Ayuda_FAQS_';

  /// Event 16 Fase 1 Parte 2
  /// Dinamica despues del _ debe ir el titulo de la pregunta
  /// de la siguiente manera Event_Ayuda_FAQS_Tengo duda sobre los fondos
  static const String AYUDA_SOPORTE_SELECCIONADO = 'Event_Ayuda_soporte_';

  // Taxonomia Fase 2 Parte 1

  /// Event 1 Fase 2 Parte 1
  static const String INGRESO_DINERO_EXITOSO = 'Event_Ingreso_exitoso_dinero';

  /// Event 2 Fase 2 Parte 1
  static const String CREAR_META_NUEVA = 'Event_Meta_crear_nueva';

  /// Event 3 Fase 2 Parte 1
  static const String RETIRAR_DE_META = 'Event_Ahorro_retirar_de_meta';

  /// Event 4 Fase 2 Parte 1
  static const String EDITAR_DESDE_META = 'Event_Ahorro_editar_meta';

  /// Event 5 Fase 2 Parte 1
  static const String INVERTIR_EN_META = 'Event_Ahorro_invertir_en_meta';

  /// Event 6 Fase 2 Parte 1
  static const String RETIRAR = 'Event_Ahorro_retirar';

  /// Event 7 Fase 2 Parte 1
  static const String INVERTIR = 'Event_Ahorro_invertir';

  /// Event 8 Fase 2 Parte 1
  static const String EDITAR_META_VALOR = 'Event_Domiciliacion_editar_valor';

  /// Event 9 Fase 2 Parte 1
  static const String RECALCULAR_META_VALOR =
      'Event_Domiciliacion_recalcular_valor';

  /// Event 10 Fase 2 Parte 1
  static const String EDITAR_META_PERIODO =
      'Event_Domiciliacion_editar_periodo';

  /// Event 11 Fase 2 redkParte 1
  static const String RECALCULAR_META_PERIODO =
      'Event_Domiciliacion_recalcular_periodo';
}
