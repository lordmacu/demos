import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class BankTransferWarningDialog extends StatelessWidget {
  final VoidCallback buttonAction;
  final String buttonText;

  const BankTransferWarningDialog({Key key, this.buttonAction, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      S.of(context).addAccountDialogTitle,
                      style: AppTextStyles.title2.copyWith(
                        color: AppColors.g50Color,
                      ),
                    ),
                  ),
                  Image.asset(
                    AppImages.monetizationSucess,
                    height: 34,
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).pseWarningDialogDescription1,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).pseWarningDialogDescription2,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
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
