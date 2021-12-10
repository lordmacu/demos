// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profiling_form_option_type_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfilingFormOptionTypeInput {
  String get id;
  String get hintTextInput;
  int get typeInput;
  String get valueInput;
  List<String> get options;

  ProfilingFormOptionTypeInput copyWith(
      {String id,
      String hintTextInput,
      int typeInput,
      String valueInput,
      List<String> options});
}

class _$ProfilingFormOptionTypeInputTearOff {
  const _$ProfilingFormOptionTypeInputTearOff();

  _ProfilingFormOptionTypeInput call(
      {@required String id,
      @required String hintTextInput,
      @required int typeInput,
      @required String valueInput,
      @required List<String> options}) {
    return _ProfilingFormOptionTypeInput(
      id: id,
      hintTextInput: hintTextInput,
      typeInput: typeInput,
      valueInput: valueInput,
      options: options,
    );
  }
}

const $ProfilingFormOptionTypeInput = _$ProfilingFormOptionTypeInputTearOff();

class _$_ProfilingFormOptionTypeInput implements _ProfilingFormOptionTypeInput {
  const _$_ProfilingFormOptionTypeInput(
      {@required this.id,
      @required this.hintTextInput,
      @required this.typeInput,
      @required this.valueInput,
      @required this.options})
      : assert(id != null),
        assert(hintTextInput != null),
        assert(typeInput != null),
        assert(valueInput != null),
        assert(options != null);

  @override
  final String id;
  @override
  final String hintTextInput;
  @override
  final int typeInput;
  @override
  final String valueInput;
  @override
  final List<String> options;

  @override
  String toString() {
    return 'ProfilingFormOptionTypeInput(id: $id, hintTextInput: $hintTextInput, typeInput: $typeInput, valueInput: $valueInput, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilingFormOptionTypeInput &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.hintTextInput, hintTextInput) ||
                const DeepCollectionEquality()
                    .equals(other.hintTextInput, hintTextInput)) &&
            (identical(other.typeInput, typeInput) ||
                const DeepCollectionEquality()
                    .equals(other.typeInput, typeInput)) &&
            (identical(other.valueInput, valueInput) ||
                const DeepCollectionEquality()
                    .equals(other.valueInput, valueInput)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(hintTextInput) ^
      const DeepCollectionEquality().hash(typeInput) ^
      const DeepCollectionEquality().hash(valueInput) ^
      const DeepCollectionEquality().hash(options);

  @override
  _$_ProfilingFormOptionTypeInput copyWith({
    Object id = freezed,
    Object hintTextInput = freezed,
    Object typeInput = freezed,
    Object valueInput = freezed,
    Object options = freezed,
  }) {
    return _$_ProfilingFormOptionTypeInput(
      id: id == freezed ? this.id : id as String,
      hintTextInput: hintTextInput == freezed
          ? this.hintTextInput
          : hintTextInput as String,
      typeInput: typeInput == freezed ? this.typeInput : typeInput as int,
      valueInput:
          valueInput == freezed ? this.valueInput : valueInput as String,
      options: options == freezed ? this.options : options as List<String>,
    );
  }
}

abstract class _ProfilingFormOptionTypeInput
    implements ProfilingFormOptionTypeInput {
  const factory _ProfilingFormOptionTypeInput(
      {@required String id,
      @required String hintTextInput,
      @required int typeInput,
      @required String valueInput,
      @required List<String> options}) = _$_ProfilingFormOptionTypeInput;

  @override
  String get id;
  @override
  String get hintTextInput;
  @override
  int get typeInput;
  @override
  String get valueInput;
  @override
  List<String> get options;

  @override
  _ProfilingFormOptionTypeInput copyWith(
      {String id,
      String hintTextInput,
      int typeInput,
      String valueInput,
      List<String> options});
}
