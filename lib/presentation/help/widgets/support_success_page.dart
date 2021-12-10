import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';

class SupportSuccessPage extends StatelessWidget {
  const SupportSuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
            text: S.of(context).supportPageSuccessButton,
            action: () => ExtendedNavigator.rootNavigator
                .popAndPushNamed(Routes.homePage)),
      ),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          ListView(
            primary: false,
            padding: EdgeInsets.only(
              left: AppDimens.layoutMarginM,
              right: AppDimens.layoutMarginM,
              top: AppDimens.layoutSpacerX * 1.5,
            ),
            children: <Widget>[
              Image.asset(
                AppImages.personIconSuccess,
                height: 90,
                width: 90,
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Text(
                S.of(context).supportPageSuccessTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.title2
                    .copyWith(color: AppColors.successColor),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Text(
                S.of(context).supportPageSuccessSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Text(
                S.of(context).supportPageSuccessSubtitle2,
                textAlign: TextAlign.center,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
