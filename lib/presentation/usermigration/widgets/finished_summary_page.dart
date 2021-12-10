import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';

class FinishedSummaryPage extends StatelessWidget {
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  FinishedSummaryPage({
    Key key,
    @required this.goalQuincenal,
    @required this.goalMensual,
    @required this.goalTrimestral,
    @required this.goalPse,
  }) : super(key: key);

  final formater = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  @override
  Widget build(BuildContext context) {
    print(goalQuincenal);
    var parser = EmojiParser();
    var setEmojiQuincenal = parser.info(goalQuincenal.emoji);
    var nameEmojiQuincenal = setEmojiQuincenal.full;
    var setEmojiMensual = parser.info(goalMensual.emoji);
    var nameEmojiMensual = setEmojiMensual.full;
    var setEmojiTrimestral = parser.info(goalTrimestral.emoji);
    var nameEmojiTrimestral = setEmojiTrimestral.full;
    var setEmojiPSE = parser.info(goalPse.emoji);
    var nameEmojiPSE = setEmojiPSE.full;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          AppDimens.layoutMargin,
        ),
        child: PrimaryButton(
          text: S.of(context).continueButton,
          action: () {
            ExtendedNavigator.rootNavigator
                .pushReplacementNamed(Routes.homePage,
                    arguments: HomePageArguments(
                      blocked: false,
                    ));
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.layoutMargin,
            vertical: AppDimens.layoutSpacerS,
          ),
          children: [
            SizedBox(
              height: AppDimens.layoutMargin,
            ),
            Text(
              S.of(context).resumeGoals,
              style: AppTextStyles.subtitle2.copyWith(
                color: AppColors.g25Color,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutMargin,
            ),
            goalQuincenal.name != ""
                ? Container(
                    height: 275,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                            AppDimens.dialogBorderRadius)),
                    padding: EdgeInsets.only(
                      left: AppDimens.layoutMarginS,
                      right: AppDimens.layoutSpacerM,
                      top: AppDimens.layoutMarginS,
                      bottom: AppDimens.layoutMarginS,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              parser.emojify(nameEmojiQuincenal),
                              style: TextStyle(fontSize: 40.0),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: AppDimens.layoutHSpacerS,
                            ),
                            Flexible(
                              child: Text(
                                goalQuincenal.name,
                                style: AppTextStyles.subtitle2.copyWith(
                                  color: AppColors.g50Color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              S.of(context).myGoalsInvestment,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(0)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              S.of(context).myGoalsGoal,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalQuincenal.goalAmt)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              getAhorro(goalQuincenal.periodicity, context),
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalQuincenal.fee)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  S.of(context).myGoalsTimeElapsed,
                                  style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  S.of(context).myGoalsTotalTime,
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${0} meses",
                                  style: AppTextStyles.normal2.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  goalQuincenal.numMonths > 1
                                      ? "${goalQuincenal.numMonths} meses"
                                      : "${goalQuincenal.numMonths} mes",
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutMargin,
            ),
            goalMensual.name != ""
                ? Container(
                    height: 275,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                            AppDimens.dialogBorderRadius)),
                    padding: EdgeInsets.only(
                      left: AppDimens.layoutMarginS,
                      right: AppDimens.layoutSpacerM,
                      top: AppDimens.layoutMarginS,
                      bottom: AppDimens.layoutMarginS,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              parser.emojify(nameEmojiMensual),
                              style: TextStyle(fontSize: 40.0),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: AppDimens.layoutHSpacerS,
                            ),
                            Flexible(
                              child: Text(
                                goalMensual.name,
                                style: AppTextStyles.subtitle2.copyWith(
                                  color: AppColors.g50Color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              S.of(context).myGoalsInvestment,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(0)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              S.of(context).myGoalsGoal,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalMensual.goalAmt)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              getAhorro(goalMensual.periodicity, context),
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalMensual.fee)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  S.of(context).myGoalsTimeElapsed,
                                  style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  S.of(context).myGoalsTotalTime,
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${0} meses",
                                  style: AppTextStyles.normal2.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  goalMensual.numMonths > 1
                                      ? "${goalMensual.numMonths} meses"
                                      : "${goalMensual.numMonths} mes",
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutMargin,
            ),
            goalTrimestral.name != ""
                ? Container(
                    height: 275,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                            AppDimens.dialogBorderRadius)),
                    padding: EdgeInsets.only(
                      left: AppDimens.layoutMarginS,
                      right: AppDimens.layoutSpacerM,
                      top: AppDimens.layoutMarginS,
                      bottom: AppDimens.layoutMarginS,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              parser.emojify(nameEmojiTrimestral),
                              style: TextStyle(fontSize: 40.0),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: AppDimens.layoutHSpacerS,
                            ),
                            Flexible(
                              child: Text(
                                goalTrimestral.name,
                                style: AppTextStyles.subtitle2.copyWith(
                                  color: AppColors.g50Color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              S.of(context).myGoalsInvestment,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(0)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              S.of(context).myGoalsGoal,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalTrimestral.goalAmt)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              getAhorro(goalTrimestral.periodicity, context),
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalTrimestral.fee)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  S.of(context).myGoalsTimeElapsed,
                                  style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  S.of(context).myGoalsTotalTime,
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${0} meses",
                                  style: AppTextStyles.normal2.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  goalTrimestral.numMonths > 1
                                      ? "${goalTrimestral.numMonths} meses"
                                      : "${goalTrimestral.numMonths} mes",
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutMargin,
            ),
            goalPse.name != ""
                ? Container(
                    height: 275,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                            AppDimens.dialogBorderRadius)),
                    padding: EdgeInsets.only(
                      left: AppDimens.layoutMarginS,
                      right: AppDimens.layoutSpacerM,
                      top: AppDimens.layoutMarginS,
                      bottom: AppDimens.layoutMarginS,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              parser.emojify(nameEmojiPSE),
                              style: TextStyle(fontSize: 40.0),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: AppDimens.layoutHSpacerS,
                            ),
                            Flexible(
                              child: Text(
                                goalPse.name,
                                style: AppTextStyles.subtitle2.copyWith(
                                  color: AppColors.g50Color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              S.of(context).myGoalsInvestment,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(0)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              S.of(context).myGoalsGoal,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalPse.goalAmt)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                              getAhorro(goalPse.periodicity, context),
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${formater.format(goalPse.fee)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  S.of(context).myGoalsTimeElapsed,
                                  style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  S.of(context).myGoalsTotalTime,
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${0} meses",
                                  style: AppTextStyles.normal2.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  goalPse.numMonths > 1
                                      ? "${goalPse.numMonths} meses"
                                      : "${goalPse.numMonths} mes",
                                  style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  String getAhorro(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).myGoalsQuincenalSavings;
        break;
      case 2:
        return S.of(context).myGoalsMonthlySavings;
        break;
      case 3:
        return S.of(context).myGoalsTrimestralSavings;
        break;
      default:
        return "";
    }
  }
}
