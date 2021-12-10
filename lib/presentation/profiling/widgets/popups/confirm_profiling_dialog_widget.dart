import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';

class ConfirmProfilingDialog extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final String buttonAcceptText;
  final String buttonRejectText;
  final String title;
  final String bodyDialog;

  const ConfirmProfilingDialog(
      {Key key,
      this.accept,
      this.reject,
      this.buttonAcceptText = "",
      this.buttonRejectText = "",
      this.title = "",
      this.bodyDialog = ""
      })
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
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g50Color),
                    ),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: AppColors.infoColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: bodyDialog,
                style:
                    AppTextStyles.normal1.copyWith(color: AppColors.g75Color, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Visibility(
                  visible: getIt<IEnv>().isColombia(),
                  child: Expanded(
                    child: Container(
                      height: 50,
                      child:
                          SecondaryButton(text: buttonRejectText, action: reject),
                    ),
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
