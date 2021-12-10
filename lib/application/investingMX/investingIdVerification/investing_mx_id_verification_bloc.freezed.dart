// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'investing_mx_id_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$InvestingMxIdVerificationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result setUserIdInfo(UserIdInfo newUserIdInfo),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result setUserIdInfo(UserIdInfo newUserIdInfo),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_initial value),
    @required Result setUserIdInfo(_setUserIdInfo value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result setUserIdInfo(_setUserIdInfo value),
    @required Result orElse(),
  });
}

class _$InvestingMxIdVerificationEventTearOff {
  const _$InvestingMxIdVerificationEventTearOff();

  _initial initial() {
    return const _initial();
  }

  _setUserIdInfo setUserIdInfo(UserIdInfo newUserIdInfo) {
    return _setUserIdInfo(
      newUserIdInfo,
    );
  }
}

const $InvestingMxIdVerificationEvent =
    _$InvestingMxIdVerificationEventTearOff();

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'InvestingMxIdVerificationEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result setUserIdInfo(UserIdInfo newUserIdInfo),
  }) {
    assert(initial != null);
    assert(setUserIdInfo != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result setUserIdInfo(UserIdInfo newUserIdInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_initial value),
    @required Result setUserIdInfo(_setUserIdInfo value),
  }) {
    assert(initial != null);
    assert(setUserIdInfo != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result setUserIdInfo(_setUserIdInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements InvestingMxIdVerificationEvent {
  const factory _initial() = _$_initial;
}

class _$_setUserIdInfo implements _setUserIdInfo {
  const _$_setUserIdInfo(this.newUserIdInfo) : assert(newUserIdInfo != null);

  @override
  final UserIdInfo newUserIdInfo;

  @override
  String toString() {
    return 'InvestingMxIdVerificationEvent.setUserIdInfo(newUserIdInfo: $newUserIdInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _setUserIdInfo &&
            (identical(other.newUserIdInfo, newUserIdInfo) ||
                const DeepCollectionEquality()
                    .equals(other.newUserIdInfo, newUserIdInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newUserIdInfo);

  @override
  _$_setUserIdInfo copyWith({
    Object newUserIdInfo = freezed,
  }) {
    return _$_setUserIdInfo(
      newUserIdInfo == freezed
          ? this.newUserIdInfo
          : newUserIdInfo as UserIdInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result setUserIdInfo(UserIdInfo newUserIdInfo),
  }) {
    assert(initial != null);
    assert(setUserIdInfo != null);
    return setUserIdInfo(newUserIdInfo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result setUserIdInfo(UserIdInfo newUserIdInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setUserIdInfo != null) {
      return setUserIdInfo(newUserIdInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_initial value),
    @required Result setUserIdInfo(_setUserIdInfo value),
  }) {
    assert(initial != null);
    assert(setUserIdInfo != null);
    return setUserIdInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result setUserIdInfo(_setUserIdInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setUserIdInfo != null) {
      return setUserIdInfo(this);
    }
    return orElse();
  }
}

abstract class _setUserIdInfo implements InvestingMxIdVerificationEvent {
  const factory _setUserIdInfo(UserIdInfo newUserIdInfo) = _$_setUserIdInfo;

  UserIdInfo get newUserIdInfo;

  _setUserIdInfo copyWith({UserIdInfo newUserIdInfo});
}

mixin _$InvestingMxIdVerificationState {
  UserIdInfo get idInfo;

  InvestingMxIdVerificationState copyWith({UserIdInfo idInfo});
}

class _$InvestingMxIdVerificationStateTearOff {
  const _$InvestingMxIdVerificationStateTearOff();

  _InvestingMxIdVerificationState call({@required UserIdInfo idInfo}) {
    return _InvestingMxIdVerificationState(
      idInfo: idInfo,
    );
  }
}

const $InvestingMxIdVerificationState =
    _$InvestingMxIdVerificationStateTearOff();

class _$_InvestingMxIdVerificationState
    implements _InvestingMxIdVerificationState {
  const _$_InvestingMxIdVerificationState({@required this.idInfo})
      : assert(idInfo != null);

  @override
  final UserIdInfo idInfo;

  @override
  String toString() {
    return 'InvestingMxIdVerificationState(idInfo: $idInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvestingMxIdVerificationState &&
            (identical(other.idInfo, idInfo) ||
                const DeepCollectionEquality().equals(other.idInfo, idInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idInfo);

  @override
  _$_InvestingMxIdVerificationState copyWith({
    Object idInfo = freezed,
  }) {
    return _$_InvestingMxIdVerificationState(
      idInfo: idInfo == freezed ? this.idInfo : idInfo as UserIdInfo,
    );
  }
}

abstract class _InvestingMxIdVerificationState
    implements InvestingMxIdVerificationState {
  const factory _InvestingMxIdVerificationState({@required UserIdInfo idInfo}) =
      _$_InvestingMxIdVerificationState;

  @override
  UserIdInfo get idInfo;

  @override
  _InvestingMxIdVerificationState copyWith({UserIdInfo idInfo});
}
