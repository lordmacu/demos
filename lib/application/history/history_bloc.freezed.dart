// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HistoryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTransactions(int valuePeriocity),
    @required
        Result transactionsReceived(
            Either<BaseFailure, KtList<ProfitabilityItem>>
                profitabilitiesOrFailure,
            Either<BaseFailure, KtList<TransactionItem>>
                graphTransactionsOrFailure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTransactions(int valuePeriocity),
    Result transactionsReceived(
        Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
        Either<BaseFailure, KtList<TransactionItem>>
            graphTransactionsOrFailure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTransactions(_GetTransactions value),
    @required Result transactionsReceived(_TransactionsReceived value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTransactions(_GetTransactions value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  });
}

class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _GetTransactions getTransactions(int valuePeriocity) {
    return _GetTransactions(
      valuePeriocity,
    );
  }

  _TransactionsReceived transactionsReceived(
      Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
      Either<BaseFailure, KtList<TransactionItem>> graphTransactionsOrFailure) {
    return _TransactionsReceived(
      profitabilitiesOrFailure,
      graphTransactionsOrFailure,
    );
  }
}

const $HistoryEvent = _$HistoryEventTearOff();

class _$_GetTransactions implements _GetTransactions {
  const _$_GetTransactions(this.valuePeriocity)
      : assert(valuePeriocity != null);

  @override
  final int valuePeriocity;

