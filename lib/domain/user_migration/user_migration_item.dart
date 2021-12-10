import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_migration_item.freezed.dart';

@freezed
abstract class UserMigrationItem with _$UserMigrationItem {
  const factory UserMigrationItem({
    @required int id,
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
    List goalsChildren,
    String imgUrl,
    String bankAccountTypeName,
  }) = _UserMigrationItem;

  factory UserMigrationItem.empty() => UserMigrationItem(
        id: 0,
        ualetAccountId: 0,
        creationDate: DateTime.now(),
        firstDateApplication: DateTime.now(),
        secondDateApplication: DateTime.now(),
        periodicity: 0,
        updateDate: DateTime.now(),
        status: 0,
        bankAccountId: 0,
        bankName: '',
        bankAccountNumber: '',
        value: 0,
        goalsChildren: [],
        imgUrl: "",
        bankAccountTypeName: "Cuenta de",
      );
}
