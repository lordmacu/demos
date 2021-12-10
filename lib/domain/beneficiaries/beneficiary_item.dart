import 'package:freezed_annotation/freezed_annotation.dart';
part 'beneficiary_item.freezed.dart';

@freezed
abstract class BeneficiaryItem with _$BeneficiaryItem {
  const factory BeneficiaryItem({
    @required int id,
    @required String name,
    @required String number,
    @required double percentage,
  }) = _BeneficiaryItem;
  factory BeneficiaryItem.empty() =>
      const BeneficiaryItem(name: '', number: '', percentage: 0.0, id: -1);
  factory BeneficiaryItem.mock() => const BeneficiaryItem(
      name: 'Beneficiario', number: '5112321414', percentage: 100.0, id: -1);
}
