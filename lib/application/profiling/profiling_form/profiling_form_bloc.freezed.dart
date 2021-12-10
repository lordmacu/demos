// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  });
}

class _$ProfilingFormEventTearOff {
  const _$ProfilingFormEventTearOff();

  _ResponseSliderChanged responseSliderChanged(
      String questionId,
      String responseId,
      double score,
      String value,
      Tuple2<double, double> limits) {
    return _ResponseSliderChanged(
      questionId,
      responseId,
      score,
      value,
      limits,
    );
  }

  _ResponseUniqueCheckChanged responseUniqueCheckChanged(
      double score, String questionId, String responseId) {
    return _ResponseUniqueCheckChanged(
      score,
      questionId,
      responseId,
    );
  }

  _ResponseUniqueFormCheckChanged responseUniqueFormCheckChanged(
      String questionId,
      double score,
      String responseId,
      String isValueCheck,
      String valueFieldObservation) {
    return _ResponseUniqueFormCheckChanged(
      questionId,
      score,
      responseId,
      isValueCheck,
      valueFieldObservation,
    );
  }

  _ResponseFormSubquestion responseFormSubquestion(double score,
      String questionId, String subquestionId, String responseText) {
    return _ResponseFormSubquestion(
      score,
      questionId,
      subquestionId,
      responseText,
    );
  }

  _ResponseMultiCheckChanged responseMultiCheckChanged(
      double score, String questionId, String responseId) {
    return _ResponseMultiCheckChanged(
      score,
      questionId,
      responseId,
    );
  }

  _NextQuestion nextQuestion(int size) {
    return _NextQuestion(
      size,
    );
  }

  _PreviousQuestion previousQuestion() {
    return const _PreviousQuestion();
  }

  _PostProfiling postProfiling() {
    return const _PostProfiling();
  }

  _SetItems setItems(KtList<ProfilingItem> items) {
    return _SetItems(
      items,
    );
  }
}

const $ProfilingFormEvent = _$ProfilingFormEventTearOff();

class _$_ResponseSliderChanged implements _ResponseSliderChanged {
  const _$_ResponseSliderChanged(
      this.questionId, this.responseId, this.score, this.value, this.limits)
      : assert(questionId != null),
        assert(responseId != null),
        assert(score != null),
        assert(value != null),
        assert(limits != null);

  @override
  final String questionId;
  @override
  final String responseId;
  @override
  final double score;
  @override
  final String value;
  @override
  final Tuple2<double, double> limits;

