// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'my_wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$MyWalletState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(MyWalletData data),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(MyWalletData data),
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

class _$MyWalletStateTearOff {
  const _$MyWalletStateTearOff();

  _initial initial() {
    return const _initial();
  }

  _loading loading() {
    return const _loading();
  }

  _loadSuccess loadSuccess(MyWalletData data) {
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

const $MyWalletState = _$MyWalletStateTearOff();

class _$_initial with DiagnosticableTreeMixin implements _initial {
  const _$_initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyWalletState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MyWalletState.initial'));
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
    @required Result loadSuccess(MyWalletData data),
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
    Result loadSuccess(MyWalletData data),
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

abstract class _initial implements MyWalletState {
  const factory _initial() = _$_initial;
}

class _$_loading with DiagnosticableTreeMixin implements _loading {
  const _$_loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyWalletState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MyWalletState.loading'));
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
    @required Result loadSuccess(MyWalletData data),
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
    Result loadSuccess(MyWalletData data),
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

abstract class _loading implements MyWalletState {
  const factory _loading() = _$_loading;
}

class _$_loadSuccess with DiagnosticableTreeMixin implements _loadSuccess {
  const _$_loadSuccess(this.data) : assert(data != null);

  @override
  final MyWalletData data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyWalletState.loadSuccess(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyWalletState.loadSuccess'))
      ..add(DiagnosticsProperty('data', data));
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
      data == freezed ? this.data : data as MyWalletData,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(MyWalletData data),
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
    Result loadSuccess(MyWalletData data),
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

abstract class _loadSuccess implements MyWalletState {
  const factory _loadSuccess(MyWalletData data) = _$_loadSuccess;

  MyWalletData get data;

  _loadSuccess copyWith({MyWalletData data});
}

class _$_loadFailure with DiagnosticableTreeMixin implements _loadFailure {
  const _$_loadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyWalletState.loadFailure(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyWalletState.loadFailure'))
      ..add(DiagnosticsProperty('failure', failure));
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
    @required Result loadSuccess(MyWalletData data),
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
    Result loadSuccess(MyWalletData data),
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

abstract class _loadFailure implements MyWalletState {
  const factory _loadFailure(BaseFailure failure) = _$_loadFailure;

  BaseFailure get failure;

  _loadFailure copyWith({BaseFailure failure});
}

mixin _$MyWalletEvent {}

class _$MyWalletEventTearOff {
  const _$MyWalletEventTearOff();

  _loadData loadData() {
    return const _loadData();
  }
}

const $MyWalletEvent = _$MyWalletEventTearOff();

class _$_loadData with DiagnosticableTreeMixin implements _loadData {
  const _$_loadData();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyWalletEvent.loadData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MyWalletEvent.loadData'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _loadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _loadData implements MyWalletEvent {
  const factory _loadData() = _$_loadData;
}
