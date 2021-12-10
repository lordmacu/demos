import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:dartz/dartz.dart';

abstract class IUserVerificationRepository {
  Future<Either<BaseFailure, UserInfoRegistraduria>> getRegistraduriaInfo(
      UserInfoRegistraduria userInfo);

  Future<Either<BaseFailure, bool>> getChangedDocument(String document);
  Future<UserVerificationState> setUpGenericData();
  Future<Map<String, String>> getRegions(String countryId);
  Future<Either<BaseFailure, bool>> updateIdentification(
      UserInfoRegistraduria userInfo);
  Future<Either<BaseFailure, Map<String, List>>> getQuestions();
  Future<Either<BaseFailure, bool>> answerQuestions(
      List answers, String questionId, String record);
  Future<Either<BaseFailure, bool>> scheduleDebit(
      BankAccountItem item, DashboardGoal goal);
  Future<Either<BaseFailure, bool>> pseTransaction(double value);
}