  @override
  String toString() {
    return 'ProfilingFormEvent.responseSliderChanged(questionId: $questionId, responseId: $responseId, score: $score, value: $value, limits: $limits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseSliderChanged &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.limits, limits) ||
                const DeepCollectionEquality().equals(other.limits, limits)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(responseId) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(limits);

  @override
  _$_ResponseSliderChanged copyWith({
    Object questionId = freezed,
    Object responseId = freezed,
    Object score = freezed,
    Object value = freezed,
    Object limits = freezed,
  }) {
    return _$_ResponseSliderChanged(
      questionId == freezed ? this.questionId : questionId as String,
      responseId == freezed ? this.responseId : responseId as String,
      score == freezed ? this.score : score as double,
      value == freezed ? this.value : value as String,
      limits == freezed ? this.limits : limits as Tuple2<double, double>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseSliderChanged(questionId, responseId, score, value, limits);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseSliderChanged != null) {
      return responseSliderChanged(
          questionId, responseId, score, value, limits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseSliderChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseSliderChanged != null) {
      return responseSliderChanged(this);
    }
    return orElse();
  }
}

abstract class _ResponseSliderChanged implements ProfilingFormEvent {
  const factory _ResponseSliderChanged(
      String questionId,
      String responseId,
      double score,
      String value,
      Tuple2<double, double> limits) = _$_ResponseSliderChanged;

  String get questionId;
  String get responseId;
  double get score;
  String get value;
  Tuple2<double, double> get limits;

  _ResponseSliderChanged copyWith(
      {String questionId,
      String responseId,
      double score,
      String value,
      Tuple2<double, double> limits});
}

class _$_ResponseUniqueCheckChanged implements _ResponseUniqueCheckChanged {
  const _$_ResponseUniqueCheckChanged(
      this.score, this.questionId, this.responseId)
      : assert(score != null),
        assert(questionId != null),
        assert(responseId != null);

  @override
  final double score;
  @override
  final String questionId;
  @override
  final String responseId;

  @override
  String toString() {
    return 'ProfilingFormEvent.responseUniqueCheckChanged(score: $score, questionId: $questionId, responseId: $responseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseUniqueCheckChanged &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(responseId);

  @override
  _$_ResponseUniqueCheckChanged copyWith({
    Object score = freezed,
    Object questionId = freezed,
    Object responseId = freezed,
  }) {
    return _$_ResponseUniqueCheckChanged(
      score == freezed ? this.score : score as double,
      questionId == freezed ? this.questionId : questionId as String,
      responseId == freezed ? this.responseId : responseId as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseUniqueCheckChanged(score, questionId, responseId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseUniqueCheckChanged != null) {
      return responseUniqueCheckChanged(score, questionId, responseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseUniqueCheckChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseUniqueCheckChanged != null) {
      return responseUniqueCheckChanged(this);
    }
    return orElse();
  }
}

abstract class _ResponseUniqueCheckChanged implements ProfilingFormEvent {
  const factory _ResponseUniqueCheckChanged(
          double score, String questionId, String responseId) =
      _$_ResponseUniqueCheckChanged;

  double get score;
  String get questionId;
  String get responseId;

  _ResponseUniqueCheckChanged copyWith(
      {double score, String questionId, String responseId});
}

class _$_ResponseUniqueFormCheckChanged
    implements _ResponseUniqueFormCheckChanged {
  const _$_ResponseUniqueFormCheckChanged(this.questionId, this.score,
      this.responseId, this.isValueCheck, this.valueFieldObservation)
      : assert(questionId != null),
        assert(score != null),
        assert(responseId != null),
        assert(isValueCheck != null),
        assert(valueFieldObservation != null);

  @override
  final String questionId;
  @override
  final double score;
  @override
  final String responseId;
  @override
  final String isValueCheck;
  @override
  final String valueFieldObservation;

  @override
  String toString() {
    return 'ProfilingFormEvent.responseUniqueFormCheckChanged(questionId: $questionId, score: $score, responseId: $responseId, isValueCheck: $isValueCheck, valueFieldObservation: $valueFieldObservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseUniqueFormCheckChanged &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)) &&
            (identical(other.isValueCheck, isValueCheck) ||
                const DeepCollectionEquality()
                    .equals(other.isValueCheck, isValueCheck)) &&
            (identical(other.valueFieldObservation, valueFieldObservation) ||
                const DeepCollectionEquality().equals(
                    other.valueFieldObservation, valueFieldObservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(responseId) ^
      const DeepCollectionEquality().hash(isValueCheck) ^
      const DeepCollectionEquality().hash(valueFieldObservation);

  @override
  _$_ResponseUniqueFormCheckChanged copyWith({
    Object questionId = freezed,
    Object score = freezed,
    Object responseId = freezed,
    Object isValueCheck = freezed,
    Object valueFieldObservation = freezed,
  }) {
    return _$_ResponseUniqueFormCheckChanged(
      questionId == freezed ? this.questionId : questionId as String,
      score == freezed ? this.score : score as double,
      responseId == freezed ? this.responseId : responseId as String,
      isValueCheck == freezed ? this.isValueCheck : isValueCheck as String,
      valueFieldObservation == freezed
          ? this.valueFieldObservation
          : valueFieldObservation as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseUniqueFormCheckChanged(
        questionId, score, responseId, isValueCheck, valueFieldObservation);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseUniqueFormCheckChanged != null) {
      return responseUniqueFormCheckChanged(
          questionId, score, responseId, isValueCheck, valueFieldObservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseUniqueFormCheckChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseUniqueFormCheckChanged != null) {
      return responseUniqueFormCheckChanged(this);
    }
    return orElse();
  }
}

abstract class _ResponseUniqueFormCheckChanged implements ProfilingFormEvent {
  const factory _ResponseUniqueFormCheckChanged(
      String questionId,
      double score,
      String responseId,
      String isValueCheck,
      String valueFieldObservation) = _$_ResponseUniqueFormCheckChanged;

  String get questionId;
  double get score;
  String get responseId;
  String get isValueCheck;
  String get valueFieldObservation;

  _ResponseUniqueFormCheckChanged copyWith(
      {String questionId,
      double score,
      String responseId,
      String isValueCheck,
      String valueFieldObservation});
}

class _$_ResponseFormSubquestion implements _ResponseFormSubquestion {
  const _$_ResponseFormSubquestion(
      this.score, this.questionId, this.subquestionId, this.responseText)
      : assert(score != null),
        assert(questionId != null),
        assert(subquestionId != null),
        assert(responseText != null);

  @override
  final double score;
  @override
  final String questionId;
  @override
  final String subquestionId;
  @override
  final String responseText;

  @override
  String toString() {
    return 'ProfilingFormEvent.responseFormSubquestion(score: $score, questionId: $questionId, subquestionId: $subquestionId, responseText: $responseText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseFormSubquestion &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.subquestionId, subquestionId) ||
                const DeepCollectionEquality()
                    .equals(other.subquestionId, subquestionId)) &&
            (identical(other.responseText, responseText) ||
                const DeepCollectionEquality()
                    .equals(other.responseText, responseText)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(subquestionId) ^
      const DeepCollectionEquality().hash(responseText);

  @override
  _$_ResponseFormSubquestion copyWith({
    Object score = freezed,
    Object questionId = freezed,
    Object subquestionId = freezed,
    Object responseText = freezed,
  }) {
    return _$_ResponseFormSubquestion(
      score == freezed ? this.score : score as double,
      questionId == freezed ? this.questionId : questionId as String,
      subquestionId == freezed ? this.subquestionId : subquestionId as String,
      responseText == freezed ? this.responseText : responseText as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseFormSubquestion(
        score, questionId, subquestionId, responseText);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseFormSubquestion != null) {
      return responseFormSubquestion(
          score, questionId, subquestionId, responseText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseFormSubquestion(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseFormSubquestion != null) {
      return responseFormSubquestion(this);
    }
    return orElse();
  }
}

abstract class _ResponseFormSubquestion implements ProfilingFormEvent {
  const factory _ResponseFormSubquestion(double score, String questionId,
      String subquestionId, String responseText) = _$_ResponseFormSubquestion;

  double get score;
  String get questionId;
  String get subquestionId;
  String get responseText;

  _ResponseFormSubquestion copyWith(
      {double score,
      String questionId,
      String subquestionId,
      String responseText});
}

class _$_ResponseMultiCheckChanged implements _ResponseMultiCheckChanged {
  const _$_ResponseMultiCheckChanged(
      this.score, this.questionId, this.responseId)
      : assert(score != null),
        assert(questionId != null),
        assert(responseId != null);

  @override
  final double score;
  @override
  final String questionId;
  @override
  final String responseId;

  @override
  String toString() {
    return 'ProfilingFormEvent.responseMultiCheckChanged(score: $score, questionId: $questionId, responseId: $responseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseMultiCheckChanged &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(responseId);

  @override
  _$_ResponseMultiCheckChanged copyWith({
    Object score = freezed,
    Object questionId = freezed,
    Object responseId = freezed,
  }) {
    return _$_ResponseMultiCheckChanged(
      score == freezed ? this.score : score as double,
      questionId == freezed ? this.questionId : questionId as String,
      responseId == freezed ? this.responseId : responseId as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseMultiCheckChanged(score, questionId, responseId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseMultiCheckChanged != null) {
      return responseMultiCheckChanged(score, questionId, responseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return responseMultiCheckChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (responseMultiCheckChanged != null) {
      return responseMultiCheckChanged(this);
    }
    return orElse();
  }
}

abstract class _ResponseMultiCheckChanged implements ProfilingFormEvent {
  const factory _ResponseMultiCheckChanged(
          double score, String questionId, String responseId) =
      _$_ResponseMultiCheckChanged;

  double get score;
  String get questionId;
  String get responseId;

  _ResponseMultiCheckChanged copyWith(
      {double score, String questionId, String responseId});
}

class _$_NextQuestion implements _NextQuestion {
  const _$_NextQuestion(this.size) : assert(size != null);

  @override
  final int size;

  @override
  String toString() {
    return 'ProfilingFormEvent.nextQuestion(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NextQuestion &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(size);

  @override
  _$_NextQuestion copyWith({
    Object size = freezed,
  }) {
    return _$_NextQuestion(
      size == freezed ? this.size : size as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return nextQuestion(size);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextQuestion != null) {
      return nextQuestion(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return nextQuestion(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nextQuestion != null) {
      return nextQuestion(this);
    }
    return orElse();
  }
}

abstract class _NextQuestion implements ProfilingFormEvent {
  const factory _NextQuestion(int size) = _$_NextQuestion;

  int get size;

  _NextQuestion copyWith({int size});
}

class _$_PreviousQuestion implements _PreviousQuestion {
  const _$_PreviousQuestion();

  @override
  String toString() {
    return 'ProfilingFormEvent.previousQuestion()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PreviousQuestion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return previousQuestion();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (previousQuestion != null) {
      return previousQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return previousQuestion(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (previousQuestion != null) {
      return previousQuestion(this);
    }
    return orElse();
  }
}

abstract class _PreviousQuestion implements ProfilingFormEvent {
  const factory _PreviousQuestion() = _$_PreviousQuestion;
}

class _$_PostProfiling implements _PostProfiling {
  const _$_PostProfiling();

  @override
  String toString() {
    return 'ProfilingFormEvent.postProfiling()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PostProfiling);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return postProfiling();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postProfiling != null) {
      return postProfiling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return postProfiling(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postProfiling != null) {
      return postProfiling(this);
    }
    return orElse();
  }
}

abstract class _PostProfiling implements ProfilingFormEvent {
  const factory _PostProfiling() = _$_PostProfiling;
}

class _$_SetItems implements _SetItems {
  const _$_SetItems(this.items) : assert(items != null);

  @override
  final KtList<ProfilingItem> items;

  @override
  String toString() {
    return 'ProfilingFormEvent.setItems(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetItems &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @override
  _$_SetItems copyWith({
    Object items = freezed,
  }) {
    return _$_SetItems(
      items == freezed ? this.items : items as KtList<ProfilingItem>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result responseSliderChanged(String questionId, String responseId,
            double score, String value, Tuple2<double, double> limits),
    @required
        Result responseUniqueCheckChanged(
            double score, String questionId, String responseId),
    @required
        Result responseUniqueFormCheckChanged(
            String questionId,
            double score,
            String responseId,
            String isValueCheck,
            String valueFieldObservation),
    @required
        Result responseFormSubquestion(double score, String questionId,
            String subquestionId, String responseText),
    @required
        Result responseMultiCheckChanged(
            double score, String questionId, String responseId),
    @required Result nextQuestion(int size),
    @required Result previousQuestion(),
    @required Result postProfiling(),
    @required Result setItems(KtList<ProfilingItem> items),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return setItems(items);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result responseSliderChanged(String questionId, String responseId,
        double score, String value, Tuple2<double, double> limits),
    Result responseUniqueCheckChanged(
        double score, String questionId, String responseId),
    Result responseUniqueFormCheckChanged(String questionId, double score,
        String responseId, String isValueCheck, String valueFieldObservation),
    Result responseFormSubquestion(double score, String questionId,
        String subquestionId, String responseText),
    Result responseMultiCheckChanged(
        double score, String questionId, String responseId),
    Result nextQuestion(int size),
    Result previousQuestion(),
    Result postProfiling(),
    Result setItems(KtList<ProfilingItem> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setItems != null) {
      return setItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result responseSliderChanged(_ResponseSliderChanged value),
    @required
        Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    @required
        Result responseUniqueFormCheckChanged(
            _ResponseUniqueFormCheckChanged value),
    @required Result responseFormSubquestion(_ResponseFormSubquestion value),
    @required
        Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    @required Result nextQuestion(_NextQuestion value),
    @required Result previousQuestion(_PreviousQuestion value),
    @required Result postProfiling(_PostProfiling value),
    @required Result setItems(_SetItems value),
  }) {
    assert(responseSliderChanged != null);
    assert(responseUniqueCheckChanged != null);
    assert(responseUniqueFormCheckChanged != null);
    assert(responseFormSubquestion != null);
    assert(responseMultiCheckChanged != null);
    assert(nextQuestion != null);
    assert(previousQuestion != null);
    assert(postProfiling != null);
    assert(setItems != null);
    return setItems(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result responseSliderChanged(_ResponseSliderChanged value),
    Result responseUniqueCheckChanged(_ResponseUniqueCheckChanged value),
    Result responseUniqueFormCheckChanged(
        _ResponseUniqueFormCheckChanged value),
    Result responseFormSubquestion(_ResponseFormSubquestion value),
    Result responseMultiCheckChanged(_ResponseMultiCheckChanged value),
    Result nextQuestion(_NextQuestion value),
    Result previousQuestion(_PreviousQuestion value),
    Result postProfiling(_PostProfiling value),
    Result setItems(_SetItems value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setItems != null) {
      return setItems(this);
    }
    return orElse();
  }
}

abstract class _SetItems implements ProfilingFormEvent {
  const factory _SetItems(KtList<ProfilingItem> items) = _$_SetItems;

  KtList<ProfilingItem> get items;

  _SetItems copyWith({KtList<ProfilingItem> items});
}

mixin _$ProfilingFormState {
  KtList<ProfilingResponse> get responses;
  int get correctResponsesLength;
  int get index;
  bool get isSubmitting;
  KtList<ProfilingItem> get items;
  Option<Either<BaseFailure, ProfilingResult>> get postFailureOrSuccessOption;

  ProfilingFormState copyWith(
      {KtList<ProfilingResponse> responses,
      int correctResponsesLength,
      int index,
      bool isSubmitting,
      KtList<ProfilingItem> items,
      Option<Either<BaseFailure, ProfilingResult>> postFailureOrSuccessOption});
}

class _$ProfilingFormStateTearOff {
  const _$ProfilingFormStateTearOff();

  _ProfilingFormState call(
      {@required
          KtList<ProfilingResponse> responses,
      @required
          int correctResponsesLength,
      @required
          int index,
      @required
          bool isSubmitting,
      @required
          KtList<ProfilingItem> items,
      @required
          Option<Either<BaseFailure, ProfilingResult>>
              postFailureOrSuccessOption}) {
    return _ProfilingFormState(
      responses: responses,
      correctResponsesLength: correctResponsesLength,
      index: index,
      isSubmitting: isSubmitting,
      items: items,
      postFailureOrSuccessOption: postFailureOrSuccessOption,
    );
  }
}

const $ProfilingFormState = _$ProfilingFormStateTearOff();

class _$_ProfilingFormState implements _ProfilingFormState {
  const _$_ProfilingFormState(
      {@required this.responses,
      @required this.correctResponsesLength,
      @required this.index,
      @required this.isSubmitting,
      @required this.items,
      @required this.postFailureOrSuccessOption})
      : assert(responses != null),
        assert(correctResponsesLength != null),
        assert(index != null),
        assert(isSubmitting != null),
        assert(items != null),
        assert(postFailureOrSuccessOption != null);

  @override
  final KtList<ProfilingResponse> responses;
  @override
  final int correctResponsesLength;
  @override
  final int index;
  @override
  final bool isSubmitting;
  @override
  final KtList<ProfilingItem> items;
  @override
  final Option<Either<BaseFailure, ProfilingResult>> postFailureOrSuccessOption;

  @override
  String toString() {
    return 'ProfilingFormState(responses: $responses, correctResponsesLength: $correctResponsesLength, index: $index, isSubmitting: $isSubmitting, items: $items, postFailureOrSuccessOption: $postFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingFormState &&
            (identical(other.responses, responses) ||
                const DeepCollectionEquality()
                    .equals(other.responses, responses)) &&
            (identical(other.correctResponsesLength, correctResponsesLength) ||
                const DeepCollectionEquality().equals(
                    other.correctResponsesLength, correctResponsesLength)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.postFailureOrSuccessOption,
                    postFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.postFailureOrSuccessOption,
                    postFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(responses) ^
      const DeepCollectionEquality().hash(correctResponsesLength) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(postFailureOrSuccessOption);

  @override
  _$_ProfilingFormState copyWith({
    Object responses = freezed,
    Object correctResponsesLength = freezed,
    Object index = freezed,
    Object isSubmitting = freezed,
    Object items = freezed,
    Object postFailureOrSuccessOption = freezed,
  }) {
    return _$_ProfilingFormState(
      responses: responses == freezed
          ? this.responses
          : responses as KtList<ProfilingResponse>,
      correctResponsesLength: correctResponsesLength == freezed
          ? this.correctResponsesLength
          : correctResponsesLength as int,
      index: index == freezed ? this.index : index as int,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      items: items == freezed ? this.items : items as KtList<ProfilingItem>,
      postFailureOrSuccessOption: postFailureOrSuccessOption == freezed
          ? this.postFailureOrSuccessOption
          : postFailureOrSuccessOption
              as Option<Either<BaseFailure, ProfilingResult>>,
    );
  }
}

abstract class _ProfilingFormState implements ProfilingFormState {
  const factory _ProfilingFormState(
      {@required
          KtList<ProfilingResponse> responses,
      @required
          int correctResponsesLength,
      @required
          int index,
      @required
          bool isSubmitting,
      @required
          KtList<ProfilingItem> items,
      @required
          Option<Either<BaseFailure, ProfilingResult>>
              postFailureOrSuccessOption}) = _$_ProfilingFormState;

  @override
  KtList<ProfilingResponse> get responses;
  @override
  int get correctResponsesLength;
  @override
  int get index;
  @override
  bool get isSubmitting;
  @override
  KtList<ProfilingItem> get items;
  @override
  Option<Either<BaseFailure, ProfilingResult>> get postFailureOrSuccessOption;

  @override
  _ProfilingFormState copyWith(
      {KtList<ProfilingResponse> responses,
      int correctResponsesLength,
      int index,
      bool isSubmitting,
      KtList<ProfilingItem> items,
      Option<Either<BaseFailure, ProfilingResult>> postFailureOrSuccessOption});
}
