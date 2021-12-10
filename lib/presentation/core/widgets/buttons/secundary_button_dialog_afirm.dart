import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class SecondaryButtonDialogAfirm extends StatelessWidget {
  final String text;
  final VoidCallback action;

  const SecondaryButtonDialogAfirm({Key key, this.text, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return SizedBox(
      width: _media.width * 0.34,
      height: AppDimens.buttonPrimary.height,
      child: OutlineButton(
        onPressed: action,
        borderSide: BorderSide(color: AppColors.primaryColor),
        child: Text(
          text,
          style: AppTextStyles.normal2.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
