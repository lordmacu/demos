import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[_redirectButton(context)],
        ),
      ),
    );
  }

  Widget _redirectButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.layoutMarginButton,
          vertical: AppDimens.layoutSpacerL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PrimaryButton(
            text: S.of(context).welcomeProfilingPageButton,
            action: () => ExtendedNavigator.rootNavigator.pushNamed(
              Routes.successInfoPage,
            ),
          ),
        ],
      ),
    );
  }
}
