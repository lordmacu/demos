import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';

class InvestingMultiplePopupDialog extends StatelessWidget {
  final List<DashboardGoal> newGoals;
  final List<DashboardGoal> oldGoals;
  final Function acceptCallBack;
  final Function undoCallback;

  const InvestingMultiplePopupDialog(
      {Key key,
      this.newGoals,
      this.oldGoals,
      this.acceptCallBack,
      this.undoCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
      content: Container(
        margin: EdgeInsets.all(0),
        height: newGoals.length > 1 ? 450 : 380,
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
            Container(
                height: newGoals.length > 1 ? 180 : 80,
                // child: ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: newGoals.length,
                //   itemBuilder: (context, index) {
                //     DashboardGoal oldGoal = oldGoals[index];
                //     DashboardGoal newGoal = newGoals[index];
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(oldGoal.name,
                //             style: AppTextStyles.normal3.copyWith(
                //               color: AppColors.g50Color,
                //             )),
                //         SizedBox(
                //           height: AppDimens.layoutSpacerS,
                //         ),
                //         _before(context, oldGoal),
                //         SizedBox(
                //           height: AppDimens.layoutSpacerS,
                //         ),
                //         _now(context, newGoal),
                //         SizedBox(
                //           height: AppDimens.layoutSpacerM,
                //         ),
                //       ],
                //     );
                //   },
                // ),
                child: SingleChildScrollView(
                  child: buildList(context),
                )),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(S.of(context).doYouWantToApplyTheChangesMultiple,
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

  Widget buildList(BuildContext context) {
    List<Widget> lst = [];
    for (var i = 0; i < oldGoals.length; i++) {
      DashboardGoal oldGoal = oldGoals[i];
      DashboardGoal newGoal = newGoals[i];
      lst.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(oldGoal.name,
              style: AppTextStyles.normal3.copyWith(
                color: AppColors.g50Color,
              )),
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          _before(context, oldGoal),
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          _now(context, newGoal),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
        ],
      ));
    }
    return Column(
      children: lst,
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            S.of(context).goalRecalculatedMultiple,
            style: AppTextStyles.title2.copyWith(
              color: AppColors.g25Color,
            ),
          ),
        ),
        Icon(Icons.info_outline, color: AppColors.g25Color, size: 40),
      ],
    );
  }

  Widget _disclamer(BuildContext context) {
    return Text(S.of(context).youChangedPeriodicity,
        style: AppTextStyles.normal4);
  }

  Widget _before(BuildContext context, goal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(S.of(context).before, style: AppTextStyles.normal4),
        Text("${goal.numMonths.toString()} ${S.of(context).months}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.g50Color,
            ))
      ],
    );
  }

  Widget _now(BuildContext context, goal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(S.of(context).now, style: AppTextStyles.normal4),
        Text("${goal.numMonths.toString()} ${S.of(context).months}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.successColor,
            ))
      ],
    );
  }
}
