part of 'dashboard_bloc.dart';

@freezed
abstract class DashboardState with _$DashboardState {

  const factory DashboardState.initial() = Initial;
  const factory DashboardState.loading() = LoadingInProgress;
  const factory DashboardState.loadSuccess(DashboardData data) = LoadSuccess;
  const factory DashboardState.loadFail(BaseFailure failure) = LoadFailure;


}