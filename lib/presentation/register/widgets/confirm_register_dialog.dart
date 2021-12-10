import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class ConfirmRegisterDialog extends StatelessWidget {
  final VoidCallback buttonAction;
  final String buttonText;

  const ConfirmRegisterDialog({
    Key key,
    this.buttonAction,
    this.buttonText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferenceUser = PreferenceUser();
    preferenceUser.activeRoute = null;
    preferenceUser.activeRouteParams = null;
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
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(
                      S.of(context).registerDialogTitle,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g50Color),
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: AppColors.successColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            Text(
              S.of(context).registerDialogDescription,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g50Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            PrimaryButton(
              text: buttonText,
              action: buttonAction,
            ),
          ],
        ),
      ),
    );
  }
}
