// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'withdrawal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$WithdrawalEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getItems(bool needsBankInfo),
    @required Result getSimulation(double value, double bankAccountId),
    @required
        Result withdrawalInfoReceived(
            Either<BaseFailure, WithdrawalInfo> failureOrInfo),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getItems(bool needsBankInfo),
    Result getSimulation(double value, double bankAccountId),
    Result withdrawalInfoReceived(
        Either<BaseFailure, WithdrawalInfo> failureOrInfo),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getItems(_GetItems value),
    @required Result getSimulation(_GetSimulation value),
    @required Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getItems(_GetItems value),
    Result getSimulation(_GetSimulation value),
    Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
    @required Result orElse(),
  });
}

class _$WithdrawalEventTearOff {
  const _$WithdrawalEventTearOff();

  _GetItems getItems(bool needsBankInfo) {
    return _GetItems(
      needsBankInfo,
    );
  }

  _GetSimulation getSimulation(double value, double bankAccountId) {
    return _GetSimulation(
      value,
      bankAccountId,
    );
  }

  _WithdrawalInfoReceived withdrawalInfoReceived(
      Either<BaseFailure, WithdrawalInfo> failureOrInfo) {
    return _WithdrawalInfoReceived(
      failureOrInfo,
    );
  }
}

const $WithdrawalEvent = _$WithdrawalEventTearOff();

class _$_GetItems implements _GetItems {
  const _$_GetItems(this.needsBankInfo) : assert(needsBankInfo != null);

  @override
  final bool needsBankInfo;

