import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';

class CustomButtonWithUndeline extends StatelessWidget {
  final VoidCallback primaryButtonOnTap;
  final VoidCallback underlineButtonOnTap;
  final bool primaryButtonEnabled;
  final String primaryButtonText;
  final String normalText;
  final TextStyle normalTextStyle;
  final String underlinedText;
  final TextStyle underLineTextStyle;

  const CustomButtonWithUndeline(
      {Key key,
      @required this.primaryButtonText,
      this.primaryButtonEnabled = true,
      @required this.primaryButtonOnTap,
      this.normalText = '',
      this.normalTextStyle = AppTextStyles.normal1,
      this.underlinedText = '',
      this.underLineTextStyle = AppTextStyles.normal1,
      this.underlineButtonOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PrimaryButton(
            action: primaryButtonOnTap,
            enabled: primaryButtonEnabled,
            text: primaryButtonText,
          ),
          Padding(
            padding: EdgeInsets.only(top: AppDimens.layoutSpacerM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  normalText,
                  style: normalTextStyle,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: underlineButtonOnTap,
                  child: Text(
                    underlinedText,
                    style: underLineTextStyle.copyWith(
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
