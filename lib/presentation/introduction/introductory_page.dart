import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/introduction/widgets/bubble_element.dart';
import 'package:ualet/router/router.gr.dart';

class IntroductoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _chatSection(context),
            _titleHoverSection(context),
          ],
        ),
      ),
    );
  }

  Widget _titleHoverSection(context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          gradient: LinearGradient(
              begin: FractionalOffset.center,
              end: FractionalOffset.bottomCenter,
              colors: [
                AppColors.backgroundColor,
                AppColors.backgroundColor.withOpacity(0.8),
              ],
              stops: [
                0.3,
                1
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                    top: AppDimens.layoutMargin,
                    bottom: AppDimens.layoutSpacerS),
                child: InkWell(
                  onTap: () => ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.successInfoPage,
                  ),
                  child: Text(
                    S.of(context).omit,
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontFamily: AppTextStyles.kFontFamily,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff333333)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                width: 270.0,
                child: Text(
                  S.of(context).titleIntroductoryPage,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title2
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chatSection(context) {
    return ListView(
      primary: false,
      padding: EdgeInsets.only(
        left: 20.0,
        right: 28.0,
        top: 212,
      ),
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "🧐",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: BubbleElement(
                type: ChatType.user,
                child: Text(
                  S.of(context).introductoryPageMessage1,
                  style: AppTextStyles.chatText,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: BubbleElement(
                type: ChatType.roboAdvisor,
                child: Text(
                  S.of(context).introductoryPageMessage2,
                  style: AppTextStyles.chatText,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "🤖",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "🧐",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: BubbleElement(
                type: ChatType.user,
                child: Text(
                  S.of(context).introductoryPageMessage3,
                  style: AppTextStyles.chatText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: BubbleElement(
                type: ChatType.roboAdvisor,
                child: Text.rich(TextSpan(
                    text: "¡Claro! ",
                    style: AppTextStyles.chatText
                        .copyWith(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: S.of(context).introductoryPageMessage4,
                          style: AppTextStyles.chatText)
                    ])),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "🤖",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "🧐",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: BubbleElement(
                type: ChatType.user,
                child: Text(
                  S.of(context).introductoryPageMessage5,
                  style: AppTextStyles.chatText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: BubbleElement(
                type: ChatType.roboAdvisor,
                child: Text.rich(TextSpan(
                    style: AppTextStyles.chatText,
                    text: "Ajam ",
                    children: [
                      TextSpan(
                        text: "¡exacto! ",
                        style: AppTextStyles.chatText
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: S.of(context).introductoryPageMessage6),
                      TextSpan(
                          text: S.of(context).introductoryPageDisclaimer,
                          style: TextStyle(fontSize: 12.0))
                    ])),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "🤖",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "🧐",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: BubbleElement(
                type: ChatType.user,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).introductoryPageMessage7,
                      style: AppTextStyles.chatText,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      S.of(context).introductoryPageMessage8,
                      style: AppTextStyles.chatText,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
        _buttonSection(context),
      ],
    );
  }

  Widget _buttonSection(context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 30.0, left: 20, right: 20),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(45.0),
            gradient: LinearGradient(
                begin: Alignment(0, -6),
                end: Alignment(0, 1),
                colors: [
                  Color(0xffb377ff).withOpacity(1),
                  AppColors.primaryColor,
                ],
                stops: [
                  0.0,
                  1
                ])),
        child: Text(
          S.of(context).introductoryButtonText,
          textAlign: TextAlign.center,
          style: AppTextStyles.normal2.copyWith(color: AppColors.whiteColor),
        ),
      ),
      onTap: () {
        //Firebase 8
        // getIt<IFireBaseEventLogger>().welcomeClick();
        //Appsflyer 8
        getIt<IAppsFlyerEventLogger>()
            .logEvent(AFEvents.COMPLETE_REGISTRATION, {});
        return ExtendedNavigator.rootNavigator.pushNamed(
          Routes.successInfoPage,
        );
      },
    );
  }
}
