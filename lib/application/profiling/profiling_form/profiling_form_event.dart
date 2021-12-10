part of 'profiling_form_bloc.dart';

@freezed
abstract class ProfilingFormEvent with _$ProfilingFormEvent {
  const factory ProfilingFormEvent.responseSliderChanged(
      String questionId,
      String responseId,
      double score,
      String value,
      Tuple2<double, double> limits) = _ResponseSliderChanged;

  const factory ProfilingFormEvent.responseUniqueCheckChanged(
    double score,
      String questionId, String responseId) = _ResponseUniqueCheckChanged;

  const factory ProfilingFormEvent.responseUniqueFormCheckChanged(
      String questionId,
      double score,
      String responseId,
      String isValueCheck,
      String valueFieldObservation) = _ResponseUniqueFormCheckChanged;

  const factory ProfilingFormEvent.responseFormSubquestion(
    double score,
          String questionId, String subquestionId, String responseText) =
      _ResponseFormSubquestion;
  const factory ProfilingFormEvent.responseMultiCheckChanged(double score,
      String questionId, String responseId) = _ResponseMultiCheckChanged;
  const factory ProfilingFormEvent.nextQuestion(int size) = _NextQuestion;
  const factory ProfilingFormEvent.previousQuestion() = _PreviousQuestion;

  const factory ProfilingFormEvent.postProfiling() = _PostProfiling;

  const factory ProfilingFormEvent.setItems(KtList<ProfilingItem> items) = _SetItems;
}
