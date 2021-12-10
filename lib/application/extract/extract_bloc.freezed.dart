// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'extract_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ExtractEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getExtractItems(),
    @required
        Result extractItemsReceived(
            Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
            Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    @required Result generateExtract(String year, String month),
    @required Result generateCertificate(String year, String month),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getExtractItems(),
    Result extractItemsReceived(
        Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
        Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    Result generateExtract(String year, String month),
    Result generateCertificate(String year, String month),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getExtractItems(_GetExtractItems value),
    @required Result extractItemsReceived(_ExtractItemsReceived value),
    @required Result generateExtract(_GenerateExtract value),
    @required Result generateCertificate(_GenerateCertificate value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getExtractItems(_GetExtractItems value),
    Result extractItemsReceived(_ExtractItemsReceived value),
    Result generateExtract(_GenerateExtract value),
    Result generateCertificate(_GenerateCertificate value),
    @required Result orElse(),
  });
}

class _$ExtractEventTearOff {
  const _$ExtractEventTearOff();

  _GetExtractItems getExtractItems() {
    return const _GetExtractItems();
  }

  _ExtractItemsReceived extractItemsReceived(
      Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
      Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate) {
    return _ExtractItemsReceived(
      failureOrItems,
      failureOrItemsCertificate,
    );
  }

  _GenerateExtract generateExtract(String year, String month) {
    return _GenerateExtract(
      year,
      month,
    );
  }

  _GenerateCertificate generateCertificate(String year, String month) {
    return _GenerateCertificate(
      year,
      month,
    );
  }
}

const $ExtractEvent = _$ExtractEventTearOff();

class _$_GetExtractItems implements _GetExtractItems {
  const _$_GetExtractItems();

