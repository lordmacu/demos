import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';

part 'investing_dom_bloc.freezed.dart';
part 'investing_dom_event.dart';
part 'investing_dom_state.dart';

@injectable
class InvestingDomBloc
    extends Bloc<InvestingDomEvent, InvestingDomState> {
  InvestingDomBloc(this._repo);

  @override
  get initialState => InvestingDomState.initial();

  final IInvestingRepository _repo;

  @override
  Stream<InvestingDomState> mapEventToState(
      InvestingDomEvent event) async* {
    yield* event.map(
        //AddBankAccount
        createAccount: (data) async* {
      var bankId = getBankId(state.selectedBank);
      var accTypeId = getAccountTypeId();

      var item = BankAccountItem(
          number: state.accountNumber.replaceAll(" ", ""),
          accountType: state.accountType,
          accountBank: state.selectedBank,
          accountImg: "",
          id: 0,
          typeId: accTypeId,
          bankId: bankId);

      var response = await _repo.addBankAccount(item, data.isInvestment);
      String error = '';
      var bankItem = BankAccountItem.empty();
      bool posted = true;
      response.fold((l) {
        posted = false;
        error = l.map(
            unexpected: (a) => "Error Inesperado",
            fromServer: (a) => a.message);
      }, (r) {
        bankItem = r;
      });

      yield state.copyWith(
        accountItem: bankItem,
        posted: posted,
        error: error,
      );
    }, getBanksList: (_) async* {
      var response = await _repo.getBanks();
      Map<int, String> lst = {};
      response.fold((l) {}, (r) {
        lst = r;
      });

      yield state.copyWith(
          error: "", banksList: lst.values.toList(), banksWithId: lst);
    }, inicial: (_) async* {
      yield state;
    }, updateAccountNumber: (data) async* {
      // print(data.newClabe);
      yield state.copyWith(
        posted: false,
        error: "",
        accountNumber: data.accountNumber,
      );
    }, updateBank: (data) async* {
      // print(data.newBank);
      yield state.copyWith(
        error: "",
        posted: false,
        selectedBank: data.newBank,
      );
    }, updateAccountType: (data) async* {
      // print(data.newAccountType);
      yield state.copyWith(
        error: "",
        posted: false,
        accountType: data.newAccountType,
      );
    }, getBankAccounts: (e) async* {
      yield state.copyWith(isSubmitting: true);

      var bankAccounts = await _repo.getBankAccounts();

      yield state.copyWith(
        error: "",
        banksFetched: true,
        isSubmitting: false,
        bankAccounts: bankAccounts,
      );
    }, chooseAccount: (e) async* {
      print("Choose Account: ${e.bank.bankAccountId}");
      if (state.bankChosen.id == e.bank.bankAccountId) {
        yield state.copyWith(
          bankChosen: BankAccountItem.empty(),
        );
      } else {
        BankAccountItem bankAccountItem = new BankAccountItem(
          number: e.bank.accountNumber,
          accountType: e.bank.accountTypeName,
          accountBank: e.bank.bankName,
          accountImg: e.bank.bankLogo,
          id: e.bank.bankAccountId,
          typeId: e.bank.accountTypeId,
          bankId: e.bank.bankId,
        );
        yield state.copyWith(
          bankChosen: bankAccountItem,
          error: "",
        );
      }
    });
  }

  bool validateAccountType() {
    return (state.accountTypes.indexOf(state.accountType) != -1);
  }

  bool validateBank() {
    return (state.banksList.indexOf(state.selectedBank) != -1);
  }

  bool isButtonActivated() {
    return (validateBank() && validateAccountType());
  }

  int getBankId(String bankName) {
    for (var bank in state.banksWithId.keys) {
      if (state.banksWithId[bank] == bankName) return bank;
    }
    return -1;
  }

  int getAccountTypeId() {
    switch (state.accountTypes.indexOf(state.accountType)) {
      case 0:
        return 1;
        break;
      case 1:
        return 2;
        break;
      case 2:
        return 40;
        break;
      default:
        return 0;
    }
  }
}
