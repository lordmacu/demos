import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/profiling/i_profiling_repository.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';

@LazySingleton(as: IProfilingRepository)
class ParamsRepository implements IProfilingRepository {
  final Dio _dio;

  ParamsRepository(this._dio);

  @override
  Future<Either<BaseFailure, KtList<ProfilingItem>>> getProfilingItems() {
    var list = List<ProfilingItem>();
    list.add(ProfilingItem(
        formQuestions: [],
        id: '1',
        type: '1',
        title: 'Esto quedará entre tú y yo',
        description: '¿Cuál es tu ingreso mensual?',
        questions: [
          ProfilingOption(
              score: 0, id: '1', emoji: 'null', description: '', value: 50000),
          ProfilingOption(
              score: 0, id: '2', emoji: 'null', description: '', value: 800000),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: 'null',
              description: '',
              value: 3000000),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: 'null',
              description: '',
              value: 10000000)
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '2',
        type: '2',
        title: 'Esto quedará entre tú y yo',
        description:
        '¿Qué porcentaje de este ingreso estás dispuesto a destinar a ahorro o inversión?',
        questions: [
          ProfilingOption(
              score: 0, id: '1', emoji: 'null', description: '', value: 1),
          ProfilingOption(
              score: 0, id: '2', emoji: 'null', description: '', value: 10),
          ProfilingOption(
              score: 0, id: '3', emoji: 'null', description: '', value: 20),
          ProfilingOption(
              score: 0, id: '4', emoji: 'null', description: '', value: 50),
          ProfilingOption(
              score: 0, id: '5', emoji: 'null', description: '', value: 100)
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '3',
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
        id: '4',
        type: '4',
        title: 'Toma una decisión',
        description:
        'Si hicieras una inversión considerable y tu dinero empezara a tener variaciones, tú:',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '🏃‍♀️',
              description: 'Retirar mi inversión, no estoy dispuesto a perder',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '2',
              emoji: '🧘',
              description:
              'Sería paciente si me explican a qué se debe la veriación',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '🤷‍♀️',
              description:
              'Entiendo que es normal perder o ganar según el comportamiento del mercado',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '👨‍💻',
              description:
              'Tengo mayor interés por el comportamiento a largo plazo',
              value: 0),
        ]));
    list.add(ProfilingItem(
        formQuestions: [],
        id: '5',
        type: '5',
        title: 'Vamos a recordar',
        description:
        '¿En cuales de los siguientes instrumentos financieros has realizado inversión en los últimos 2 años?',
        questions: [
          ProfilingOption(
              score: 0,
              id: '1',
              emoji: '💰',
              description:
              'Cuenta bancaria/Depósito (ahorros, corriente, digital)',
              value: 0),
          ProfilingOption(
              score: 0, id: '2', emoji: '📝', description: 'CDT', value: 0),
          ProfilingOption(
              score: 0,
              id: '3',
              emoji: '🔐',
              description: 'Seguros (Diferentes al SOAT)',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '4',
              emoji: '📊',
              description: 'Créditos',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '5',
              emoji: '💳',
              description: 'Tarjeta de crédito',
              value: 0),
          ProfilingOption(
              score: 0,
              id: '6',
              emoji: '📈',
              description: 'Acciones listadas en bolsa',
              value: 0),
          ProfilingOption(
              score: 0, id: '7', emoji: '❓', description: 'Otro.', value: 0),
        ]));

    return Future.delayed(Duration(seconds: 1), () => right(KtList.from(list)));
  }

  @override
  Future<Either<BaseFailure, ProfilingResult>> postProfilingData(data) {
    return Future.delayed(
        Duration(seconds: 2),
            () => right(ProfilingResult(
            connectedProfileId: "1",
            id: 1,
            title: 'Estratega',
            subtitle: 'Nivel de riesgo bajo',
            description:
            'Como un director de orquesta eres cauteloso, pero tomas riesgos en algunos casos con el fin de maximizar tus ganancias. No te asusta tener algunas pérdidas, si con ellas tienes la posibilidad de ganar más.',
            image: '🧐')));
  }
}
