import 'package:freezed_annotation/freezed_annotation.dart';

part 'Extract_item.freezed.dart';

@freezed
abstract class ExtractItem with _$ExtractItem {
  const factory ExtractItem({
    int month,
    String monthName,
    @required int year,
    @required int order,
    bool generated,
  }) = _ExtractItem;

  factory ExtractItem.empty() =>
      ExtractItem(month: 0, monthName: '', year: 0, order: 0, generated: false);
}
