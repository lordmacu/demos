import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';

class RecalculatedGoalsDialog extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final List<int> newMonths;
  final List<DashboardGoal> dashboardGoals;
  const RecalculatedGoalsDialog({
    Key key,
    this.accept,
    this.reject,
    @required this.newMonths,
    @required this.dashboardGoals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        content: Container(
          height: 360,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      S.of(context).goalsRecalculated,
                      style: AppTextStyles.title2.copyWith(
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
              Text(
                S.of(context).youChangedPeriodicity,
                style: AppTextStyles.normal4,
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Container(
                height: 160,
                width: 500,
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
                          style: AppTextStyles.normal3.copyWith(
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
                            Text(S.of(context).before,
                                style: AppTextStyles.normal4),
                            Text(
                              "${goal.numMonths} ${S.of(context).months}",
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
                              S.of(context).now,
                              style: AppTextStyles.normal4,
                            ),
                            Text(
                              "${newMonths[index]} ${S.of(context).months}",
                              style: AppTextStyles.normal3.copyWith(
                                color: AppColors.successColor,
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
                          text: S.of(context).goalsRecalculatedButtonUnderstood,
                          action: accept),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
