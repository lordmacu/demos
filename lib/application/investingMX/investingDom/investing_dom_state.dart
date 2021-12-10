part of 'investing_dom_bloc.dart';

@freezed
abstract class InvestingDomState with _$InvestingDomState {
  const factory InvestingDomState({
    @required List<String> accountTypes,
    @required List<String> banksList,
    @required String selectedBank,
    @required String accountType,
    @required String accountNumber,
    @required String rfc,
    @required bool checkedBox,
    @required bool posted,
    @required BankAccountItem accountItem,
    @required Map<int, String> banksWithId,
    @required String error,
    bool isSubmitting,
    bool banksFetched,
    List<BankInfo> bankAccounts,
    BankAccountItem bankChosen,
  }) = _InvestingDomState;

  factory InvestingDomState.initial() => InvestingDomState(
        accountTypes: [
          'Cuenta de Ahorros',
          'Cuenta Corriente',
        ],
        banksList: [],
        selectedBank: "",
        accountType: "",
        accountNumber: "",
        rfc: "",
        checkedBox: false,
        posted: false,
        banksWithId: {},
        accountItem: BankAccountItem.empty(),
        error: '',
        isSubmitting: false,
        banksFetched: false,
        bankAccounts: [],
        bankChosen: BankAccountItem.empty(),
      );
}
