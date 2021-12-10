import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';

abstract class IRegisterRepository {
  Future<bool> getEmailAvailable(String email);
  Future<bool> getphoneNumberAvailable(String phoneNumber);
  Future<bool> sendEmail(String email, String phoneNumber, bool privacy, bool medios);
  Future<bool> sendOTP(String phoneNumber, int actionOtpType);
  Future<Either<BaseFailure, bool>> validateEmail(String email);
  Future<Either<BaseFailure, bool>> validateOTP(String phone, String otp, int actionOtpType);
  Future<Either<BaseFailure, bool>> register(String name, String email,
      String password, String phoneNumber, bool acceptTerms, bool acceptedPrivacy);
  Future<String> getEmailByPhoneNumber(String phoneNumber);
  Future<Either<BaseFailure, bool>> changePassword(
      String email, String newPassword, String confirmPassword);
  Future<Either<BaseFailure, bool>> updateLocation();
  Future<String> getIP();
}
