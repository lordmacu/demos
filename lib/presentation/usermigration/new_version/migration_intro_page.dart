import 'dart:async';

import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/i_user_migration_repository.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MigrationIntroPage extends StatefulWidget {
  MigrationIntroPage({Key key}) : super(key: key);

  @override
  _MigrationIntroPageState createState() => _MigrationIntroPageState();
}

class _MigrationIntroPageState extends State<MigrationIntroPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _pages = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserMigrationBloc>(
          create: (context) => getIt<UserMigrationBloc>(),
        )
      ],
      child: BlocConsumer<UserMigrationBloc, UserMigrationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isLoading) {
            return Stack(
              children: <Widget>[
                Container(
                  color: AppColors.backgroundColor,
                ),
                LoadingInProgressOverlay(isLoading: true)
              ],
            );
          } else {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              bottomNavigationBar: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      for (int i = 0; i < _pages; i++)
                        SlideDots(i == _currentPage ? true : false)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      AppDimens.layoutMargin,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.layoutMarginS),
                      child: PrimaryButton(
                          text: S.of(context).continueButton,
                          action: () => _onPageButtonChanged(_currentPage)),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(top: AppDimens.layoutMarginS),
                  children: [
                    Container(
                      height: 500,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        scrollDirection: Axis.horizontal,
                        children: [
                          _sliderIntroductory(
                              AppImages.migrateIntroductory1,
                              S.of(context).sliderIntroductoryMigrationOneTitle,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationOneSubtitle),
                          _sliderIntroductory(
                              AppImages.migrateIntroductory2,
                              S.of(context).sliderIntroductoryMigrationTwoTitle,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationTwoSubtitle),
                          _sliderIntroductory(
                              AppImages.migrateIntroductory3,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationThreeTitle,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationThreeSubtitle),
                          _sliderIntroductory(
                              AppImages.migrateIntroductory4,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationFourTitle,
                              S
                                  .of(context)
                                  .sliderIntroductoryMigrationFourSubtitle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _sliderIntroductory(String img, String title, String subTitle) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 360,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppDimens.containerBorderRadius),
                bottomLeft: Radius.circular(AppDimens.containerBorderRadius)),
            image: new DecorationImage(
              image: new ExactAssetImage(img),
              fit: BoxFit.contain,
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  offset: Offset(0, 4),
                  spreadRadius: 0.5,
                  blurRadius: 8.0)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.layoutMarginS,
              vertical: AppDimens.layoutMarginS),
          child: Column(
            children: [
              Expanded(child: Container()),
              Text(
                title,
                style: AppTextStyles.subtitle2.copyWith(
                  color: AppColors.g50Color,
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerS,
              ),
              Text(
                subTitle,
                style: AppTextStyles.normal4.copyWith(
                  color: AppColors.g50Color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _onPageButtonChanged(int index) {
    setState(() {
      _currentPage = index;
    });

    if (_currentPage < _pages) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    if (_currentPage == _pages) {
      getIt<IUserMigrationRepository>().updateIntroductoryMigrate(true);

      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.homePage,
      );
    }

    if (_pageController.hasClients) {
      _pageController?.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
