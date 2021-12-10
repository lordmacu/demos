import 'package:ualet/domain/core/values.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:intl/intl.dart';

class InvestingTransactionSummaryMX extends StatelessWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingTransactionSummaryMX(
      {Key key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.multiple,
      this.goals,
      this.valuesChosen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value = 0;
    value = bankTransferValue;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMargin,
                    vertical: AppDimens.layoutMarginXS),
                children: <Widget>[
                  _title(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _subtitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _overviewContainer(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  _movimientosEnProcesoTitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _movimientoItem(context, bankTransferValue),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: PrimaryButton(
                  text: S.of(context).goalsRecalculatedButtonUnderstood,
                  enabled: true,
                  action: () {
                    if (bankTransfer) {
                      //Firebase 30
                      // getIt<IFirebaseEventLoggerMX>().speiInvestmentSummary({
                      //   "Price": bankTransferValue.toString(),
                      //   "Currency": "MXN",
                      // });
                      //AppsFlyer 30
                      getIt<IAppsFlyerEventLogger>()
                          .logEvent(AFEvents.RESUMEN_INVERSION_SPEI, {
                        "af_revenue": bankTransferValue.toString(),
                        "af_currency": "MXN",
                      });


                    } else {
                      //Firebase 25
                      // getIt<IFirebaseEventLoggerMX>()
                      //     .domiciliacionInvestmentSummary({
                      //   "Price": goal.goalBalance.toString(),
                      //   "Currency": "MXN",
                      //   "periodicidad": goal.periodicity.toString()
                      // });


                      //AppsFlyer 25
                      getIt<IAppsFlyerEventLogger>()
                          .logEvent(AFEvents.RESUMEN_INVERSION_DOMICILIACION, {
                        "af_revenue": goal.goalBalance.toString(),
                        "af_currency": "MXN",
                        "af_periodicidad": goal.periodicity.toString()
                      });
                    }
                    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                        Routes.homePage, (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      S.of(context).transactionSummary,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
    );
  }

  Widget _subtitle(BuildContext context) {
    return Text(
      bankTransfer
          ? S.of(context).bankTransferSummaryDescription
          : S.of(context).transactionSummarySubtitle,
      style: AppTextStyles.normal4,
      textAlign: TextAlign.left,
    );
  }

  Widget _overviewContainer(BuildContext context) {
    NumberFormat mxFormatter = NumberFormaters.mxFormater;
    String fee = mxFormatter.format(bankTransferValue);
    String total = mxFormatter.format(bankTransferValue + Values.bankTransferCost);
    return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.dialogBorderRadius))),
        padding: EdgeInsets.all(AppDimens.layoutMargin),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).yourInvestment,
                    style: AppTextStyles.normal4),
                Text("$fee",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).bankFee, style: AppTextStyles.normal4),
                Text("\$10.00",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(S.of(context).total, style: AppTextStyles.normal4),
                  Text("$total",
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ))
                ]),
          ],
        ));
  }

  Widget _movimientosEnProcesoTitle(BuildContext context) {
    return Text(S.of(context).movementsInProgress,
        style: AppTextStyles.subtitle2.copyWith(
          color: AppColors.g75Color,
        ));
  }

  Widget _movimientoItem(BuildContext context, double value) {
    NumberFormat mxFormatter = NumberFormaters.mxFormater;
    DateTime date = DateTime.now();
    return Container(
      padding: EdgeInsets.all(AppDimens.layoutSpacerM),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  bankTransfer
                      ? S.of(context).bankTransferMovement
                      : "Domiciliación",
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.g75Color)),
              Text(goal.name, style: AppTextStyles.normal4),
              Text("${date.day}/${date.month}/${date.year}",
                  style: AppTextStyles.normal4),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                  bankTransfer
                      ? "${mxFormatter.format(bankTransferValue + Values.bankTransferCost)}"
                      : "${mxFormatter.format(bankTransferValue + Values.domiciliacionCost)}",
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.g75Color)),
              Text(S.of(context).myGoalMovementsAwaiting,
                  style: AppTextStyles.caption2
                      .copyWith(color: AppColors.infoColor)),
            ],
          )
        ],
      ),
    );
  }
}
