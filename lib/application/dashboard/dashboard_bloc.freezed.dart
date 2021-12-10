// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DashboardEvent {}

class _$DashboardEventTearOff {
  const _$DashboardEventTearOff();

  _getInformation getInformation() {
    return const _getInformation();
  }
}

const $DashboardEvent = _$DashboardEventTearOff();

class _$_getInformation implements _getInformation {
  const _$_getInformation();

  @override
  String toString() {
    return 'DashboardEvent.getInformation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _getInformation);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _getInformation implements DashboardEvent {
  const factory _getInformation() = _$_getInformation;
}

mixin _$DashboardState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(DashboardData data),
    @required Result loadFail(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(DashboardData data),
    Result loadFail(BaseFailure failure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(LoadingInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFail(LoadFailure value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(LoadingInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFail(LoadFailure value),
    @required Result orElse(),
  });
}

class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

  Initial initial() {
    return const Initial();
  }

  LoadingInProgress loading() {
    return const LoadingInProgress();
  }

  LoadSuccess loadSuccess(DashboardData data) {
    return LoadSuccess(
      data,
    );
  }

  LoadFailure loadFail(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $DashboardState = _$DashboardStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'DashboardState.initial()';
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
    @required Result loading(),
    @required Result loadSuccess(DashboardData data),
    @required Result loadFail(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(DashboardData data),
    Result loadFail(BaseFailure failure),
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
    @required Result loading(LoadingInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFail(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(LoadingInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFail(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DashboardState {
  const factory Initial() = _$Initial;
}

class _$LoadingInProgress implements LoadingInProgress {
  const _$LoadingInProgress();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(DashboardData data),
    @required Result loadFail(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(DashboardData data),
    Result loadFail(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(LoadingInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFail(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(LoadingInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFail(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingInProgress implements DashboardState {
  const factory LoadingInProgress() = _$LoadingInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.data) : assert(data != null);

  @override
  final DashboardData data;

  @override
  String toString() {
    return 'DashboardState.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$LoadSuccess copyWith({
    Object data = freezed,
  }) {
    return _$LoadSuccess(
      data == freezed ? this.data : data as DashboardData,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(DashboardData data),
    @required Result loadFail(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(DashboardData data),
    Result loadFail(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(LoadingInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFail(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(LoadingInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFail(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements DashboardState {
  const factory LoadSuccess(DashboardData data) = _$LoadSuccess;

  DashboardData get data;

  LoadSuccess copyWith({DashboardData data});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'DashboardState.loadFail(failure: $failure)';
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
    @required Result loading(),
    @required Result loadSuccess(DashboardData data),
    @required Result loadFail(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loadFail(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(DashboardData data),
    Result loadFail(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFail != null) {
      return loadFail(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(LoadingInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFail(LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFail != null);
    return loadFail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(LoadingInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFail(LoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFail != null) {
      return loadFail(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements DashboardState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
