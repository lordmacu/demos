import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item.freezed.dart';

@freezed
abstract class TransactionItem with _$TransactionItem {
  const factory TransactionItem({
    @required int id,
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
    String accountNumer,
  }) = _TransactionItem;

  factory TransactionItem.empty() => TransactionItem(
      id: 0,
      createDate: DateTime.now(),
      value: 0,
      state: 0,
      type: "",
      name: "",
      nameResume: "",
      goalName: "",
      faildetail: "",
      rejectionCode: 0,
      valueBalance: 0,
      accountNumer:'',
      transactionStateName: "");
}
