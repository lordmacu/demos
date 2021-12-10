import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class CloseSessionDialog extends StatelessWidget {
  final redirect;
  const CloseSessionDialog({
    Key key,
    this.redirect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (redirect) {
      ExtendedNavigator.rootNavigator
          .pushNamedAndRemoveUntil(Routes.loginPage, (route) => false);
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        height: 100,
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
                      "Cierre de sesión",
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g50Color),
                    ),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: AppColors.dangerColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              "Por razones de seguridad se cerrará la sesión.",
              style:
                  AppTextStyles.subtitle1.copyWith(color: AppColors.g50Color),
            ),
          ],
        ),
      ),
    );
  }
}
