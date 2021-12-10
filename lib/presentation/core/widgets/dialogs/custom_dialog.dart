import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path/path.dart';
import 'package:flutter_html/style.dart' as s;

class CustomDialog extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback buttonAction;
  final String subTitle;

  const CustomDialog(
      {Key key,
      this.icon,
      this.title,
      this.description,
      this.buttonText,
      this.buttonAction,
      this.image,
      this.iconColor = AppColors.successColor,
      this.subTitle = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
      contentPadding: EdgeInsets.all(AppDimens.layoutSpacerM),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 5,
                  child: Text(
                    title,
                    style: AppTextStyles.title2
                        .copyWith(color: AppColors.g50Color),
                  )),
              if (icon != null) ...[
                Expanded(
                  child: Icon(icon,
                      color: iconColor, size: AppDimens.emojiSizeM.height),
                )
              ] else ...[
                Expanded(
                  child: Image.asset(
                    image,
                    height: AppDimens.emojiSizeM.height,
                    width: AppDimens.emojiSizeM.width,
                  ),
                )
              ]
            ],
          ),
          const SizedBox(height: AppDimens.layoutSpacerS), // Subtitle

          Html(

              data:subTitle,
            style: {
              "p" : s.Style(
                  padding: EdgeInsets.all(0),
                  color: AppColors.g90Color,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w300,
                  fontSize: s.FontSize(AppDimens.normalTextSize)
              ),
              "b" : s.Style(
                  padding: EdgeInsets.all(0),
                  color: AppColors.g90Color,
                  fontFamily: "OpenSans",
                   fontSize: s.FontSize(AppDimens.normalTextSize)
              )
            },
          ),
           Html(


            style: {
              "p" : s.Style(
                padding: EdgeInsets.all(0),
                        color: AppColors.g90Color,
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w300,
                fontSize: s.FontSize(AppDimens.normalTextSize)
              ),
              "b" : s.Style(
                  padding: EdgeInsets.all(0),
                  color: AppColors.g90Color,
                  fontFamily: "OpenSans",
                   fontSize: s.FontSize(AppDimens.normalTextSize)
              )
            },

            data: description,

          ),
          const SizedBox(height: AppDimens.layoutSpacerL),
          PrimaryButton(
            text: buttonText,
            action: buttonAction,
          )
        ],
      ),
    );
  }
}
