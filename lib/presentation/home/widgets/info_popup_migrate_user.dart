import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class InfoPopUpMigrateUser extends StatelessWidget {

  final VoidCallback buttonAction;
  final String title;
  final String body;
  final String buttonText;

  const InfoPopUpMigrateUser({Key key, this.buttonAction, this.buttonText, this.body, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 250,
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
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
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
