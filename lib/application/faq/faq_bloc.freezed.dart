// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'faq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$FAQEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFAQItems(),
    @required
        Result faqItemsReceived(
            Either<BaseFailure, KtList<FAQItem>> failureOrItems,
            Either<BaseFailure, ProfilingResult> profileOrFailure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFAQItems(),
    Result faqItemsReceived(Either<BaseFailure, KtList<FAQItem>> failureOrItems,
        Either<BaseFailure, ProfilingResult> profileOrFailure),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getFAQItems(_GetFAQItems value),
    @required Result faqItemsReceived(_FAQItemsReceived value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFAQItems(_GetFAQItems value),
    Result faqItemsReceived(_FAQItemsReceived value),
    @required Result orElse(),
  });
}

class _$FAQEventTearOff {
  const _$FAQEventTearOff();

  _GetFAQItems getFAQItems() {
    return const _GetFAQItems();
  }

  _FAQItemsReceived faqItemsReceived(
      Either<BaseFailure, KtList<FAQItem>> failureOrItems,
      Either<BaseFailure, ProfilingResult> profileOrFailure) {
    return _FAQItemsReceived(
      failureOrItems,
      profileOrFailure,
    );
  }
}

const $FAQEvent = _$FAQEventTearOff();

class _$_GetFAQItems implements _GetFAQItems {
  const _$_GetFAQItems();

  @override
  String toString() {
    return 'FAQEvent.getFAQItems()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetFAQItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFAQItems(),
    @required
        Result faqItemsReceived(
            Either<BaseFailure, KtList<FAQItem>> failureOrItems,
            Either<BaseFailure, ProfilingResult> profileOrFailure),
  }) {
    assert(getFAQItems != null);
    assert(faqItemsReceived != null);
    return getFAQItems();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFAQItems(),
    Result faqItemsReceived(Either<BaseFailure, KtList<FAQItem>> failureOrItems,
        Either<BaseFailure, ProfilingResult> profileOrFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFAQItems != null) {
      return getFAQItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getFAQItems(_GetFAQItems value),
    @required Result faqItemsReceived(_FAQItemsReceived value),
  }) {
    assert(getFAQItems != null);
    assert(faqItemsReceived != null);
    return getFAQItems(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFAQItems(_GetFAQItems value),
    Result faqItemsReceived(_FAQItemsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFAQItems != null) {
      return getFAQItems(this);
    }
    return orElse();
  }
}

abstract class _GetFAQItems implements FAQEvent {
  const factory _GetFAQItems() = _$_GetFAQItems;
}

class _$_FAQItemsReceived implements _FAQItemsReceived {
  const _$_FAQItemsReceived(this.failureOrItems, this.profileOrFailure)
      : assert(failureOrItems != null),
        assert(profileOrFailure != null);

  @override
  final Either<BaseFailure, KtList<FAQItem>> failureOrItems;
  @override
  final Either<BaseFailure, ProfilingResult> profileOrFailure;

