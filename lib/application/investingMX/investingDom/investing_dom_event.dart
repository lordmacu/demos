part of 'investing_dom_bloc.dart';

@freezed
abstract class InvestingDomEvent with _$InvestingDomEvent {
  const factory InvestingDomEvent.inicial() = _initial;
  const factory InvestingDomEvent.getBanksList() = _getBanksList;
  const factory InvestingDomEvent.updateAccountNumber(String accountNumber) =
      _updateAccountNumber;
  const factory InvestingDomEvent.updateBank(String newBank) = _updateBank;
  const factory InvestingDomEvent.updateAccountType(String newAccountType) =
      _updateAccountType;
  const factory InvestingDomEvent.createAccount(bool isInvestment) = _createAccount;
  const factory InvestingDomEvent.getBankAccounts() = _getBankAccounts;
  const factory InvestingDomEvent.chooseAccount(BankInfo bank) =
      _chooseAccount;
}
