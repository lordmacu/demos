import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback leftButtonAction;
  final VoidCallback rightButtonAction;
  final String leftButtonText;
  final String rightButtonText;
  final String descriptionText;

  const DeleteAccountDialog(
      {Key key,
      this.leftButtonAction,
      this.rightButtonAction,
      this.rightButtonText = "",
      this.leftButtonText = "",
      this.descriptionText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).deleteAccountTitle,
                    style: AppTextStyles.title2
                        .copyWith(color: AppColors.g50Color),
                  ),
                  Icon(
                    Icons.delete_outline,
                    color: AppColors.errorToastColor,
                    size: 35,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: AppDimens.layoutSpacerM,
            // ),
            Expanded(
              child: Text(
                descriptionText,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // SizedBox(
            //   height: AppDimens.layoutSpacerM,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SecondaryButton(
                    action: leftButtonAction,
                    text: leftButtonText,
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutSpacerXs,
                ),
                Expanded(
                  child: PrimaryButtonSmall(
                    text: rightButtonText,
                    action: rightButtonAction,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
