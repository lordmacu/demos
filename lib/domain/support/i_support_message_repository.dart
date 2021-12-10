import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/support/support_message.dart';

abstract class ISupportMessageRepository {
  Future<Either<BaseFailure, SupportMessage>> postSupportMessage(
      SupportMessage message);
}
