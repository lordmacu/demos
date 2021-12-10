// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'debit_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DebitInfo {
  int get id;
  int get ualetAccountId;
  DateTime get creationDate;
  DateTime get firstDateApplication;
  DateTime get seconDateApplication;
  int get periodicity;
  DateTime get updateDate;
  int get status;
  int get bankAccountId;
  String get bankAccountName;
  String get bankAccountNumber;
  double get value;
  String get bankUrl;
  int get bankAccountTypeId;
  List<int> get goalId;
  String get bankAccountType;

  DebitInfo copyWith(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime seconDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankAccountName,
      String bankAccountNumber,
      double value,
      String bankUrl,
      int bankAccountTypeId,
      List<int> goalId,
      String bankAccountType});
}

class _$DebitInfoTearOff {
  const _$DebitInfoTearOff();

  _DebitInfo call(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime seconDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankAccountName,
      String bankAccountNumber,
      double value,
      String bankUrl,
      int bankAccountTypeId,
      List<int> goalId,
      String bankAccountType}) {
    return _DebitInfo(
      id: id,
      ualetAccountId: ualetAccountId,
      creationDate: creationDate,
      firstDateApplication: firstDateApplication,
      seconDateApplication: seconDateApplication,
      periodicity: periodicity,
      updateDate: updateDate,
      status: status,
      bankAccountId: bankAccountId,
      bankAccountName: bankAccountName,
      bankAccountNumber: bankAccountNumber,
      value: value,
      bankUrl: bankUrl,
      bankAccountTypeId: bankAccountTypeId,
      goalId: goalId,
      bankAccountType: bankAccountType,
    );
  }
}

const $DebitInfo = _$DebitInfoTearOff();

class _$_DebitInfo implements _DebitInfo {
  const _$_DebitInfo(
      {this.id,
      this.ualetAccountId,
      this.creationDate,
      this.firstDateApplication,
      this.seconDateApplication,
      this.periodicity,
      this.updateDate,
      this.status,
      this.bankAccountId,
      this.bankAccountName,
      this.bankAccountNumber,
      this.value,
      this.bankUrl,
      this.bankAccountTypeId,
      this.goalId,
      this.bankAccountType});

  @override
  final int id;
  @override
  final int ualetAccountId;
  @override
  final DateTime creationDate;
  @override
  final DateTime firstDateApplication;
  @override
  final DateTime seconDateApplication;
  @override
  final int periodicity;
  @override
  final DateTime updateDate;
  @override
  final int status;
  @override
  final int bankAccountId;
  @override
  final String bankAccountName;
  @override
  final String bankAccountNumber;
  @override
  final double value;
  @override
  final String bankUrl;
  @override
  final int bankAccountTypeId;
  @override
  final List<int> goalId;
  @override
  final String bankAccountType;

