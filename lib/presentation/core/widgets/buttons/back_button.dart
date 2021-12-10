import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';

class BackButton extends StatelessWidget {
  final VoidCallback action;
  const BackButton({Key key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.layoutSpacerS, top: AppDimens.layoutSpacerM),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: AppDimens.buttonBack.height,
        ),
        onPressed: action,
      ),
    );
  }
}
