// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_migration_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$UserMigrationInfo {
  KtList<UserMigrationItem> get lstInfo;

  UserMigrationInfo copyWith({KtList<UserMigrationItem> lstInfo});
}

class _$UserMigrationInfoTearOff {
  const _$UserMigrationInfoTearOff();

  _UserMigrationInfo call({@required KtList<UserMigrationItem> lstInfo}) {
    return _UserMigrationInfo(
      lstInfo: lstInfo,
    );
  }
}

const $UserMigrationInfo = _$UserMigrationInfoTearOff();

class _$_UserMigrationInfo implements _UserMigrationInfo {
  const _$_UserMigrationInfo({@required this.lstInfo})
      : assert(lstInfo != null);

  @override
  final KtList<UserMigrationItem> lstInfo;

  @override
  String toString() {
    return 'UserMigrationInfo(lstInfo: $lstInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserMigrationInfo &&
            (identical(other.lstInfo, lstInfo) ||
                const DeepCollectionEquality().equals(other.lstInfo, lstInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lstInfo);

  @override
  _$_UserMigrationInfo copyWith({
    Object lstInfo = freezed,
  }) {
    return _$_UserMigrationInfo(
      lstInfo: lstInfo == freezed
          ? this.lstInfo
          : lstInfo as KtList<UserMigrationItem>,
    );
  }
}

abstract class _UserMigrationInfo implements UserMigrationInfo {
  const factory _UserMigrationInfo(
      {@required KtList<UserMigrationItem> lstInfo}) = _$_UserMigrationInfo;

  @override
  KtList<UserMigrationItem> get lstInfo;

  @override
  _UserMigrationInfo copyWith({KtList<UserMigrationItem> lstInfo});
}
