part of 'beneficiaries_bloc.dart';

@freezed
abstract class BeneficiariesEvent with _$BeneficiariesEvent {
  const factory BeneficiariesEvent.addBeneficiary() = _addBeneficiary;
  const factory BeneficiariesEvent.getBeneficiaries() = _getBeneficiaries;
  const factory BeneficiariesEvent.editBeneficiary(
      int index, BeneficiaryItem newItem) = _editBeneficiarie;
  const factory BeneficiariesEvent.removeBeneficiary(int index) =
      _removeBeneficiary;
  const factory BeneficiariesEvent.postBeneficiaries() = _postBeneficiaries;
}
