// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'beneficiaries_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BeneficiariesState {
  KtList<BeneficiaryItem> get benficiaries;
  bool get isLoading;
  String get error;
  Option<Either<BaseFailure, bool>> get postOrFailure;
  bool get isUpdate;
  KtList<BeneficiaryItem> get deleted;

  BeneficiariesState copyWith(
      {KtList<BeneficiaryItem> benficiaries,
      bool isLoading,
      String error,
      Option<Either<BaseFailure, bool>> postOrFailure,
      bool isUpdate,
      KtList<BeneficiaryItem> deleted});
}

class _$BeneficiariesStateTearOff {
  const _$BeneficiariesStateTearOff();

  _BeneficiariesState call(
      {@required KtList<BeneficiaryItem> benficiaries,
      @required bool isLoading,
      @required String error,
      @required Option<Either<BaseFailure, bool>> postOrFailure,
      @required bool isUpdate,
      @required KtList<BeneficiaryItem> deleted}) {
    return _BeneficiariesState(
      benficiaries: benficiaries,
      isLoading: isLoading,
      error: error,
      postOrFailure: postOrFailure,
      isUpdate: isUpdate,
      deleted: deleted,
    );
  }
}

const $BeneficiariesState = _$BeneficiariesStateTearOff();

class _$_BeneficiariesState implements _BeneficiariesState {
  const _$_BeneficiariesState(
      {@required this.benficiaries,
      @required this.isLoading,
      @required this.error,
      @required this.postOrFailure,
      @required this.isUpdate,
      @required this.deleted})
      : assert(benficiaries != null),
        assert(isLoading != null),
        assert(error != null),
        assert(postOrFailure != null),
        assert(isUpdate != null),
        assert(deleted != null);

  @override
  final KtList<BeneficiaryItem> benficiaries;
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final Option<Either<BaseFailure, bool>> postOrFailure;
  @override
  final bool isUpdate;
  @override
  final KtList<BeneficiaryItem> deleted;

  @override
  String toString() {
    return 'BeneficiariesState(benficiaries: $benficiaries, isLoading: $isLoading, error: $error, postOrFailure: $postOrFailure, isUpdate: $isUpdate, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeneficiariesState &&
            (identical(other.benficiaries, benficiaries) ||
                const DeepCollectionEquality()
                    .equals(other.benficiaries, benficiaries)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.postOrFailure, postOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.postOrFailure, postOrFailure)) &&
            (identical(other.isUpdate, isUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdate, isUpdate)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality().equals(other.deleted, deleted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(benficiaries) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(postOrFailure) ^
      const DeepCollectionEquality().hash(isUpdate) ^
      const DeepCollectionEquality().hash(deleted);

  @override
  _$_BeneficiariesState copyWith({
    Object benficiaries = freezed,
    Object isLoading = freezed,
    Object error = freezed,
    Object postOrFailure = freezed,
    Object isUpdate = freezed,
    Object deleted = freezed,
  }) {
    return _$_BeneficiariesState(
      benficiaries: benficiaries == freezed
          ? this.benficiaries
          : benficiaries as KtList<BeneficiaryItem>,
      isLoading: isLoading == freezed ? this.isLoading : isLoading as bool,
      error: error == freezed ? this.error : error as String,
      postOrFailure: postOrFailure == freezed
          ? this.postOrFailure
          : postOrFailure as Option<Either<BaseFailure, bool>>,
      isUpdate: isUpdate == freezed ? this.isUpdate : isUpdate as bool,
      deleted: deleted == freezed
          ? this.deleted
          : deleted as KtList<BeneficiaryItem>,
    );
  }
}

abstract class _BeneficiariesState implements BeneficiariesState {
  const factory _BeneficiariesState(
      {@required KtList<BeneficiaryItem> benficiaries,
      @required bool isLoading,
      @required String error,
      @required Option<Either<BaseFailure, bool>> postOrFailure,
      @required bool isUpdate,
      @required KtList<BeneficiaryItem> deleted}) = _$_BeneficiariesState;

  @override
  KtList<BeneficiaryItem> get benficiaries;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  Option<Either<BaseFailure, bool>> get postOrFailure;
  @override
  bool get isUpdate;
  @override
  KtList<BeneficiaryItem> get deleted;

  @override
  _BeneficiariesState copyWith(
      {KtList<BeneficiaryItem> benficiaries,
      bool isLoading,
      String error,
      Option<Either<BaseFailure, bool>> postOrFailure,
      bool isUpdate,
      KtList<BeneficiaryItem> deleted});
}

mixin _$BeneficiariesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  });
}

class _$BeneficiariesEventTearOff {
  const _$BeneficiariesEventTearOff();

  _addBeneficiary addBeneficiary() {
    return const _addBeneficiary();
  }

  _getBeneficiaries getBeneficiaries() {
    return const _getBeneficiaries();
  }

  _editBeneficiarie editBeneficiary(int index, BeneficiaryItem newItem) {
    return _editBeneficiarie(
      index,
      newItem,
    );
  }

  _removeBeneficiary removeBeneficiary(int index) {
    return _removeBeneficiary(
      index,
    );
  }

  _postBeneficiaries postBeneficiaries() {
    return const _postBeneficiaries();
  }
}

