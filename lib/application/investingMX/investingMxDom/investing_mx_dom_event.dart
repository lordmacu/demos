part of 'investing_mx_dom_bloc.dart';

@freezed
abstract class InvestingMxDomEvent with _$InvestingMxDomEvent {
  const factory InvestingMxDomEvent.inicial() = _initial;
  const factory InvestingMxDomEvent.getBanksList() = _getBanksList;
  const factory InvestingMxDomEvent.updateAccountNumber(String accountNumber) = _updateAccountNumber;
  const factory InvestingMxDomEvent.updateClabe(String newClabe) = _updateClabe;
  const factory InvestingMxDomEvent.updateRFC(String newRFC) = _updateRFC;
  const factory InvestingMxDomEvent.updateBank(String newBank) = _updateBank;
  const factory InvestingMxDomEvent.updateAccountType(String newAccountType) = _updateAccountType;
  const factory InvestingMxDomEvent.checkBox() = _checkBox;
  const factory InvestingMxDomEvent.createAccount(bool isInvestment) = _createAccount;
  const factory InvestingMxDomEvent.getBankAccounts() = _getBankAccounts;
  const factory InvestingMxDomEvent.chooseAccount(BankInfo bank) =
      _chooseAccount;
}