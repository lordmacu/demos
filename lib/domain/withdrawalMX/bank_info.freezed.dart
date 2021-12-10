// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bank_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BankInfo {
  DateTime get registrationDate;
  int get status;
  int get bankAccountId;
  int get bankId;
  int get accountTypeId;
  String get accountNumber;
  String get bankName;
  String get stateName;
  String get accountTypeName;
  String get bankLogo;
  String get rfc;

  BankInfo copyWith(
      {DateTime registrationDate,
      int status,
      int bankAccountId,
      int bankId,
      int accountTypeId,
      String accountNumber,
      String bankName,
      String stateName,
      String accountTypeName,
      String bankLogo,
      String rfc});
}

class _$BankInfoTearOff {
  const _$BankInfoTearOff();

  _BankInfo call(
      {DateTime registrationDate,
      int status,
      @required int bankAccountId,
      @required int bankId,
      @required int accountTypeId,
      @required String accountNumber,
      @required String bankName,
      @required String stateName,
      @required String accountTypeName,
      @required String bankLogo,
      @required String rfc}) {
    return _BankInfo(
      registrationDate: registrationDate,
      status: status,
      bankAccountId: bankAccountId,
      bankId: bankId,
      accountTypeId: accountTypeId,
      accountNumber: accountNumber,
      bankName: bankName,
      stateName: stateName,
      accountTypeName: accountTypeName,
      bankLogo: bankLogo,
      rfc: rfc,
    );
  }
}

const $BankInfo = _$BankInfoTearOff();

class _$_BankInfo implements _BankInfo {
  const _$_BankInfo(
      {this.registrationDate,
      this.status,
      @required this.bankAccountId,
      @required this.bankId,
      @required this.accountTypeId,
      @required this.accountNumber,
      @required this.bankName,
      @required this.stateName,
      @required this.accountTypeName,
      @required this.bankLogo,
      @required this.rfc})
      : assert(bankAccountId != null),
        assert(bankId != null),
        assert(accountTypeId != null),
        assert(accountNumber != null),
        assert(bankName != null),
        assert(stateName != null),
        assert(accountTypeName != null),
        assert(bankLogo != null),
        assert(rfc != null);

  @override
  final DateTime registrationDate;
  @override
  final int status;
  @override
  final int bankAccountId;
  @override
  final int bankId;
  @override
  final int accountTypeId;
  @override
  final String accountNumber;
  @override
  final String bankName;
  @override
  final String stateName;
  @override
  final String accountTypeName;
  @override
  final String bankLogo;
  @override
  final String rfc;

  @override
  String toString() {
    return 'BankInfo(registrationDate: $registrationDate, status: $status, bankAccountId: $bankAccountId, bankId: $bankId, accountTypeId: $accountTypeId, accountNumber: $accountNumber, bankName: $bankName, stateName: $stateName, accountTypeName: $accountTypeName, bankLogo: $bankLogo, rfc: $rfc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankInfo &&
            (identical(other.registrationDate, registrationDate) ||
                const DeepCollectionEquality()
                    .equals(other.registrationDate, registrationDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.bankId, bankId) ||
                const DeepCollectionEquality().equals(other.bankId, bankId)) &&
            (identical(other.accountTypeId, accountTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.accountTypeId, accountTypeId)) &&
            (identical(other.accountNumber, accountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.accountNumber, accountNumber)) &&
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)) &&
            (identical(other.stateName, stateName) ||
                const DeepCollectionEquality()
                    .equals(other.stateName, stateName)) &&
            (identical(other.accountTypeName, accountTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.accountTypeName, accountTypeName)) &&
            (identical(other.bankLogo, bankLogo) ||
                const DeepCollectionEquality()
                    .equals(other.bankLogo, bankLogo)) &&
            (identical(other.rfc, rfc) ||
                const DeepCollectionEquality().equals(other.rfc, rfc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(registrationDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(bankId) ^
      const DeepCollectionEquality().hash(accountTypeId) ^
      const DeepCollectionEquality().hash(accountNumber) ^
      const DeepCollectionEquality().hash(bankName) ^
      const DeepCollectionEquality().hash(stateName) ^
      const DeepCollectionEquality().hash(accountTypeName) ^
      const DeepCollectionEquality().hash(bankLogo) ^
      const DeepCollectionEquality().hash(rfc);

  @override
  _$_BankInfo copyWith({
    Object registrationDate = freezed,
    Object status = freezed,
    Object bankAccountId = freezed,
    Object bankId = freezed,
    Object accountTypeId = freezed,
    Object accountNumber = freezed,
    Object bankName = freezed,
    Object stateName = freezed,
    Object accountTypeName = freezed,
    Object bankLogo = freezed,
    Object rfc = freezed,
  }) {
    return _$_BankInfo(
      registrationDate: registrationDate == freezed
          ? this.registrationDate
          : registrationDate as DateTime,
      status: status == freezed ? this.status : status as int,
      bankAccountId:
          bankAccountId == freezed ? this.bankAccountId : bankAccountId as int,
      bankId: bankId == freezed ? this.bankId : bankId as int,
      accountTypeId:
          accountTypeId == freezed ? this.accountTypeId : accountTypeId as int,
      accountNumber: accountNumber == freezed
          ? this.accountNumber
          : accountNumber as String,
      bankName: bankName == freezed ? this.bankName : bankName as String,
      stateName: stateName == freezed ? this.stateName : stateName as String,
      accountTypeName: accountTypeName == freezed
          ? this.accountTypeName
          : accountTypeName as String,
      bankLogo: bankLogo == freezed ? this.bankLogo : bankLogo as String,
      rfc: rfc == freezed ? this.rfc : rfc as String,
    );
  }
}

abstract class _BankInfo implements BankInfo {
  const factory _BankInfo(
      {DateTime registrationDate,
      int status,
      @required int bankAccountId,
      @required int bankId,
      @required int accountTypeId,
      @required String accountNumber,
      @required String bankName,
      @required String stateName,
      @required String accountTypeName,
      @required String bankLogo,
      @required String rfc}) = _$_BankInfo;

  @override
  DateTime get registrationDate;
  @override
  int get status;
  @override
  int get bankAccountId;
  @override
  int get bankId;
  @override
  int get accountTypeId;
  @override
  String get accountNumber;
  @override
  String get bankName;
  @override
  String get stateName;
  @override
  String get accountTypeName;
  @override
  String get bankLogo;
  @override
  String get rfc;

  @override
  _BankInfo copyWith(
      {DateTime registrationDate,
      int status,
      int bankAccountId,
      int bankId,
      int accountTypeId,
      String accountNumber,
      String bankName,
      String stateName,
      String accountTypeName,
      String bankLogo,
      String rfc});
}
