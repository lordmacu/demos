import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/my_wallet/i_my_wallet_repository.dart';
import 'package:ualet/domain/my_wallet/my_wallet_data.dart';

part 'my_wallet_state.dart';
part 'my_wallet_bloc.freezed.dart';
part 'my_wallet_event.dart';

@injectable
class MyWalletBloc extends Bloc<MyWalletEvent, MyWalletState> {
  final IMyWalletRepository _myWalletRepository;

  MyWalletBloc(this._myWalletRepository);
  
  @override
  MyWalletState get initialState => MyWalletState.initial();

  @override
  Stream<MyWalletState> mapEventToState(MyWalletEvent event) async* {
    
    Either<BaseFailure, MyWalletData> fOrData;

    yield MyWalletState.loading();

    fOrData = await _myWalletRepository.getData();

    yield fOrData.fold(
      (l) => MyWalletState.loadFailure(l),
      (r) => MyWalletState.loadSuccess(r),
    );

  }


}