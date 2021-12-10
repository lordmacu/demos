import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class ValidTransactionPopUp extends StatelessWidget {
  final VoidCallback buttonAction;
  final String title;
  final String body;
  final String buttonText;
  final String subTitlePopUp;

  const ValidTransactionPopUp(
      {Key key,
      this.buttonAction,
      this.buttonText,
      this.body,
      this.title,
      this.subTitlePopUp = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.title2
                        .copyWith(color: AppColors.g50Color),
                  ),
                ),
                Icon(
                  Icons.mobile_screen_share,
                  color: AppColors.successColor,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Visibility(
                child: Text(
                  subTitlePopUp,
                  style:
                      AppTextStyles.normal1.copyWith(color: AppColors.g50Color),
                ),
                visible: subTitlePopUp != ''),
            Visibility(
              visible: subTitlePopUp != '',
              child: SizedBox(
                height: AppDimens.layoutSpacerS,
              ),
            ),
            Text(
              body,
              style: AppTextStyles.normal1.copyWith(color: AppColors.g50Color),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            PrimaryButton(text: buttonText, action: buttonAction),
          ],
        ),
      ),
    );
  }
}
