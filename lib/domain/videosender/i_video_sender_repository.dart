import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';

abstract class IVideoSenderRepository {
 // Future<Either<BaseFailure, bool>> sendVideoId(String id, DateTime date);
  Future<Either<BaseFailure, bool>> sendVideo(String path, String date);
}
