// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingResponse {
  String get questionId;
  String get responseId;
  ValueObject<String> get value;
  double get score;
  String get isValueCheck;
  String get valueFieldObservation;

  ProfilingResponse copyWith(
      {String questionId,
      String responseId,
      ValueObject<String> value,
      double score,
      String isValueCheck,
      String valueFieldObservation});
}

class _$ProfilingResponseTearOff {
  const _$ProfilingResponseTearOff();

  _ProfilingResponse call(
      {@required String questionId,
      @required String responseId,
      @required ValueObject<String> value,
      @required double score,
      String isValueCheck,
      String valueFieldObservation}) {
    return _ProfilingResponse(
      questionId: questionId,
      responseId: responseId,
      value: value,
      score: score,
      isValueCheck: isValueCheck,
      valueFieldObservation: valueFieldObservation,
    );
  }
}

const $ProfilingResponse = _$ProfilingResponseTearOff();

class _$_ProfilingResponse implements _ProfilingResponse {
  const _$_ProfilingResponse(
      {@required this.questionId,
      @required this.responseId,
      @required this.value,
      @required this.score,
      this.isValueCheck,
      this.valueFieldObservation})
      : assert(questionId != null),
        assert(responseId != null),
        assert(value != null),
        assert(score != null);

  @override
  final String questionId;
  @override
  final String responseId;
  @override
  final ValueObject<String> value;
  @override
  final double score;
  @override
  final String isValueCheck;
  @override
  final String valueFieldObservation;

  @override
  String toString() {
    return 'ProfilingResponse(questionId: $questionId, responseId: $responseId, value: $value, score: $score, isValueCheck: $isValueCheck, valueFieldObservation: $valueFieldObservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingResponse &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
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
      const DeepCollectionEquality().hash(responseId) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(isValueCheck) ^
      const DeepCollectionEquality().hash(valueFieldObservation);

  @override
  _$_ProfilingResponse copyWith({
    Object questionId = freezed,
    Object responseId = freezed,
    Object value = freezed,
    Object score = freezed,
    Object isValueCheck = freezed,
    Object valueFieldObservation = freezed,
  }) {
    return _$_ProfilingResponse(
      questionId:
          questionId == freezed ? this.questionId : questionId as String,
      responseId:
          responseId == freezed ? this.responseId : responseId as String,
      value: value == freezed ? this.value : value as ValueObject<String>,
      score: score == freezed ? this.score : score as double,
      isValueCheck:
          isValueCheck == freezed ? this.isValueCheck : isValueCheck as String,
      valueFieldObservation: valueFieldObservation == freezed
          ? this.valueFieldObservation
          : valueFieldObservation as String,
    );
  }
}

abstract class _ProfilingResponse implements ProfilingResponse {
  const factory _ProfilingResponse(
      {@required String questionId,
      @required String responseId,
      @required ValueObject<String> value,
      @required double score,
      String isValueCheck,
      String valueFieldObservation}) = _$_ProfilingResponse;

  @override
  String get questionId;
  @override
  String get responseId;
  @override
  ValueObject<String> get value;
  @override
  double get score;
  @override
  String get isValueCheck;
  @override
  String get valueFieldObservation;

  @override
  _ProfilingResponse copyWith(
      {String questionId,
      String responseId,
      ValueObject<String> value,
      double score,
      String isValueCheck,
      String valueFieldObservation});
}
