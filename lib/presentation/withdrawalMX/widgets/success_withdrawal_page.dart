import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class SuccessWithdrawalPage extends HookWidget {
  final List<DashboardGoal> chosenGoals;
  final List<double> chosenValues;
  final double chosenAmmount;
  final bool withdrawalAll;
  final double withdrawalFee;
  final WithdrawalInfo info;
  final int isValidDeleteGoal;
  int countGoals = 0;

  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

  NumberFormat formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  formatedNumber(number) {
    var formatCurrency;
    formatCurrency =
    new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

    if (getIt<IEnv>().isColombia()) {
      formatCurrency = new NumberFormat.currency(
          customPattern: "\u00A4#,##0.00\u00A0",
          symbol: "\$",
          decimalDigits: 0,
          locale: "es");
    }

    return formatCurrency.format(number);
  }

  SuccessWithdrawalPage({
    @required this.chosenAmmount,
    @required this.chosenGoals,
    @required this.chosenValues,
    @required this.withdrawalAll,
    @required this.withdrawalFee,
    this.info,
    this.isValidDeleteGoal,
  });

  @override
  Widget build(BuildContext context) {
    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrency : formatCurrencyMx;
    DateTime date = DateTime.now();

    info.goals.map((element) {
      DashboardGoal goal = element;
      double value = withdrawalAll ? 0 : goal.currentAmt;
      if (value > 0) {
        countGoals = countGoals + 1;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
          text: S.of(context).continueButton,
          action: () {
            double total = 0;
            if (withdrawalAll) {
              total = chosenAmmount - withdrawalFee;
            } else {
              total = chosenAmmount - withdrawalFee;
            }
            // getIt<IFireBaseEventLogger>()
            //     .eventRetireGoalSucess({"Price": total, "Currency": "COP"});
            getIt<IAppsFlyerEventLogger>().logEvent(
                AFEvents.EVENT_RETIRE_GOAL_SUCCESS,
                {"Price": total, "Currency": "COP"});
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
                            child: Text(S.of(context).withdrawFinishText,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: RaisedButton(
                                      onPressed: () {
                                        // getIt<IFireBaseEventLogger>()
                                        //     .successfulWithdrawal();

                                        ExtendedNavigator.rootNavigator
                                            .pushNamed(
                                          Routes.transactionSummaryPageMX,
                                          arguments:
                                              TransactionSummaryPageArguments(
                                            chosenGoals: chosenGoals,
                                            chosenValues: chosenValues,
                                            chosenAmmount: chosenAmmount,
                                            withdrawalAll: withdrawalAll,
                                            withdrawalFee: withdrawalFee,
                                            withdrawalInfo: info,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        S.of(context).understand,
                                        style: AppTextStyles.normal2.copyWith(
                                            color: AppColors.whiteColor),
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
                      buttonAction: () => ExtendedNavigator.rootNavigator.pop(),
                    ),
                  );
                },
                transitionBuilder: (ctx, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                        .animate(anim1),
                    child: child,
                  );
                });
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
              top: 50),
          children: <Widget>[
            Image.asset(
              AppImages.personIconSuccess,
              height: 90,
              width: 90,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).withdrawalSuccessTitle,
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.title2.copyWith(color: AppColors.successColor),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).bankTransferAlmostDescriptionv2,
              textAlign: TextAlign.center,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
              ),
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
                        "${formatedNumber(chosenAmmount)}",
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
                            ? "-${formatedNumber(withdrawalFee)}"
                            : "-${formatedNumber(withdrawalFee)}",
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
                            ? "${formatedNumber(chosenAmmount - withdrawalFee)}"
                            : "${formatedNumber(chosenAmmount - withdrawalFee)}",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).movementsInProgress,
                        style: AppTextStyles.subtitle2
                            .copyWith(color: AppColors.g75Color),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerS,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(AppDimens.layoutSpacerM),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppDimens.dialogBorderRadius))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                !withdrawalAll
                                    ? S.of(context).withdrawal
                                    : S.of(context).withdrawalMx,
                                style: AppTextStyles.normal2
                                    .copyWith(color: AppColors.g75Color)),
                            Text("${date.day}/${date.month}/${date.year}",
                                style: AppTextStyles.normal4),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("${formatedNumber(chosenAmmount)}",
                                style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                )),
                            Text(S.of(context).myGoalMovementsAwaiting,
                                style: AppTextStyles.caption2
                                    .copyWith(color: AppColors.infoColor)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isValidDeleteGoal == 1
                          ? Text(
                              withdrawalAll
                                  ? S.of(context).withdrawalSummaryGoalsv2
                                  : S.of(context).withdrawalSummaryGoalsv2,
                              style: AppTextStyles.subtitle2
                                  .copyWith(color: AppColors.g75Color),
                            )
                          : info.goals.length > 0
                              ? countGoals > 0
                                  ? Text(
                                      "${S.of(context).goalsdeleted}",
                                      style: AppTextStyles.subtitle2
                                          .copyWith(color: AppColors.g75Color),
                                    )
                                  : Container()
                              : Container()
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerS,
                  ),
                  info.goals.length > 0 ? _goalListData(context) : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _returnDataGoal(
    DashboardGoal goal,
    double value,
    Emoji setEmoji,
    String nameEmoji,
    double newAmmount,
    double newPercentage,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius:
                  BorderRadius.circular(AppDimens.dialogBorderRadius)),
          padding: EdgeInsets.all(AppDimens.layoutMarginS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    EmojiParser().emojify(nameEmoji),
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    width: AppDimens.layoutSpacerM,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${goal.name}",
                        style: AppTextStyles.caption1
                            .copyWith(color: AppColors.g50Color),
                      ),
                      Text(
                        "${formatedNumber(goal.currentAmt.floor())}",
                        style: AppTextStyles.caption2
                            .copyWith(color: AppColors.g50Color),
                      ),
                    ],
                  ),
                ],
              ),
              isValidDeleteGoal == 1
                  ? CircularPercentIndicator(
                      radius: 54,
                      lineWidth: 6,
                      animateFromLastPercent: true,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 0.0,
                      progressColor: AppColors.primaryColor,
                      backgroundColor: AppColors.backgroundColor,
                      startAngle: 0,
                      reverse: true,
                      center: Text(
                        withdrawalAll
                            ? " 0%"
                            : "${(newPercentage * 100).toStringAsFixed(1)}%",
                        style: AppTextStyles.caption2
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
      ],
    );
  }

  Widget _goalListData(context) {
    return Container(
        child: Column(
            children: info.goals.map((element) {
      var index = info.goals.indexOf(element);
      DashboardGoal goal = element;
      double value = withdrawalAll ? 0 : goal.currentAmt;

      if (value > 0) {
        var parser = EmojiParser();
        var setEmoji = parser.info('${goal.emoji}');
        var nameEmoji = setEmoji.full;
        double newAmmount = 0;
        double newPercentage = 0;
        if (!withdrawalAll) {
          newAmmount = goal.currentAmt - value;
          newPercentage = (newAmmount / goal.goalAmt);
          if (newPercentage > 1) {
            newPercentage = 1;
          }
        }

        return _returnDataGoal(
            goal, value, setEmoji, nameEmoji, newAmmount, newPercentage);
      } else {
        return Container();
      }
    }).toList()));
  }
}
