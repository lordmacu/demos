// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_migration_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$UserMigrationItem {
  int get id;
  int get ualetAccountId;
  DateTime get creationDate;
  DateTime get firstDateApplication;
  DateTime get secondDateApplication;
  int get periodicity;
  DateTime get updateDate;
  int get status;
  int get bankAccountId;
  String get bankName;
  String get bankAccountNumber;
  double get value;
  List<dynamic> get goalsChildren;
  String get imgUrl;
  String get bankAccountTypeName;

  UserMigrationItem copyWith(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime secondDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankName,
      String bankAccountNumber,
      double value,
      List<dynamic> goalsChildren,
      String imgUrl,
      String bankAccountTypeName});
}

class _$UserMigrationItemTearOff {
  const _$UserMigrationItemTearOff();

  _UserMigrationItem call(
      {@required int id,
      @required int ualetAccountId,
      @required DateTime creationDate,
      @required DateTime firstDateApplication,
      DateTime secondDateApplication,
      @required int periodicity,
      @required DateTime updateDate,
      @required int status,
      @required int bankAccountId,
      @required String bankName,
      @required String bankAccountNumber,
      @required double value,
      List<dynamic> goalsChildren,
      String imgUrl,
      String bankAccountTypeName}) {
    return _UserMigrationItem(
      id: id,
      ualetAccountId: ualetAccountId,
      creationDate: creationDate,
      firstDateApplication: firstDateApplication,
      secondDateApplication: secondDateApplication,
      periodicity: periodicity,
      updateDate: updateDate,
      status: status,
      bankAccountId: bankAccountId,
      bankName: bankName,
      bankAccountNumber: bankAccountNumber,
      value: value,
      goalsChildren: goalsChildren,
      imgUrl: imgUrl,
      bankAccountTypeName: bankAccountTypeName,
    );
  }
}

const $UserMigrationItem = _$UserMigrationItemTearOff();

class _$_UserMigrationItem implements _UserMigrationItem {
  const _$_UserMigrationItem(
      {@required this.id,
      @required this.ualetAccountId,
      @required this.creationDate,
      @required this.firstDateApplication,
      this.secondDateApplication,
      @required this.periodicity,
      @required this.updateDate,
      @required this.status,
      @required this.bankAccountId,
      @required this.bankName,
      @required this.bankAccountNumber,
      @required this.value,
      this.goalsChildren,
      this.imgUrl,
      this.bankAccountTypeName})
      : assert(id != null),
        assert(ualetAccountId != null),
        assert(creationDate != null),
        assert(firstDateApplication != null),
        assert(periodicity != null),
        assert(updateDate != null),
        assert(status != null),
        assert(bankAccountId != null),
        assert(bankName != null),
        assert(bankAccountNumber != null),
        assert(value != null);

  @override
  final int id;
  @override
  final int ualetAccountId;
  @override
  final DateTime creationDate;
  @override
  final DateTime firstDateApplication;
  @override
  final DateTime secondDateApplication;
  @override
  final int periodicity;
  @override
  final DateTime updateDate;
  @override
  final int status;
  @override
  final int bankAccountId;
  @override
  final String bankName;
  @override
  final String bankAccountNumber;
  @override
  final double value;
  @override
  final List<dynamic> goalsChildren;
  @override
  final String imgUrl;
  @override
  final String bankAccountTypeName;

