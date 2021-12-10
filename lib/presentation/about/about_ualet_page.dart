import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/faq/faq_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/profile/widgets/faq_profile_page.dart';

import '../../injection.dart';

class AboutUaletPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FAQBloc>(
            create: (context) => getIt<FAQBloc>()..add(FAQEvent.getFAQItems()),
          )
        ],
        child: BlocBuilder<FAQBloc, FAQState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loadInProgress: (_) => Stack(
                      children: <Widget>[
                        Container(
                          color: AppColors.backgroundColor,
                        ),
                        LoadingInProgressOverlay(isLoading: true)
                      ],
                    ),
                loadSuccess: (state) {
                  List faq = new List();
                  String name = state.faqItems.asList()[0].name;
                  state.faqItems.asList().forEach((element) {
                    if (element.type == "AboutUalet") {
                      faq.add(element.faq);
                    }
                  });
                  return _aboutBody(context, faq, name);
                },
                loadFailure: (state) => Container());
          },
        ));
  }

  Widget _aboutBody(context, faq, name) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
                left: AppDimens.layoutMargin,
                right: AppDimens.layoutMargin,
                top: AppDimens.layoutSpacerXs,
                bottom: AppDimens.layoutSpacerXs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: AppColors.primaryColor,
                  alignment: Alignment.topLeft,
                  tooltip: "Volver",
                  onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                ),
                _aboutHeader(context),
                SizedBox(
                  height: AppDimens.layoutSpacerL,
                ),
                _aboutDescription(context),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                _infoSection(context, faq, name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _aboutHeader(context) {
    return Text(
      S.of(context).aboutTitle,
      textAlign: TextAlign.left,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
    );
  }

  Widget _aboutDescription(context) {
    return Text(
      S.of(context).aboutDescription,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal8
    );
  }

  Widget _infoSection(context, faq, name) {
    return  Container(
      height: 350,
      child: FAQProfilePage(
        items: faq,
        name: name,
        namePage: 'about',
      ),
    );
  }
}
