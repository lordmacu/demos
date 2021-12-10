import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_white.dart';
import 'package:ualet/presentation/core/widgets/buttons/redirect_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/redirect_button_white.dart';

class SectionBottomSheet extends StatelessWidget {
  final VoidCallback action;
  final String textButton;
  final String textInf;
  final String textUnderline;
  final VoidCallback redirectUnderline;
  final bool isValidRedirect;
  final bool isValidResendButton;
  final bool isEnabled;
  final VoidCallback actionResendButton;
  final String textResendButton;
  final bool isValidTypeButton;
  final bool isValidShowButton;

  const SectionBottomSheet(
      {Key key,
      @required this.action,
      @required this.textButton,
      this.textInf = "",
      this.textUnderline = "",
      this.redirectUnderline,
      @required this.isValidRedirect,
      this.isValidResendButton = false,
      this.actionResendButton,
      this.textResendButton,
      this.isEnabled = true,
      this.isValidTypeButton = false,
      this.isValidShowButton = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: isValidShowButton,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.layoutMarginButton,
            ),
            child: !isValidTypeButton
                ? PrimaryButton(
                    text: textButton,
                    action: action,
                    enabled: isEnabled,
                  )
                : PrimaryButtonWhite(
                    text: textButton,
                    action: action,
                    enabled: isEnabled,
                  ),
          ),
        ),
        const SizedBox(height: AppDimens.layoutSpacerM),
        isValidRedirect
            ? !isValidTypeButton
                ? RedirectButton(
                    textInf: textInf,
                    textUnderline: textUnderline,
                    redirectUnderline: redirectUnderline)
                : RedirectButtonWhite(
                    textInf: textInf,
                    textUnderline: textUnderline,
                    redirectUnderline: redirectUnderline)
            : Container(),
        isValidResendButton ? _resendButton() : Container()
      ],
    );
  }

  Widget _resendButton() {
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(children: [
          TextSpan(
              text: textResendButton,
              recognizer: TapGestureRecognizer()..onTap = actionResendButton,
              style: AppTextStyles.normalUnder1
                  .copyWith(color: AppColors.primaryColor))
        ]));
  }
}