  @override
  String toString() {
    return 'HistoryEvent.getTransactions(valuePeriocity: $valuePeriocity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetTransactions &&
            (identical(other.valuePeriocity, valuePeriocity) ||
                const DeepCollectionEquality()
                    .equals(other.valuePeriocity, valuePeriocity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(valuePeriocity);

  @override
  _$_GetTransactions copyWith({
    Object valuePeriocity = freezed,
  }) {
    return _$_GetTransactions(
      valuePeriocity == freezed ? this.valuePeriocity : valuePeriocity as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTransactions(int valuePeriocity),
    @required
        Result transactionsReceived(
            Either<BaseFailure, KtList<ProfitabilityItem>>
                profitabilitiesOrFailure,
            Either<BaseFailure, KtList<TransactionItem>>
                graphTransactionsOrFailure),
  }) {
    assert(getTransactions != null);
    assert(transactionsReceived != null);
    return getTransactions(valuePeriocity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTransactions(int valuePeriocity),
    Result transactionsReceived(
        Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
        Either<BaseFailure, KtList<TransactionItem>>
            graphTransactionsOrFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTransactions != null) {
      return getTransactions(valuePeriocity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTransactions(_GetTransactions value),
    @required Result transactionsReceived(_TransactionsReceived value),
  }) {
    assert(getTransactions != null);
    assert(transactionsReceived != null);
    return getTransactions(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTransactions(_GetTransactions value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTransactions != null) {
      return getTransactions(this);
    }
    return orElse();
  }
}

abstract class _GetTransactions implements HistoryEvent {
  const factory _GetTransactions(int valuePeriocity) = _$_GetTransactions;

  int get valuePeriocity;

  _GetTransactions copyWith({int valuePeriocity});
}

class _$_TransactionsReceived implements _TransactionsReceived {
  const _$_TransactionsReceived(
      this.profitabilitiesOrFailure, this.graphTransactionsOrFailure)
      : assert(profitabilitiesOrFailure != null),
        assert(graphTransactionsOrFailure != null);

  @override
  final Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure;
  @override
  final Either<BaseFailure, KtList<TransactionItem>> graphTransactionsOrFailure;

  @override
  String toString() {
    return 'HistoryEvent.transactionsReceived(profitabilitiesOrFailure: $profitabilitiesOrFailure, graphTransactionsOrFailure: $graphTransactionsOrFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionsReceived &&
            (identical(
                    other.profitabilitiesOrFailure, profitabilitiesOrFailure) ||
                const DeepCollectionEquality().equals(
                    other.profitabilitiesOrFailure,
                    profitabilitiesOrFailure)) &&
            (identical(other.graphTransactionsOrFailure,
                    graphTransactionsOrFailure) ||
                const DeepCollectionEquality().equals(
                    other.graphTransactionsOrFailure,
                    graphTransactionsOrFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profitabilitiesOrFailure) ^
      const DeepCollectionEquality().hash(graphTransactionsOrFailure);

  @override
  _$_TransactionsReceived copyWith({
    Object profitabilitiesOrFailure = freezed,
    Object graphTransactionsOrFailure = freezed,
  }) {
    return _$_TransactionsReceived(
      profitabilitiesOrFailure == freezed
          ? this.profitabilitiesOrFailure
          : profitabilitiesOrFailure
              as Either<BaseFailure, KtList<ProfitabilityItem>>,
      graphTransactionsOrFailure == freezed
          ? this.graphTransactionsOrFailure
          : graphTransactionsOrFailure
              as Either<BaseFailure, KtList<TransactionItem>>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getTransactions(int valuePeriocity),
    @required
        Result transactionsReceived(
            Either<BaseFailure, KtList<ProfitabilityItem>>
                profitabilitiesOrFailure,
            Either<BaseFailure, KtList<TransactionItem>>
                graphTransactionsOrFailure),
  }) {
    assert(getTransactions != null);
    assert(transactionsReceived != null);
    return transactionsReceived(
        profitabilitiesOrFailure, graphTransactionsOrFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getTransactions(int valuePeriocity),
    Result transactionsReceived(
        Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
        Either<BaseFailure, KtList<TransactionItem>>
            graphTransactionsOrFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (transactionsReceived != null) {
      return transactionsReceived(
          profitabilitiesOrFailure, graphTransactionsOrFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getTransactions(_GetTransactions value),
    @required Result transactionsReceived(_TransactionsReceived value),
  }) {
    assert(getTransactions != null);
    assert(transactionsReceived != null);
    return transactionsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getTransactions(_GetTransactions value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (transactionsReceived != null) {
      return transactionsReceived(this);
    }
    return orElse();
  }
}

abstract class _TransactionsReceived implements HistoryEvent {
  const factory _TransactionsReceived(
      Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
      Either<BaseFailure, KtList<TransactionItem>>
          graphTransactionsOrFailure) = _$_TransactionsReceived;

  Either<BaseFailure, KtList<ProfitabilityItem>> get profitabilitiesOrFailure;
  Either<BaseFailure, KtList<TransactionItem>> get graphTransactionsOrFailure;

  _TransactionsReceived copyWith(
      {Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
      Either<BaseFailure, KtList<TransactionItem>> graphTransactionsOrFailure});
}

mixin _$HistoryState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
            KtList<TransactionItem> graphTransactions),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
        KtList<TransactionItem> graphTransactions),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(LoadInProgress value),
    @required Result loadSuccess(LoadSuccess value),
    @required Result loadFailure(LoadFailure value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loadInProgress(LoadInProgress value),
    Result loadSuccess(LoadSuccess value),
    Result loadFailure(LoadFailure value),
    @required Result orElse(),
  });
}

class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

  Initial initial() {
    return const Initial();
  }

  LoadInProgress loadInProgress() {
    return const LoadInProgress();
  }

  LoadSuccess loadSuccess(KtList<ProfitabilityItem> profitabilities,
      KtList<TransactionItem> graphTransactions) {
    return LoadSuccess(
      profitabilities,
      graphTransactions,
    );
  }

  LoadFailure loadFailure(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $HistoryState = _$HistoryStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'HistoryState.initial()';
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
    @required
        Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
            KtList<TransactionItem> graphTransactions),
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
    Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
        KtList<TransactionItem> graphTransactions),
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
    @required Result loadInProgress(LoadInProgress value),
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
    Result loadInProgress(LoadInProgress value),
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

abstract class Initial implements HistoryState {
  const factory Initial() = _$Initial;
}

class _$LoadInProgress implements LoadInProgress {
  const _$LoadInProgress();

  @override
  String toString() {
    return 'HistoryState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
            KtList<TransactionItem> graphTransactions),
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
    Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
        KtList<TransactionItem> graphTransactions),
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
    @required Result loadInProgress(LoadInProgress value),
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
    Result loadInProgress(LoadInProgress value),
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

abstract class LoadInProgress implements HistoryState {
  const factory LoadInProgress() = _$LoadInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.profitabilities, this.graphTransactions)
      : assert(profitabilities != null),
        assert(graphTransactions != null);

  @override
  final KtList<ProfitabilityItem> profitabilities;
  @override
  final KtList<TransactionItem> graphTransactions;

  @override
  String toString() {
    return 'HistoryState.loadSuccess(profitabilities: $profitabilities, graphTransactions: $graphTransactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.profitabilities, profitabilities) ||
                const DeepCollectionEquality()
                    .equals(other.profitabilities, profitabilities)) &&
            (identical(other.graphTransactions, graphTransactions) ||
                const DeepCollectionEquality()
                    .equals(other.graphTransactions, graphTransactions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profitabilities) ^
      const DeepCollectionEquality().hash(graphTransactions);

  @override
  _$LoadSuccess copyWith({
    Object profitabilities = freezed,
    Object graphTransactions = freezed,
  }) {
    return _$LoadSuccess(
      profitabilities == freezed
          ? this.profitabilities
          : profitabilities as KtList<ProfitabilityItem>,
      graphTransactions == freezed
          ? this.graphTransactions
          : graphTransactions as KtList<TransactionItem>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
            KtList<TransactionItem> graphTransactions),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(profitabilities, graphTransactions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
        KtList<TransactionItem> graphTransactions),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(profitabilities, graphTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loadInProgress(LoadInProgress value),
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
    Result loadInProgress(LoadInProgress value),
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

abstract class LoadSuccess implements HistoryState {
  const factory LoadSuccess(KtList<ProfitabilityItem> profitabilities,
      KtList<TransactionItem> graphTransactions) = _$LoadSuccess;

  KtList<ProfitabilityItem> get profitabilities;
  KtList<TransactionItem> get graphTransactions;

  LoadSuccess copyWith(
      {KtList<ProfitabilityItem> profitabilities,
      KtList<TransactionItem> graphTransactions});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'HistoryState.loadFailure(failure: $failure)';
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
    @required
        Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
            KtList<TransactionItem> graphTransactions),
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
    Result loadSuccess(KtList<ProfitabilityItem> profitabilities,
        KtList<TransactionItem> graphTransactions),
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
    @required Result loadInProgress(LoadInProgress value),
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
    Result loadInProgress(LoadInProgress value),
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

abstract class LoadFailure implements HistoryState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
