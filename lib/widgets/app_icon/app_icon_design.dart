import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';

class AppIconDesignWidget extends StatelessWidget {
  final IconData icon;
  const AppIconDesignWidget({Key key, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(AppDimens.iconContentSize),
          child: Icon(icon,
              size: AppDimens.iconSizeL.height, color: AppColors.whiteColor)),
      decoration: BoxDecoration(
          color: AppColors.successColor,
          borderRadius: BorderRadius.circular(AppDimens.iconSizeL.height)),
    );
  }
}
