// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'terms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$TermsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTermsItems(),
    @required
        Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTermsItems(),
    Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTermsItems(_GetTermsItems value),
    @required Result termsItemsreceived(_TermsItemsReceived value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTermsItems(_GetTermsItems value),
    Result termsItemsreceived(_TermsItemsReceived value),
    @required Result orElse(),
  });
}

class _$TermsEventTearOff {
  const _$TermsEventTearOff();

  _GetTermsItems getTermsItems() {
    return const _GetTermsItems();
  }

  _TermsItemsReceived termsItemsreceived(
      Either<BaseFailure, String> failureOrItem) {
    return _TermsItemsReceived(
      failureOrItem,
    );
  }
}

const $TermsEvent = _$TermsEventTearOff();

class _$_GetTermsItems implements _GetTermsItems {
  const _$_GetTermsItems();

  @override
  String toString() {
    return 'TermsEvent.getTermsItems()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetTermsItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTermsItems(),
    @required
        Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
  }) {
    assert(getTermsItems != null);
    assert(termsItemsreceived != null);
    return getTermsItems();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTermsItems(),
    Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTermsItems != null) {
      return getTermsItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTermsItems(_GetTermsItems value),
    @required Result termsItemsreceived(_TermsItemsReceived value),
  }) {
    assert(getTermsItems != null);
    assert(termsItemsreceived != null);
    return getTermsItems(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTermsItems(_GetTermsItems value),
    Result termsItemsreceived(_TermsItemsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTermsItems != null) {
      return getTermsItems(this);
    }
    return orElse();
  }
}

abstract class _GetTermsItems implements TermsEvent {
  const factory _GetTermsItems() = _$_GetTermsItems;
}

class _$_TermsItemsReceived implements _TermsItemsReceived {
  const _$_TermsItemsReceived(this.failureOrItem)
      : assert(failureOrItem != null);

  @override
  final Either<BaseFailure, String> failureOrItem;

  @override
  String toString() {
    return 'TermsEvent.termsItemsreceived(failureOrItem: $failureOrItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TermsItemsReceived &&
            (identical(other.failureOrItem, failureOrItem) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrItem, failureOrItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failureOrItem);

  @override
  _$_TermsItemsReceived copyWith({
    Object failureOrItem = freezed,
  }) {
    return _$_TermsItemsReceived(
      failureOrItem == freezed
          ? this.failureOrItem
          : failureOrItem as Either<BaseFailure, String>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTermsItems(),
    @required
        Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
  }) {
    assert(getTermsItems != null);
    assert(termsItemsreceived != null);
    return termsItemsreceived(failureOrItem);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTermsItems(),
    Result termsItemsreceived(Either<BaseFailure, String> failureOrItem),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (termsItemsreceived != null) {
      return termsItemsreceived(failureOrItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTermsItems(_GetTermsItems value),
    @required Result termsItemsreceived(_TermsItemsReceived value),
  }) {
    assert(getTermsItems != null);
    assert(termsItemsreceived != null);
    return termsItemsreceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTermsItems(_GetTermsItems value),
    Result termsItemsreceived(_TermsItemsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (termsItemsreceived != null) {
      return termsItemsreceived(this);
    }
    return orElse();
  }
}

abstract class _TermsItemsReceived implements TermsEvent {
  const factory _TermsItemsReceived(Either<BaseFailure, String> failureOrItem) =
      _$_TermsItemsReceived;

  Either<BaseFailure, String> get failureOrItem;

  _TermsItemsReceived copyWith({Either<BaseFailure, String> failureOrItem});
}

mixin _$TermsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(String items),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(String items),
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

class _$TermsStateTearOff {
  const _$TermsStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(String items) {
    return LoadSuccess(
      items,
    );
  }

  LoadFailure loadFailure(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $TermsState = _$TermsStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'TermsState.initial()';
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
    @required Result loadSuccess(String items),
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
    Result loadSuccess(String items),
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

abstract class Initial implements TermsState {
  const factory Initial() = _$Initial;
}

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'TermsState.loadInProgress()';
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
    @required Result loadSuccess(String items),
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
    Result loadSuccess(String items),
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

abstract class DataTransferInProgress implements TermsState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.items) : assert(items != null);

  @override
  final String items;

  @override
  String toString() {
    return 'TermsState.loadSuccess(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @override
  _$LoadSuccess copyWith({
    Object items = freezed,
  }) {
    return _$LoadSuccess(
      items == freezed ? this.items : items as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required Result loadSuccess(String items),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(items);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(String items),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(items);
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

abstract class LoadSuccess implements TermsState {
  const factory LoadSuccess(String items) = _$LoadSuccess;

  String get items;

  LoadSuccess copyWith({String items});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'TermsState.loadFailure(failure: $failure)';
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
    @required Result loadSuccess(String items),
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
    Result loadSuccess(String items),
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

abstract class LoadFailure implements TermsState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
