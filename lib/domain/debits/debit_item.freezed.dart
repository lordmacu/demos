// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'debit_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DebitItem {
  int get id;
  String get debitBank;
  String get accNumber;
  String get accountType;
  String get bankImageUrl;
  DashboardGoal get linkedGoal;

  DebitItem copyWith(
      {int id,
      String debitBank,
      String accNumber,
      String accountType,
      String bankImageUrl,
      DashboardGoal linkedGoal});
}

class _$DebitItemTearOff {
  const _$DebitItemTearOff();

  _DebitItem call(
      {@required int id,
      @required String debitBank,
      @required String accNumber,
      @required String accountType,
      @required String bankImageUrl,
      @required DashboardGoal linkedGoal}) {
    return _DebitItem(
      id: id,
      debitBank: debitBank,
      accNumber: accNumber,
      accountType: accountType,
      bankImageUrl: bankImageUrl,
      linkedGoal: linkedGoal,
    );
  }
}

const $DebitItem = _$DebitItemTearOff();

class _$_DebitItem implements _DebitItem {
  const _$_DebitItem(
      {@required this.id,
      @required this.debitBank,
      @required this.accNumber,
      @required this.accountType,
      @required this.bankImageUrl,
      @required this.linkedGoal})
      : assert(id != null),
        assert(debitBank != null),
        assert(accNumber != null),
        assert(accountType != null),
        assert(bankImageUrl != null),
        assert(linkedGoal != null);

  @override
  final int id;
  @override
  final String debitBank;
  @override
  final String accNumber;
  @override
  final String accountType;
  @override
  final String bankImageUrl;
  @override
  final DashboardGoal linkedGoal;

  @override
  String toString() {
    return 'DebitItem(id: $id, debitBank: $debitBank, accNumber: $accNumber, accountType: $accountType, bankImageUrl: $bankImageUrl, linkedGoal: $linkedGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DebitItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.debitBank, debitBank) ||
                const DeepCollectionEquality()
                    .equals(other.debitBank, debitBank)) &&
            (identical(other.accNumber, accNumber) ||
                const DeepCollectionEquality()
                    .equals(other.accNumber, accNumber)) &&
            (identical(other.accountType, accountType) ||
                const DeepCollectionEquality()
                    .equals(other.accountType, accountType)) &&
            (identical(other.bankImageUrl, bankImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bankImageUrl, bankImageUrl)) &&
            (identical(other.linkedGoal, linkedGoal) ||
                const DeepCollectionEquality()
                    .equals(other.linkedGoal, linkedGoal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(debitBank) ^
      const DeepCollectionEquality().hash(accNumber) ^
      const DeepCollectionEquality().hash(accountType) ^
      const DeepCollectionEquality().hash(bankImageUrl) ^
      const DeepCollectionEquality().hash(linkedGoal);

  @override
  _$_DebitItem copyWith({
    Object id = freezed,
    Object debitBank = freezed,
    Object accNumber = freezed,
    Object accountType = freezed,
    Object bankImageUrl = freezed,
    Object linkedGoal = freezed,
  }) {
    return _$_DebitItem(
      id: id == freezed ? this.id : id as int,
      debitBank: debitBank == freezed ? this.debitBank : debitBank as String,
      accNumber: accNumber == freezed ? this.accNumber : accNumber as String,
      accountType:
          accountType == freezed ? this.accountType : accountType as String,
      bankImageUrl:
          bankImageUrl == freezed ? this.bankImageUrl : bankImageUrl as String,
      linkedGoal:
          linkedGoal == freezed ? this.linkedGoal : linkedGoal as DashboardGoal,
    );
  }
}

abstract class _DebitItem implements DebitItem {
  const factory _DebitItem(
      {@required int id,
      @required String debitBank,
      @required String accNumber,
      @required String accountType,
      @required String bankImageUrl,
      @required DashboardGoal linkedGoal}) = _$_DebitItem;

  @override
  int get id;
  @override
  String get debitBank;
  @override
  String get accNumber;
  @override
  String get accountType;
  @override
  String get bankImageUrl;
  @override
  DashboardGoal get linkedGoal;

  @override
  _DebitItem copyWith(
      {int id,
      String debitBank,
      String accNumber,
      String accountType,
      String bankImageUrl,
      DashboardGoal linkedGoal});
}
