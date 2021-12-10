part of 'portfolio_bloc.dart';

@freezed
abstract class PortfolioEvent with _$PortfolioEvent {
  const factory PortfolioEvent.getInformation() = _getInformation;
}