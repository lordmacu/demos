import 'dart:async';

import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
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

class InvestingTransactionSummary extends StatelessWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingTransactionSummary({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.multiple = false,
    this.goals,
    this.valuesChosen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          ExtendedNavigator.rootNavigator
                              .pushNamedAndRemoveUntil(
                                  Routes.homePage, (route) => false);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.primaryColor,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
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
                  multiple
                      ? Container(
                          height: 220,
                          child: ListView.builder(
                            itemCount: goals.length,
                            primary: false,
                            itemBuilder: (context, index) {
                              DashboardGoal goal = goals[index];
                              double value = valuesChosen[index];
                              return Column(
                                children: [
                                  _movimientoItem(
                                    context,
                                    goal,
                                    value,
                                  ),
                                  SizedBox(
                                    height: AppDimens.layoutSpacerS,
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      : _movimientoItem(context, goal, 0),
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
                    text: S.of(context).withdrawalTransactionSummaryButton,
                    enabled: true,
                    action: () async {
                      showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          barrierDismissible: true,
                          barrierLabel: "Label",
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder: (ctx, anim1, anim2) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomDialogExtend(
                                description: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                          S
                                              .of(context)
                                              .pseWarningDialogDescription1,
                                          style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g75Color,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                    Container(
                                      child: Text(
                                          S
                                              .of(context)
                                              .pseWarningDialogDescription2,
                                          style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g75Color,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      margin: EdgeInsets.only(top: 20),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
/*                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: SecondaryButton(
                                                text: S.of(context).goBack,
                                                action: () {
                                                  ExtendedNavigator
                                                      .rootNavigator
                                                      .pop();
                                                },
                                              ),
                                            ),
                                          ),*/
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: RaisedButton(
                                                onPressed: () {
                                                  ExtendedNavigator
                                                      .rootNavigator
                                                      .pushNamedAndRemoveUntil(
                                                    Routes.homePage,
                                                    (route) => route.isFirst,
                                                  );
                                                },
                                                child: Text(
                                                  S.of(context).understand,
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .whiteColor),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                icon: Image.asset(
                                  AppImages.monetizationSucess,
                                  height: 30,
                                ),
                                iconColor: AppColors.successColor,
                                title: S.of(context).remember,
                                buttonAction: () =>
                                    ExtendedNavigator.rootNavigator.pop(),
                              ),
                            );
                          },
                          transitionBuilder: (ctx, anim1, anim2, child) {
                            return SlideTransition(
                              position: Tween(
                                      begin: Offset(0, 1), end: Offset(0, 0.32))
                                  .animate(anim1),
                              child: child,
                            );
                          });

                      //PSE = true
                      if (bankTransfer) {
                        await getIt<IFireBaseEventLogger>()
                            .investmentPseResume({
                          "Price": bankTransferValue.toString(),
                          "Currency": "COP",
                        });

                        await getIt<IAppsFlyerEventLogger>()
                            .logEvent(AFEvents.RESUMEN_INVERSION_PSE, {});

                        //AppsFlyer 28
                        await getIt<IAppsFlyerEventLogger>().logEvent(
                            AFEvents.RESUMEN_INVERSION_PSE, {
                          "af_revenue": bankTransferValue.toString(),
                          "af_currency": 'MXN'
                        });
                      } else {
                        double value;
                        if (multiple) {
                          value = valuesChosen.fold(0, (i, j) => i + j);
                        } else {
                          value = goal.fee;
                        }
                        //Firebase 24
                        // await getIt<IFireBaseEventLogger>().debitInvestSummary({
                        //   "Price": value.toString(),
                        //   "Currency": "MXN",
                        //   "periodicidad": goal.periodicity.toString()
                        // });

                        //AppsFlyer 24
                        await getIt<IAppsFlyerEventLogger>()
                            .logEvent(AFEvents.RESUMEN_INVERSION_DEBITO, {
                          "af_revenue": value.toString(),
                          "af_currency": 'MXN',
                          "periodicidad": goal.periodicity.toString()
                        });
                      }
                    }),
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
          ? S.of(context).pseSummaryDescription
          : S.of(context).transactionSummarySubtitleCo,
      style: AppTextStyles.normal4,
      textAlign: TextAlign.left,
    );
  }

  Widget _overviewContainer(BuildContext context) {
    final coFormatter = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es");
    String fee = "";
    String total = "";
    if (multiple) {
      fee = coFormatter.format(valuesChosen.fold(0, (i, j) => i + j));
      total = coFormatter.format(
          valuesChosen.fold(0, (i, j) => i + j) + (bankTransfer ? 1600 : 950));
    } else {
      fee = bankTransfer
          ? coFormatter.format(bankTransferValue)
          : coFormatter.format(goal.fee);
      total = bankTransfer
          ? coFormatter.format(bankTransferValue + (bankTransfer ? 1600 : 950))
          : coFormatter.format(goal.fee + (bankTransfer ? 1600 : 950));
    }

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
                Text(S.of(context).withdrawalFee, style: AppTextStyles.normal4),
                Text(bankTransfer ? "\$1.600" : "\$950",
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

  Widget _movimientoItem(
      BuildContext context, DashboardGoal goal, double value) {
    final coFormatter = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es");
    DateTime date = DateTime.now();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
                      ? S.of(context).bankTransferPSEDialogTitle
                      : S.of(context).automaticDebit,
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.g75Color)),
              goal != null
                  ? Text(goal.name, style: AppTextStyles.normal4)
                  : Container(),
              Text("${date.day}/${date.month}/${date.year}",
                  style: AppTextStyles.normal4),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              multiple
                  ? Text("${coFormatter.format(value)}",
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ))
                  : Text(
                      bankTransfer
                          ? "${coFormatter.format(bankTransferValue + (bankTransfer ? 1600 : 950))}"
                          : "${coFormatter.format(goal.fee + (bankTransfer ? 1600 : 950))}",
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
