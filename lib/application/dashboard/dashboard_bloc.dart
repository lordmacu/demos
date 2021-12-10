import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

part 'dashboard_bloc.freezed.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IDashboardRepository _dashboardRepository;

  DashboardBloc(this._dashboardRepository);

  @override
  DashboardState get initialState => DashboardState.initial();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    // Either<BaseFailure, KtList<DashboardFund>> fOrFunds;
    // Either<BaseFailure, KtList<DashboardGoal>> fOrGoals;
    // Either<BaseFailure, DashboardUserItem> fOrUser;
    Either<BaseFailure, DashboardData> fOrData;

    yield DashboardState.loading();
    fOrData = await _dashboardRepository.getData();

    yield fOrData.fold(
      (l) => DashboardState.loadFail(l),
      (r) => DashboardState.loadSuccess(r),
    );
  }
}
