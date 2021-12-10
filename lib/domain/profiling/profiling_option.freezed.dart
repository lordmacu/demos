// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingOption {
  String get id;
  String get emoji;
  String get description;
  double get score;
  double get value;

  ProfilingOption copyWith(
      {String id,
      String emoji,
      String description,
      double score,
      double value});
}

class _$ProfilingOptionTearOff {
  const _$ProfilingOptionTearOff();

  _ProfilingQuestion call(
      {@required String id,
      @required String emoji,
      @required String description,
      @required double score,
      @required double value}) {
    return _ProfilingQuestion(
      id: id,
      emoji: emoji,
      description: description,
      score: score,
      value: value,
    );
  }
}

const $ProfilingOption = _$ProfilingOptionTearOff();

class _$_ProfilingQuestion implements _ProfilingQuestion {
  const _$_ProfilingQuestion(
      {@required this.id,
      @required this.emoji,
      @required this.description,
      @required this.score,
      @required this.value})
      : assert(id != null),
        assert(emoji != null),
        assert(description != null),
        assert(score != null),
        assert(value != null);

  @override
  final String id;
  @override
  final String emoji;
  @override
  final String description;
  @override
  final double score;
  @override
  final double value;

  @override
  String toString() {
    return 'ProfilingOption(id: $id, emoji: $emoji, description: $description, score: $score, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingQuestion &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.emoji, emoji) ||
                const DeepCollectionEquality().equals(other.emoji, emoji)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(emoji) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$_ProfilingQuestion copyWith({
    Object id = freezed,
    Object emoji = freezed,
    Object description = freezed,
    Object score = freezed,
    Object value = freezed,
  }) {
    return _$_ProfilingQuestion(
      id: id == freezed ? this.id : id as String,
      emoji: emoji == freezed ? this.emoji : emoji as String,
      description:
          description == freezed ? this.description : description as String,
      score: score == freezed ? this.score : score as double,
      value: value == freezed ? this.value : value as double,
    );
  }
}

abstract class _ProfilingQuestion implements ProfilingOption {
  const factory _ProfilingQuestion(
      {@required String id,
      @required String emoji,
      @required String description,
      @required double score,
      @required double value}) = _$_ProfilingQuestion;

  @override
  String get id;
  @override
  String get emoji;
  @override
  String get description;
  @override
  double get score;
  @override
  double get value;

  @override
  _ProfilingQuestion copyWith(
      {String id,
      String emoji,
      String description,
      double score,
      double value});
}
