import 'package:ualet/router/router.gr.dart';
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
import 'package:ualet/presentation/profile/widgets/faq_profile_page.dart';
import 'package:ualet/to_be_refactor/utils/bubble_indication_painter.dart';

import '../../injection.dart';
import 'widgets/support_help_page.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  PageController _pageController;
  bool isLeft = true;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onButtonFAQPress() {
    setState(() {
      isLeft = true;
    });
  }

  void _onButtonSupportPress() {
    setState(() {
      isLeft = false;
    });
  }

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
                  List support = new List();
                  String name = state.faqItems.asList()[0].name;
                  state.faqItems.asList().forEach((element) {
                    if (element.type == "FAQ") {
                      faq.add(element.faq);
                    } else if (element.type == "Support") {
                      support.add(element.faq);
                    }
                  });
                  return _helpBody(context, faq, support, name);
                },
                loadFailure: (state) => Container());
          },
        ));
  }

  Widget _helpBody(context, faq, support, name) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              left: AppDimens.layoutMargin,
              right: AppDimens.layoutMargin,
              top: AppDimens.layoutSpacerXs,
              bottom: AppDimens.layoutSpacerXs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
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
              // _helpOtherSupport(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _buttonGroup(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _infoSection(context, faq, support, name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpOtherSupport(context) {
    return Container(
      child: ListTile(
        onTap: () => ExtendedNavigator.rootNavigator
            .pushNamed(Routes.helpSupportFormPage),
        title: Text(
          S.of(context).otherSupport,
          textAlign: TextAlign.left,
          style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.g50Color,
          size: 15,
        ),
      ),
    );
  }

  Widget _helpHeader(context) {
    return Text(
      S.of(context).helpTitle,
      textAlign: TextAlign.left,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
    );
  }

  Widget _helpDescription(context) {
    return Text(
      S.of(context).helpDescription,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal4.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buttonGroup(context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.buttonBarSlideRadius),
          color: AppColors.whiteColor),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: isLeft ? Color(0xfff9f5fe) : Colors.transparent,
              elevation: 0,
              onPressed: _onButtonFAQPress,
              child: Text(
                S.of(context).helpFAQ,
                style: AppTextStyles.normal2.copyWith(
                  color: !isLeft ? AppColors.g25Color : AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              color: !isLeft ? Color(0xfff9f5fe) : Colors.transparent,
              elevation: 0,
              onPressed: _onButtonSupportPress,
              child: Text(
                S.of(context).helpSupport,
                style: AppTextStyles.normal2.copyWith(
                    color:
                        isLeft ? AppColors.g25Color : AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoSection(context, faq, support, name) {
    return Expanded(
      child: isLeft
          ? FAQProfilePage(
              items: faq,
              name: name,
              namePage: 'help_faq',
            )
          : SupportHelpPage(
              items: support,
              name: name,
            ),
    );
  }
}
