
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_investment.freezed.dart';

@freezed
abstract class PortfolioInvestment with _$PortfolioInvestment {
  const factory PortfolioInvestment({
    @required String title,
    @required String distribution,
  }) = _PortfolioInvestment;
}