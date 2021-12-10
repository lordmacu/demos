import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import '../../../../injection.dart';

class SuccessInfoPage extends StatelessWidget {
  const SuccessInfoPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SectionBottomSheet(
            isValidRedirect: false,
            action: () {

              getIt<IFireBaseEventLogger>().profileFind();

              //Appsflyer 8
              getIt<IAppsFlyerEventLogger>()
                  .logEvent(AFEvents.COMPLETE_REGISTRATION, {});
              return ExtendedNavigator.rootNavigator.pushNamed(
                Routes.profilingPage,
              );
            },
            textButton: S.of(context).welcomeProfilingPageTitle),
        body: ListView(
          primary: false,
          padding: EdgeInsets.only(
              left: AppDimens.layoutMargin * 1.5,
              right: AppDimens.layoutMargin,
              top: height / 5),
          children: <Widget>[
            SizedBox(
                child: Image.asset(AppImages.personIconSuccess),
                height: AppDimens.emojiSizeL.height,
                width: AppDimens.emojiSizeL.width),
            const SizedBox(height: AppDimens.layoutSpacerM),
            Text(
              S.of(context).welcomeProfilingPageTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.title2.copyWith(color: AppColors.successColor),
            ),
            const SizedBox(height: AppDimens.layoutSpacerM),
            Text(
              S.of(context).welcomeProfilingPageDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      onWillPop: () {}
    );
  }
}
