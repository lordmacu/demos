// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'notification_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$NotificationItem {
  int get id;
  String get name;
  DateTime get date;
  double get value;
  int get transactionTypeId;
  int get transactionStateId;
  String get transactionStateName;
  int get transactionStateMoney;
  String get description;

  NotificationItem copyWith(
      {int id,
      String name,
      DateTime date,
      double value,
      int transactionTypeId,
      int transactionStateId,
      String transactionStateName,
      int transactionStateMoney,
      String description});
}

class _$NotificationItemTearOff {
  const _$NotificationItemTearOff();

  _NotificationItem call(
      {@required int id,
      @required String name,
      @required DateTime date,
      @required double value,
      @required int transactionTypeId,
      @required int transactionStateId,
      @required String transactionStateName,
      @required int transactionStateMoney,
      String description}) {
    return _NotificationItem(
      id: id,
      name: name,
      date: date,
      value: value,
      transactionTypeId: transactionTypeId,
      transactionStateId: transactionStateId,
      transactionStateName: transactionStateName,
      transactionStateMoney: transactionStateMoney,
      description: description,
    );
  }
}

const $NotificationItem = _$NotificationItemTearOff();

class _$_NotificationItem implements _NotificationItem {
  const _$_NotificationItem(
      {@required this.id,
      @required this.name,
      @required this.date,
      @required this.value,
      @required this.transactionTypeId,
      @required this.transactionStateId,
      @required this.transactionStateName,
      @required this.transactionStateMoney,
      this.description})
      : assert(id != null),
        assert(name != null),
        assert(date != null),
        assert(value != null),
        assert(transactionTypeId != null),
        assert(transactionStateId != null),
        assert(transactionStateName != null),
        assert(transactionStateMoney != null);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime date;
  @override
  final double value;
  @override
  final int transactionTypeId;
  @override
  final int transactionStateId;
  @override
  final String transactionStateName;
  @override
  final int transactionStateMoney;
  @override
  final String description;

  @override
  String toString() {
    return 'NotificationItem(id: $id, name: $name, date: $date, value: $value, transactionTypeId: $transactionTypeId, transactionStateId: $transactionStateId, transactionStateName: $transactionStateName, transactionStateMoney: $transactionStateMoney, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionTypeId, transactionTypeId)) &&
            (identical(other.transactionStateId, transactionStateId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionStateId, transactionStateId)) &&
            (identical(other.transactionStateName, transactionStateName) ||
                const DeepCollectionEquality().equals(
                    other.transactionStateName, transactionStateName)) &&
            (identical(other.transactionStateMoney, transactionStateMoney) ||
                const DeepCollectionEquality().equals(
                    other.transactionStateMoney, transactionStateMoney)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(transactionTypeId) ^
      const DeepCollectionEquality().hash(transactionStateId) ^
      const DeepCollectionEquality().hash(transactionStateName) ^
      const DeepCollectionEquality().hash(transactionStateMoney) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$_NotificationItem copyWith({
    Object id = freezed,
    Object name = freezed,
    Object date = freezed,
    Object value = freezed,
    Object transactionTypeId = freezed,
    Object transactionStateId = freezed,
    Object transactionStateName = freezed,
    Object transactionStateMoney = freezed,
    Object description = freezed,
  }) {
    return _$_NotificationItem(
      id: id == freezed ? this.id : id as int,
      name: name == freezed ? this.name : name as String,
      date: date == freezed ? this.date : date as DateTime,
      value: value == freezed ? this.value : value as double,
      transactionTypeId: transactionTypeId == freezed
          ? this.transactionTypeId
          : transactionTypeId as int,
      transactionStateId: transactionStateId == freezed
          ? this.transactionStateId
          : transactionStateId as int,
      transactionStateName: transactionStateName == freezed
          ? this.transactionStateName
          : transactionStateName as String,
      transactionStateMoney: transactionStateMoney == freezed
          ? this.transactionStateMoney
          : transactionStateMoney as int,
      description:
          description == freezed ? this.description : description as String,
    );
  }
}

abstract class _NotificationItem implements NotificationItem {
  const factory _NotificationItem(
      {@required int id,
      @required String name,
      @required DateTime date,
      @required double value,
      @required int transactionTypeId,
      @required int transactionStateId,
      @required String transactionStateName,
      @required int transactionStateMoney,
      String description}) = _$_NotificationItem;

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get date;
  @override
  double get value;
  @override
  int get transactionTypeId;
  @override
  int get transactionStateId;
  @override
  String get transactionStateName;
  @override
  int get transactionStateMoney;
  @override
  String get description;

  @override
  _NotificationItem copyWith(
      {int id,
      String name,
      DateTime date,
      double value,
      int transactionTypeId,
      int transactionStateId,
      String transactionStateName,
      int transactionStateMoney,
      String description});
}
