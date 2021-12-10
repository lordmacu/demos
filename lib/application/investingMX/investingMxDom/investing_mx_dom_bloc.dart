import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';

part 'investing_mx_dom_bloc.freezed.dart';
part 'investing_mx_dom_event.dart';
part 'investing_mx_dom_state.dart';

@injectable
class InvestingMxDomBloc
    extends Bloc<InvestingMxDomEvent, InvestingMxDomState> {
  InvestingMxDomBloc(this._repo);

  @override
  get initialState => InvestingMxDomState.initial();

  final IInvestingRepositoryMx _repo;

  @override
  Stream<InvestingMxDomState> mapEventToState(
      InvestingMxDomEvent event) async* {
    yield* event.map(getBankAccounts: (e) async* {
      yield state.copyWith(isSubmitting: true);
      var bankAccounts = await _repo.getBankAccounts();

      yield state.copyWith(
          banksFetched: true,
          isSubmitting: false,
          bankAccounts: bankAccounts,
          error: '');
    }, chooseAccount: (e) async* {
      BankAccountItem bankAccountItem = new BankAccountItem(
        number: e.bank.accountNumber,
        accountType: e.bank.accountTypeName,
        accountBank: e.bank.bankName,
        accountImg: e.bank.bankLogo,
        id: e.bank.bankAccountId,
        typeId: e.bank.accountTypeId,
        bankId: e.bank.bankId,
      );
      yield state.copyWith(bankChosen: bankAccountItem, error: '');
    },
        //AddBankAccount
        createAccount: (_) async* {
      var bankId = getBankId(state.selectedBank);
      var accTypeId = getAccountTypeId();

      var item = BankAccountItem(
          number: getIt<IEnv>().isColombia() ? state.accountNumber.replaceAll(" ", "") : state.clabe.replaceAll(" ", ""),
          accountType: state.accountType,
          accountBank: state.selectedBank,
          accountImg: "",
          rfc: state.rfc,
          id: 0,
          typeId: accTypeId,
          bankId: bankId);

      var response = await _repo.addBankAccount(item, true);
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
      print("ADD ACCOUNT");
      print(bankItem);
      print(posted);
      print(error);

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

      yield state.copyWith(banksList: lst.values.toList(), banksWithId: lst);
    }, updateAccountNumber: (data) async* {
      // print(data.newClabe);
      yield state.copyWith(
        posted: false,
        error: "",
        accountNumber: data.accountNumber,
      );
    }, checkBox: (_) async* {
      // print(state.banksList);
      yield state.copyWith(
          checkedBox: !state.checkedBox, posted: false, error: '');
    }, inicial: (_) async* {
      yield state;
    }, updateClabe: (data) async* {
      // print(data.newClabe);
      yield state.copyWith(
        posted: false,
        error: '',
        clabe: data.newClabe,
      );
    }, updateRFC: (data) async* {
      print(data.newRFC);
      yield state.copyWith(posted: false, rfc: data.newRFC, error: '');
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
    });
  }

  bool validateClabe() {
    Pattern pattern = r'[0-9]{18}';
    String cleaned = state.clabe.replaceAll(" ", "");
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(cleaned);
  }

  bool validateRFC() {
    Pattern pattern = r'[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]';
    String cleaned = state.rfc;
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(cleaned) && cleaned.length == 13);
  }

  bool validateAccountType() {
    return (state.accountTypes.indexOf(state.accountType) != -1);
  }

  bool validateBank() {
    return (state.banksList.indexOf(state.selectedBank) != -1);
  }

  bool validateAccountNumber() {
    return (state.accountNumber != "");
  }

  bool isButtonActivated() {
    return getIt<IEnv>().isColombia()
        ? (validateBank() && validateAccountType())
        : (validateClabe() &&
            validateRFC() &&
            validateBank() &&
            validateAccountType() &&
            state.checkedBox);
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
        return 3;
        break;
      case 2:
        return 40;
        break;
      default:
        return 0;
    }
  }
}
