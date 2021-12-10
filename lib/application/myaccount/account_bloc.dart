import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/i_account_repository.dart';
import 'package:ualet/domain/myaccount/user_info.dart';

part 'account_event.dart';
part 'account_state.dart';

part 'account_bloc.freezed.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final IAccountRepository _accountRepository;

  AccountBloc(this._accountRepository);

  StreamSubscription<Either<BaseFailure, UserInfo>> _accountStreamSubscription;

  @override
  AccountState get initialState => AccountState.initial();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    yield* event.map(
      getUserInfo: (e) async* {
        yield const AccountState.loadInProgress();
        await _accountStreamSubscription?.cancel();

        _accountStreamSubscription =
            _accountRepository.getUserInfo().listen((userInfo) {
          return add(AccountEvent.userInfoReceived(userInfo));
        });
      },
      userInfoReceived: (e) async* {
        yield e.failureOrInfo.fold(
          (failure) => AccountState.loadFailure(failure),
          (items) => AccountState.loadSuccess(items),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _accountStreamSubscription.cancel();
    return super.close();
  }
}
