// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$NotificationsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(KtList<NotificationItem> data),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(KtList<NotificationItem> data),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_initial value),
    @required Result loading(_loading value),
    @required Result loadSuccess(_loadSuccess value),
    @required Result loadFailure(_loadFailure value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result loading(_loading value),
    Result loadSuccess(_loadSuccess value),
    Result loadFailure(_loadFailure value),
    @required Result orElse(),
  });
}

class _$NotificationsStateTearOff {
  const _$NotificationsStateTearOff();

  _initial initial() {
    return const _initial();
  }

  _loading loading() {
    return const _loading();
  }

  _loadSuccess loadSuccess(KtList<NotificationItem> data) {
    return _loadSuccess(
      data,
    );
  }

  _loadFailure loadFailure(BaseFailure failure) {
    return _loadFailure(
      failure,
    );
  }
}

const $NotificationsState = _$NotificationsStateTearOff();

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'NotificationsState.initial()';
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
    @required Result loading(),
    @required Result loadSuccess(KtList<NotificationItem> data),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(KtList<NotificationItem> data),
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
    @required Result initial(_initial value),
    @required Result loading(_loading value),
    @required Result loadSuccess(_loadSuccess value),
    @required Result loadFailure(_loadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result loading(_loading value),
    Result loadSuccess(_loadSuccess value),
    Result loadFailure(_loadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements NotificationsState {
  const factory _initial() = _$_initial;
}

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(KtList<NotificationItem> data),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(KtList<NotificationItem> data),
    Result loadFailure(BaseFailure failure),
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
    @required Result initial(_initial value),
    @required Result loading(_loading value),
    @required Result loadSuccess(_loadSuccess value),
    @required Result loadFailure(_loadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result loading(_loading value),
    Result loadSuccess(_loadSuccess value),
    Result loadFailure(_loadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements NotificationsState {
  const factory _loading() = _$_loading;
}

class _$_loadSuccess implements _loadSuccess {
  const _$_loadSuccess(this.data) : assert(data != null);

  @override
  final KtList<NotificationItem> data;

  @override
  String toString() {
    return 'NotificationsState.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _loadSuccess &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$_loadSuccess copyWith({
    Object data = freezed,
  }) {
    return _$_loadSuccess(
      data == freezed ? this.data : data as KtList<NotificationItem>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(KtList<NotificationItem> data),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(KtList<NotificationItem> data),
    Result loadFailure(BaseFailure failure),
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
    @required Result initial(_initial value),
    @required Result loading(_loading value),
    @required Result loadSuccess(_loadSuccess value),
    @required Result loadFailure(_loadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result loading(_loading value),
    Result loadSuccess(_loadSuccess value),
    Result loadFailure(_loadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _loadSuccess implements NotificationsState {
  const factory _loadSuccess(KtList<NotificationItem> data) = _$_loadSuccess;

  KtList<NotificationItem> get data;

  _loadSuccess copyWith({KtList<NotificationItem> data});
}

class _$_loadFailure implements _loadFailure {
  const _$_loadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'NotificationsState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _loadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$_loadFailure copyWith({
    Object failure = freezed,
  }) {
    return _$_loadFailure(
      failure == freezed ? this.failure : failure as BaseFailure,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(KtList<NotificationItem> data),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(KtList<NotificationItem> data),
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
    @required Result initial(_initial value),
    @required Result loading(_loading value),
    @required Result loadSuccess(_loadSuccess value),
    @required Result loadFailure(_loadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_initial value),
    Result loading(_loading value),
    Result loadSuccess(_loadSuccess value),
    Result loadFailure(_loadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _loadFailure implements NotificationsState {
  const factory _loadFailure(BaseFailure failure) = _$_loadFailure;

  BaseFailure get failure;

  _loadFailure copyWith({BaseFailure failure});
}

mixin _$NotificationsEvent {}

class _$NotificationsEventTearOff {
  const _$NotificationsEventTearOff();

  _loadData loadData() {
    return const _loadData();
  }
}

const $NotificationsEvent = _$NotificationsEventTearOff();

class _$_loadData implements _loadData {
  const _$_loadData();

  @override
  String toString() {
    return 'NotificationsEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _loadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _loadData implements NotificationsEvent {
  const factory _loadData() = _$_loadData;
}