  @override
  String toString() {
    return 'UserMigrationItem(id: $id, ualetAccountId: $ualetAccountId, creationDate: $creationDate, firstDateApplication: $firstDateApplication, secondDateApplication: $secondDateApplication, periodicity: $periodicity, updateDate: $updateDate, status: $status, bankAccountId: $bankAccountId, bankName: $bankName, bankAccountNumber: $bankAccountNumber, value: $value, goalsChildren: $goalsChildren, imgUrl: $imgUrl, bankAccountTypeName: $bankAccountTypeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserMigrationItem &&
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
            (identical(other.secondDateApplication, secondDateApplication) ||
                const DeepCollectionEquality().equals(
                    other.secondDateApplication, secondDateApplication)) &&
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
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNumber, bankAccountNumber)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.goalsChildren, goalsChildren) ||
                const DeepCollectionEquality()
                    .equals(other.goalsChildren, goalsChildren)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.bankAccountTypeName, bankAccountTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountTypeName, bankAccountTypeName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ualetAccountId) ^
      const DeepCollectionEquality().hash(creationDate) ^
      const DeepCollectionEquality().hash(firstDateApplication) ^
      const DeepCollectionEquality().hash(secondDateApplication) ^
      const DeepCollectionEquality().hash(periodicity) ^
      const DeepCollectionEquality().hash(updateDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(bankName) ^
      const DeepCollectionEquality().hash(bankAccountNumber) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(goalsChildren) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(bankAccountTypeName);

  @override
  _$_UserMigrationItem copyWith({
    Object id = freezed,
    Object ualetAccountId = freezed,
    Object creationDate = freezed,
    Object firstDateApplication = freezed,
    Object secondDateApplication = freezed,
    Object periodicity = freezed,
    Object updateDate = freezed,
    Object status = freezed,
    Object bankAccountId = freezed,
    Object bankName = freezed,
    Object bankAccountNumber = freezed,
    Object value = freezed,
    Object goalsChildren = freezed,
    Object imgUrl = freezed,
    Object bankAccountTypeName = freezed,
  }) {
    return _$_UserMigrationItem(
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
      secondDateApplication: secondDateApplication == freezed
          ? this.secondDateApplication
          : secondDateApplication as DateTime,
      periodicity:
          periodicity == freezed ? this.periodicity : periodicity as int,
      updateDate:
          updateDate == freezed ? this.updateDate : updateDate as DateTime,
      status: status == freezed ? this.status : status as int,
      bankAccountId:
          bankAccountId == freezed ? this.bankAccountId : bankAccountId as int,
      bankName: bankName == freezed ? this.bankName : bankName as String,
      bankAccountNumber: bankAccountNumber == freezed
          ? this.bankAccountNumber
          : bankAccountNumber as String,
      value: value == freezed ? this.value : value as double,
      goalsChildren: goalsChildren == freezed
          ? this.goalsChildren
          : goalsChildren as List<dynamic>,
      imgUrl: imgUrl == freezed ? this.imgUrl : imgUrl as String,
      bankAccountTypeName: bankAccountTypeName == freezed
          ? this.bankAccountTypeName
          : bankAccountTypeName as String,
    );
  }
}

abstract class _UserMigrationItem implements UserMigrationItem {
  const factory _UserMigrationItem(
      {@required int id,
      @required int ualetAccountId,
      @required DateTime creationDate,
      @required DateTime firstDateApplication,
      DateTime secondDateApplication,
      @required int periodicity,
      @required DateTime updateDate,
      @required int status,
      @required int bankAccountId,
      @required String bankName,
      @required String bankAccountNumber,
      @required double value,
      List<dynamic> goalsChildren,
      String imgUrl,
      String bankAccountTypeName}) = _$_UserMigrationItem;

  @override
  int get id;
  @override
  int get ualetAccountId;
  @override
  DateTime get creationDate;
  @override
  DateTime get firstDateApplication;
  @override
  DateTime get secondDateApplication;
  @override
  int get periodicity;
  @override
  DateTime get updateDate;
  @override
  int get status;
  @override
  int get bankAccountId;
  @override
  String get bankName;
  @override
  String get bankAccountNumber;
  @override
  double get value;
  @override
  List<dynamic> get goalsChildren;
  @override
  String get imgUrl;
  @override
  String get bankAccountTypeName;

  @override
  _UserMigrationItem copyWith(
      {int id,
      int ualetAccountId,
      DateTime creationDate,
      DateTime firstDateApplication,
      DateTime secondDateApplication,
      int periodicity,
      DateTime updateDate,
      int status,
      int bankAccountId,
      String bankName,
      String bankAccountNumber,
      double value,
      List<dynamic> goalsChildren,
      String imgUrl,
      String bankAccountTypeName});
}
