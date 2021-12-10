// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bankdelete_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BankdeleteEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleteBankAccount(BankAccountItem bankAccount),
    @required Result resetBloc(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleteBankAccount(BankAccountItem bankAccount),
    Result resetBloc(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleteBankAccount(_deleteBankAccount value),
    @required Result resetBloc(_resetBloc value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleteBankAccount(_deleteBankAccount value),
    Result resetBloc(_resetBloc value),
    @required Result orElse(),
  });
}

class _$BankdeleteEventTearOff {
  const _$BankdeleteEventTearOff();

  _deleteBankAccount deleteBankAccount(BankAccountItem bankAccount) {
    return _deleteBankAccount(
      bankAccount,
    );
  }

  _resetBloc resetBloc() {
    return const _resetBloc();
  }
}

const $BankdeleteEvent = _$BankdeleteEventTearOff();

class _$_deleteBankAccount implements _deleteBankAccount {
  const _$_deleteBankAccount(this.bankAccount) : assert(bankAccount != null);

  @override
  final BankAccountItem bankAccount;

  @override
  String toString() {
    return 'BankdeleteEvent.deleteBankAccount(bankAccount: $bankAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _deleteBankAccount &&
            (identical(other.bankAccount, bankAccount) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccount, bankAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bankAccount);

  @override
  _$_deleteBankAccount copyWith({
    Object bankAccount = freezed,
  }) {
    return _$_deleteBankAccount(
      bankAccount == freezed
          ? this.bankAccount
          : bankAccount as BankAccountItem,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleteBankAccount(BankAccountItem bankAccount),
    @required Result resetBloc(),
  }) {
    assert(deleteBankAccount != null);
    assert(resetBloc != null);
    return deleteBankAccount(bankAccount);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleteBankAccount(BankAccountItem bankAccount),
    Result resetBloc(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteBankAccount != null) {
      return deleteBankAccount(bankAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleteBankAccount(_deleteBankAccount value),
    @required Result resetBloc(_resetBloc value),
  }) {
    assert(deleteBankAccount != null);
    assert(resetBloc != null);
    return deleteBankAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleteBankAccount(_deleteBankAccount value),
    Result resetBloc(_resetBloc value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteBankAccount != null) {
      return deleteBankAccount(this);
    }
    return orElse();
  }
}

abstract class _deleteBankAccount implements BankdeleteEvent {
  const factory _deleteBankAccount(BankAccountItem bankAccount) =
      _$_deleteBankAccount;

  BankAccountItem get bankAccount;

  _deleteBankAccount copyWith({BankAccountItem bankAccount});
}

class _$_resetBloc implements _resetBloc {
  const _$_resetBloc();

  @override
  String toString() {
    return 'BankdeleteEvent.resetBloc()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _resetBloc);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleteBankAccount(BankAccountItem bankAccount),
    @required Result resetBloc(),
  }) {
    assert(deleteBankAccount != null);
    assert(resetBloc != null);
    return resetBloc();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleteBankAccount(BankAccountItem bankAccount),
    Result resetBloc(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetBloc != null) {
      return resetBloc();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleteBankAccount(_deleteBankAccount value),
    @required Result resetBloc(_resetBloc value),
  }) {
    assert(deleteBankAccount != null);
    assert(resetBloc != null);
    return resetBloc(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleteBankAccount(_deleteBankAccount value),
    Result resetBloc(_resetBloc value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetBloc != null) {
      return resetBloc(this);
    }
    return orElse();
  }
}

abstract class _resetBloc implements BankdeleteEvent {
  const factory _resetBloc() = _$_resetBloc;
}

mixin _$BankdeleteState {
  Option<Either<BaseFailure, bool>> get deleteOrFailure;

  BankdeleteState copyWith({Option<Either<BaseFailure, bool>> deleteOrFailure});
}

class _$BankdeleteStateTearOff {
  const _$BankdeleteStateTearOff();

  _BankdeleteState call({Option<Either<BaseFailure, bool>> deleteOrFailure}) {
    return _BankdeleteState(
      deleteOrFailure: deleteOrFailure,
    );
  }
}

const $BankdeleteState = _$BankdeleteStateTearOff();

class _$_BankdeleteState implements _BankdeleteState {
  const _$_BankdeleteState({this.deleteOrFailure});

  @override
  final Option<Either<BaseFailure, bool>> deleteOrFailure;

  @override
  String toString() {
    return 'BankdeleteState(deleteOrFailure: $deleteOrFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankdeleteState &&
            (identical(other.deleteOrFailure, deleteOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.deleteOrFailure, deleteOrFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deleteOrFailure);

  @override
  _$_BankdeleteState copyWith({
    Object deleteOrFailure = freezed,
  }) {
    return _$_BankdeleteState(
      deleteOrFailure: deleteOrFailure == freezed
          ? this.deleteOrFailure
          : deleteOrFailure as Option<Either<BaseFailure, bool>>,
    );
  }
}

abstract class _BankdeleteState implements BankdeleteState {
  const factory _BankdeleteState(
      {Option<Either<BaseFailure, bool>> deleteOrFailure}) = _$_BankdeleteState;

  @override
  Option<Either<BaseFailure, bool>> get deleteOrFailure;

  @override
  _BankdeleteState copyWith(
      {Option<Either<BaseFailure, bool>> deleteOrFailure});
}
