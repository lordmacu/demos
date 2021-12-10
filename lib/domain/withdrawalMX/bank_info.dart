import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_info.freezed.dart';

@freezed
abstract class BankInfo with _$BankInfo {
  const factory BankInfo({
    DateTime registrationDate,
    int status,
    @required int bankAccountId,
    @required int bankId,
    @required int accountTypeId,
    @required String accountNumber,
    @required String bankName,
    @required String stateName,
    @required String accountTypeName,
    @required String bankLogo,
    @required String rfc,
  }) = _BankInfo;

  factory BankInfo.empty() => BankInfo(
        bankAccountId: 0,
        bankId: 0,
        accountTypeId: 0,
        accountNumber: "",
        bankName: "",
        stateName: "",
        accountTypeName: "",
        bankLogo: "",
        registrationDate: DateTime.now(),
        status: 0,
        rfc: "",
      );
}
