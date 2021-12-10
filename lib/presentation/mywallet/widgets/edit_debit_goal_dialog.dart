import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';

class EditDebitGoalDialog extends StatelessWidget {
  final VoidCallback accept;
  final List<DashboardGoal> dashboardGoals;
  const EditDebitGoalDialog({
    Key key,
    @required this.accept,
    @required this.dashboardGoals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String periodicity = '';
    switch (dashboardGoals[0].periodicity) {
      case DashboardGoal.MENSUAL:
        periodicity = 'mensual';
        break;
      case DashboardGoal.QUINCENCAL:
        periodicity = 'quincenal';
        break;
      case DashboardGoal.TRIMESTRAL:
        periodicity = 'trimestral';
        break;
      default:
    }
    double height = 120.0 * dashboardGoals.length;
    if (height > 300) height = 300;
    var formatter = NumberFormaters.mxFormater;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
      content: Container(
        height: 250 + height,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "${S.of(context).debitHasGoals}$periodicity${S.of(context).debitHasGoals2}",
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: AppColors.g25Color,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Container(
              height: height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                itemCount: dashboardGoals.length,
                padding: EdgeInsets.all(0),
                primary: false,
                itemBuilder: (context, index) {
                  DashboardGoal goal = dashboardGoals[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        goal.name,
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.g50Color,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(S.of(context).cuota,
                              style: AppTextStyles.normal4),
                          Text(
                            "${formatter.format(goal.fee)}",
                            style: AppTextStyles.normal3.copyWith(
                              color: AppColors.g50Color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            S.of(context).balance,
                            style: AppTextStyles.normal4,
                          ),
                          Text(
                            "${formatter.format(goal.currentAmt)}",
                            style: AppTextStyles.normal3.copyWith(
                              color: AppColors.successColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).debitHasGoalsInstructions,
                    style: AppTextStyles.normal4,
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    child: PrimaryButtonSmall(
                        text: S.of(context).goalsRecalculatedButtonUnderstood,
                        action: accept),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
