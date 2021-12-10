import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class PrimaryButtonDialogAfirm extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback action;

  const PrimaryButtonDialogAfirm(
      {Key key,
      @required this.text,
      @required this.action,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return SizedBox(
      width: _media.width * 0.34,
      height: AppDimens.buttonPrimary.height,
      child: RaisedButton(
        onPressed: enabled ? action : null,
        child: Text(
          text,
          style: AppTextStyles.normal2.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
