import 'package:ualet/presentation/profile/widgets/profiling_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/faq/faq_bloc.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/profile/widgets/faq_profile_page.dart';
import 'package:ualet/generated/l10n.dart';
import '../../injection.dart';

import 'package:ualet/presentation/help/widgets/profile_help_page.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FAQBloc>(
      create: (context) => getIt<FAQBloc>()..add(FAQEvent.getFAQItems()),
      child: BlocBuilder<FAQBloc, FAQState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Stack(
                    children: <Widget>[
                      Container(
                        color: AppColors.backgroundColor,
                      ),
                      LoadingInProgressOverlay(isLoading: true),
                    ],
                  ),
              loadSuccess: (state) {
                List faqProfile = new List();
                String name = state.faqItems.asList()[0].name;
                state.faqItems.asList().forEach((element) {
                  if (element.type == "Profile") {
                    faqProfile.add(element.faq);
                  } else if (element.type == "Goals") {
                    faqProfile.add(element.faq);
                  }
                });
                double height = MediaQuery.of(context).size.height;

                return Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: SafeArea(
                    child: Container(
                      height: height,
                      child: ListView(
                        primary: false,
                        padding: EdgeInsets.only(
                            left: AppDimens.layoutMargin,
                            right: AppDimens.layoutMargin,
                            top: AppDimens.layoutSpacerXs,
                            bottom: AppDimens.layoutSpacerL),
                        children: <Widget>[
                          SizedBox(
                            height: AppDimens.layoutSpacerHeader,
                          ),
                          _headerProfile(context),
                          SizedBox(
                            height: AppDimens.layoutMarginS,
                          ),
                          ProfilingProfilePage(result: state.profile),
                          SizedBox(
                            height: AppDimens.layoutSpacerL,
                          ),
                          _faqProfile(context),
                          SizedBox(
                            height: AppDimens.layoutSpacerM,
                          ),
                          Container(
                            height: 300,
                            child:ProfileHelpPage(
                              items: faqProfile,
                              name: name,

                            ) ,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loadFailure: (state) {
                return Container();
              });
        },
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Text(
      S.of(context).myProfile,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Widget _faqProfile(BuildContext context) {
    return Text(
      S.of(context).faqProfile,
      style: AppTextStyles.subtitle2.copyWith(color: AppColors.g75Color),
      textAlign: TextAlign.left,
    );
  }
}
