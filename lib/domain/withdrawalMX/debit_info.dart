import 'package:freezed_annotation/freezed_annotation.dart';

part 'debit_info.freezed.dart';

@freezed
abstract class DebitInfo with _$DebitInfo {
  const factory DebitInfo({
    int id,
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
    String bankAccountType,
  }) = _DebitInfo;

  factory DebitInfo.empty() => DebitInfo(
        bankAccountId: 0,
        bankAccountName: "",
        bankAccountNumber: "",
        creationDate: DateTime.now(),
        firstDateApplication: DateTime.now(),
        id: -1,
        periodicity: 0,
        seconDateApplication: DateTime.now(),
        status: 1,
        ualetAccountId: 0,
        updateDate: DateTime.now(),
        value: 0.0,
        goalId: [],
        bankUrl: "",
        bankAccountType: "",
      );

  factory DebitInfo.mock() => DebitInfo(
        bankAccountId: 1,
        bankAccountName: "Banco de Colombia",
        bankAccountNumber: "1234 5678",
        creationDate: DateTime.now(),
        firstDateApplication: DateTime.now(),
        goalId: [1],
        id: 1,
        periodicity: 1,
        seconDateApplication: DateTime.now().add(Duration(days: 15)),
        status: 1,
        ualetAccountId: 1,
        updateDate: DateTime.now(),
        value: 1000000,
        bankUrl: "",
        bankAccountType: "Cuenta",
      );
}
