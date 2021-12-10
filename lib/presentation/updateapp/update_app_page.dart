import 'dart:io';

import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:launch_review/launch_review.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';

class UpdateAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              left: AppDimens.layoutMarginXM,
              right: AppDimens.layoutMarginXM,
              top: AppDimens.layoutMarginXS),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: AppColors.background),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/phone_update.png",
                    height: MediaQuery.of(context).size.height * 0.56),
                Text(
                  S.of(context).updateVersionTitle,
                  style: AppTextStyles.normal6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                Text(
                  S.of(context).updateVersionSubTitle,
                  style: AppTextStyles.normal7,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SectionBottomSheet(
                    action: _submit,
                    textButton: S.of(context).updateVersionButton,
                    isValidRedirect: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    Platform.isAndroid ? LaunchReview.launch() : LaunchReview.launch(iOSAppId: '1266764142');
  }
}