  @override
  String toString() {
    return 'ExtractEvent.getExtractItems()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetExtractItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getExtractItems(),
    @required
        Result extractItemsReceived(
            Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
            Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    @required Result generateExtract(String year, String month),
    @required Result generateCertificate(String year, String month),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return getExtractItems();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getExtractItems(),
    Result extractItemsReceived(
        Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
        Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    Result generateExtract(String year, String month),
    Result generateCertificate(String year, String month),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getExtractItems != null) {
      return getExtractItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getExtractItems(_GetExtractItems value),
    @required Result extractItemsReceived(_ExtractItemsReceived value),
    @required Result generateExtract(_GenerateExtract value),
    @required Result generateCertificate(_GenerateCertificate value),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return getExtractItems(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getExtractItems(_GetExtractItems value),
    Result extractItemsReceived(_ExtractItemsReceived value),
    Result generateExtract(_GenerateExtract value),
    Result generateCertificate(_GenerateCertificate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getExtractItems != null) {
      return getExtractItems(this);
    }
    return orElse();
  }
}

abstract class _GetExtractItems implements ExtractEvent {
  const factory _GetExtractItems() = _$_GetExtractItems;
}

class _$_ExtractItemsReceived implements _ExtractItemsReceived {
  const _$_ExtractItemsReceived(
      this.failureOrItems, this.failureOrItemsCertificate)
      : assert(failureOrItems != null),
        assert(failureOrItemsCertificate != null);

  @override
  final Either<BaseFailure, KtList<ExtractItem>> failureOrItems;
  @override
  final Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate;

  @override
  String toString() {
    return 'ExtractEvent.extractItemsReceived(failureOrItems: $failureOrItems, failureOrItemsCertificate: $failureOrItemsCertificate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExtractItemsReceived &&
            (identical(other.failureOrItems, failureOrItems) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrItems, failureOrItems)) &&
            (identical(other.failureOrItemsCertificate,
                    failureOrItemsCertificate) ||
                const DeepCollectionEquality().equals(
                    other.failureOrItemsCertificate,
                    failureOrItemsCertificate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrItems) ^
      const DeepCollectionEquality().hash(failureOrItemsCertificate);

  @override
  _$_ExtractItemsReceived copyWith({
    Object failureOrItems = freezed,
    Object failureOrItemsCertificate = freezed,
  }) {
    return _$_ExtractItemsReceived(
      failureOrItems == freezed
          ? this.failureOrItems
          : failureOrItems as Either<BaseFailure, KtList<ExtractItem>>,
      failureOrItemsCertificate == freezed
          ? this.failureOrItemsCertificate
          : failureOrItemsCertificate
              as Either<BaseFailure, KtList<ExtractItem>>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getExtractItems(),
    @required
        Result extractItemsReceived(
            Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
            Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    @required Result generateExtract(String year, String month),
    @required Result generateCertificate(String year, String month),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return extractItemsReceived(failureOrItems, failureOrItemsCertificate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getExtractItems(),
    Result extractItemsReceived(
        Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
        Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    Result generateExtract(String year, String month),
    Result generateCertificate(String year, String month),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (extractItemsReceived != null) {
      return extractItemsReceived(failureOrItems, failureOrItemsCertificate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getExtractItems(_GetExtractItems value),
    @required Result extractItemsReceived(_ExtractItemsReceived value),
    @required Result generateExtract(_GenerateExtract value),
    @required Result generateCertificate(_GenerateCertificate value),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return extractItemsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getExtractItems(_GetExtractItems value),
    Result extractItemsReceived(_ExtractItemsReceived value),
    Result generateExtract(_GenerateExtract value),
    Result generateCertificate(_GenerateCertificate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (extractItemsReceived != null) {
      return extractItemsReceived(this);
    }
    return orElse();
  }
}

abstract class _ExtractItemsReceived implements ExtractEvent {
  const factory _ExtractItemsReceived(
          Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
          Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate) =
      _$_ExtractItemsReceived;

  Either<BaseFailure, KtList<ExtractItem>> get failureOrItems;
  Either<BaseFailure, KtList<ExtractItem>> get failureOrItemsCertificate;

  _ExtractItemsReceived copyWith(
      {Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
      Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate});
}

class _$_GenerateExtract implements _GenerateExtract {
  const _$_GenerateExtract(this.year, this.month)
      : assert(year != null),
        assert(month != null);

  @override
  final String year;
  @override
  final String month;

  @override
  String toString() {
    return 'ExtractEvent.generateExtract(year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenerateExtract &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.month, month) ||
                const DeepCollectionEquality().equals(other.month, month)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(month);

  @override
  _$_GenerateExtract copyWith({
    Object year = freezed,
    Object month = freezed,
  }) {
    return _$_GenerateExtract(
      year == freezed ? this.year : year as String,
      month == freezed ? this.month : month as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getExtractItems(),
    @required
        Result extractItemsReceived(
            Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
            Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    @required Result generateExtract(String year, String month),
    @required Result generateCertificate(String year, String month),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return generateExtract(year, month);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getExtractItems(),
    Result extractItemsReceived(
        Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
        Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    Result generateExtract(String year, String month),
    Result generateCertificate(String year, String month),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (generateExtract != null) {
      return generateExtract(year, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getExtractItems(_GetExtractItems value),
    @required Result extractItemsReceived(_ExtractItemsReceived value),
    @required Result generateExtract(_GenerateExtract value),
    @required Result generateCertificate(_GenerateCertificate value),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return generateExtract(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getExtractItems(_GetExtractItems value),
    Result extractItemsReceived(_ExtractItemsReceived value),
    Result generateExtract(_GenerateExtract value),
    Result generateCertificate(_GenerateCertificate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (generateExtract != null) {
      return generateExtract(this);
    }
    return orElse();
  }
}

abstract class _GenerateExtract implements ExtractEvent {
  const factory _GenerateExtract(String year, String month) =
      _$_GenerateExtract;

  String get year;
  String get month;

  _GenerateExtract copyWith({String year, String month});
}

class _$_GenerateCertificate implements _GenerateCertificate {
  const _$_GenerateCertificate(this.year, this.month)
      : assert(year != null),
        assert(month != null);

  @override
  final String year;
  @override
  final String month;

  @override
  String toString() {
    return 'ExtractEvent.generateCertificate(year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenerateCertificate &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.month, month) ||
                const DeepCollectionEquality().equals(other.month, month)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(month);

  @override
  _$_GenerateCertificate copyWith({
    Object year = freezed,
    Object month = freezed,
  }) {
    return _$_GenerateCertificate(
      year == freezed ? this.year : year as String,
      month == freezed ? this.month : month as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getExtractItems(),
    @required
        Result extractItemsReceived(
            Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
            Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    @required Result generateExtract(String year, String month),
    @required Result generateCertificate(String year, String month),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return generateCertificate(year, month);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getExtractItems(),
    Result extractItemsReceived(
        Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
        Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate),
    Result generateExtract(String year, String month),
    Result generateCertificate(String year, String month),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (generateCertificate != null) {
      return generateCertificate(year, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getExtractItems(_GetExtractItems value),
    @required Result extractItemsReceived(_ExtractItemsReceived value),
    @required Result generateExtract(_GenerateExtract value),
    @required Result generateCertificate(_GenerateCertificate value),
  }) {
    assert(getExtractItems != null);
    assert(extractItemsReceived != null);
    assert(generateExtract != null);
    assert(generateCertificate != null);
    return generateCertificate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getExtractItems(_GetExtractItems value),
    Result extractItemsReceived(_ExtractItemsReceived value),
    Result generateExtract(_GenerateExtract value),
    Result generateCertificate(_GenerateCertificate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (generateCertificate != null) {
      return generateCertificate(this);
    }
    return orElse();
  }
}

abstract class _GenerateCertificate implements ExtractEvent {
  const factory _GenerateCertificate(String year, String month) =
      _$_GenerateCertificate;

  String get year;
  String get month;

  _GenerateCertificate copyWith({String year, String month});
}

mixin _$ExtractState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<ExtractItem> extractItems,
            KtList<ExtractItem> extractItemsCertificate),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<ExtractItem> extractItems,
        KtList<ExtractItem> extractItemsCertificate),
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

class _$ExtractStateTearOff {
  const _$ExtractStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(KtList<ExtractItem> extractItems,
      KtList<ExtractItem> extractItemsCertificate) {
    return LoadSuccess(
      extractItems,
      extractItemsCertificate,
    );
  }

  LoadFailure loadFailure(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $ExtractState = _$ExtractStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ExtractState.initial()';
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
        Result loadSuccess(KtList<ExtractItem> extractItems,
            KtList<ExtractItem> extractItemsCertificate),
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
    Result loadSuccess(KtList<ExtractItem> extractItems,
        KtList<ExtractItem> extractItemsCertificate),
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

abstract class Initial implements ExtractState {
  const factory Initial() = _$Initial;
}

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'ExtractState.loadInProgress()';
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
    @required
        Result loadSuccess(KtList<ExtractItem> extractItems,
            KtList<ExtractItem> extractItemsCertificate),
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
    Result loadSuccess(KtList<ExtractItem> extractItems,
        KtList<ExtractItem> extractItemsCertificate),
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

abstract class DataTransferInProgress implements ExtractState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.extractItems, this.extractItemsCertificate)
      : assert(extractItems != null),
        assert(extractItemsCertificate != null);

  @override
  final KtList<ExtractItem> extractItems;
  @override
  final KtList<ExtractItem> extractItemsCertificate;

  @override
  String toString() {
    return 'ExtractState.loadSuccess(extractItems: $extractItems, extractItemsCertificate: $extractItemsCertificate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.extractItems, extractItems) ||
                const DeepCollectionEquality()
                    .equals(other.extractItems, extractItems)) &&
            (identical(
                    other.extractItemsCertificate, extractItemsCertificate) ||
                const DeepCollectionEquality().equals(
                    other.extractItemsCertificate, extractItemsCertificate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(extractItems) ^
      const DeepCollectionEquality().hash(extractItemsCertificate);

  @override
  _$LoadSuccess copyWith({
    Object extractItems = freezed,
    Object extractItemsCertificate = freezed,
  }) {
    return _$LoadSuccess(
      extractItems == freezed
          ? this.extractItems
          : extractItems as KtList<ExtractItem>,
      extractItemsCertificate == freezed
          ? this.extractItemsCertificate
          : extractItemsCertificate as KtList<ExtractItem>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<ExtractItem> extractItems,
            KtList<ExtractItem> extractItemsCertificate),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(extractItems, extractItemsCertificate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<ExtractItem> extractItems,
        KtList<ExtractItem> extractItemsCertificate),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(extractItems, extractItemsCertificate);
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

abstract class LoadSuccess implements ExtractState {
  const factory LoadSuccess(KtList<ExtractItem> extractItems,
      KtList<ExtractItem> extractItemsCertificate) = _$LoadSuccess;

  KtList<ExtractItem> get extractItems;
  KtList<ExtractItem> get extractItemsCertificate;

  LoadSuccess copyWith(
      {KtList<ExtractItem> extractItems,
      KtList<ExtractItem> extractItemsCertificate});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'ExtractState.loadFailure(failure: $failure)';
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
        Result loadSuccess(KtList<ExtractItem> extractItems,
            KtList<ExtractItem> extractItemsCertificate),
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
    Result loadSuccess(KtList<ExtractItem> extractItems,
        KtList<ExtractItem> extractItemsCertificate),
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

abstract class LoadFailure implements ExtractState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
