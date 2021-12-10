part of 'user_verification_bloc.dart';

@freezed
abstract class UserVerificationState with _$UserVerificationState {
  const factory UserVerificationState({
    UserInfoRegistraduria userInfo,
    Map<String, String> regionsMap,
    List<String> countries,
    List<String> regions,
    List<String> genderId,
    List<String> idTypes,
    bool isSubmitting,
    bool buttonVerificationActive,
    bool isDocumentUsed,
    bool dropdownDisabled,
    Option<Either<BaseFailure, UserInfoRegistraduria>> registraduriaInfoOption,
    Option<Either<BaseFailure, bool>> updateOption,
    Option<Either<BaseFailure, bool>> validateEvidente,
    Option<Either<BaseFailure, bool>> scheduleDebitOption,
    Option<Either<BaseFailure, bool>> pseTransactionOption,
    Option<Either<BaseFailure, Map<String, List<dynamic>>>> getQuestionsOption,
    List questions,
    String questionsId,
    String regionText,
    String expeditionRegionText,
    String countryText,
    List<Map<String, String>> answers,
    bool buttonsDisabled,
    String record,
  }) = _UserVerificationState;

  factory UserVerificationState.initial() => UserVerificationState(
        userInfo: UserInfoRegistraduria.empty(),
        regionsMap: {},
        countries: [],
        genderId: ["Femenino", "Masculino"],
        idTypes: ["Cédula de ciudadanía"],
        regions: [],
        isSubmitting: false,
        registraduriaInfoOption: none(),
        updateOption: none(),
        buttonVerificationActive: false,
        isDocumentUsed: false,
        dropdownDisabled: false,
        questions: [],
        getQuestionsOption: none(),
        questionsId: "",
        regionText: "",
        expeditionRegionText: "",
        countryText: "",
        answers: [],
        buttonsDisabled: false,
        validateEvidente: none(),
        pseTransactionOption: none(),
        scheduleDebitOption: none(),
      );
}