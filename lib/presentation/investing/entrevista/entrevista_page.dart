import 'dart:async';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class EntrevistaPage extends StatefulWidget {
  @override
  _EntrevistaPageState createState() => _EntrevistaPageState();
}

class _EntrevistaPageState extends State<EntrevistaPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            key: _scaffoldKey,
            backgroundColor: AppColors.backgroundColor,
            body: SafeArea(
                child: Stack(
              fit: StackFit.expand,
              children: [
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Container()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppDimens.layoutMargin,
                                  right: AppDimens.layoutMargin,
                                  bottom: AppDimens.layoutSpacerL),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _imgBody(AppImages.entrevistaImg),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  _title(S.of(context).entrevistaTitle),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  _subTitle(),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  _description(
                                      S.of(context).entrevistaDescription)
                                ],
                              ),
                            ),
                            Expanded(child: _footer())
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ))));
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
                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.entrevistaWebView,
                        arguments: EntrevistaWebViewArguments(
                            url: EnvironmentConfig.urlCalendly))
                    .then((value) {
                  print(value);
                  //Termina la entrevista y vincula de manera simplificada al usuario en mx
                  var responseEnrolment =
                      getIt<IInvestingRepository>().softEnrollment();

                  responseEnrolment
                      .then((value) => {
                            value.fold(
                                (l) => {
                                      ToastHelper.createError(
                                              message: l.map(
                                                  fromServer: (e) =>
                                                      "Error: ${e.message}",
                                                  unexpected: (_) =>
                                                      "Error inesperado"))
                                          .show(context)
                                    },
                                (r) => {
                                      ExtendedNavigator.rootNavigator.pushNamed(
                                        Routes.investingIntroPage,
                                        arguments: InvestingIntroPageArguments(
                                            fromRegister: true,
                                            valueFromRegister: 100),
                                      )
                                    })
                          })
                      .catchError((e) {
                    print("Got error: ${e.error}");
                  });
                });
              },
              textButton: S.of(context).entrevistaButton,
              isValidRedirect: false,
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
        textAlign: TextAlign.center,
        style: AppTextStyles.title2
            .copyWith(color: AppColors.titleColorEntrevista));
  }

  Widget _subTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: AppTextStyles.normal9.copyWith(color: AppColors.g75Color),
          text: S.of(context).entrevistaSubTitle,
          children: [
            TextSpan(
              style: AppTextStyles.normal9.copyWith(
                  color: AppColors.g75Color, fontWeight: FontWeight.bold),
              text: S.of(context).entrevistaSubTitleBold,
            ),
            TextSpan(
              style: AppTextStyles.normal9.copyWith(color: AppColors.g75Color),
              text: S.of(context).entrevistaSubTitle2,
            ),
          ]),
    );
  }

  Widget _description(String text) {
    return Text(text,
        textAlign: TextAlign.center, style: AppTextStyles.normal9);
  }

  Widget _imgBody(String url) {
    return Image.asset(
      url,
      height: 90,
      width: 90,
      fit: BoxFit.contain,
    );
  }
}
