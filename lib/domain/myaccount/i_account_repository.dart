import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/user_info.dart';

abstract class IAccountRepository {
  Stream<Either<BaseFailure, UserInfo>> getUserInfo();
  Future<bool> getEmailAvailable(String email);
  Future<bool> confirmIdentification(String email);
  Future<bool> getphoneNumberAvailable(String phoneNumber);
  Future<bool> updatePhoneNumber(String phoneNumber);
  Future<bool> sendEmail(String email, String phoneNumber);
  Future<Either<BaseFailure, bool>> validateEmail(String email);
  Future<Either<BaseFailure, bool>> sendOTP(String phoneNumber);
  Future<Either<BaseFailure, bool>> validateOTP(String phoneNumber, String otp);
  Future<Either<BaseFailure, bool>> changeEmail(String email);
  Future<Either<BaseFailure, bool>> changePassword(
      String password, String newPassword, String confirmPassword);
  Future<Either<BaseFailure, bool>> changePhoneNumber(String phoneNumber);
}
