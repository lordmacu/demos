part of 'user_verification_bloc.dart';

@freezed
abstract class UserVerificationEvent with _$UserVerificationEvent {
  const factory UserVerificationEvent.setUpForm() = SetUpForm;
  const factory UserVerificationEvent.documentTypeChanged(String documentType) =
      DocumentTypeChanged;
  const factory UserVerificationEvent.documentChanged(String documentId) =
      DocumentChanged;
  const factory UserVerificationEvent.surnameChanged(String surname) =
      SurnameChanged;
  const factory UserVerificationEvent.getInfoRegistraduria(
      UserInfoRegistraduria info) = GetInfoRegistraduria;
  const factory UserVerificationEvent.fillFields(
      UserInfoRegistraduria info, List<String> countries) = FillFields;
  const factory UserVerificationEvent.firstNameChanged(String firstName) =
      FirstNameChanged;
  const factory UserVerificationEvent.secondNameChanged(String secondName) =
      SecondNameChanged;
  const factory UserVerificationEvent.firstSurnameChanged(String firstSurname) =
      FirstSurnameChanged;
  const factory UserVerificationEvent.secondSurnameChanged(
      String secondSurname) = SecondSurnameChanged;
  const factory UserVerificationEvent.birthDateChanged(DateTime birthDate) =
      BirthDateChanged;
  const factory UserVerificationEvent.countryChanged(String countryString) =
      CountryChanged;
  const factory UserVerificationEvent.birthRegionChanged(String regionString) =
      BirthRegionChanged;
  const factory UserVerificationEvent.genderChanged(String gender) =
      GenderChanged;
  const factory UserVerificationEvent.expeditionDateChanged(
      DateTime expeditionDate) = ExpeditionDateChanged;
  const factory UserVerificationEvent.expeditionRegionChanged(
      String regionString) = ExpeditionRegionChanged;
  const factory UserVerificationEvent.updateId(UserInfoRegistraduria info) =
      UpdateId;
  const factory UserVerificationEvent.getQuestions() = GetQuestions;
  const factory UserVerificationEvent.answerQuestions() = AnswerQuestions;
  const factory UserVerificationEvent.answerOneQuestion(
      String answerId, String questionId) = AnswerOneQuestion;
  const factory UserVerificationEvent.changeButtonsDisabled(bool newValue) =
      ChangeButtonsDisabled;
  const factory UserVerificationEvent.scheduleDebit(
      BankAccountItem item, DashboardGoal goal) = ScheduleDebit;
  const factory UserVerificationEvent.pseTransaction(double value) =
      PSETransaction;
  const factory UserVerificationEvent.fillQuestions(
      Map<String, List<dynamic>> questionsData) = FillQuestions;
}
