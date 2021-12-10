import 'dart:async';
import 'dart:convert';

import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';

import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots_onboarding.dart';
import 'package:ualet/to_be_refactor/widgets/slide_item.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentPage = 0;
  int _pageQuantity = (getIt<IEnv>().isColombia()) ? 4 : 5;
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

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundSplashBottomColor,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SectionBottomSheet(
                action: () {
                  getIt<IEnv>().isColombia()
                      ? ExtendedNavigator.rootNavigator
                          .pushNamed(Routes.registerPage)
                      : ExtendedNavigator.rootNavigator
                          .pushNamed(Routes.registerPageMX);
                },
                textButton: S.of(context).onBoardingIndexTextButtonNext,
                isValidRedirect: true,
                isValidTypeButton: true,
                isValidShowButton:
                    _currentPage == (_pageQuantity - 1) ? true : false,
                textInf: S.of(context).onBoardingIndexTextInfoNext,
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
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _contentPage(),
          ],
        ),
      ),
    );
  }

  Widget _contentPage() {
    var _media = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: _media.width * 1.0,
        height: _media.height * 1.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              AppColors.backgroundSplashTopColor,
              AppColors.backgroundSplashBottomColor
            ],
                stops: [
              0.3,
              0.9
            ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: (getIt<IEnv>().isColombia())
                    ? <Widget>[
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle1,
                          text: S.of(context).onBoardingIndexText1,
                          imageUrl: AppImages.onBoarding1,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle2,
                          text: S.of(context).onBoardingIndexText2,
                          imageUrl: AppImages.onBoarding2,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle3,
                          text: S.of(context).onBoardingIndexText3,
                          imageUrl: AppImages.onBoarding3,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle4,
                          text: S.of(context).onBoardingIndexText4,
                          imageUrl: AppImages.onBoarding4,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                      ]
                    : <Widget>[
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle1Mx,
                          text: S.of(context).onBoardingIndexText1Mx,
                          imageUrl: AppImages.onBoarding1,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle2Mx,
                          text: S.of(context).onBoardingIndexText2Mx,
                          imageUrl: AppImages.onBoarding2,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle3Mx,
                          text: S.of(context).onBoardingIndexText3Mx,
                          imageUrl: AppImages.onBoarding3,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle4Mx,
                          text: S.of(context).onBoardingIndexText4Mx,
                          imageUrl: AppImages.onBoarding4,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        ),
                        SlideItem(
                          title: S.of(context).onBoardingIndexTitle5Mx,
                          text: S.of(context).onBoardingIndexText5Mx,
                          imageUrl: AppImages.onBoarding4,
                          currentPage: _currentPage,
                          pages: _pageQuantity,
                          action: () {
                            _pageController.animateToPage(_pageQuantity - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            setState(() {
                              _currentPage = _pageQuantity - 1;
                            });
                          },
                        )
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
