import 'package:freezed_annotation/freezed_annotation.dart';

part 'foreign_currency_item.freezed.dart';

@freezed
abstract class ForeignCurrencyItem with _$ForeignCurrencyItem {
  const factory ForeignCurrencyItem({
    @required String productName,
    @required String productType,
    @required String clientIdentification,
    @required String entity,
    @required int amount,
    @required String countryCode,
    @required String countryName,
    @required String cityCode,
    @required String currencyType,
  }) = _ForeignCurrencyItem;

  factory ForeignCurrencyItem.empty() => ForeignCurrencyItem(
      cityCode: '',
      countryName: '',
      productName: '',
      productType: '',
      clientIdentification: '',
      entity: '',
      amount: 0,
      countryCode: '',
      currencyType: '');
}
