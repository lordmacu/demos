part of 'portfolio_bloc.dart';

@freezed
abstract class PortfolioState with _$PortfolioState {

  const factory PortfolioState.initial() = Initial;
  const factory PortfolioState.loading() = Loading;
  const factory PortfolioState.loadSuccess(KtList<PortfolioDetail> details) = LoadSuccess;
  const factory PortfolioState.loadFailure(BaseFailure failure) = LoadFailure;
}