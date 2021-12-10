// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'notification_item_valid_read.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$NotificationValidRead {
  int get notificationsNotIsRead;
  int get notificationsIsRead;

  NotificationValidRead copyWith(
      {int notificationsNotIsRead, int notificationsIsRead});
}

class _$NotificationValidReadTearOff {
  const _$NotificationValidReadTearOff();

  _NotificationValidRead call(
      {@required int notificationsNotIsRead,
      @required int notificationsIsRead}) {
    return _NotificationValidRead(
      notificationsNotIsRead: notificationsNotIsRead,
      notificationsIsRead: notificationsIsRead,
    );
  }
}

const $NotificationValidRead = _$NotificationValidReadTearOff();

class _$_NotificationValidRead implements _NotificationValidRead {
  const _$_NotificationValidRead(
      {@required this.notificationsNotIsRead,
      @required this.notificationsIsRead})
      : assert(notificationsNotIsRead != null),
        assert(notificationsIsRead != null);

  @override
  final int notificationsNotIsRead;
  @override
  final int notificationsIsRead;

  @override
  String toString() {
    return 'NotificationValidRead(notificationsNotIsRead: $notificationsNotIsRead, notificationsIsRead: $notificationsIsRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationValidRead &&
            (identical(other.notificationsNotIsRead, notificationsNotIsRead) ||
                const DeepCollectionEquality().equals(
                    other.notificationsNotIsRead, notificationsNotIsRead)) &&
            (identical(other.notificationsIsRead, notificationsIsRead) ||
                const DeepCollectionEquality()
                    .equals(other.notificationsIsRead, notificationsIsRead)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notificationsNotIsRead) ^
      const DeepCollectionEquality().hash(notificationsIsRead);

  @override
  _$_NotificationValidRead copyWith({
    Object notificationsNotIsRead = freezed,
    Object notificationsIsRead = freezed,
  }) {
    return _$_NotificationValidRead(
      notificationsNotIsRead: notificationsNotIsRead == freezed
          ? this.notificationsNotIsRead
          : notificationsNotIsRead as int,
      notificationsIsRead: notificationsIsRead == freezed
          ? this.notificationsIsRead
          : notificationsIsRead as int,
    );
  }
}

abstract class _NotificationValidRead implements NotificationValidRead {
  const factory _NotificationValidRead(
      {@required int notificationsNotIsRead,
      @required int notificationsIsRead}) = _$_NotificationValidRead;

  @override
  int get notificationsNotIsRead;
  @override
  int get notificationsIsRead;

  @override
  _NotificationValidRead copyWith(
      {int notificationsNotIsRead, int notificationsIsRead});
}
