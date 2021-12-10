import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_taxes_not_colombia_item.freezed.dart';

@freezed
abstract class PayTaxesNotColombiaItem with _$PayTaxesNotColombiaItem {
  const factory PayTaxesNotColombiaItem({
    @required String countryId,
    @required String countryName,
    @required String name,
      String documentType,
    String parentType,
      String country,
    @required String identification,
  }) = _PayTaxesNotColombiaItem;
  
  factory PayTaxesNotColombiaItem.empty() => PayTaxesNotColombiaItem(
      countryId: '', countryName: '', name: '', identification: '', documentType: '', parentType: '', country: '');
}
