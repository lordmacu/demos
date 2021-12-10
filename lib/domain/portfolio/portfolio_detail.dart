import 'package:ualet/domain/portfolio/portfolio_description_invest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/portfolio/portfolio_investment.dart';

part 'portfolio_detail.freezed.dart';

@freezed
abstract class PortfolioDetail with _$PortfolioDetail {
  const factory PortfolioDetail(
      {@required String type,
      @required String icon,
      @required String description,
      @required KtList<PortfolioInvestment> investments,
      @required String link,
      KtList<PortfolioDescriptionInvest> descriptionInvest}) = _PortfolioDetail;

  factory PortfolioDetail.empty() => PortfolioDetail(
      type: '',
      icon: '',
      description: '',
      investments: KtList.empty(),
      link: '',
      descriptionInvest: KtList.empty());
}
