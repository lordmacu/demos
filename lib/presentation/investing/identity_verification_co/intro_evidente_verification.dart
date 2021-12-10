import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';

class IntroEvidenteVerification extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final investment;
  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  IntroEvidenteVerification({
    @required this.goal,
    @required this.bankTransfer,
    @required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.layoutMarginM,
            right: AppDimens.layoutMarginM,
            bottom: AppDimens.layoutSpacerL,
          ),
          child: PrimaryButton(
            text: S.of(context).continueButton,
            action: () {
              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.evidenteVerification,
                arguments: EvidenteVerificationArguments(
                  investment: investment,
                  goal: goal,
                  bankTransfer: bankTransfer,
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            primary: false,
            padding: EdgeInsets.only(
              left: AppDimens.layoutMargin,
              right: AppDimens.layoutMargin,
              top: AppDimens.layoutSpacerX * 1.5,
            ),
            children: <Widget>[
              Image.asset(
                AppImages.checkIconSuccess,
                height: 90,
                width: 90,
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutMarginS,
                ),
                child: Text(
                  S.of(context).introEvidenteTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title2.copyWith(
                    color: AppColors.successColor,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutMarginM,
                ),
                child: Text(
                  S.of(context).introEvidenteDescription,
                  style: AppTextStyles.normal1.copyWith(
                    color: AppColors.g75Color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {}
    );
  }
}
