
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_description_invest.freezed.dart';

@freezed
abstract class PortfolioDescriptionInvest with _$PortfolioDescriptionInvest {
  const factory PortfolioDescriptionInvest({
    @required String title,
    @required String subTitle,
  }) = _PortfolioDescriptionInvest;
}