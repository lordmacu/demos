import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/i_account_repository.dart';
import 'package:ualet/domain/myaccount/value_objects.dart';

part 'change_info_event.dart';
part 'change_info_state.dart';

part 'change_info_bloc.freezed.dart';

@injectable
class ChangeInfoBloc extends Bloc<ChangeInfoEvent, ChangeInfoState> {
  final IAccountRepository _accountRepository;

  ChangeInfoBloc(this._accountRepository);

  @override
  ChangeInfoState get initialState => ChangeInfoState.initial();

  @override
  Stream<ChangeInfoState> mapEventToState(ChangeInfoEvent event) async* {
    yield* event.map(
      emailChanged: (e) async* {
        bool isAvailable = await _accountRepository.getEmailAvailable(e.email);
        yield state.copyWith(
          emailAddress: EmailAddress(e.email),
          emailAvailable: isAvailable,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      confirmIdentification: (e) async* {
        bool isAvailable = await _accountRepository.confirmIdentification("");
        yield state.copyWith(
          emailAddress: EmailAddress(e.email),
          emailAvailable: isAvailable,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.password),
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      newPasswordChanged: (e) async* {
        bool isSame = false;
        isSame = state.newPasswordConfirm.value
            .fold((l) => false, (r) => r == e.password);
        yield state.copyWith(
          newPassword: Password(e.password),
          arePasswordsSame: isSame,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      newPasswordConfirmChanged: (e) async* {
        bool isSame = false;
        isSame =
            state.newPassword.value.fold((l) => false, (r) => r == e.password);
        yield state.copyWith(
          newPasswordConfirm: Password(e.password),
          arePasswordsSame: isSame,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      phoneNumberChanged: (e) async* {
        String phoneNumber = e.phoneNumber.replaceAll(" ", "");
        bool isAvailable =
            await _accountRepository.getphoneNumberAvailable(phoneNumber);
        yield state.copyWith(
          phoneNumber: PhoneNumber(phoneNumber),
          phoneNumberAvailable: isAvailable,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      updatePhoneNumber: (e) async* {
        bool nextProcess = false;
        yield state.copyWith(isSubmitting: true);
        String phoneNumber = e.phoneNumber.replaceAll(" ", "");
        bool isSuccess =
            await _accountRepository.updatePhoneNumber(phoneNumber);

        if (isSuccess) {
          final response = await _accountRepository.sendOTP(phoneNumber);
          response.fold((l) => {}, (r) {
            nextProcess = true;
          });
        }

        yield state.copyWith(
          isSubmitting: false,
          sendOtp: nextProcess,
          phoneNumber: PhoneNumber(phoneNumber),
          saveUpdatephoneNumber: isSuccess,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      otpChanged: (e) async* {
        yield state.copyWith(
          otp: OTP(e.otp),
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      sendEmail: (e) async* {
        yield state.copyWith(isSubmitting: true);
        await _accountRepository.sendEmail(e.email, e.phoneNumber);
        yield state.copyWith(
          isSubmitting: false,
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      checkEmailConfirmed: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrConfirmed =
            await _accountRepository.validateEmail(e.email);
        yield state.copyWith(
          isSubmitting: false,
          emailConfirmedOption: some(failureOrConfirmed),
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      sendOTP: (e) async* {
        bool nextProcess = false;
        yield state.copyWith(isSubmitting: true);
        final response = await _accountRepository.sendOTP(e.phoneNumber);
        response.fold((l) => {}, (r) {
          nextProcess = true;
        });

        yield state.copyWith(
          isSubmitting: false,
          sendOtp: nextProcess,
          phoneNumber: PhoneNumber(e.phoneNumber),
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      validateOTP: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrValidated =
            await _accountRepository.validateOTP(e.phoneNumber, e.otp);
        yield state.copyWith(
          isSubmitting: false,
          phoneConfirmedOption: some(failureOrValidated),
          changeEmailOption: none(),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
        );
      },
      changeEmail: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrEmailedChanged =
            await _accountRepository.changeEmail(e.email);
        yield state.copyWith(
          isSubmitting: false,
          changeEmailOption: some(failureOrEmailedChanged),
          changePasswordOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      changePassword: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrPasswordChanged = await _accountRepository
            .changePassword(e.password, e.newPassword, e.confirmPassword);
        yield state.copyWith(
          isSubmitting: false,
          changePasswordOption: some(failureOrPasswordChanged),
          changeEmailOption: none(),
          changePhoneNumberOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
      changePhoneNumber: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrPhoneChanged =
            await _accountRepository.changePhoneNumber(e.phoneNumber);
        yield state.copyWith(
          isSubmitting: false,
          changePhoneNumberOption: some(failureOrPhoneChanged),
          changeEmailOption: none(),
          changePasswordOption: none(),
          emailConfirmedOption: none(),
          phoneConfirmedOption: none(),
        );
      },
    );
  }
}
