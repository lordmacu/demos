import 'package:freezed_annotation/freezed_annotation.dart';

part 'profitability_item.freezed.dart';

@freezed
abstract class ProfitabilityItem with _$ProfitabilityItem {
  const factory ProfitabilityItem({
    String name,
    double value,
    bool isPositive,
  }) = _ProfitabilityItem;

  factory ProfitabilityItem.empty() => ProfitabilityItem(
        name: "",
        isPositive: false,
        value: 0.0,
      );
}
