import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';

class SignOutDialog extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final String buttonAcceptText;
  final String buttonRejectText;

  const SignOutDialog({
    Key key,
    this.accept,
    this.reject,
    this.buttonAcceptText = "",
    this.buttonRejectText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      S.of(context).closeSession,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g50Color),
                    ),
                  ),
                  Icon(
                    Icons.exit_to_app,
                    color: AppColors.g10Color,
                    size: 35,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).areYouSure,
              style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g50Color, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: AppDimens.layoutMargin,
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
