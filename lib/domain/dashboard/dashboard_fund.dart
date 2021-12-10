import 'dart:ui';

import 'package:ualet/domain/portfolio/portfolio_investment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'dashboard_fund.freezed.dart';

@freezed
abstract class DashboardFund with _$DashboardFund {
  const factory DashboardFund({
    @required String name,
    @required double participationPercentage,
    @required String logo,
    @required KtList<PortfolioInvestment>  assetType,
    @required double balance,
    @required Color color,
    @required int id,
    int titulos,
    String description
  }) = _DashboardFund;
//TODO: Agregar color de fondo
  factory DashboardFund.empty() => DashboardFund(
        assetType: KtList.empty(),
        logo: '',
        name: '',
        participationPercentage: 0.0,
        balance: 0,
        color: Color(0xff000000),
        id: -1,
        titulos: -1,
        description: ''
      );
}
