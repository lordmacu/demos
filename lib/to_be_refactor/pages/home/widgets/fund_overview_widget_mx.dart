import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/domain/dashboard/dashboard_fund.dart';
import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';

class FundOverviewWidgetMX extends StatelessWidget {
  const FundOverviewWidgetMX({
    @required this.selectedFundIndex,
    @required this.funds,
    @required this.userItem,
    @required this.onPreviousPressed,
    @required this.onNextPressed,
    this.hasArrows = true,
  });

  final int selectedFundIndex;
  final KtList<DashboardFund> funds;
  final DashboardUserItem userItem;
  final Function() onPreviousPressed;
  final Function() onNextPressed;
  final bool hasArrows;

  @override
  Widget build(BuildContext context) {
    // var formater = NumberFormaters.copFormater;
    var formater = NumberFormaters.mxFormater;
    var _media = MediaQuery.of(context).size;
    DashboardFund currentFund = funds[selectedFundIndex];
    var sum = 0.0;
    for (int i = 0; i < selectedFundIndex; i++) {
      sum += funds[i].participationPercentage;
    }
    var startAngle = 360 * (sum / 100);
    String assetType = '';
    for (var f in currentFund.assetType.asList()) {
      assetType += "${f.title}\n${f.distribution}";
      if (f != currentFund.assetType.last) assetType += "\n";
    }
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 10.0,
                  startAngle: startAngle,
                  percent: currentFund.participationPercentage / 100,
                  center: _iconCenterRobot(context),
                  // progressColor: AppColors.colorGreen,
                  progressColor: AppColors.greenColor,
                  animation: true,
                  backgroundColor: AppColors.g75Color.withOpacity(0.2),
                ),
                SizedBox(
                  width: AppDimens.layoutMarginS,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Logo & Porcentaje condicional
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: getIt<IEnv>().isColombia()
                                  ? 'https://cdn.banlinea.com/banlinea-products/SuperMarket/Ualet/Develop/founds/${currentFund.logo}'
                                  : 'https://cdn.banlinea.com/banlinea-products/SuperMarket/Ualet/Develop/founds/MX/${currentFund.logo}',
                              width: 80,
                            ),
                            _participation(userItem, currentFund),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerXs,
                      ),
                      Text(
                        currentFund.name,
                        style: AppTextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.g75Color,
                        ),
                      ),
                      //Fund balance conditional
                      SizedBox(
                        height: AppDimens.layoutSpacerXs,
                      ),
                      userItem.hasTransactions
                          ? Text(
                              '${formater.format(currentFund.balance)}',
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.g75Color,
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).titulosMX,
                            style: AppTextStyles.caption2
                                .copyWith(color: AppColors.g50Color),
                          ),
                          SizedBox(
                            width: AppDimens.layoutSpacerXs,
                          ),
                          Text(
                            "${currentFund.titulos}",
                            style: AppTextStyles.caption2
                                .copyWith(color: AppColors.g75Color),
                          ),
                        ],
                      ),
                      Text(
                        S.of(context).assetClass,
                        style: AppTextStyles.menu2.copyWith(
                          color: AppColors.successColor,
                        ),
                      ),
                      //Tipo de activo
                      Text(
                        assetType,
                        style: AppTextStyles.menu1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.g75Color,
                        ),
                        // style: TextStyle(
                        //     fontSize: 10.0, fontFamily: 'open-sans-semi-bold'),
                      ),
                      SizedBox(height: AppDimens.layoutSpacerXs),
                      //Buttons
                      hasArrows
                          ? Container(
                              width: 130,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: AppColors.backgroundColor,
                                            width: 2.5)),
                                    child: IconButton(
                                      iconSize: 24.0,
                                      onPressed: onPreviousPressed,
                                      padding: EdgeInsets.all(1.0),
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: AppColors.g50Color,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: AppColors.backgroundColor,
                                            width: 2.5)),
                                    child: IconButton(
                                      onPressed: onNextPressed,
                                      padding: EdgeInsets.all(1.0),
                                      iconSize: 24.0,
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: AppColors.g50Color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5.0),
            !hasArrows
                ? Container()
                : Text(
                    S.of(context).roboAdvisorDisclamer,
                    style: AppTextStyles.menu1.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  )
          ],
        ));
  }

  Widget _iconCenterRobot(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/roboadvisor.png',
            width: 45.0,
          ),
          Text(
            S.of(context).roboAdvisor,
            style: TextStyle(
                fontSize: 10.0,
                color: AppColors.g50Color,
                fontFamily: 'open-sans-semi-bold'),
          ),
          Text(
            "7 Fondos",
            style: TextStyle(
                fontFamily: 'open-sans-semi-bold',
                color: AppColors.g75Color,
                fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget _participation(DashboardUserItem user, DashboardFund currentFund) {
    if (user.hasTransactions) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
        decoration: BoxDecoration(
            color: AppColors.successColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: Text("${currentFund.participationPercentage}%",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 10.0,
                fontFamily: 'open-sans-semi-bold')),
      );
    }
  }
}
