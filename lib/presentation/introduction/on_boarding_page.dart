import 'dart:async';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/widgets/slide_item.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final String imageUrl = "${EnvironmentConfig.cdnUrl}/icon.png";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: _media.width * 1.0,
                height: _media.height * 1.0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppDimens.layoutMargin,
                      right: AppDimens.layoutMargin,
                      top: AppDimens.layoutSpacerM,
                      bottom: AppDimens.layoutSpacerXs),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Container()),
                      _sectionLogo(imageUrl),
                      SizedBox(
                        height: AppDimens.layoutMarginM,
                      ),
                      _title(S.of(context).introductoryPageTitle),
                      SizedBox(
                        height: AppDimens.layoutMarginM,
                      ),
                      _subTitle(),
                      SizedBox(
                        height: AppDimens.layoutMarginButton,
                      ),
                      _footer(),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return Padding(
      padding: EdgeInsets.only(
          top: AppDimens.layoutSpacerM, bottom: AppDimens.layoutSpacerXs),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SectionBottomSheet(
              action: () {
                getIt<IFireBaseEventLogger>().singUp();
                ExtendedNavigator.rootNavigator.pushNamed(Routes.indexPage);
              },
              textButton: S.of(context).signUpButton,
              isValidRedirect: true,
              textInf: S.of(context).alreadyHaveAnAccountLabel,
              textUnderline: S.of(context).alreadyHaveAnLoginButton,
              redirectUnderline: () =>
                  ExtendedNavigator.rootNavigator.pushNamed(Routes.loginPage),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(text,
        textAlign: TextAlign.center, style: AppTextStyles.normalBig1);
  }

  Widget _subTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginS,
        right: AppDimens.layoutMarginS,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: AppTextStyles.normal7
                .copyWith(color: AppColors.g75Color, height: 1.7),
            text: S.of(context).introductoryPageText1,
            children: [
              TextSpan(
                style: AppTextStyles.normal7.copyWith(
                    color: AppColors.g75Color, fontWeight: FontWeight.bold),
                text: S.of(context).introductoryPageText2,
              ),
              TextSpan(
                style:
                    AppTextStyles.normal7.copyWith(color: AppColors.g75Color),
                text: S.of(context).introductoryPageText3,
              ),
              TextSpan(
                style: AppTextStyles.normal7.copyWith(
                    color: AppColors.g75Color, fontWeight: FontWeight.bold),
                text: S.of(context).introductoryPageText4,
              ),
            ]),
      ),
    );
  }

  Widget _sectionLogo(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: AppDimens.iconOnBordingSize,
      fit: BoxFit.contain,
    );
  }
}
