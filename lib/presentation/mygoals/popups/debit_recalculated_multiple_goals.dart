import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:intl/intl.dart';

class DebitRecalculatedMultipleGoalsPopUp extends StatelessWidget {
  final List<DashboardGoal> goals;
  final DashboardGoal primaryGoal;
  final Function acceptCallBack;
  final Function undoCallback;

  const DebitRecalculatedMultipleGoalsPopUp(
      {Key key,
      @required this.acceptCallBack,
      @required this.undoCallback,
      @required this.goals,
      @required this.primaryGoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
      content: Container(
        margin: EdgeInsets.all(0),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(AppDimens.dialogBorderRadius),
        //     ),
        //     color: AppColors.whiteColor),
        // width: MediaQuery.of(context).size.width * 1.1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _disclamer(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(S.of(context).automaticDebit,
                style: AppTextStyles.normal3.copyWith(
                  color: AppColors.g50Color,
                )),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            _buildRows(context),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Text(S.of(context).doYouWantToApplyTheChanges,
                style: AppTextStyles.normal4),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: SecondaryButton(
                      text: S.of(context).goBack, action: undoCallback),
                ),
                SizedBox(
                    // width: AppDimens.layoutHSpacerS,
                    ),
                Container(
                  // padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: PrimaryButtonSmall(
                      text: S.of(context).yesContinue, action: acceptCallBack),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            S.of(context).debitRecalculated,
            style: AppTextStyles.title2.copyWith(
              color: AppColors.g25Color,
            ),
          ),
        ),
        Icon(Icons.attach_money, color: AppColors.g25Color, size: 40),
      ],
    );
  }

  Widget _disclamer(BuildContext context) {
    return Text(S.of(context).multiGoalDebitRecalculatedSubtitle,
        style: AppTextStyles.normal4);
  }

  Widget _buildRows(BuildContext context) {
    NumberFormat formater = NumberFormaters.copFormater;
    List<Row> rows = [];
    double total = primaryGoal.fee;
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(primaryGoal.name, style: AppTextStyles.normal4),
        Text("\$${formater.format(primaryGoal.fee)}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.g50Color,
            )),
      ],
    ));
    for (var goal in goals) {
      total += goal.fee;
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(goal.name, style: AppTextStyles.normal4),
          Text("\$${formater.format(goal.fee)}",
              style: AppTextStyles.normal3.copyWith(
                color: AppColors.g50Color,
              )),
        ],
      ));
    }
    rows.add(Row(children: [
      SizedBox(
        height: AppDimens.layoutSpacerS,
      )
    ]));
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).total, style: AppTextStyles.normal4),
        Text("\$${formater.format(total)}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.g50Color,
            )),
      ],
    ));
    return Column(
      children: rows,
    );
  }

  // Widget _before(BuildContext context) {
  //   NumberFormat formater = NumberFormaters.copFormater;
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(S.of(context).before, style: AppTextStyles.normal4),
  //       Text("\$${formater.format(before)}",
  //           style: AppTextStyles.normal3.copyWith(
  //             color: AppColors.g50Color,
  //           ))
  //     ],
  //   );
  // }

  // Widget _now(BuildContext context) {
  //   NumberFormat formater = NumberFormaters.copFormater;
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(S.of(context).now, style: AppTextStyles.normal4),
  //       Text("\$${formater.format(now)}",
  //           style: AppTextStyles.normal3.copyWith(
  //             color: AppColors.successColor,
  //           ))
  //     ],
  //   );
  // }
}