  @override
  String toString() {
    return 'FAQEvent.faqItemsReceived(failureOrItems: $failureOrItems, profileOrFailure: $profileOrFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQItemsReceived &&
            (identical(other.failureOrItems, failureOrItems) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrItems, failureOrItems)) &&
            (identical(other.profileOrFailure, profileOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.profileOrFailure, profileOrFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrItems) ^
      const DeepCollectionEquality().hash(profileOrFailure);

  @override
  _$_FAQItemsReceived copyWith({
    Object failureOrItems = freezed,
    Object profileOrFailure = freezed,
  }) {
    return _$_FAQItemsReceived(
      failureOrItems == freezed
          ? this.failureOrItems
          : failureOrItems as Either<BaseFailure, KtList<FAQItem>>,
      profileOrFailure == freezed
          ? this.profileOrFailure
          : profileOrFailure as Either<BaseFailure, ProfilingResult>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFAQItems(),
    @required
        Result faqItemsReceived(
            Either<BaseFailure, KtList<FAQItem>> failureOrItems,
            Either<BaseFailure, ProfilingResult> profileOrFailure),
  }) {
    assert(getFAQItems != null);
    assert(faqItemsReceived != null);
    return faqItemsReceived(failureOrItems, profileOrFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFAQItems(),
    Result faqItemsReceived(Either<BaseFailure, KtList<FAQItem>> failureOrItems,
        Either<BaseFailure, ProfilingResult> profileOrFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (faqItemsReceived != null) {
      return faqItemsReceived(failureOrItems, profileOrFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getFAQItems(_GetFAQItems value),
    @required Result faqItemsReceived(_FAQItemsReceived value),
  }) {
    assert(getFAQItems != null);
    assert(faqItemsReceived != null);
    return faqItemsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFAQItems(_GetFAQItems value),
    Result faqItemsReceived(_FAQItemsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (faqItemsReceived != null) {
      return faqItemsReceived(this);
    }
    return orElse();
  }
}

abstract class _FAQItemsReceived implements FAQEvent {
  const factory _FAQItemsReceived(
          Either<BaseFailure, KtList<FAQItem>> failureOrItems,
          Either<BaseFailure, ProfilingResult> profileOrFailure) =
      _$_FAQItemsReceived;

  Either<BaseFailure, KtList<FAQItem>> get failureOrItems;
  Either<BaseFailure, ProfilingResult> get profileOrFailure;

  _FAQItemsReceived copyWith(
      {Either<BaseFailure, KtList<FAQItem>> failureOrItems,
      Either<BaseFailure, ProfilingResult> profileOrFailure});
}

mixin _$FAQState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
    @required Result loadFailure(BaseFailure failure),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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

class _$FAQStateTearOff {
  const _$FAQStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile) {
    return LoadSuccess(
      faqItems,
      profile,
    );
  }

  LoadFailure loadFailure(BaseFailure failure) {
    return LoadFailure(
      failure,
    );
  }
}

const $FAQState = _$FAQStateTearOff();

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'FAQState.initial()';
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
        Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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
    Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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

abstract class Initial implements FAQState {
  const factory Initial() = _$Initial;
}

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'FAQState.loadInProgress()';
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
        Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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
    Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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

abstract class DataTransferInProgress implements FAQState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.faqItems, this.profile)
      : assert(faqItems != null),
        assert(profile != null);

  @override
  final KtList<FAQItem> faqItems;
  @override
  final ProfilingResult profile;

  @override
  String toString() {
    return 'FAQState.loadSuccess(faqItems: $faqItems, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.faqItems, faqItems) ||
                const DeepCollectionEquality()
                    .equals(other.faqItems, faqItems)) &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(faqItems) ^
      const DeepCollectionEquality().hash(profile);

  @override
  _$LoadSuccess copyWith({
    Object faqItems = freezed,
    Object profile = freezed,
  }) {
    return _$LoadSuccess(
      faqItems == freezed ? this.faqItems : faqItems as KtList<FAQItem>,
      profile == freezed ? this.profile : profile as ProfilingResult,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loadInProgress(),
    @required
        Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
    @required Result loadFailure(BaseFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(faqItems, profile);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loadInProgress(),
    Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
    Result loadFailure(BaseFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(faqItems, profile);
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

abstract class LoadSuccess implements FAQState {
  const factory LoadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile) =
      _$LoadSuccess;

  KtList<FAQItem> get faqItems;
  ProfilingResult get profile;

  LoadSuccess copyWith({KtList<FAQItem> faqItems, ProfilingResult profile});
}

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.failure) : assert(failure != null);

  @override
  final BaseFailure failure;

  @override
  String toString() {
    return 'FAQState.loadFailure(failure: $failure)';
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
        Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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
    Result loadSuccess(KtList<FAQItem> faqItems, ProfilingResult profile),
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

abstract class LoadFailure implements FAQState {
  const factory LoadFailure(BaseFailure failure) = _$LoadFailure;

  BaseFailure get failure;

  LoadFailure copyWith({BaseFailure failure});
}
