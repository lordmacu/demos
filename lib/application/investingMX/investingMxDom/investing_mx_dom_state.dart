part of 'investing_mx_dom_bloc.dart';

@freezed
abstract class InvestingMxDomState with _$InvestingMxDomState {
  const factory InvestingMxDomState({
    @required List<String> accountTypes,
    @required List<String> banksList,
    @required String selectedBank,
    @required String accountType,
    @required String accountNumber,
    @required String clabe,
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
  }) = _InvestingMxDomState;

  factory InvestingMxDomState.initial() => InvestingMxDomState(
        accountTypes: getIt<IEnv>().isColombia()
            ? [
                'Cuenta de Ahorros',
                'Cuenta Corriente',
              ]
            : ['Cuenta CLABE (Clave Bancaria Estandarizada)'],
        banksList: [],
        selectedBank: "",
        accountType: "",
        accountNumber: "",
        clabe: "",
        rfc: "",
        checkedBox: false,
        posted: false,
        banksWithId: {},
        accountItem: BankAccountItem.empty(),
        error: '',
        isSubmitting: false,
        bankChosen: BankAccountItem.empty(),
      );
}
