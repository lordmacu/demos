import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/faq/faq_bloc.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/generated/l10n.dart';

import '../../../injection.dart';
import 'support_help_page.dart';

class SupportAccountPage extends HookWidget {
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
                  List support = new List();
                  String name = state.faqItems.asList()[0].name;
                  state.faqItems.asList().forEach((element) {
                    if (element.type == "Support") {
                      support.add(element.faq);
                    }
                  });
                  return _supportAccountBody(context, support, name);
                },
                loadFailure: (state) => Container());
          },
        ));
  }

  Widget _supportAccountBody(context, support, name) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            primary: false,
            padding: EdgeInsets.only(
                left: AppDimens.layoutMargin,
                right: AppDimens.layoutMargin,
                top: AppDimens.layoutSpacerXs,
                bottom: AppDimens.layoutSpacerXs),
            children: <Widget>[
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
              _helpHeader(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              _helpDescription(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _infoSection(context, support, name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpHeader(context) {
    return Text(
      S.of(context).helpSupport,
      textAlign: TextAlign.left,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
    );
  }

  Widget _helpDescription(context) {
    return Text(
      S.of(context).supportAccountDescription,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal4.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _infoSection(
    context,
    support,
    name,
  ) {
    return SupportHelpPage(
      items: support,
      name: name,
    );
  }
}
