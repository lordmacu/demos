import 'dart:async';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/value_objects.dart';
import 'package:ualet/domain/register/i_register_repository.dart';
import 'package:ualet/to_be_refactor/models/login/login_request_model.dart';
import 'package:ualet/to_be_refactor/services/login/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IRegisterRepository _registerRepository;
  final LoginService _loginService;
  final SharedPreferences _prefs;

  RegisterBloc(this._registerRepository, this._loginService, this._prefs);

  @override
  RegisterState get initialState => RegisterState.initial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield* event.map(getGeoreferenciacionIP: (value) async* {
      String ip = await _registerRepository.getIP();
      print("IP: $ip");
      _prefs.setString("lon", ip);
      _prefs.setString("lat", ip);
      print("IP SAVED:::$ip");
    }, getGeoreferenciacionGPS: (value) async* {
      print("Get Loc GPS");

      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        print("GPS Permission available");
        Position position =
            await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print(
            "LOCATION: ${position.longitude.toString()}: ${position.latitude.toString()}");
        _prefs.setString("lon", position.longitude.toString());
        _prefs.setString("lat", position.latitude.toString());
        yield state.copyWith(
          allowedGeoreferencing: true,
          timesAskedGeo: state.timesAskedGeo + 1,
        );
      } else {
        yield state.copyWith(
          allowedGeoreferencing: false,
          timesAskedGeo: state.timesAskedGeo + 1,
        );
      }
    }, emailChanged: (e) async* {
      bool isAvailable = true;
      yield state.copyWith(
        emailAddress: EmailAddress(e.email),
        isRetrieving: true,
      );
      if (e.email.length > 5 && EmailAddress(e.email).value.isRight()) {
        isAvailable = await _registerRepository.getEmailAvailable(e.email);
      }
      yield state.copyWith(
          emailAddress: EmailAddress(e.email),
          emailAvailable: isAvailable,
          isRetrieving: false,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, confirmIdentification: (e) async* {
      yield state.copyWith(
          isRetrieving: false,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, passwordChanged: (e) async* {
      bool isSame = false;
      isSame = state.confirmPassword.value
          .fold((l) => false, (r) => r == e.password);
      yield state.copyWith(
          password: Password(e.password),
          arePasswordsSame: isSame,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, confirmPasswordChanged: (e) async* {
      bool isSame = false;
      isSame = state.password.value
          .fold((l) => false, (r) => r == e.confirmPassword);
      yield state.copyWith(
          confirmPassword: Password(e.confirmPassword),
          arePasswordsSame: isSame,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, nameChanged: (e) async* {
      yield state.copyWith(
          name: Name(e.name),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, phoneNumberChanged: (e) async* {
      String phoneNumber = e.phoneNumber.replaceAll(" ", "");
      yield state.copyWith(
        phoneNumber: PhoneNumber(phoneNumber),
        isRetrieving: true,
      );
      bool isAvailable = true;
      if (phoneNumber.length > 9 && PhoneNumber(phoneNumber).value.isRight()) {
        isAvailable =
            await _registerRepository.getphoneNumberAvailable(phoneNumber);
      }
      yield state.copyWith(
          phoneNumber: PhoneNumber(phoneNumber),
          phoneNumberAvailable: isAvailable,
          isRetrieving: false,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, otpChanged: (e) async* {
      yield state.copyWith(
          otp: OTP(e.otp),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, acceptedTermsChanged: (e) async* {
      yield state.copyWith(acceptedTerms: e.checked);
    }, acceptedPrivacy: (e) async* {
      yield state.copyWith(acceptedPrivacy: e.checked);
    }, sendEmail: (e) async* {
      yield state.copyWith(isSubmitting: true);
      await _registerRepository.sendEmail(e.email, e.phoneNumber,e.privacy,e.medios);
      yield state.copyWith(
          isSubmitting: false,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, sendOTP: (e) async* {
      yield state.copyWith(isSubmitting: true);
      await _registerRepository.sendOTP(e.phoneNumber, e.actionOtpType);
      yield state.copyWith(
        isSubmitting: false,
        emailConfirmedOption: none(),
        phoneConfirmedOption: none(),
        registerOption: none(),
        changePasswordOption: none(),
        otpSent: true,
      );
    }, checkEmailConfirmed: (e) async* {
      yield state.copyWith(isSubmitting: true);
      final failureOrConfirmed =
          await _registerRepository.validateEmail(e.email);
      yield state.copyWith(
          isSubmitting: false,
          emailConfirmedOption: some(failureOrConfirmed),
          phoneConfirmedOption: none(),
          registerOption: none(),
          changePasswordOption: none());
    }, validateOTP: (e) async* {
      yield state.copyWith(isSubmitting: true);
      final failureOrValidated =
          await _registerRepository.validateOTP(e.phoneNumber, e.otp, e.actionOtpType);
      yield state.copyWith(
          isSubmitting: false,
          emailConfirmedOption: none(),
          phoneConfirmedOption: some(failureOrValidated),
          registerOption: none(),
          changePasswordOption: none());
    }, register: (e) async* {
      yield state.copyWith(isSubmitting: true);
      final failureOrRegistered = await _registerRepository.register(
          e.name, e.email, e.password, e.phoneNumber, e.acceptedTerms, e.acceptedPrivacy);

      var request = LoginRequestModel(
        deviceId: 'FIREBASE',
        password: e.password,
        platformId: 1,
        userName: e.email,
      );
      var loginResponse = await _loginService.login(request);
      var ipResponse = await _registerRepository.updateLocation();
      yield state.copyWith(
        isSubmitting: false,
        emailConfirmedOption: none(),
        phoneConfirmedOption: none(),
        changePasswordOption: none(),
        registerOption: some(failureOrRegistered),
        finishedRegister: true,
      );
    }, changePassword: (e) async* {
      yield state.copyWith(isSubmitting: true);
      final failureOrPasswordChanged = await _registerRepository.changePassword(
          e.email, e.newPassword, e.confirmPassword);
      yield state.copyWith(
        isSubmitting: false,
        emailConfirmedOption: none(),
        phoneConfirmedOption: none(),
        registerOption: none(),
        changePasswordOption: some(failureOrPasswordChanged),
        finishedRegister: true,
      );
    }, getEmailByPhoneNumber: (e) async* {
      yield state.copyWith(isSubmitting: true);
      String email =
          await _registerRepository.getEmailByPhoneNumber(e.phoneNumber);
      yield state.copyWith(
          isSubmitting: false,
          emailByPhone: email,
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
          registerOption: none());
    }, changeSentOTP: (e) async* {
      yield state.copyWith(
        otpSent: false,
        emailConfirmedOption: none(),
        phoneConfirmedOption: none(),
        registerOption: none(),
        changePasswordOption: none(),
      );
    });
  }
}
