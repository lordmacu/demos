import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';
import 'package:intl/intl.dart';

class DeleteGoalDebitMultiple extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final List<DashboardGoal> goalsWithDebit;
  final DashboardGoal goalToDelete;

  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  DeleteGoalDebitMultiple({
    Key key,
    this.accept,
    this.reject,
    @required this.goalsWithDebit,
    @required this.goalToDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (int i = 0; i < goalsWithDebit.length; i++) {
      if (goalsWithDebit[i].id != goalToDelete.id) {
        total += goalsWithDebit[i].fee;
      }
    }

    goalsWithDebit.removeWhere((element) => element.id == goalToDelete.id);

    String periodicity = getPeriodicity(goalToDelete.periodicity, context);
    print(goalsWithDebit.length > 1 ? 410 : 390);
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
      content: Container(
        height: goalsWithDebit.length > 1 ? 410 : 390,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).updateDebitDialogTitle,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g50Color,
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
            Text(
              S.of(context).updateDebitDialogDescription,
              style: AppTextStyles.normal4,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Container(
              height: goalsWithDebit.length > 1 ? 60 : 30,
              width: 1000,
              child: ListView.builder(
                itemCount: goalsWithDebit.length,
                padding: EdgeInsets.all(0),
                primary: false,
                itemBuilder: (context, index) {
                  DashboardGoal goal = goalsWithDebit[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            goal.name,
                            style: AppTextStyles.normal4.copyWith(
                              color: AppColors.g75Color,
                            ),
                          ),
                          Text(
                            formatCurrency.format(goal.fee),
                            style: AppTextStyles.normal2.copyWith(
                              color: AppColors.g75Color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).total,
                  style: AppTextStyles.normal4.copyWith(
                    color: AppColors.g75Color,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      formatCurrency.format(total),
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ),
                    ),
                    Text(
                      periodicity,
                      style: AppTextStyles.caption1,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Text(
              S.of(context).updateDebitDialogQuestion,
              style: AppTextStyles.normal4,
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
                    child: SecondaryButton(
                        text: S.of(context).goalsRecalculatedButtonBack,
                        action: reject),
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutHSpacerS,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: PrimaryButtonSmall(
                        text: S.of(context).yesContinue, action: accept),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getPeriodicity(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).quincenal;
        break;
      case 2:
        return S.of(context).mensual;
        break;
      case 3:
        return S.of(context).trimestral;
        break;
      default:
        return "";
    }
  }
}
