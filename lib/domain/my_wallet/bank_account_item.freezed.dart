// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bank_account_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BankAccountItem {
  String get number;
  String get accountType;
  String get accountBank;
  String get accountImg;
  int get id;
  int get typeId;
  int get bankId;
  int get status;
  String get stateName;
  String get rfc;

  BankAccountItem copyWith(
      {String number,
      String accountType,
      String accountBank,
      String accountImg,
      int id,
      int typeId,
      int bankId,
      int status,
      String stateName,
      String rfc});
}

class _$BankAccountItemTearOff {
  const _$BankAccountItemTearOff();

  _BankAccountItem call(
      {@required String number,
      @required String accountType,
      @required String accountBank,
      @required String accountImg,
      @required int id,
      @required int typeId,
      @required int bankId,
      int status,
      String stateName,
      String rfc}) {
    return _BankAccountItem(
      number: number,
      accountType: accountType,
      accountBank: accountBank,
      accountImg: accountImg,
      id: id,
      typeId: typeId,
      bankId: bankId,
      status: status,
      stateName: stateName,
      rfc: rfc,
    );
  }
}

const $BankAccountItem = _$BankAccountItemTearOff();

class _$_BankAccountItem implements _BankAccountItem {
  const _$_BankAccountItem(
      {@required this.number,
      @required this.accountType,
      @required this.accountBank,
      @required this.accountImg,
      @required this.id,
      @required this.typeId,
      @required this.bankId,
      this.status,
      this.stateName,
      this.rfc})
      : assert(number != null),
        assert(accountType != null),
        assert(accountBank != null),
        assert(accountImg != null),
        assert(id != null),
        assert(typeId != null),
        assert(bankId != null);

  @override
  final String number;
  @override
  final String accountType;
  @override
  final String accountBank;
  @override
  final String accountImg;
  @override
  final int id;
  @override
  final int typeId;
  @override
  final int bankId;
  @override
  final int status;
  @override
  final String stateName;
  @override
  final String rfc;

  @override
  String toString() {
    return 'BankAccountItem(number: $number, accountType: $accountType, accountBank: $accountBank, accountImg: $accountImg, id: $id, typeId: $typeId, bankId: $bankId, status: $status, stateName: $stateName, rfc: $rfc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankAccountItem &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.accountType, accountType) ||
                const DeepCollectionEquality()
                    .equals(other.accountType, accountType)) &&
            (identical(other.accountBank, accountBank) ||
                const DeepCollectionEquality()
                    .equals(other.accountBank, accountBank)) &&
            (identical(other.accountImg, accountImg) ||
                const DeepCollectionEquality()
                    .equals(other.accountImg, accountImg)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.typeId, typeId) ||
                const DeepCollectionEquality().equals(other.typeId, typeId)) &&
            (identical(other.bankId, bankId) ||
                const DeepCollectionEquality().equals(other.bankId, bankId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.stateName, stateName) ||
                const DeepCollectionEquality()
                    .equals(other.stateName, stateName)) &&
            (identical(other.rfc, rfc) ||
                const DeepCollectionEquality().equals(other.rfc, rfc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(accountType) ^
      const DeepCollectionEquality().hash(accountBank) ^
      const DeepCollectionEquality().hash(accountImg) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(typeId) ^
      const DeepCollectionEquality().hash(bankId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(stateName) ^
      const DeepCollectionEquality().hash(rfc);

  @override
  _$_BankAccountItem copyWith({
    Object number = freezed,
    Object accountType = freezed,
    Object accountBank = freezed,
    Object accountImg = freezed,
    Object id = freezed,
    Object typeId = freezed,
    Object bankId = freezed,
    Object status = freezed,
    Object stateName = freezed,
    Object rfc = freezed,
  }) {
    return _$_BankAccountItem(
      number: number == freezed ? this.number : number as String,
      accountType:
          accountType == freezed ? this.accountType : accountType as String,
      accountBank:
          accountBank == freezed ? this.accountBank : accountBank as String,
      accountImg:
          accountImg == freezed ? this.accountImg : accountImg as String,
      id: id == freezed ? this.id : id as int,
      typeId: typeId == freezed ? this.typeId : typeId as int,
      bankId: bankId == freezed ? this.bankId : bankId as int,
      status: status == freezed ? this.status : status as int,
      stateName: stateName == freezed ? this.stateName : stateName as String,
      rfc: rfc == freezed ? this.rfc : rfc as String,
    );
  }
}

abstract class _BankAccountItem implements BankAccountItem {
  const factory _BankAccountItem(
      {@required String number,
      @required String accountType,
      @required String accountBank,
      @required String accountImg,
      @required int id,
      @required int typeId,
      @required int bankId,
      int status,
      String stateName,
      String rfc}) = _$_BankAccountItem;

  @override
  String get number;
  @override
  String get accountType;
  @override
  String get accountBank;
  @override
  String get accountImg;
  @override
  int get id;
  @override
  int get typeId;
  @override
  int get bankId;
  @override
  int get status;
  @override
  String get stateName;
  @override
  String get rfc;

  @override
  _BankAccountItem copyWith(
      {String number,
      String accountType,
      String accountBank,
      String accountImg,
      int id,
      int typeId,
      int bankId,
      int status,
      String stateName,
      String rfc});
}
