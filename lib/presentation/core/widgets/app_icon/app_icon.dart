import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';

class AppIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: AppDimens.layoutSpacerL),
        Image.asset(AppImages.appIcon,
            width: AppDimens.emojiSizeL.width,
            height: AppDimens.emojiSizeL.height)
      ],
    );
  }
}
