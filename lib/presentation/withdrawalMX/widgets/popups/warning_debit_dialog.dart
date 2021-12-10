import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';

class WarningDebitDialog extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final String buttonAcceptText;
  final String buttonRejectText;
  final String goalNames;
  final bool multiple;

  const WarningDebitDialog(
      {Key key,
      this.accept,
      this.reject,
      this.buttonAcceptText = "Eliminar débitos",
      this.buttonRejectText = "Mantener débitos",
      this.goalNames = "",
      this.multiple = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List description = multiple
        ? S.of(context).withdrawalDialogMultiple.split("name")
        : S.of(context).withdrawalDialogSingle.split("name");
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
                    S.of(context).withdrawalGoalsDeleteTitle,
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
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                S.of(context).deletedebitstext,
                style:
                    AppTextStyles.normal1.copyWith(color: AppColors.g50Color),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    child:
                        SecondaryButton(text: buttonRejectText, action: reject),
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutHSpacerS,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: PrimaryButtonSmall(
                        text: buttonAcceptText, action: accept),
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
