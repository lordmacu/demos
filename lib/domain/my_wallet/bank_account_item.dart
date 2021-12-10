
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_item.freezed.dart';

@freezed
abstract class BankAccountItem with _$BankAccountItem {

  const factory BankAccountItem({
    @required String number,
    @required String accountType,
    @required String accountBank,
    @required String accountImg,
    @required int id,
    @required int typeId,
    @required int bankId,
    int status,
    String stateName,
    String rfc,

  }) = _BankAccountItem;

  factory BankAccountItem.empty() => BankAccountItem(
    accountBank: '',
    accountImg: '',
    accountType: '',
    number: '',
    bankId: -1,
    id: -1,
    typeId: -1,
    status: 0,
    stateName: '',
    rfc: ''
  );

  factory BankAccountItem.mock() => BankAccountItem(
     number: "9743",
          accountType: "Cuenta de ahorros",
          accountBank: "Bancolombia",
          accountImg:
              'https://upload.wikimedia.org/wikipedia/commons/8/81/Logo_Bancolombia2.png',
              bankId: 27,
              id: 123,
              typeId: 1,
  );

}