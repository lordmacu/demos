import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/videosender/i_video_sender_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/injection.dart';

@LazySingleton(as: IVideoSenderRepository)
class VideoSenderRepository implements IVideoSenderRepository {
  final Dio _dio;
  final apiVideoSender = "/Video/DriveUpload";

  VideoSenderRepository(this._dio);

  @override
  Future<Either<BaseFailure, bool>> sendVideo(String file, String date) async {

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file,
        filename: "video.mp4",
      ),
    });

    print("aquiii el video a enviuar   ${file}");

    try {
      var response = await _dio.post(
        "${apiVideoSender}?timeSpan=${date}&configFileId=8",
        data: formData,

      );

      print("esta es la resputsta del server  ${response.data["Result"]}");

      if (response.data["Result"]) {

         return right(true);
      } else {
        return left(BaseFailure.fromServer(response.data["Message"]));
      }
    } catch (err) {

      print("este es el error ${err}´");
      return left(BaseFailure.fromServer("error"));
    }
  }
}