const $BeneficiariesEvent = _$BeneficiariesEventTearOff();

class _$_addBeneficiary implements _addBeneficiary {
  const _$_addBeneficiary();

  @override
  String toString() {
    return 'BeneficiariesEvent.addBeneficiary()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _addBeneficiary);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return addBeneficiary();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addBeneficiary != null) {
      return addBeneficiary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return addBeneficiary(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addBeneficiary != null) {
      return addBeneficiary(this);
    }
    return orElse();
  }
}

abstract class _addBeneficiary implements BeneficiariesEvent {
  const factory _addBeneficiary() = _$_addBeneficiary;
}

class _$_getBeneficiaries implements _getBeneficiaries {
  const _$_getBeneficiaries();

  @override
  String toString() {
    return 'BeneficiariesEvent.getBeneficiaries()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _getBeneficiaries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return getBeneficiaries();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getBeneficiaries != null) {
      return getBeneficiaries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return getBeneficiaries(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getBeneficiaries != null) {
      return getBeneficiaries(this);
    }
    return orElse();
  }
}

abstract class _getBeneficiaries implements BeneficiariesEvent {
  const factory _getBeneficiaries() = _$_getBeneficiaries;
}

class _$_editBeneficiarie implements _editBeneficiarie {
  const _$_editBeneficiarie(this.index, this.newItem)
      : assert(index != null),
        assert(newItem != null);

  @override
  final int index;
  @override
  final BeneficiaryItem newItem;

  @override
  String toString() {
    return 'BeneficiariesEvent.editBeneficiary(index: $index, newItem: $newItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _editBeneficiarie &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.newItem, newItem) ||
                const DeepCollectionEquality().equals(other.newItem, newItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(newItem);

  @override
  _$_editBeneficiarie copyWith({
    Object index = freezed,
    Object newItem = freezed,
  }) {
    return _$_editBeneficiarie(
      index == freezed ? this.index : index as int,
      newItem == freezed ? this.newItem : newItem as BeneficiaryItem,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return editBeneficiary(index, newItem);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editBeneficiary != null) {
      return editBeneficiary(index, newItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return editBeneficiary(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editBeneficiary != null) {
      return editBeneficiary(this);
    }
    return orElse();
  }
}

abstract class _editBeneficiarie implements BeneficiariesEvent {
  const factory _editBeneficiarie(int index, BeneficiaryItem newItem) =
      _$_editBeneficiarie;

  int get index;
  BeneficiaryItem get newItem;

  _editBeneficiarie copyWith({int index, BeneficiaryItem newItem});
}

class _$_removeBeneficiary implements _removeBeneficiary {
  const _$_removeBeneficiary(this.index) : assert(index != null);

  @override
  final int index;

  @override
  String toString() {
    return 'BeneficiariesEvent.removeBeneficiary(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _removeBeneficiary &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  _$_removeBeneficiary copyWith({
    Object index = freezed,
  }) {
    return _$_removeBeneficiary(
      index == freezed ? this.index : index as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return removeBeneficiary(index);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removeBeneficiary != null) {
      return removeBeneficiary(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return removeBeneficiary(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removeBeneficiary != null) {
      return removeBeneficiary(this);
    }
    return orElse();
  }
}

abstract class _removeBeneficiary implements BeneficiariesEvent {
  const factory _removeBeneficiary(int index) = _$_removeBeneficiary;

  int get index;

  _removeBeneficiary copyWith({int index});
}

class _$_postBeneficiaries implements _postBeneficiaries {
  const _$_postBeneficiaries();

  @override
  String toString() {
    return 'BeneficiariesEvent.postBeneficiaries()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _postBeneficiaries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result addBeneficiary(),
    @required Result getBeneficiaries(),
    @required Result editBeneficiary(int index, BeneficiaryItem newItem),
    @required Result removeBeneficiary(int index),
    @required Result postBeneficiaries(),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return postBeneficiaries();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addBeneficiary(),
    Result getBeneficiaries(),
    Result editBeneficiary(int index, BeneficiaryItem newItem),
    Result removeBeneficiary(int index),
    Result postBeneficiaries(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postBeneficiaries != null) {
      return postBeneficiaries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addBeneficiary(_addBeneficiary value),
    @required Result getBeneficiaries(_getBeneficiaries value),
    @required Result editBeneficiary(_editBeneficiarie value),
    @required Result removeBeneficiary(_removeBeneficiary value),
    @required Result postBeneficiaries(_postBeneficiaries value),
  }) {
    assert(addBeneficiary != null);
    assert(getBeneficiaries != null);
    assert(editBeneficiary != null);
    assert(removeBeneficiary != null);
    assert(postBeneficiaries != null);
    return postBeneficiaries(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addBeneficiary(_addBeneficiary value),
    Result getBeneficiaries(_getBeneficiaries value),
    Result editBeneficiary(_editBeneficiarie value),
    Result removeBeneficiary(_removeBeneficiary value),
    Result postBeneficiaries(_postBeneficiaries value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postBeneficiaries != null) {
      return postBeneficiaries(this);
    }
    return orElse();
  }
}

abstract class _postBeneficiaries implements BeneficiariesEvent {
  const factory _postBeneficiaries() = _$_postBeneficiaries;
}
