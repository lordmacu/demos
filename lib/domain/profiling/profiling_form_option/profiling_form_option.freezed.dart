// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_form_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingFormOption {
  String get id;
  String get description;
  int get typeInput;
  String get descriptionObservation;
  String get hintTextObservation;
  List<ProfilingFormOptionType> get listOptionTypeCheck;
  List<ProfilingFormOptionTypeInput> get listOptionTypeField;

  ProfilingFormOption copyWith(
      {String id,
      String description,
      int typeInput,
      String descriptionObservation,
      String hintTextObservation,
      List<ProfilingFormOptionType> listOptionTypeCheck,
      List<ProfilingFormOptionTypeInput> listOptionTypeField});
}

class _$ProfilingFormOptionTearOff {
  const _$ProfilingFormOptionTearOff();

  _ProfilingQuestion call(
      {@required String id,
      @required String description,
      @required int typeInput,
      String descriptionObservation,
      String hintTextObservation,
      @required List<ProfilingFormOptionType> listOptionTypeCheck,
      @required List<ProfilingFormOptionTypeInput> listOptionTypeField}) {
    return _ProfilingQuestion(
      id: id,
      description: description,
      typeInput: typeInput,
      descriptionObservation: descriptionObservation,
      hintTextObservation: hintTextObservation,
      listOptionTypeCheck: listOptionTypeCheck,
      listOptionTypeField: listOptionTypeField,
    );
  }
}

const $ProfilingFormOption = _$ProfilingFormOptionTearOff();

class _$_ProfilingQuestion implements _ProfilingQuestion {
  const _$_ProfilingQuestion(
      {@required this.id,
      @required this.description,
      @required this.typeInput,
      this.descriptionObservation,
      this.hintTextObservation,
      @required this.listOptionTypeCheck,
      @required this.listOptionTypeField})
      : assert(id != null),
        assert(description != null),
        assert(typeInput != null),
        assert(listOptionTypeCheck != null),
        assert(listOptionTypeField != null);

  @override
  final String id;
  @override
  final String description;
  @override
  final int typeInput;
  @override
  final String descriptionObservation;
  @override
  final String hintTextObservation;
  @override
  final List<ProfilingFormOptionType> listOptionTypeCheck;
  @override
  final List<ProfilingFormOptionTypeInput> listOptionTypeField;

  @override
  String toString() {
    return 'ProfilingFormOption(id: $id, description: $description, typeInput: $typeInput, descriptionObservation: $descriptionObservation, hintTextObservation: $hintTextObservation, listOptionTypeCheck: $listOptionTypeCheck, listOptionTypeField: $listOptionTypeField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingQuestion &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.typeInput, typeInput) ||
                const DeepCollectionEquality()
                    .equals(other.typeInput, typeInput)) &&
            (identical(other.descriptionObservation, descriptionObservation) ||
                const DeepCollectionEquality().equals(
                    other.descriptionObservation, descriptionObservation)) &&
            (identical(other.hintTextObservation, hintTextObservation) ||
                const DeepCollectionEquality()
                    .equals(other.hintTextObservation, hintTextObservation)) &&
            (identical(other.listOptionTypeCheck, listOptionTypeCheck) ||
                const DeepCollectionEquality()
                    .equals(other.listOptionTypeCheck, listOptionTypeCheck)) &&
            (identical(other.listOptionTypeField, listOptionTypeField) ||
                const DeepCollectionEquality()
                    .equals(other.listOptionTypeField, listOptionTypeField)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(typeInput) ^
      const DeepCollectionEquality().hash(descriptionObservation) ^
      const DeepCollectionEquality().hash(hintTextObservation) ^
      const DeepCollectionEquality().hash(listOptionTypeCheck) ^
      const DeepCollectionEquality().hash(listOptionTypeField);

  @override
  _$_ProfilingQuestion copyWith({
    Object id = freezed,
    Object description = freezed,
    Object typeInput = freezed,
    Object descriptionObservation = freezed,
    Object hintTextObservation = freezed,
    Object listOptionTypeCheck = freezed,
    Object listOptionTypeField = freezed,
  }) {
    return _$_ProfilingQuestion(
      id: id == freezed ? this.id : id as String,
      description:
          description == freezed ? this.description : description as String,
      typeInput: typeInput == freezed ? this.typeInput : typeInput as int,
      descriptionObservation: descriptionObservation == freezed
          ? this.descriptionObservation
          : descriptionObservation as String,
      hintTextObservation: hintTextObservation == freezed
          ? this.hintTextObservation
          : hintTextObservation as String,
      listOptionTypeCheck: listOptionTypeCheck == freezed
          ? this.listOptionTypeCheck
          : listOptionTypeCheck as List<ProfilingFormOptionType>,
      listOptionTypeField: listOptionTypeField == freezed
          ? this.listOptionTypeField
          : listOptionTypeField as List<ProfilingFormOptionTypeInput>,
    );
  }
}

abstract class _ProfilingQuestion implements ProfilingFormOption {
  const factory _ProfilingQuestion(
          {@required String id,
          @required String description,
          @required int typeInput,
          String descriptionObservation,
          String hintTextObservation,
          @required List<ProfilingFormOptionType> listOptionTypeCheck,
          @required List<ProfilingFormOptionTypeInput> listOptionTypeField}) =
      _$_ProfilingQuestion;

  @override
  String get id;
  @override
  String get description;
  @override
  int get typeInput;
  @override
  String get descriptionObservation;
  @override
  String get hintTextObservation;
  @override
  List<ProfilingFormOptionType> get listOptionTypeCheck;
  @override
  List<ProfilingFormOptionTypeInput> get listOptionTypeField;

  @override
  _ProfilingQuestion copyWith(
      {String id,
      String description,
      int typeInput,
      String descriptionObservation,
      String hintTextObservation,
      List<ProfilingFormOptionType> listOptionTypeCheck,
      List<ProfilingFormOptionTypeInput> listOptionTypeField});
}
