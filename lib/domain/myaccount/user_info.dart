import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    @required String fullName,
    String firstName,
    @required String email,
    @required String phoneNumber,
    @required SarlaftItem sarlaftItem,
    @required bool hasSarlaft,
    double balance
  }) = _UserInfo;

  factory UserInfo.empty() => UserInfo(
      email: '',
      fullName: '',
      firstName: '',
      phoneNumber: '',
      sarlaftItem: SarlaftItem.empty(),
      hasSarlaft: false,
      balance: 0);
}
