import 'dart:async';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/hubs_pot/i_hubs_pot_repo.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/domain/user_verification/i_user_verification_repository.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:ualet/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

part 'user_verification_event.dart';
part 'user_verification_state.dart';
part 'user_verification_bloc.freezed.dart';

@injectable
class UserVerificationBloc
    extends Bloc<UserVerificationEvent, UserVerificationState> {
  final IUserVerificationRepository _userVerificationRepository;
  final IHubsPotRepo _hubsPotRepo;
  UserVerificationBloc(this._userVerificationRepository, this._hubsPotRepo);

  @override
  UserVerificationState get initialState => UserVerificationState.initial();

  @override
  Stream<UserVerificationState> mapEventToState(
    UserVerificationEvent event,
  ) async* {
    yield* event.map(
      setUpForm: (e) async* {
        yield state.copyWith(
            isSubmitting: true, registraduriaInfoOption: none());
        UserVerificationState setUp =
            await _userVerificationRepository.setUpGenericData();
        yield state.copyWith(
          countries: setUp.countries,
          idTypes: setUp.idTypes,
          isSubmitting: false,
          registraduriaInfoOption: none(),
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      documentTypeChanged: (e) async* {
        int idType = state.idTypes.indexOf(e.documentType) + 1;
        yield state.copyWith(
          userInfo: state.userInfo.copyWith(
            idType: idType,
          ),
          registraduriaInfoOption: none(),
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      documentChanged: (e) async* {
        var isDocumentUsed =
            await _userVerificationRepository.getChangedDocument(e.documentId);

        if(isDocumentUsed!=null){
          bool isUsed = isDocumentUsed.fold((l) {
            return false;
          }, (r) {
            return r;
          });

          yield state.copyWith(
              userInfo: state.userInfo.copyWith(id: e.documentId),
              registraduriaInfoOption: none(),
              buttonVerificationActive: buttonActive(state.userInfo, false),
              isDocumentUsed: isUsed);
        }

      },
      surnameChanged: (e) async* {
        yield state.copyWith(
          userInfo: state.userInfo.copyWith(surname: e.surname),
          registraduriaInfoOption: none(),
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      getInfoRegistraduria: (e) async* {
        bool blockedAlert = false;
        yield state.copyWith(isSubmitting: true);

        var infoRegistraduriaOrFailure =
            await _userVerificationRepository.getRegistraduriaInfo(e.info);

        infoRegistraduriaOrFailure.fold(
            (l) => null, (r) => {blockedAlert = r.blockedAlert});

        yield state.copyWith(
          isSubmitting: false,
          registraduriaInfoOption: some(
            infoRegistraduriaOrFailure,
          ),
          buttonVerificationActive: buttonActive(state.userInfo, blockedAlert),
        );
      },
      fillFields: (e) async* {
        yield state.copyWith(
          userInfo: e.info,
          countries: e.countries,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      firstNameChanged: (e) async* {
        var userInfo = state.userInfo.copyWith(firstName: e.firstName);
        yield state.copyWith(
          userInfo: userInfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      secondNameChanged: (e) async* {
        var userInfo = state.userInfo.copyWith(secondName: e.secondName);
        yield state.copyWith(
          userInfo: userInfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      firstSurnameChanged: (e) async* {
        var userInfo = state.userInfo.copyWith(
          surname: e.firstSurname,
        );
        yield state.copyWith(
          userInfo: userInfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      secondSurnameChanged: (e) async* {
        var userInfo = state.userInfo.copyWith(
          secondSurname: e.secondSurname,
        );
        yield state.copyWith(
          userInfo: userInfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      birthDateChanged: (e) async* {
        var userInfo = state.userInfo.copyWith(
          birthDate: e.birthDate,
        );
        yield state.copyWith(
          userInfo: userInfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      countryChanged: (e) async* {
        yield state.copyWith(
          dropdownDisabled: true,
          isSubmitting: true,
        );
        int countrycode = state.countries.indexOf(e.countryString) + 1;
        var regionsMap = await _userVerificationRepository
            .getRegions(countrycode.toString());
        List<String> regions = [];
        regionsMap.forEach((key, value) {
          regions.add(value);
        });
        var userinfo = state.userInfo.copyWith(
          countryId: countrycode,
          regionId: -1,
          expeditionRegionId: -1,
        );
        var b = buttonActive(state.userInfo, false);
        yield state.copyWith(
          isSubmitting: false,
          dropdownDisabled: false,
          regionsMap: regionsMap,
          regions: regions,
          expeditionRegionText: "",
          regionText: "",
          countryText: e.countryString,
          userInfo: userinfo,
          buttonVerificationActive: b,
        );
      },
      birthRegionChanged: (e) async* {
        var regionId = state.regionsMap.keys.firstWhere(
            (element) => state.regionsMap[element] == e.regionString,
            orElse: () => null);
        var userinfo = state.userInfo.copyWith(
          regionId: regionId != null ? int.parse(regionId) : -1,
        );
        yield state.copyWith(
          regionText: e.regionString,
          userInfo: userinfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      genderChanged: (e) async* {
        int genderId = state.genderId.indexOf(e.gender) + 1;
        var userinfo = state.userInfo.copyWith(
          genderId: genderId,
        );
        yield state.copyWith(
          userInfo: userinfo,
          buttonVerificationActive: buttonActive(state.userInfo, false),
        );
      },
      expeditionDateChanged: (e) async* {
        var userinfo = state.userInfo.copyWith(
          expeditionDate: e.expeditionDate,
        );
        yield state.copyWith(
          userInfo: userinfo,
          buttonVerificationActive: buttonActive(userinfo, false),
        );
      },
      expeditionRegionChanged: (e) async* {
        var regionId = state.regionsMap.keys.firstWhere(
          (element) => state.regionsMap[element] == e.regionString,
          orElse: () => null,
        );
        var userinfo = state.userInfo.copyWith(
          expeditionRegionId: regionId != null ? int.parse(regionId) : -1,
        );
        bool btnBool = buttonActive(userinfo, false);
        yield state.copyWith(
            expeditionRegionText: e.regionString,
            userInfo: userinfo,
            buttonVerificationActive: btnBool);
      },
      updateId: (e) async* {
        yield state.copyWith(isSubmitting: true);
        if (buttonActive(state.userInfo, false)) {
          var updatedOrInfo =
              await _userVerificationRepository.updateIdentification(e.info);

          yield state.copyWith(
            isSubmitting: false,
            updateOption: some(updatedOrInfo),
          );
        } else {
          yield state.copyWith(
              isSubmitting: false, buttonVerificationActive: false);
        }
      },
      answerOneQuestion: (e) async* {
        List answers = state.answers;
        Map<String, String> answer = {e.questionId: e.answerId};
        answers.add(answer);
        print(state.answers);
        yield state.copyWith(
          validateEvidente: none(),
          answers: answers,
          buttonsDisabled: false,
        );
      },
      answerQuestions: (e) async* {
        yield state.copyWith(isSubmitting: true);

        var successOrFailure = await _userVerificationRepository
            .answerQuestions(state.answers, state.questionsId, state.record);

        // await successOrFailure.fold((l) => null,
        //     (r) async => await getIt<IInvestingRepository>().softEnrollment());

        yield state.copyWith(
          isSubmitting: false,
          validateEvidente: some(successOrFailure),
          answers: [],
        );
        // yield state.copyWith(
        //   validateEvidente: none(),
        // );
      },
      getQuestions: (e) async* {
        yield state.copyWith(isSubmitting: true, validateEvidente: none());
        var questionsOrFailure =
            await _userVerificationRepository.getQuestions();

        yield state.copyWith(
          getQuestionsOption: some(questionsOrFailure),
          validateEvidente: none(),
          answers: [],
        );
      },
      fillQuestions: (e) async* {
        String questionId = "";
        List questions = [];

        e.questionsData.forEach((key, value) {
          if (key != "Record") {
            questionId = key;
            questions = value;
          }
        });
        yield state.copyWith(
          record: e.questionsData['Record'].first,
          questions: questions,
          questionsId: questionId,
          isSubmitting: false,
          getQuestionsOption: none(),
        );
      },
      changeButtonsDisabled: (e) async* {
        yield state.copyWith(buttonsDisabled: e.newValue);
      },
      scheduleDebit: (e) async* {
        yield state.copyWith(isSubmitting: true);

        var scheduledOrFailure =
            await _userVerificationRepository.scheduleDebit(e.item, e.goal);
        yield state.copyWith(
            isSubmitting: false, scheduleDebitOption: some(scheduledOrFailure));
      },
      pseTransaction: (e) async* {
        yield state.copyWith(isSubmitting: true);

        var pseOrFailure =
            await _userVerificationRepository.pseTransaction(e.value);

        yield state.copyWith(
            isSubmitting: false, pseTransactionOption: some(pseOrFailure));
      },
    );
  }

  bool buttonActive(UserInfoRegistraduria info, bool blockedAlert) {
    if (info.idType != 0 &&
        info.firstName != "" &&
        info.surname != "" &&
        info.id != "" &&
        info.birthDate != null &&
        info.countryId != -1 &&
        info.regionId != -1 &&
        info.expeditionDate != null &&
        info.expeditionRegionId != -1 &&
        !blockedAlert &&
        (info.genderId != null && info.genderId > 0) &&
        info.expeditionDate
            .isAfter(info.birthDate.add(Duration(days: 365 * 18)))) {
      return true;
    } else {
      return false;
    }
  }
}
