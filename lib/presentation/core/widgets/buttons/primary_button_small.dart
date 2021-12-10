import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class PrimaryButtonSmall extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback action;

  const PrimaryButtonSmall(
      {Key key,
      @required this.text,
      @required this.action,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: enabled ? action : null,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.caption2.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
