import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class RedirectButton extends StatelessWidget {
  final String textInf;
  final String textUnderline;
  final VoidCallback redirectUnderline;

  const RedirectButton(
      {Key key, this.textInf, this.textUnderline, this.redirectUnderline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(children: [
          TextSpan(
              text: textInf,
              style: AppTextStyles.normal4.copyWith(color: AppColors.g50Color)),
          TextSpan(
              text: textUnderline,
              recognizer: TapGestureRecognizer()..onTap = redirectUnderline,
              style: AppTextStyles.normalUnder1
                  .copyWith(color: AppColors.primaryColor))
        ]));
  }
}
