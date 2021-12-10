import 'dart:async';

import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:intl/intl.dart';

class TransactionSummaryPage extends HookWidget {
  final List<DashboardGoal> chosenGoals;
  final List<double> chosenValues;
  final double chosenAmmount;
  final bool withdrawalAll;
  final double withdrawalFee;
  final WithdrawalInfo withdrawalInfo;
  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(decimalDigits: 2, locale: "es_Mx");
  final formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  final date = DateTime.now();

  TransactionSummaryPage({
    @required this.chosenGoals,
    @required this.chosenValues,
    @required this.chosenAmmount,
    @required this.withdrawalAll,
    @required this.withdrawalFee,
    this.withdrawalInfo,
  });

  @override
  Widget build(BuildContext context) {
    bool isColombia = getIt<IEnv>().isColombia();
    var formatCurrency = isColombia ? formatCurrencyCol : formatCurrencyMx;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
          text: S.of(context).withdrawalTransactionSummaryButton,
          action: () async {
            getIt<IFireBaseEventLogger>().withdrawalSuccess({
              "Price": chosenAmmount.toString(),
              "Currency": "COP",
            });

            Future.delayed(Duration(seconds: 3), () {
              ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                Routes.homePage,
                (route) => false,
              );
            });

            // //AppsFlyer 40
            // getIt<IAppsFlyerEventLogger>().logEvent(
            //     AFEvents.RESUMEN_RETIRAR_TRANSACCION,
            //     {"af_revenue": chosenAmmount.toString(), "af_currency": 'MXN'});
          },
          enabled: true,
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(
              left: AppDimens.layoutMargin,
              right: AppDimens.layoutMargin,
              top: AppDimens.layoutSpacerM,
              bottom: AppDimens.layoutSpacerXs),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 3),
              child: Text(
                S.of(context).withdrawalTransactionSummaryTitle,
                textAlign: TextAlign.left,
                style: AppTextStyles.title2.copyWith(
                  color: AppColors.g25Color,
                ),
              ),
            ),
            SizedBox(
              height: AppDimens.layoutMarginS,
            ),
            Text(
              S.of(context).withdrawalTransactionSummaryDescription,
              style: AppTextStyles.normal1.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.g75Color),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Container(
              height: 135,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                    BorderRadius.circular(AppDimens.dialogBorderRadius),
              ),
              padding: EdgeInsets.all(AppDimens.layoutMarginS),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        S.of(context).withdrawal,
                        style: AppTextStyles.normal1
                            .copyWith(color: AppColors.g75Color),
                      ),
                      Text(
                        "${formatCurrency.format(chosenAmmount)}",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerS,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        S.of(context).withdrawalFee,
                        style: AppTextStyles.normal1
                            .copyWith(color: AppColors.g75Color),
                      ),
                      Text(
                        withdrawalAll
                            ? "-${formatCurrency.format(withdrawalFee)}"
                            : "-${formatCurrency.format(withdrawalFee)}",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerXs,
                  ),
                  Divider(
                    color: AppColors.backgroundColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerXs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        S.of(context).withdrawTotal,
                        style: AppTextStyles.normal1
                            .copyWith(color: AppColors.g75Color),
                      ),
                      Text(
                        withdrawalAll
                            ? "${formatCurrency.format(chosenAmmount - withdrawalFee)}"
                            : "${formatCurrency.format(chosenAmmount - withdrawalFee)}",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            Text(
              S.of(context).withdrawalTransactionSummaryMovements,
              style:
                  AppTextStyles.subtitle2.copyWith(color: AppColors.g75Color),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            withdrawalAll
                ? Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.circular(AppDimens.dialogBorderRadius),
                    ),
                    padding: EdgeInsets.all(AppDimens.layoutMarginS),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              !withdrawalAll
                                  ? S.of(context).withdrawal
                                  : S.of(context).withdrawalMx,
                              style: AppTextStyles.normal2
                                  .copyWith(color: AppColors.g75Color),
                            ),
                            Text(
                              S.of(context).withdrawalTransactionSummaryAll,
                              style: AppTextStyles.caption1
                                  .copyWith(color: AppColors.g50Color),
                            ),
                            Text(
                              "${date.day}/${date.month}/${date.year}",
                              style: AppTextStyles.caption1
                                  .copyWith(color: AppColors.g50Color),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              // "${formatCurrency.format(chosenAmmount - 10)}", //TODO: CheckCountry
                              "${formatCurrency.format(chosenAmmount - withdrawalFee)}",
                              style: AppTextStyles.normal2
                                  .copyWith(color: AppColors.g75Color),
                            ),
                            Text(
                              S.of(context).pendient,
                              style: AppTextStyles.caption2
                                  .copyWith(color: AppColors.infoColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 220,
                    child: ListView.builder(
                      itemCount: chosenGoals.length,
                      primary: false,
                      itemBuilder: (context, index) {
                        DashboardGoal goal = chosenGoals[index];
                        double value = chosenValues[index];
                        return Column(
                          children: [
                            Container(
                              height: 92,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(
                                    AppDimens.dialogBorderRadius),
                              ),
                              padding: EdgeInsets.all(AppDimens.layoutMarginS),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        !withdrawalAll
                                            ? S.of(context).withdrawal
                                            : S.of(context).withdrawalMx,
                                        style: AppTextStyles.normal2.copyWith(
                                            color: AppColors.g75Color),
                                      ),
                                      Text(
                                        "${goal.name}",
                                        style: AppTextStyles.caption1.copyWith(
                                            color: AppColors.g50Color),
                                      ),
                                      Text(
                                        "${date.day}/${date.month}/${date.year}",
                                        style: AppTextStyles.caption1.copyWith(
                                            color: AppColors.g50Color),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "${formatCurrency.format(value)}",
                                        style: AppTextStyles.normal2.copyWith(
                                            color: AppColors.g75Color),
                                      ),
                                      Text(
                                        S.of(context).pendient,
                                        style: AppTextStyles.caption2.copyWith(
                                            color: AppColors.infoColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerS,
                            )
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
