import 'dart:async';

import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/my_wallet/i_my_wallet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bankdelete_event.dart';
part 'bankdelete_state.dart';
part 'bankdelete_bloc.freezed.dart';

@injectable
class BankdeleteBloc extends Bloc<BankdeleteEvent, BankdeleteState> {
  final IMyWalletRepository _myWalletRepository;

  BankdeleteBloc(this._myWalletRepository);

  @override
  Stream<BankdeleteState> mapEventToState(
    BankdeleteEvent event,
  ) async* {
    yield* event.map(
      deleteBankAccount: (e) async* {
        var deleteOrFailure =
            await _myWalletRepository.deleteAccount(e.bankAccount);

        yield state.copyWith(
          deleteOrFailure: some(deleteOrFailure),
        );
      },
      resetBloc: (e) async* {
        print("entra");
        yield state.copyWith(
          deleteOrFailure: none(),
        );
      },
    );
  }

  @override
  BankdeleteState get initialState => BankdeleteState.initial();
}
