import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/core/value_objects.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type_input.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/domain/profiling/profiling_response.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IProfilingMxRepository)
class ParamsMxRepository implements IProfilingMxRepository {
  final Dio _dio;
  final String profilingQuestionsApi = "/User/QuestionsProfilingUalet";

  final String profilingQuestionsPostApi =
      '/User/AnswerQuestionsToGetProfileUalet';

  final String assignProfilingPostApi = "/User/AssignProfile";

  final String getFindCustomerLevelSimplApi =
      "/User/FindCustomerLevelSimplified";

  final SharedPreferences _sharedPreferences;

  ParamsMxRepository(this._dio, this._sharedPreferences);

  Future<Either<BaseFailure, KtList<ProfilingItem>>> getProfilingItemsMock() {
    var list = List<ProfilingItem>();
    list.add(ProfilingItem(
        id: '1',
        type: '3',
        title: 'Tómate unos segundos para responder',
        description: '¿Por qué quieres invertir o ahorrar? ¿Cuál es tu meta?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '📈',
              description: 'Aumentar mi capital',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '💰',
              description: 'Ahorrar para hacer una compra',
              value: 0),
          ProfilingOption(
              score: 0, id: '3', emoji: '✈️', description: 'Viajar', value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '⚠️',
              description: 'Para una emergencia',
              value: 0),
        ],
        formQuestions: []));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '2',
        type: '1',
        title: 'Esto quedará entre tú y yo',
        description: '¿Cuál es tu ingreso mensual?',
        questions: [
          ProfilingOption(
              score: 0, id: '1', emoji: 'null', description: '', value: 0),
          ProfilingOption(
              score: 0, id: '2', emoji: 'null', description: '', value: 10000),
          ProfilingOption(
              score: 0, id: '3', emoji: 'null', description: '', value: 20000),
          ProfilingOption(
              score: 0, id: '4', emoji: 'null', description: '', value: 50000)
        ]));
    list.add(ProfilingItem(
        id: '3',
        type: '5',
        title: 'Vamos a recordar',
        description: '¿Cuál es el origen de tus ingresos?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '💲',
              description: 'Sueldos, aguinaldos, pensiones, primas',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '💰',
              description: 'Ahorros, honorarios, bonos, inversión',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '💵',
              description: 'Comisiones, comercio, herencia',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '🏦',
              description:
                  'Venta de bienes muebles e inmuebles, fideicomisos recursos gubernamentales',
              value: 0),
        ],
        formQuestions: [
          ProfilingFormOption(
            id: '1',
            description: '¿Tienes otros ingresos a parte de los seleccionados?',
            typeInput: ProfilingFormOption.RADIO,
            descriptionObservation: 'Especifica cuales:',
            hintTextObservation: 'Escribe aquí...',
            listOptionTypeCheck: [
              ProfilingFormOptionType(
                  score: 0, id: '1', value: 'No', isObservation: false),
              ProfilingFormOptionType(
                  score: 0, id: '2', value: 'Si', isObservation: true),
            ],
            listOptionTypeField: [
              ProfilingFormOptionTypeInput(
                  options: [],
                  id: '1',
                  hintTextInput: 'Especifica cuales:',
                  typeInput: ProfilingFormOptionTypeInput.TEXT_LONG,
                  valueInput: '0'),
            ],
          )
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '4',
        type: '2',
        title: 'Esto quedará entre tú y yo',
        description:
            '¿Qué porcentaje de este ingreso estás dispuesto a destinar a ahorro o inversión?',
        questions: [
          ProfilingOption(
              score: 0, id: '1', emoji: 'null', description: '', value: 1),
          ProfilingOption(
              score: 0, id: '2', emoji: 'null', description: '', value: 100)
        ]));
    list.add(ProfilingItem(
        id: '5',
        type: '7',
        title: 'Tomate unos segundos para responder',
        description: '',
        questions: [],
        formQuestions: [
          ProfilingFormOption(
              id: '1',
              description:
                  '¿Cuánto tiempo te gustaría dejar tu ahorro / inversión en Ualet?',
              typeInput: ProfilingFormOption.RADIO,
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0,
                    id: '1',
                    value: 'Menos de 6 meses',
                    isObservation: false),
                ProfilingFormOptionType(
                    score: 0,
                    id: '2',
                    value: 'Entre 6 meses y un año',
                    isObservation: false),
                ProfilingFormOptionType(
                    score: 0,
                    id: '3',
                    value: 'Uno o dos años como máximo',
                    isObservation: false),
                ProfilingFormOptionType(
                    score: 0,
                    id: '4',
                    value: 'Más de dos años',
                    isObservation: false),
              ],
              listOptionTypeField: []),
          ProfilingFormOption(
              id: '2',
              description:
                  '¿Piensa hacer retiros durante el primer año de tu inversión?',
              typeInput: ProfilingFormOption.RADIO,
              descriptionObservation: 'Especifica cuales:',
              hintTextObservation: 'Escribe aquí...',
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0, id: '1', value: 'No', isObservation: false),
                ProfilingFormOptionType(
                    score: 0, id: '2', value: 'Si', isObservation: true),
              ],
              listOptionTypeField: [
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '1',
                    hintTextInput: 'Especifica cuales:',
                    typeInput: ProfilingFormOptionTypeInput.TEXT_LONG,
                    valueInput: '0'),
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '2',
                    hintTextInput: '¿Qué monto esperas retirar?',
                    typeInput: ProfilingFormOptionTypeInput.MONEY,
                    valueInput: '0'),
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '3',
                    hintTextInput: 'Fecha aproximada de retiro',
                    typeInput: ProfilingFormOptionTypeInput.DATE,
                    valueInput: '06/05/2020')
              ]),
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '6',
        type: '3',
        title: 'Tómate unos segundos para responder',
        description: '¿En este momento ahorras o inviertes?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '🤨',
              description: '¿Ahorrar o Invertir? ¿Qué es eso?',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '😎',
              description: 'Sí, ahorro',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '🤓',
              description: 'Ahorro para invertir',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '🤑',
              description: 'Sí, invierto',
              value: 0),
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '7',
        type: '4',
        title: 'Toma una decisión',
        description:
            'Si hicieras una inversión considerable y tu dinero empezara a tener variaciones, tú:',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '🏃‍♀️',
              description:
                  'Retiraría mi inversión, no estoy dispuesto a perder',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '🧘',
              description:
                  'Sería paciente solo si me explican a qué se debe la variación',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '🤷‍♀️',
              description:
                  'Entendería que es normal perder o ganar según el mercado',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '👨‍💻',
              description:
                  'No me alarmaría, me interesa el comportamiento a largo plazo',
              value: 0),
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '8',
        type: '6',
        title: 'Vamos a recordar',
        description:
            '¿En cuales de los siguientes instrumentos financieros has realizado inversión en los últimos 2 años?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '💸',
              description: 'Ningún instrumento de inversión',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '💰',
              description: 'Fondos de inversión',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '📝',
              description: 'Instrumentos de deuda gubernamental y privada',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '📈',
              description: 'Acciones bursátiles, Efs y Valores Extranjeros',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '5',
              emoji: '📊',
              description:
                  'Valores estructurados, valores respaldados por activos, certificados bursátiles fiduciarios de desarrollo, inmobiliarios, de inversión en energía e infraestructura.',
              value: 0),
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '9',
        type: '3',
        title: 'Tomate unos segundos para responder',
        description: '¿Cuál es tu grado de estudios?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '🤷‍♂️',
              description: 'No tengo estudios',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '👩‍🎓',
              description: 'Preparatoria o menos',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '👨‍🏫',
              description: 'Carrera profesional',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '👩‍🔬',
              description: 'Maestría o doctorado',
              value: 0),
        ]));
    list.add(ProfilingItem(
        id: '10',
        type: '7',
        title: 'Estas a un paso',
        description: '',
        questions: [],
        formQuestions: [
          ProfilingFormOption(
              id: '1',
              description: '¿Alguna vez has utilizado servicios de inversión?',
              typeInput: ProfilingFormOption.RADIO,
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0, id: '1', value: 'No', isObservation: false),
                ProfilingFormOptionType(
                    score: 0, id: '2', value: 'Si', isObservation: false),
              ],
              listOptionTypeField: []),
          ProfilingFormOption(
              id: '2',
              description: '¿Eres una Persona Expuesta Políticamente o PEP?',
              typeInput: ProfilingFormOption.RADIO,
              descriptionObservation: '',
              hintTextObservation: '',
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0, id: '1', value: 'No', isObservation: false),
                ProfilingFormOptionType(
                    score: 0, id: '2', value: 'Si', isObservation: false),
              ],
              listOptionTypeField: []),
          ProfilingFormOption(
              id: '3',
              description:
                  'Sus padres, abuelos, hijos, nietos, hermanos, cónyugue, concubina o concubino, hijos del cónyugue o concubina/concubinario, suegros son personas expuestas politicamente (PEPs)*:',
              typeInput: ProfilingFormOption.RADIO,
              descriptionObservation: '',
              hintTextObservation: '',
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0, id: '1', value: 'No', isObservation: false),
                ProfilingFormOptionType(
                    score: 0, id: '2', value: 'Si', isObservation: true),
              ],
              listOptionTypeField: [
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '1',
                    hintTextInput: 'Indique nombres y parentesco:',
                    typeInput: ProfilingFormOptionTypeInput.TEXT_LONG,
                    valueInput: '0'),
              ]),
          ProfilingFormOption(
              id: '4',
              description:
                  "¿Eres una persona responsable del pago de impuestos en otro país?",
              typeInput: ProfilingFormOption.RADIO,
              descriptionObservation: '',
              hintTextObservation: '',
              listOptionTypeCheck: [
                ProfilingFormOptionType(
                    score: 0, id: '1', value: 'No', isObservation: false),
                ProfilingFormOptionType(
                    score: 0, id: '2', value: 'Si', isObservation: true),
              ],
              listOptionTypeField: [
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '1',
                    hintTextInput: 'País',
                    typeInput: ProfilingFormOptionTypeInput.TEXT,
                    valueInput: 'País'),
                ProfilingFormOptionTypeInput(
                    options: [],
                    id: '2',
                    hintTextInput: 'No. de identificación fiscal o queivalente',
                    typeInput: ProfilingFormOptionTypeInput.TEXT,
                    valueInput: 'No. de identificación fiscal o queivalente'),
              ]),
        ]));
    return Future.delayed(Duration(seconds: 1), () => right(KtList.from(list)));
  }

  @override
  Future<Either<BaseFailure, bool>> postAssignProfile(
      ProfilingResult result) async {
    Map jsonData = {};
    jsonData["Id"] = result.id;
    jsonData["Name"] = result.title;
    jsonData["Description"] = result.description;
    jsonData["Image"] = result.image;
    jsonData["ConnectProfileId"] = result.connectedProfileId;

    try {
      var response =
          await _dio.post(assignProfilingPostApi, data: json.encode(jsonData));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(
            "Error actualizando tu perfil: ${response.statusCode}"));

      return right(response.data["Result"]);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, ProfilingResult>> postProfilingData(data) async {
    var jsonResponse = {};
    double scoreTotal = 0;
    //responses
    for (var datum in data.asList()) {
      if (datum.questionId.split(".").length == 1) {
        var responseItem = responseToMap(datum);
        responseItem["subResponses"] = [];
        jsonResponse[datum.questionId] = (responseItem);
        scoreTotal += datum.score;
      }
    }
    //subresponses
    for (var datum in data.asList()) {
      var id = datum.questionId.split(".");
      if (id.length > 1) {
        if (jsonResponse[id[0]] == null) {
          jsonResponse[id[0]] = responseToMap(ProfilingResponse(
              questionId: id[0],
              responseId: "-",
              value: StringNotEmpty("-"),
              score: 0));
          jsonResponse[id[0]]["subResponses"] = [];
        }
        scoreTotal += datum.score;
        jsonResponse[id[0]]["subResponses"].add(responseToMap(datum));
      }
    }

    // for(var a in jsonResponse.values.toList()) {
    //   print(a);
    // }
    print("==================================================");
    print("SCORE TOTAL: $scoreTotal");
    print("==================================================");
    print("==================================================");
    print("SCORE TOTAL: $scoreTotal");
    print("==================================================");
    print("==================================================");
    print("SCORE TOTAL: $scoreTotal");
    print("==================================================");
    try {
      var response = await _dio.post(profilingQuestionsPostApi,
          data: json.encode(jsonResponse.values.toList()));

      if (response.data['Result']) {
        var rdata = response.data['Data'];
        String nameLower = rdata['Name'].toString().toLowerCase();

        var randInt = Random().nextInt(4);
        String imageStr = '$nameLower/$nameLower$randInt.png';

        var result = ProfilingResult(
          id: rdata['Id'],
          title: rdata['Name'],
          subtitle: "Nivel de riesgo ${rdata["RiskLevel"]}",
          description: rdata['Description'],
          connectedProfileId: rdata['ConnectProfileId'].toString(),
          image: imageStr,
        );

        _sharedPreferences.userProfile = result.title;

        return right(result);
      } else {
        return left(BaseFailure.fromServer("Error al calcular tu perfil"));
      }
    } catch (e) {
      return left(BaseFailure.fromServer("Error al calcular tu perfil"));
    }
  }

  @override
  Future<Either<BaseFailure, KtList<ProfilingItem>>> getProfilingItems() async {
    try {
      var response = await _dio.get(profilingQuestionsApi);
      var rData = response.data;

      if (!rData["Result"])
        return left(BaseFailure.fromServer(
            "Error al descargar preguntas de perfilamiento: ${response.statusCode}"));
      var data = rData["Data"]["Content"]["QuestionCaptions"];
      List<ProfilingItem> list = [];
      for (var item in data) {
        list.add(profilingItemFromJson(item));
        print(profilingItemFromJson(item));
      }

      //return the list
      return right(KtList.from(list));
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  ProfilingItem profilingItemFromJson(dynamic json) {
    List<ProfilingOption> questions = [];
    List<ProfilingFormOption> formQuestions = [];

    //populate questions
    for (var q in json["Questions"]) {
      questions.add(ProfilingOption(
          id: q["Id"].toString(),
          emoji: q["Emoji"],
          description: q["Description"],
          score: double.parse(q["Score"].toString()),
          value: double.parse(q["Value"].toString())));
    }

    //populate formQuestions
    for (var q in json["FormQuestions"]) {
      List<ProfilingFormOptionType> listOptionTypeCheck = [];
      //populate listOptionTypeCheck
      for (var lo in q["ListOptionTypeCheck"]) {
        print(lo);
        listOptionTypeCheck.add(ProfilingFormOptionType(
          id: lo["Id"].toString(),
          value: lo["Value"],
          isObservation: lo["isObservation"],
          score: lo["Score"] == null ? 0 : lo["Score"],
        ));
      }

      List<ProfilingFormOptionTypeInput> listOptionTypeField = [];
      //populate listOptionTypeField
      for (var lo in q["listOptionTypeField"]) {
        print(lo);
        List<String> options = [];
        if (lo['TypeInput'] == ProfilingFormOptionTypeInput.MULTI_CHECK) {
          for (var option in lo['Options']) {
            options.add(option["Name"]);
          }
        }
        listOptionTypeField.add(ProfilingFormOptionTypeInput(
            id: lo["Id"].toString(),
            hintTextInput: lo["HintTextInput"],
            typeInput: lo["TypeInput"],
            valueInput: lo["ValueInput"],
            options: options));
      }

      formQuestions.add(ProfilingFormOption(
          id: q["Id"].toString(),
          description: q["Description"],
          typeInput: q["TypeInput"],
          descriptionObservation: q["DescriptionObservation"],
          hintTextObservation: q["HintTextObservation"],
          listOptionTypeCheck: listOptionTypeCheck,
          listOptionTypeField: listOptionTypeField));
    }

    return ProfilingItem(
        id: json["Id"].toString(),
        title: json["Title"],
        type: json["Type"],
        description: json["Description"],
        questions: questions,
        formQuestions: formQuestions);
  }

  ///Maps a not-very-cool profiling response to a cool Map that can be later used as a cool json
  Map responseToMap(ProfilingResponse datum) {
    var responseItem = {};
    responseItem["QuestionId"] = datum.questionId;
    responseItem["CustomText"] = datum.valueFieldObservation;
    var value = datum.value.value.fold((l) => l.failedValue, (r) => r);
    responseItem["Value"] = [value];

    try {
      responseItem["Number"] = int.parse(datum.responseId);
    } catch (e) {
      responseItem["Number"] = 0;
    }
    double score = datum.score;
    if (score < 0) score = 0;
    responseItem["Score"] = [score];
    // responseItem["Score"] = [1];
    return responseItem;
  }

  @override
  Future<Either<BaseFailure, bool>> getCustomerLevelSimpl() async {
    try {
      var response = await _dio.get(getFindCustomerLevelSimplApi);

      print("---------------------------  ${getFindCustomerLevelSimplApi}");
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(
            "Error actualizando tu perfil: ${response.statusCode}"));

      return right(response.data["Result"]);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
