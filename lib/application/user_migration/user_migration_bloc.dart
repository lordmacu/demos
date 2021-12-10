import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/i_user_migration_repository.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:kt_dart/kt.dart';

part 'user_migration_state.dart';
part 'user_migration_bloc.freezed.dart';
part 'user_migration_event.dart';

@injectable
class UserMigrationBloc extends Bloc<UserMigrationEvent, UserMigrationState> {
  final IUserMigrationRepository _userMigrationRepository;

  UserMigrationBloc(this._userMigrationRepository);

  @override
  UserMigrationState get initialState => UserMigrationState.initial();

  @override
  Stream<UserMigrationState> mapEventToState(UserMigrationEvent event) async* {
    yield* event.map(
      postGoals: (_) async* {
        yield state.copyWith(
          isLoading: true,
          isPosted: true,
        );
        var result = await _userMigrationRepository.postUserMigration(state);
        yield state.copyWith(
          fOrSuccess: some(result),
          isLoading: false,
        );
      },
      getData: (e) async* {
        yield state.copyWith(isLoading: true);
        var infoOrFailure =
            await _userMigrationRepository.getUserMigrationItems();

        BalanceItem item = await _userMigrationRepository.getBalance();

        yield state.copyWith(
          isLoading: false,
          dataOrFailure: some(infoOrFailure),
          balance: item,
        );
      },
      loadData: (event) async* {
        yield state.copyWith(
          items: event.item,
          quincenales: event.item.lstInfo.filter((i) => i.periodicity == 1),
          mensuales: event.item.lstInfo.filter((i) => i.periodicity == 2),
          trimestrales: event.item.lstInfo.filter((i) => i.periodicity == 3),
        );
      },
      saveGoal: (data) async* {
        yield state.copyWith(isLoading: true);
        print("Save Goal: ");
        print(data.goal);
        if (data.isPse) {
          yield state.copyWith(
              goalPse: data.goal, pseDone: true, isLoading: true);
        } else {
          switch (data.goal.periodicity) {
            case DashboardGoal.QUINCENCAL:
              yield state.copyWith(
                goalQuincenales: data.goal,
                quincenalesDone: true,
                isLoading: false,
              );
              break;
            case DashboardGoal.MENSUAL:
              yield state.copyWith(
                goalMensuales: data.goal,
                mensualesDone: true,
                isLoading: false,
              );
              break;
            case DashboardGoal.TRIMESTRAL:
              yield state.copyWith(
                goalTrimestrales: data.goal,
                trimestralesDone: true,
                isLoading: false,
              );
              break;
            default:
          }
        }
      },
      updateIntroductoryMigrate: (data) async* {
        yield state.copyWith(
          isLoading: true
        );
        var result = await _userMigrationRepository.updateIntroductoryMigrate(data.valueParameter);
        yield state.copyWith(
          fOrSuccess: some(result),
          isLoading: false,
        );
      },
    
    );
  }

  bool nextActivated() {
    if (state.mensuales.size > 0 && !state.mensualesDone) return false;
    if (state.quincenales.size > 0 && !state.quincenalesDone) return false;
    if (state.trimestrales.size > 0 && !state.trimestralesDone) return false;
    return true;
  }
}
