import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/support/i_support_message_repository.dart';
import 'package:ualet/domain/support/support_message.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

@LazySingleton(as: ISupportMessageRepository)
class SupportMessageRepository implements ISupportMessageRepository {
  final Dio _dio;
  final api = "/Data/RequestSupport";

  SupportMessageRepository(this._dio);

  @override
  Future<Either<BaseFailure, SupportMessage>> postSupportMessage(
      SupportMessage message) async {
    FormData formData = new FormData.fromMap({"message": message.message, "typology": message.typology});
    if (message.file != null) {
      MultipartFile f = await MultipartFile.fromFile(message.file.path);
      formData = new FormData.fromMap({
        "message": message.message,
        "file": f,
        "typology": message.typology
      });
    }

    var response = await _dio.post(api, data: formData);
    if (response.data['Result']) {
      return right(SupportMessage(message: response.data["Message"]));
    } else {
      return left(BaseFailure.fromServer(response.data['Message']));
    }
  }
}
