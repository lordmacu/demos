import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';
import 'package:ualet/injection.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

class AssignToGoalSuccess extends StatelessWidget {
  final DashboardGoal assignedTo;
  final DashboardGoal assignedFrom;
  final double assignedValue;
  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  AssignToGoalSuccess({
    Key key,
    @required this.assignedTo,
    @required this.assignedFrom,
    @required this.assignedValue,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    DashboardGoal newAssignTo = getAssignTo(assignedTo, assignedValue);
    DashboardGoal newAssignFrom = getAssignFrom(assignedFrom, assignedValue);

    var parser = EmojiParser();
    var setEmoji1 = parser.info(newAssignTo.emoji);
    var nameEmoji1 = setEmoji1.full;
    var setEmoji2 = parser.info(newAssignFrom.emoji);
    var nameEmoji2 = setEmoji2.full;
    String subtitle = S.of(context).assignedSuccessGoalToGoal;
    if (newAssignFrom.id == 0) {
      subtitle = S.of(context).assignedSuccessBalanceToGoal;
    }
    DateTime date = DateTime.now();
    String dateMovement = "${date.day}/${date.month}/${date.year}";
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          AppDimens.layoutMarginM,
        ),
        child: PrimaryButton(
          text: S.of(context).supportPageSuccessButton,
          action: () {
            getIt<IFireBaseEventLogger>().assignMoneyToGoalSuccess({
              "Price": "$assignedValue",
              "Currency": "COP",
              "Nombre Meta": newAssignFrom.name
            });

            ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
              Routes.homePage,
              (route) => false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(
            left: AppDimens.layoutMargin,
            right: AppDimens.layoutMargin,
            top: AppDimens.layoutSpacerL,
            bottom: AppDimens.layoutSpacerXs,
          ),
          children: [
            Image.asset(
              AppImages.personIconSuccess,
              height: 90,
              width: 90,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).assignedSuccessTitle,
              style:
                  AppTextStyles.title2.copyWith(color: AppColors.successColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutSpacerHeader,
              ),
              child: Text(
                subtitle,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            summaryContainer(context, dateMovement),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            Text(
              S.of(context).goalState,
              style: AppTextStyles.subtitle2.copyWith(
                color: AppColors.g75Color,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            assignContainer(newAssignTo, parser, nameEmoji1),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            newAssignFrom.id != 0
                ? assignContainer(newAssignFrom, parser, nameEmoji2)
                : Container(),
          ],
        ),
      ),
    );
  }

  Container summaryContainer(BuildContext context, String dateMovement) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(AppDimens.layoutSpacerM),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).assignation,
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
              Text(
                dateMovement,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.g50Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${formatedNumber(assignedValue)}",
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
                textAlign: TextAlign.end,
              ),
              Text(
                "${S.of(context).aprobada}",
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.successColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container assignContainer(
      DashboardGoal goal, EmojiParser parser, String nameEmoji) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(
        AppDimens.layoutSpacerM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                parser.emojify(nameEmoji),
                style: TextStyle(fontSize: 35.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: AppDimens.layoutSpacerS,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${goal.name}",
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.g50Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "${formatedNumber(goal.currentAmt.floor().floor())}",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g50Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CircularPercentIndicator(
            radius: 54,
            lineWidth: 5,
            animateFromLastPercent: true,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            percent: goal.percentComplete / 100,
            progressColor: AppColors.primaryColor,
            backgroundColor: AppColors.backgroundColor,
            startAngle: 0,
            reverse: true,
            center: Text(
              getGoalPercentString(goal.percentComplete),
              style: AppTextStyles.caption2.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DashboardGoal getAssignTo(DashboardGoal goal, double value) {
    double newCurrentAmmount = goal.currentAmt + value;
    DashboardGoal newGoal = goal.copyWith(
      currentAmt: newCurrentAmmount,
      percentComplete: getNewPercentage(
        goal.goalAmt,
        newCurrentAmmount,
      ),
    );

    return newGoal;
  }

  DashboardGoal getAssignFrom(DashboardGoal goal, double value) {
    double newCurrentAmmount = goal.currentAmt - value;
    DashboardGoal newGoal = goal.copyWith(
      currentAmt: newCurrentAmmount,
      percentComplete: getNewPercentage(
        goal.goalAmt,
        newCurrentAmmount,
      ),
    );

    return newGoal;
  }

  double getNewPercentage(double total, double current) {
    if (total == 0.0) {
      return 0.0;
    }
    double percent = (current / total) * 100;
    percent = double.parse(percent.toStringAsFixed(1));
    if (percent >= 100.0) {
      percent = 100.0;
    } else if (percent < 0.0) {
      percent = 0.0;
    }
    return percent;
  }

  String getGoalPercentString(double percent) {
    var percentString = "";
    if (percent >= 100.0) {
      percent = 100;
      percentString = "100%";
    } else
      percentString = " ${percent.toStringAsPrecision(2)}%";
    return percentString;
  }
}
