import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback action;

  const SecondaryButton({Key key, this.text, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
