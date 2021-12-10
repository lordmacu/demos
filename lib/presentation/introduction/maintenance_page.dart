import 'dart:async';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
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
                                  _imgBody(AppImages.maintenance),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  _title( S.of(context).maintenanceTitle),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  _subTitle(S.of(context).maintenanceSubTitle)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container() //_footer(),
                            ),
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
                ExtendedNavigator.rootNavigator.pushNamed(Routes.indexPage);
              },
              textButton: 'Entendido',
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
        textAlign: TextAlign.center, style: AppTextStyles.subtitle2.copyWith(color: AppColors.txtColorTitleInfo));
  }

  Widget _subTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyles.normal8.copyWith(color: AppColors.txtColorSubtitleInfo)
    );
  }

  Widget _imgBody(String url) {
    return Image.asset(
      url,
      height: 170,
      fit: BoxFit.contain,
    );
  }
}
