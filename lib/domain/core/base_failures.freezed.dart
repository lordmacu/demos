// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'base_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BaseFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result fromServer(String message),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result fromServer(String message),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(Unexpected value),
    @required Result fromServer(FromServer value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(Unexpected value),
    Result fromServer(FromServer value),
    @required Result orElse(),
  });
}

class _$BaseFailureTearOff {
  const _$BaseFailureTearOff();

  Unexpected unexpected() {
    return const Unexpected();
  }

  FromServer fromServer(String message) {
    return FromServer(
      message,
    );
  }
}

const $BaseFailure = _$BaseFailureTearOff();

class _$Unexpected implements Unexpected {
  const _$Unexpected();

  @override
  String toString() {
    return 'BaseFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result fromServer(String message),
  }) {
    assert(unexpected != null);
    assert(fromServer != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result fromServer(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(Unexpected value),
    @required Result fromServer(FromServer value),
  }) {
    assert(unexpected != null);
    assert(fromServer != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(Unexpected value),
    Result fromServer(FromServer value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements BaseFailure {
  const factory Unexpected() = _$Unexpected;
}

class _$FromServer implements FromServer {
  const _$FromServer(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'BaseFailure.fromServer(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FromServer &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$FromServer copyWith({
    Object message = freezed,
  }) {
    return _$FromServer(
      message == freezed ? this.message : message as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result fromServer(String message),
  }) {
    assert(unexpected != null);
    assert(fromServer != null);
    return fromServer(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result fromServer(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fromServer != null) {
      return fromServer(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(Unexpected value),
    @required Result fromServer(FromServer value),
  }) {
    assert(unexpected != null);
    assert(fromServer != null);
    return fromServer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(Unexpected value),
    Result fromServer(FromServer value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fromServer != null) {
      return fromServer(this);
    }
    return orElse();
  }
}

abstract class FromServer implements BaseFailure {
  const factory FromServer(String message) = _$FromServer;

  String get message;

  FromServer copyWith({String message});
}
