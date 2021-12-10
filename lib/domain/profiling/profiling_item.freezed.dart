// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingItem {
  String get id;
  String get title;
  String get type;
  String get description;
  List<ProfilingOption> get questions;
  List<ProfilingFormOption> get formQuestions;

  ProfilingItem copyWith(
      {String id,
      String title,
      String type,
      String description,
      List<ProfilingOption> questions,
      List<ProfilingFormOption> formQuestions});
}

class _$ProfilingItemTearOff {
  const _$ProfilingItemTearOff();

  _ProfilingItem call(
      {@required String id,
      @required String title,
      @required String type,
      @required String description,
      @required List<ProfilingOption> questions,
      @required List<ProfilingFormOption> formQuestions}) {
    return _ProfilingItem(
      id: id,
      title: title,
      type: type,
      description: description,
      questions: questions,
      formQuestions: formQuestions,
    );
  }
}

const $ProfilingItem = _$ProfilingItemTearOff();

class _$_ProfilingItem implements _ProfilingItem {
  const _$_ProfilingItem(
      {@required this.id,
      @required this.title,
      @required this.type,
      @required this.description,
      @required this.questions,
      @required this.formQuestions})
      : assert(id != null),
        assert(title != null),
        assert(type != null),
        assert(description != null),
        assert(questions != null),
        assert(formQuestions != null);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final String description;
  @override
  final List<ProfilingOption> questions;
  @override
  final List<ProfilingFormOption> formQuestions;

  @override
  String toString() {
    return 'ProfilingItem(id: $id, title: $title, type: $type, description: $description, questions: $questions, formQuestions: $formQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)) &&
            (identical(other.formQuestions, formQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.formQuestions, formQuestions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(questions) ^
      const DeepCollectionEquality().hash(formQuestions);

  @override
  _$_ProfilingItem copyWith({
    Object id = freezed,
    Object title = freezed,
    Object type = freezed,
    Object description = freezed,
    Object questions = freezed,
    Object formQuestions = freezed,
  }) {
    return _$_ProfilingItem(
      id: id == freezed ? this.id : id as String,
      title: title == freezed ? this.title : title as String,
      type: type == freezed ? this.type : type as String,
      description:
          description == freezed ? this.description : description as String,
      questions: questions == freezed
          ? this.questions
          : questions as List<ProfilingOption>,
      formQuestions: formQuestions == freezed
          ? this.formQuestions
          : formQuestions as List<ProfilingFormOption>,
    );
  }
}

abstract class _ProfilingItem implements ProfilingItem {
  const factory _ProfilingItem(
      {@required String id,
      @required String title,
      @required String type,
      @required String description,
      @required List<ProfilingOption> questions,
      @required List<ProfilingFormOption> formQuestions}) = _$_ProfilingItem;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  String get description;
  @override
  List<ProfilingOption> get questions;
  @override
  List<ProfilingFormOption> get formQuestions;

  @override
  _ProfilingItem copyWith(
      {String id,
      String title,
      String type,
      String description,
      List<ProfilingOption> questions,
      List<ProfilingFormOption> formQuestions});
}
