import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';

class DeleteGoalDialog extends StatelessWidget {
  final VoidCallback leftAction;
  final VoidCallback rightAction;
  final String leftText;
  final String righText;
  final String descriptionText;
  final String questionText;
  final bool hasBalance;
  const DeleteGoalDialog({
    Key key,
    this.leftAction,
    this.rightAction,
    this.leftText = "",
    this.righText = "",
    this.descriptionText = "",
    this.questionText = "",
    this.hasBalance = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
      content: Container(
        height: hasBalance ? 245 : 188,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).deleteGoal,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g50Color,
                    ),
                  ),
                ),
                Icon(
                  Icons.delete_outline,
                  color: AppColors.dangerColor,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              descriptionText,
              style: AppTextStyles.normal4,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            hasBalance
                ? Text(
                    questionText,
                    style: AppTextStyles.normal4,
                  )
                : Container(),
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
                      text: leftText,
                      action: leftAction,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutSpacerXs,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: PrimaryButtonSmall(
                      text: righText,
                      action: rightAction,
                    ),
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
