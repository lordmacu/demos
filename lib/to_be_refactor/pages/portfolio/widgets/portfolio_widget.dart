import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots_portfolio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/portfolio/portfolio_detail.dart';
import 'package:ualet/domain/portfolio/portfolio_investment.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/fundOverviewWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderPortfolioItem extends StatelessWidget {
  final DashboardData dData;
  final Widget dots;
  final int index;
  final KtList<PortfolioDetail> details;
  SliderPortfolioItem({
    @required this.dots,
    @required this.index,
    @required this.dData,
    @required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    offset: Offset(0, 4),
                    spreadRadius: 0.5,
                    blurRadius: 8.0)
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
            child: FundOverviewWidget(
              funds: dData.funds,
              onNextPressed: () => null,
              onPreviousPressed: () => null,
              selectedFundIndex: index,
              userItem: dData.user,
              hasArrows: false,
            ),
          ),
          SizedBox(height: 40.0),
          dots,
          Column(
            children: _sliderPortfolioDescription(context, details),
          ),
        ],
      ),
    );
  }

  Widget _sectionDots(DashboardData dData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < dData.funds.size; i++)
              if (i == index)
                SlideDotsPortfolio(true)
              else
                SlideDotsPortfolio(false)
          ],
        ),
      ),
    );
  }

  List<Widget> _sliderPortfolioDescription(
      BuildContext context, KtList<PortfolioDetail> details) {
    return <Widget>[
      Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                offset: Offset(0, 4),
                spreadRadius: 0.5,
                blurRadius: 8.0)
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  //Logo
                  CachedNetworkImage(
                    imageUrl: getIt<IEnv>().isColombia()
                        ? 'https://cdn.banlinea.com/banlinea-products/SuperMarket/Ualet/Develop/founds/${details[index].icon}'
                        : 'https://cdn.banlinea.com/banlinea-products/SuperMarket/Ualet/Develop/founds/MX/${details[index].icon}',
                    width: 100,
                  ),
                  SizedBox(height: AppDimens.layoutSpacerHeader),
                  Text(
                    details[index].description.split("\\n")[0],
                    style: AppTextStyles.normal2
                        .copyWith(color: AppColors.g50Color, fontSize: 16),
                  ),
                  SizedBox(height: AppDimens.layoutMarginS),
                  //Description
                  Text(
                    details[index].description,
                    style: AppTextStyles.caption1
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: AppDimens.layoutSpacerS),
                  Divider(),
                  SizedBox(height: AppDimens.layoutSpacerS),
                  SizedBox(height: AppDimens.layoutSpacerS),
                  //Investments
                  Text(
                    S.of(context).investmentTypes,
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g50Color,
                    ),
                  ),
                  SizedBox(height: AppDimens.layoutSpacerS),
                ] +
                (_investments(
                    context, details[index].investments, details[index].link))),
      )
    ];
  }

  _investments(BuildContext context, KtList<PortfolioInvestment> investments,
      String url) {
    List<Widget> wList = List();
    for (PortfolioInvestment inv in investments.iter) {
      wList.add(Row(
        children: <Widget>[
          Text(
            inv.title,
            style: AppTextStyles.caption2
                .copyWith(color: AppColors.successColor, fontSize: 15),
          ),
          SizedBox(
            width: 3.75,
          ),
          Icon(
            Icons.info_outline,
            color: AppColors.successColor,
            size: 7.5,
          )
        ],
      ));

      wList.add(Text(
        inv.distribution,
        style: AppTextStyles.menu1.copyWith(
            color: AppColors.g75Color,
            fontWeight: FontWeight.w400,
            fontSize: 13),
      ));
      wList.add(SizedBox(
        height: AppDimens.layoutSpacerS,
      ));
    }
    wList.add(SizedBox(
      height: AppDimens.layoutSpacerS,
    ));
    wList.add(Divider());
    wList.add(SizedBox(
      height: AppDimens.layoutSpacerS,
    ));
    wList.add(InkWell(
      onTap: () => _launchUrl(url),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).rulesTechSheetsProspects,
              style: AppTextStyles.normal2.copyWith(
                fontSize: 15,
                color: AppColors.g75Color,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.successColor,
            size: 25,
          )
        ],
      ),
    ));
    wList.add(SizedBox(
      height: AppDimens.layoutSpacerS,
    ));

    return wList;
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
