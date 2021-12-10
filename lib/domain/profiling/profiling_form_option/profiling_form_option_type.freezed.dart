// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_form_option_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingFormOptionType {
  String get id;
  String get value;
  bool get isObservation;
  double get score;

  ProfilingFormOptionType copyWith(
      {String id, String value, bool isObservation, double score});
}

class _$ProfilingFormOptionTypeTearOff {
  const _$ProfilingFormOptionTypeTearOff();

  _ProfilingFormOptionType call(
      {@required String id,
      @required String value,
      @required bool isObservation,
      @required double score}) {
    return _ProfilingFormOptionType(
      id: id,
      value: value,
      isObservation: isObservation,
      score: score,
    );
  }
}

const $ProfilingFormOptionType = _$ProfilingFormOptionTypeTearOff();

class _$_ProfilingFormOptionType implements _ProfilingFormOptionType {
  const _$_ProfilingFormOptionType(
      {@required this.id,
      @required this.value,
      @required this.isObservation,
      @required this.score})
      : assert(id != null),
        assert(value != null),
        assert(isObservation != null),
        assert(score != null);

  @override
  final String id;
  @override
  final String value;
  @override
  final bool isObservation;
  @override
  final double score;

  @override
  String toString() {
    return 'ProfilingFormOptionType(id: $id, value: $value, isObservation: $isObservation, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingFormOptionType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.isObservation, isObservation) ||
                const DeepCollectionEquality()
                    .equals(other.isObservation, isObservation)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(isObservation) ^
      const DeepCollectionEquality().hash(score);

  @override
  _$_ProfilingFormOptionType copyWith({
    Object id = freezed,
    Object value = freezed,
    Object isObservation = freezed,
    Object score = freezed,
  }) {
    return _$_ProfilingFormOptionType(
      id: id == freezed ? this.id : id as String,
      value: value == freezed ? this.value : value as String,
      isObservation:
          isObservation == freezed ? this.isObservation : isObservation as bool,
      score: score == freezed ? this.score : score as double,
    );
  }
}

abstract class _ProfilingFormOptionType implements ProfilingFormOptionType {
  const factory _ProfilingFormOptionType(
      {@required String id,
      @required String value,
      @required bool isObservation,
      @required double score}) = _$_ProfilingFormOptionType;

  @override
  String get id;
  @override
  String get value;
  @override
  bool get isObservation;
  @override
  double get score;

  @override
  _ProfilingFormOptionType copyWith(
      {String id, String value, bool isObservation, double score});
}
