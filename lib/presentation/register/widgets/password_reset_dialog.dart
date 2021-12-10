import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class PasswordResetDialog extends StatelessWidget {
  final VoidCallback action;
  const PasswordResetDialog({
    Key key,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
      content: Container(
        height: 190,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).passwordResetDialogTitle,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.successColor,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).passwordResetDialogDescription,
              style: AppTextStyles.normal4,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Expanded(
              child: PrimaryButton(
                text: S.of(context).continueButton,
                action: action,
              ),
            )
          ],
        ),
      ),
    );
  }
}
