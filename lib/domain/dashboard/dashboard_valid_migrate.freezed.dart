// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_valid_migrate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValidateIntroductoryMigrate {
  bool get validate;

  ValidateIntroductoryMigrate copyWith({bool validate});
}

class _$ValidateIntroductoryMigrateTearOff {
  const _$ValidateIntroductoryMigrateTearOff();

  _ValidateIntroductoryMigrate call({@required bool validate}) {
    return _ValidateIntroductoryMigrate(
      validate: validate,
    );
  }
}

const $ValidateIntroductoryMigrate = _$ValidateIntroductoryMigrateTearOff();

class _$_ValidateIntroductoryMigrate implements _ValidateIntroductoryMigrate {
  const _$_ValidateIntroductoryMigrate({@required this.validate})
      : assert(validate != null);

  @override
  final bool validate;

  @override
  String toString() {
    return 'ValidateIntroductoryMigrate(validate: $validate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ValidateIntroductoryMigrate &&
            (identical(other.validate, validate) ||
                const DeepCollectionEquality()
                    .equals(other.validate, validate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(validate);

  @override
  _$_ValidateIntroductoryMigrate copyWith({
    Object validate = freezed,
  }) {
    return _$_ValidateIntroductoryMigrate(
      validate: validate == freezed ? this.validate : validate as bool,
    );
  }
}

abstract class _ValidateIntroductoryMigrate
    implements ValidateIntroductoryMigrate {
  const factory _ValidateIntroductoryMigrate({@required bool validate}) =
      _$_ValidateIntroductoryMigrate;

  @override
  bool get validate;

  @override
  _ValidateIntroductoryMigrate copyWith({bool validate});
}
