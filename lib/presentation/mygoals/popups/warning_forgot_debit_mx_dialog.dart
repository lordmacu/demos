import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class WarningForgotDebitDialogMX extends StatelessWidget {
  final VoidCallback buttonAction;
  final String buttonText;
  final String goalNames;

  const WarningForgotDebitDialogMX({
    Key key,
    this.buttonAction,
    this.buttonText = "",
    this.goalNames = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List description = S.of(context).forgotDebitDialogDescription.split("name");
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 300,
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
                  Expanded(
                    child: Text(
                      S.of(context).forgotDebitDialogTitle,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g50Color),
                    ),
                  ),
                  Icon(
                    Icons.account_balance,
                    color: AppColors.successColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: description[0],
                style:
                    AppTextStyles.normal1.copyWith(color: AppColors.g50Color),
                children: [
                  TextSpan(
                    text: goalNames,
                    style: AppTextStyles.normal1.copyWith(
                        color: AppColors.g50Color, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: description[1],
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).forgotDebitDialogQuestion,
              style: AppTextStyles.normal1.copyWith(color: AppColors.g50Color),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            PrimaryButton(text: buttonText, action: buttonAction)
          ],
        ),
      ),
    );
  }
}
