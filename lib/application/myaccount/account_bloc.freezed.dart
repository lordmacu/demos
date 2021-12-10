// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$AccountEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserInfo(),
    @required
        Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserInfo(),
    Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserInfo(_GetUserInfo value),
    @required Result userInfoReceived(_UserInfoReceived value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserInfo(_GetUserInfo value),
    Result userInfoReceived(_UserInfoReceived value),
    @required Result orElse(),
  });
}

class _$AccountEventTearOff {
  const _$AccountEventTearOff();

  _GetUserInfo getUserInfo() {
    return const _GetUserInfo();
  }

  _UserInfoReceived userInfoReceived(
      Either<BaseFailure, UserInfo> failureOrInfo) {
    return _UserInfoReceived(
      failureOrInfo,
    );
  }
}

const $AccountEvent = _$AccountEventTearOff();

class _$_GetUserInfo implements _GetUserInfo {
  const _$_GetUserInfo();

  @override
  String toString() {
    return 'AccountEvent.getUserInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetUserInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserInfo(),
    @required
        Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
  }) {
    assert(getUserInfo != null);
    assert(userInfoReceived != null);
    return getUserInfo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserInfo(),
    Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getUserInfo != null) {
      return getUserInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserInfo(_GetUserInfo value),
    @required Result userInfoReceived(_UserInfoReceived value),
  }) {
    assert(getUserInfo != null);
    assert(userInfoReceived != null);
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserInfo(_GetUserInfo value),
    Result userInfoReceived(_UserInfoReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class _GetUserInfo implements AccountEvent {
  const factory _GetUserInfo() = _$_GetUserInfo;
}

class _$_UserInfoReceived implements _UserInfoReceived {
  const _$_UserInfoReceived(this.failureOrInfo) : assert(failureOrInfo != null);

  @override
  final Either<BaseFailure, UserInfo> failureOrInfo;

  @override
  String toString() {
    return 'AccountEvent.userInfoReceived(failureOrInfo: $failureOrInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfoReceived &&
            (identical(other.failureOrInfo, failureOrInfo) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrInfo, failureOrInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failureOrInfo);

  @override
  _$_UserInfoReceived copyWith({
    Object failureOrInfo = freezed,
  }) {
    return _$_UserInfoReceived(
      failureOrInfo == freezed
          ? this.failureOrInfo
          : failureOrInfo as Either<BaseFailure, UserInfo>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserInfo(),
    @required
        Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
  }) {
    assert(getUserInfo != null);
    assert(userInfoReceived != null);
    return userInfoReceived(failureOrInfo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserInfo(),
    Result userInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userInfoReceived != null) {
      return userInfoReceived(failureOrInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserInfo(_GetUserInfo value),
    @required Result userInfoReceived(_UserInfoReceived value),
  }) {
    assert(getUserInfo != null);
    assert(userInfoReceived != null);
    return userInfoReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserInfo(_GetUserInfo value),
    Result userInfoReceived(_UserInfoReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userInfoReceived != null) {
      return userInfoReceived(this);
    }
    return orElse();
  }
}

abstract class _UserInfoReceived implements AccountEvent {
  const factory _UserInfoReceived(Either<BaseFailure, UserInfo> failureOrInfo) =
      _$_UserInfoReceived;

  Either<BaseFailure, UserInfo> get failureOrInfo;

  _UserInfoReceived copyWith({Either<BaseFailure, UserInfo> failureOrInfo});
}

mixin _$AccountState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(UserInfo info),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(UserInfo info),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(DataTransferInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(DataTransferInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  });
}

class _$AccountStateTearOff {
  const _$AccountStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(UserInfo info) {
    return LoadSuccess(
      info,
    );
  }

  LoadFailure loadFailure(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $AccountState = _$AccountStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AccountState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(UserInfo info),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(UserInfo info),
    Result loadFailure(BaseFailure failure),
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
    @required Result initial(Initial value),
    @required Result loadInProgress(DataTransferInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(DataTransferInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AccountState {
  const factory Initial() = _$Initial;
}

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'AccountState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DataTransferInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(UserInfo info),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(UserInfo info),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(DataTransferInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(DataTransferInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class DataTransferInProgress implements AccountState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.info) : assert(info != null);

  @override
  final UserInfo info;

  @override
  String toString() {
    return 'AccountState.loadSuccess(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(info);

  @override
  _$LoadSuccess copyWith({
    Object info = freezed,
  }) {
    return _$LoadSuccess(
      info == freezed ? this.info : info as UserInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(UserInfo info),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(info);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(UserInfo info),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(DataTransferInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(DataTransferInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements AccountState {
  const factory LoadSuccess(UserInfo info) = _$LoadSuccess;

  UserInfo get info;

  LoadSuccess copyWith({UserInfo info});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'AccountState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$LoadFailure copyWith({
    Object failure = freezed,
  }) {
    return _$LoadFailure(
      failure == freezed ? this.failure : failure as BaseFailure,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(UserInfo info),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(UserInfo info),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(DataTransferInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(DataTransferInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements AccountState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
