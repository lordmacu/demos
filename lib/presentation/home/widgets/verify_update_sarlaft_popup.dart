import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';

class VerifyUpdateSarlaftDialog extends StatelessWidget {
  final VoidCallback buttonActionPrimary;
  final VoidCallback buttonActionSecondary;
  final String title;
  final String subTitleOne;
  final String subTitleOneBold;
  final String subTitleOneNext;
  final String subTitleTwo;
  final String buttonTextPrimary;
  final String buttonTextSecondary;
  final int typeDialog;

  const VerifyUpdateSarlaftDialog(
      {Key key,
      this.buttonActionPrimary,
      this.buttonActionSecondary,
      this.title,
      this.subTitleOne,
      this.subTitleOneBold,
      this.subTitleOneNext,
      this.subTitleTwo,
      this.buttonTextPrimary,
      this.buttonTextSecondary,
      this.typeDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: SingleChildScrollView(
        child: Container(
          height: typeDialog == 1 ? 370 : 420,
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
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.title2
                            .copyWith(color: AppColors.g50Color),
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: typeDialog == 1 ? AppColors.successColor: AppColors.dangerColor,
                      size: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerS,
              ),
              RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            subTitleOne,
                        style: AppTextStyles.normal4),
                    TextSpan(
                        text:
                            subTitleOneBold,
                        style: AppTextStyles.normal4
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            subTitleOneNext,
                        style: AppTextStyles.normal4),
                  ])),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              Text(
                subTitleTwo,
                style: AppTextStyles.normal4,
              ),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              PrimaryButton(
                  text: buttonTextPrimary, action: buttonActionPrimary),
              SizedBox(
                height: AppDimens.layoutSpacerS,
              ),
              SecondaryButton(
                  text: buttonTextSecondary, action: buttonActionSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
