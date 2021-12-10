import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'user_migration_item.dart';

part 'user_migration_info.freezed.dart';

@freezed
abstract class UserMigrationInfo with _$UserMigrationInfo {
  const factory UserMigrationInfo({
    @required KtList<UserMigrationItem> lstInfo,
  }) = _UserMigrationInfo;

  factory UserMigrationInfo.empty() =>
      UserMigrationInfo(lstInfo: KtList.empty());
}