  @override
  String toString() {
    return 'WithdrawalEvent.getItems(needsBankInfo: $needsBankInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetItems &&
            (identical(other.needsBankInfo, needsBankInfo) ||
                const DeepCollectionEquality()
                    .equals(other.needsBankInfo, needsBankInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(needsBankInfo);

  @override
  _$_GetItems copyWith({
    Object needsBankInfo = freezed,
  }) {
    return _$_GetItems(
      needsBankInfo == freezed ? this.needsBankInfo : needsBankInfo as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getItems(bool needsBankInfo),
    @required Result getSimulation(double value, double bankAccountId),
    @required
        Result withdrawalInfoReceived(
            Either<BaseFailure, WithdrawalInfo> failureOrInfo),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return getItems(needsBankInfo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getItems(bool needsBankInfo),
    Result getSimulation(double value, double bankAccountId),
    Result withdrawalInfoReceived(
        Either<BaseFailure, WithdrawalInfo> failureOrInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getItems != null) {
      return getItems(needsBankInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getItems(_GetItems value),
    @required Result getSimulation(_GetSimulation value),
    @required Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return getItems(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getItems(_GetItems value),
    Result getSimulation(_GetSimulation value),
    Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getItems != null) {
      return getItems(this);
    }
    return orElse();
  }
}

abstract class _GetItems implements WithdrawalEvent {
  const factory _GetItems(bool needsBankInfo) = _$_GetItems;

  bool get needsBankInfo;

  _GetItems copyWith({bool needsBankInfo});
}

class _$_GetSimulation implements _GetSimulation {
  const _$_GetSimulation(this.value, this.bankAccountId)
      : assert(value != null),
        assert(bankAccountId != null);

  @override
  final double value;
  @override
  final double bankAccountId;

  @override
  String toString() {
    return 'WithdrawalEvent.getSimulation(value: $value, bankAccountId: $bankAccountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetSimulation &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(bankAccountId);

  @override
  _$_GetSimulation copyWith({
    Object value = freezed,
    Object bankAccountId = freezed,
  }) {
    return _$_GetSimulation(
      value == freezed ? this.value : value as double,
      bankAccountId == freezed ? this.bankAccountId : bankAccountId as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getItems(bool needsBankInfo),
    @required Result getSimulation(double value, double bankAccountId),
    @required
        Result withdrawalInfoReceived(
            Either<BaseFailure, WithdrawalInfo> failureOrInfo),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return getSimulation(value, bankAccountId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getItems(bool needsBankInfo),
    Result getSimulation(double value, double bankAccountId),
    Result withdrawalInfoReceived(
        Either<BaseFailure, WithdrawalInfo> failureOrInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSimulation != null) {
      return getSimulation(value, bankAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getItems(_GetItems value),
    @required Result getSimulation(_GetSimulation value),
    @required Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return getSimulation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getItems(_GetItems value),
    Result getSimulation(_GetSimulation value),
    Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSimulation != null) {
      return getSimulation(this);
    }
    return orElse();
  }
}

abstract class _GetSimulation implements WithdrawalEvent {
  const factory _GetSimulation(double value, double bankAccountId) =
      _$_GetSimulation;

  double get value;
  double get bankAccountId;

  _GetSimulation copyWith({double value, double bankAccountId});
}

class _$_WithdrawalInfoReceived implements _WithdrawalInfoReceived {
  const _$_WithdrawalInfoReceived(this.failureOrInfo)
      : assert(failureOrInfo != null);

  @override
  final Either<BaseFailure, WithdrawalInfo> failureOrInfo;

  @override
  String toString() {
    return 'WithdrawalEvent.withdrawalInfoReceived(failureOrInfo: $failureOrInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawalInfoReceived &&
            (identical(other.failureOrInfo, failureOrInfo) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrInfo, failureOrInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failureOrInfo);

  @override
  _$_WithdrawalInfoReceived copyWith({
    Object failureOrInfo = freezed,
  }) {
    return _$_WithdrawalInfoReceived(
      failureOrInfo == freezed
          ? this.failureOrInfo
          : failureOrInfo as Either<BaseFailure, WithdrawalInfo>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getItems(bool needsBankInfo),
    @required Result getSimulation(double value, double bankAccountId),
    @required
        Result withdrawalInfoReceived(
            Either<BaseFailure, WithdrawalInfo> failureOrInfo),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return withdrawalInfoReceived(failureOrInfo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getItems(bool needsBankInfo),
    Result getSimulation(double value, double bankAccountId),
    Result withdrawalInfoReceived(
        Either<BaseFailure, WithdrawalInfo> failureOrInfo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalInfoReceived != null) {
      return withdrawalInfoReceived(failureOrInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getItems(_GetItems value),
    @required Result getSimulation(_GetSimulation value),
    @required Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
  }) {
    assert(getItems != null);
    assert(getSimulation != null);
    assert(withdrawalInfoReceived != null);
    return withdrawalInfoReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getItems(_GetItems value),
    Result getSimulation(_GetSimulation value),
    Result withdrawalInfoReceived(_WithdrawalInfoReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalInfoReceived != null) {
      return withdrawalInfoReceived(this);
    }
    return orElse();
  }
}

abstract class _WithdrawalInfoReceived implements WithdrawalEvent {
  const factory _WithdrawalInfoReceived(
          Either<BaseFailure, WithdrawalInfo> failureOrInfo) =
      _$_WithdrawalInfoReceived;

  Either<BaseFailure, WithdrawalInfo> get failureOrInfo;

  _WithdrawalInfoReceived copyWith(
      {Either<BaseFailure, WithdrawalInfo> failureOrInfo});
}

mixin _$WithdrawalState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(WithdrawalInfo info),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(WithdrawalInfo info),
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

class _$WithdrawalStateTearOff {
  const _$WithdrawalStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(WithdrawalInfo info) {
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

const $WithdrawalState = _$WithdrawalStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WithdrawalState.initial()';
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
    @required Result loadSuccess(WithdrawalInfo info),
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
    Result loadSuccess(WithdrawalInfo info),
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

abstract class Initial implements WithdrawalState {
  const factory Initial() = _$Initial;
}

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'WithdrawalState.loadInProgress()';
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
    @required Result loadSuccess(WithdrawalInfo info),
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
    Result loadSuccess(WithdrawalInfo info),
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

abstract class DataTransferInProgress implements WithdrawalState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.info) : assert(info != null);

  @override
  final WithdrawalInfo info;

  @override
  String toString() {
    return 'WithdrawalState.loadSuccess(info: $info)';
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
      info == freezed ? this.info : info as WithdrawalInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(WithdrawalInfo info),
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
    Result loadSuccess(WithdrawalInfo info),
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

abstract class LoadSuccess implements WithdrawalState {
  const factory LoadSuccess(WithdrawalInfo info) = _$LoadSuccess;

  WithdrawalInfo get info;

  LoadSuccess copyWith({WithdrawalInfo info});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'WithdrawalState.loadFailure(failure: $failure)';
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
    @required Result loadSuccess(WithdrawalInfo info),
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
    Result loadSuccess(WithdrawalInfo info),
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

abstract class LoadFailure implements WithdrawalState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
