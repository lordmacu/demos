import 'package:dio/dio.dart' as dio;
import 'package:injectable/injectable.dart';
import 'package:ualet/to_be_refactor/models/profiling/get_questions.dart';

@lazySingleton
class ProfilingService {
  final dio.Dio _dio;
  static const QUESTION_PROFILING_END_POINT = '/User/QuestionsProfiling';

  ProfilingService(this._dio);

  Future<GetProfileQuestionsModel> getQuestionsProfiling() async {
    try {
      final dio.Response response =
          await _dio.get(QUESTION_PROFILING_END_POINT);
      final decodedData = GetProfileQuestionsModel.fromJson(response.data);

      return decodedData;
    } on dio.DioError catch (e) {
      print(e);
      return null;
    }
  }
}