  @override
  String toString() {
    return 'DebitInfo(id: $id, ualetAccountId: $ualetAccountId, creationDate: $creationDate, firstDateApplication: $firstDateApplication, seconDateApplication: $seconDateApplication, periodicity: $periodicity, updateDate: $updateDate, status: $status, bankAccountId: $bankAccountId, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, value: $value, bankUrl: $bankUrl, bankAccountTypeId: $bankAccountTypeId, goalId: $goalId, bankAccountType: $bankAccountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DebitInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ualetAccountId, ualetAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.ualetAccountId, ualetAccountId)) &&
            (identical(other.creationDate, creationDate) ||
                const DeepCollectionEquality()
                    .equals(other.creationDate, creationDate)) &&
            (identical(other.firstDateApplication, firstDateApplication) ||
                const DeepCollectionEquality().equals(
                    other.firstDateApplication, firstDateApplication)) &&
            (identical(other.seconDateApplication, seconDateApplication) ||
                const DeepCollectionEquality().equals(
                    other.seconDateApplication, seconDateApplication)) &&
            (identical(other.periodicity, periodicity) ||
                const DeepCollectionEquality()
                    .equals(other.periodicity, periodicity)) &&
            (identical(other.updateDate, updateDate) ||
                const DeepCollectionEquality()
                    .equals(other.updateDate, updateDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.bankAccountName, bankAccountName) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountName, bankAccountName)) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNumber, bankAccountNumber)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.bankUrl, bankUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bankUrl, bankUrl)) &&
            (identical(other.bankAccountTypeId, bankAccountTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountTypeId, bankAccountTypeId)) &&
            (identical(other.goalId, goalId) ||
                const DeepCollectionEquality().equals(other.goalId, goalId)) &&
            (identical(other.bankAccountType, bankAccountType) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountType, bankAccountType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ualetAccountId) ^
      const DeepCollectionEquality().hash(creationDate) ^
      const DeepCollectionEquality().hash(firstDateApplication) ^
      const DeepCollectionEquality().hash(seconDateApplication) ^
      const DeepCollectionEquality().hash(periodicity) ^
      const DeepCollectionEquality().hash(updateDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(bankAccountName) ^
      const DeepCollectionEquality().hash(bankAccountNumber) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(bankUrl) ^
      const DeepCollectionEquality().hash(bankAccountTypeId) ^
      const DeepCollectionEquality().hash(goalId) ^
      const DeepCollectionEquality().hash(bankAccountType);

  @override
  _$_DebitInfo copyWith({
    Object id = freezed,
    Object ualetAccountId = freezed,
    Object creationDate = freezed,
    Object firstDateApplication = freezed,
    Object seconDateApplication = freezed,
    Object periodicity = freezed,
    Object updateDate = freezed,
    Object status = freezed,
    Object bankAccountId = freezed,
    Object bankAccountName = freezed,
    Object bankAccountNumber = freezed,
    Object value = freezed,
    Object bankUrl = freezed,
    Object bankAccountTypeId = freezed,
    Object goalId = freezed,
    Object bankAccountType = freezed,
  }) {
    return _$_DebitInfo(
      id: id == freezed ? this.id : id as int,
      ualetAccountId: ualetAccountId == freezed
          ? this.ualetAccountId
          : ualetAccountId as int,
      creationDate: creationDate == freezed
          ? this.creationDate
          : creationDate as DateTime,
      firstDateApplication: firstDateApplication == freezed
          ? this.firstDateApplication
          : firstDateApplication as DateTime,
      seconDateApplication: seconDateApplication == freezed
          ? this.seconDateApplication
          : seconDateApplication as DateTime,
      periodicity:
          periodicity == freezed ? this.periodicity : periodicity as int,
      updateDate:
          updateDate == freezed ? this.updateDate : updateDate as DateTime,
      status: status == freezed ? this.status : status as int,
      bankAccountId:
          bankAccountId == freezed ? this.bankAccountId : bankAccountId as int,
      bankAccountName: bankAccountName == freezed
          ? this.bankAccountName
          : bankAccountName as String,
      bankAccountNumber: bankAccountNumber == freezed
          ? this.bankAccountNumber
          : bankAccountNumber as String,
      value: value == freezed ? this.value : value as double,
      bankUrl: bankUrl == freezed ? this.bankUrl : bankUrl as String,
      bankAccountTypeId: bankAccountTypeId == freezed
          ? this.bankAccountTypeId
          : bankAccountTypeId as int,
      goalId: goalId == freezed ? this.goalId : goalId as List<int>,
      bankAccountType: bankAccountType == freezed
          ? this.bankAccountType
          : bankAccountType as String,
    );
  }
}

abstract class _DebitInfo implements DebitInfo {
  const factory _DebitInfo(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime seconDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankAccountName,
      String bankAccountNumber,
      double value,
      String bankUrl,
      int bankAccountTypeId,
      List<int> goalId,
      String bankAccountType}) = _$_DebitInfo;

  @override
  int get id;
  @override
  int get ualetAccountId;
  @override
  DateTime get creationDate;
  @override
  DateTime get firstDateApplication;
  @override
  DateTime get seconDateApplication;
  @override
  int get periodicity;
  @override
  DateTime get updateDate;
  @override
  int get status;
  @override
  int get bankAccountId;
  @override
  String get bankAccountName;
  @override
  String get bankAccountNumber;
  @override
  double get value;
  @override
  String get bankUrl;
  @override
  int get bankAccountTypeId;
  @override
  List<int> get goalId;
  @override
  String get bankAccountType;

  @override
  _DebitInfo copyWith(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime seconDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankAccountName,
      String bankAccountNumber,
      double value,
      String bankUrl,
      int bankAccountTypeId,
      List<int> goalId,
      String bankAccountType});
}
