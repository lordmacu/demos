import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_item.freezed.dart';

@freezed
abstract class BalanceItem with _$BalanceItem {
  const factory BalanceItem({
    double balance,
    String profileName,
  }) = _BalanceItem;

  factory BalanceItem.empty() => BalanceItem(balance: 0, profileName: "");
}
