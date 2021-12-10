import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class PrimaryButtonWhite extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback action;

  const PrimaryButtonWhite(
      {Key key,
      @required this.text,
      @required this.action,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.buttonPrimary.width,
      height: AppDimens.buttonPrimary.height,
      child: RaisedButton(
        color: AppColors.whiteColor,
        onPressed: enabled ? action : null,
        child: Text(
          text,
          style: AppTextStyles.normal2.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
