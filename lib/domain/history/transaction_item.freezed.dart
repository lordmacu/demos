// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$TransactionItem {
  int get id;
  DateTime get createDate;
  double get value;
  int get state;
  String get type;
  String get name;
  String get nameResume;
  String get goalName;
  String get faildetail;
  int get rejectionCode;
  double get valueBalance;
  String get transactionStateName;
  String get accountNumer;

  TransactionItem copyWith(
      {int id,
      DateTime createDate,
      double value,
      int state,
      String type,
      String name,
      String nameResume,
      String goalName,
      String faildetail,
      int rejectionCode,
      double valueBalance,
      String transactionStateName,
      String accountNumer});
}

class _$TransactionItemTearOff {
  const _$TransactionItemTearOff();

  _TransactionItem call(
      {@required int id,
      @required DateTime createDate,
      @required double value,
      @required int state,
      @required String type,
      @required String name,
      @required String nameResume,
      @required String goalName,
      @required String faildetail,
      @required int rejectionCode,
      @required double valueBalance,
      @required String transactionStateName,
      String accountNumer}) {
    return _TransactionItem(
      id: id,
      createDate: createDate,
      value: value,
      state: state,
      type: type,
      name: name,
      nameResume: nameResume,
      goalName: goalName,
      faildetail: faildetail,
      rejectionCode: rejectionCode,
      valueBalance: valueBalance,
      transactionStateName: transactionStateName,
      accountNumer: accountNumer,
    );
  }
}

const $TransactionItem = _$TransactionItemTearOff();

class _$_TransactionItem implements _TransactionItem {
  const _$_TransactionItem(
      {@required this.id,
      @required this.createDate,
      @required this.value,
      @required this.state,
      @required this.type,
      @required this.name,
      @required this.nameResume,
      @required this.goalName,
      @required this.faildetail,
      @required this.rejectionCode,
      @required this.valueBalance,
      @required this.transactionStateName,
      this.accountNumer})
      : assert(id != null),
        assert(createDate != null),
        assert(value != null),
        assert(state != null),
        assert(type != null),
        assert(name != null),
        assert(nameResume != null),
        assert(goalName != null),
        assert(faildetail != null),
        assert(rejectionCode != null),
        assert(valueBalance != null),
        assert(transactionStateName != null);

  @override
  final int id;
  @override
  final DateTime createDate;
  @override
  final double value;
  @override
  final int state;
  @override
  final String type;
  @override
  final String name;
  @override
  final String nameResume;
  @override
  final String goalName;
  @override
  final String faildetail;
  @override
  final int rejectionCode;
  @override
  final double valueBalance;
  @override
  final String transactionStateName;
  @override
  final String accountNumer;

  @override
  String toString() {
    return 'TransactionItem(id: $id, createDate: $createDate, value: $value, state: $state, type: $type, name: $name, nameResume: $nameResume, goalName: $goalName, faildetail: $faildetail, rejectionCode: $rejectionCode, valueBalance: $valueBalance, transactionStateName: $transactionStateName, accountNumer: $accountNumer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.nameResume, nameResume) ||
                const DeepCollectionEquality()
                    .equals(other.nameResume, nameResume)) &&
            (identical(other.goalName, goalName) ||
                const DeepCollectionEquality()
                    .equals(other.goalName, goalName)) &&
            (identical(other.faildetail, faildetail) ||
                const DeepCollectionEquality()
                    .equals(other.faildetail, faildetail)) &&
            (identical(other.rejectionCode, rejectionCode) ||
                const DeepCollectionEquality()
                    .equals(other.rejectionCode, rejectionCode)) &&
            (identical(other.valueBalance, valueBalance) ||
                const DeepCollectionEquality()
                    .equals(other.valueBalance, valueBalance)) &&
            (identical(other.transactionStateName, transactionStateName) ||
                const DeepCollectionEquality().equals(
                    other.transactionStateName, transactionStateName)) &&
            (identical(other.accountNumer, accountNumer) ||
                const DeepCollectionEquality()
                    .equals(other.accountNumer, accountNumer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createDate) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(nameResume) ^
      const DeepCollectionEquality().hash(goalName) ^
      const DeepCollectionEquality().hash(faildetail) ^
      const DeepCollectionEquality().hash(rejectionCode) ^
      const DeepCollectionEquality().hash(valueBalance) ^
      const DeepCollectionEquality().hash(transactionStateName) ^
      const DeepCollectionEquality().hash(accountNumer);

  @override
  _$_TransactionItem copyWith({
    Object id = freezed,
    Object createDate = freezed,
    Object value = freezed,
    Object state = freezed,
    Object type = freezed,
    Object name = freezed,
    Object nameResume = freezed,
    Object goalName = freezed,
    Object faildetail = freezed,
    Object rejectionCode = freezed,
    Object valueBalance = freezed,
    Object transactionStateName = freezed,
    Object accountNumer = freezed,
  }) {
    return _$_TransactionItem(
      id: id == freezed ? this.id : id as int,
      createDate:
          createDate == freezed ? this.createDate : createDate as DateTime,
      value: value == freezed ? this.value : value as double,
      state: state == freezed ? this.state : state as int,
      type: type == freezed ? this.type : type as String,
      name: name == freezed ? this.name : name as String,
      nameResume:
          nameResume == freezed ? this.nameResume : nameResume as String,
      goalName: goalName == freezed ? this.goalName : goalName as String,
      faildetail:
          faildetail == freezed ? this.faildetail : faildetail as String,
      rejectionCode:
          rejectionCode == freezed ? this.rejectionCode : rejectionCode as int,
      valueBalance:
          valueBalance == freezed ? this.valueBalance : valueBalance as double,
      transactionStateName: transactionStateName == freezed
          ? this.transactionStateName
          : transactionStateName as String,
      accountNumer:
          accountNumer == freezed ? this.accountNumer : accountNumer as String,
    );
  }
}

abstract class _TransactionItem implements TransactionItem {
  const factory _TransactionItem(
      {@required int id,
      @required DateTime createDate,
      @required double value,
      @required int state,
      @required String type,
      @required String name,
      @required String nameResume,
      @required String goalName,
      @required String faildetail,
      @required int rejectionCode,
      @required double valueBalance,
      @required String transactionStateName,
      String accountNumer}) = _$_TransactionItem;

  @override
  int get id;
  @override
  DateTime get createDate;
  @override
  double get value;
  @override
  int get state;
  @override
  String get type;
  @override
  String get name;
  @override
  String get nameResume;
  @override
  String get goalName;
  @override
  String get faildetail;
  @override
  int get rejectionCode;
  @override
  double get valueBalance;
  @override
  String get transactionStateName;
  @override
  String get accountNumer;

  @override
  _TransactionItem copyWith(
      {int id,
      DateTime createDate,
      double value,
      int state,
      String type,
      String name,
      String nameResume,
      String goalName,
      String faildetail,
      int rejectionCode,
      double valueBalance,
      String transactionStateName,
      String accountNumer});
}
