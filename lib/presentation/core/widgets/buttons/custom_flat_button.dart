import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback action;

  const CustomFlatButton(
      {Key key,
      @required this.text,
      @required this.action,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        onPressed: enabled ? action : null,
        child: Text(
          text,
          style: AppTextStyles.normalUnder1
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
