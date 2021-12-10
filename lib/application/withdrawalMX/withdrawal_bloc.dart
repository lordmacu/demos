import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/domain/withdrawalMX/value_objects.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/domain/withdrawalMx/bank_info.dart';

part 'withdrawal_event.dart';
part 'withdrawal_state.dart';

part 'withdrawal_bloc.freezed.dart';

@injectable
class WithdrawalBloc extends Bloc<WithdrawalEvent, WithdrawalState> {
  final IWithdrawalRepository _withdrawalRepository;

  WithdrawalBloc(this._withdrawalRepository);

  StreamSubscription<Either<BaseFailure, WithdrawalInfo>>
      _withdrawalStreamSubscription;

  StreamSubscription<Either<BaseFailure, List<DashboardGoal>>>
      _listSimulationGoals;

  @override
  Stream<WithdrawalState> mapEventToState(
    WithdrawalEvent event,
  ) async* {
    yield* event.map(
      getItems: (e) async* {
        yield const WithdrawalState.loadInProgress();
        await _withdrawalStreamSubscription?.cancel();

        Either<BaseFailure, List<DashboardGoal>> fOrData;

        //  fOrData = await _withdrawalRepository.getsimulation(100000.0, 23260);

        _withdrawalStreamSubscription =
            _withdrawalRepository.getInfo(e.needsBankInfo).listen(
          (info) {
            return add(WithdrawalEvent.withdrawalInfoReceived(info));
          },
        );
      },
      getSimulation: (e) async* {
        yield const WithdrawalState.loadInProgress();
        await _listSimulationGoals?.cancel();
        Either<BaseFailure, List<DashboardGoal>> fOrData;

        // // fOrData =
        // //     await _withdrawalRepository.getSimulation(e.value);

        // /*  yield fOrData.fold(
        //   (error) => WithdrawalState.loadFailure(error),
        //   (success) => WithdrawalState.loadSuccessSimulation(success),
        // );*/
      },
      withdrawalInfoReceived: (e) async* {
        yield e.failureOrInfo.fold(
          (failure) => WithdrawalState.loadFailure(failure),
          (items) => WithdrawalState.loadSuccess(
            items,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _withdrawalStreamSubscription.cancel();
    return super.close();
  }

  @override
  WithdrawalState get initialState => WithdrawalState.initial();
}
