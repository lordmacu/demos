import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class EvidenteErrorDialog extends StatelessWidget {
  final VoidCallback buttonAction;
  final String buttonText;
  final String title;
  final String subtitle;

  const EvidenteErrorDialog({
    Key key,
    this.buttonAction,
    this.buttonText = "",
    this.title = "",
    this.subtitle = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 210,
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
                    Icons.highlight_off,
                    color: AppColors.dangerColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Text(
              subtitle,
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
