import 'dart:async';

import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
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

class IntroUserMigrationPage extends StatefulWidget {
  IntroUserMigrationPage({Key key}) : super(key: key);

  @override
  _IntroUserMigrationPageState createState() => _IntroUserMigrationPageState();
}

class _IntroUserMigrationPageState extends State<IntroUserMigrationPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _pages = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      if (_currentPage < _pages) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController?.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<UserMigrationBloc>()..add(UserMigrationEvent.getData()),
      child: BlocConsumer<UserMigrationBloc, UserMigrationState>(
        listener: (context, state) {
          state.dataOrFailure.fold(() {}, (either) {
            either.fold((l) {
              ToastHelper.createError(
                  message: l.map(
                unexpected: (s) => "unexpected",
                fromServer: (s) => s.message,
              )).show(context);

              Future.delayed(Duration(seconds: 3), () {
                ExtendedNavigator.rootNavigator.pushReplacementNamed(
                  Routes.indexPage,
                );
              });
            }, (r) {
              context.bloc<UserMigrationBloc>().add(
                    UserMigrationEvent.loadData(
                      UserMigrationInfo(lstInfo: r),
                    ),
                  );
            });
          });
        },
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
            bool pseDone = state.balance.balance == 0.0 ||
                state.quincenales.size != 0 ||
                state.mensuales.size != 0 ||
                state.mensuales.size != 0;
            bool quincenalDone = state.quincenales.size == 0;
            bool mensualDone = state.mensuales.size == 0;
            bool trimestralDone = state.trimestrales.size == 0;
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
                    child: PrimaryButton(
                      text: S.of(context).continueButton,
                      action: () => ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.userMigrationPage,
                        arguments: UserMigrationPageArguments(
                          userMigrationInfo: state.items,
                          balance: state.balance,
                          goalMensual: DashboardGoal.empty(),
                          goalQuincenal: DashboardGoal.empty(),
                          goalTrimestral: DashboardGoal.empty(),
                          goalPse: DashboardGoal.empty(),
                          mensualDone: mensualDone,
                          pseDone: pseDone,
                          quincenalDone: quincenalDone,
                          trimestralDone: trimestralDone,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(
                    left: AppDimens.layoutMarginM,
                    right: AppDimens.layoutMarginM,
                  ),
                  children: [
                    SizedBox(
                      height: AppDimens.layoutSpacerX,
                    ),
                    Container(
                      height: 500,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            child: ListView(
                              primary: false,
                              children: [
                                Image.asset(
                                  AppImages.appIcon,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerX,
                                ),
                                Text(
                                  S.of(context).onBoardingTitle1,
                                  style: AppTextStyles.title2.copyWith(
                                    color: AppColors.g25Color,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerS,
                                ),
                                Text(
                                  S.of(context).onBoardingDescription1,
                                  style: AppTextStyles.normal1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.g75Color,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            child: ListView(
                              primary: false,
                              children: [
                                Image.asset(
                                  AppImages.appIcon,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerX,
                                ),
                                Text(
                                  S.of(context).onBoardingTitle2,
                                  style: AppTextStyles.title2.copyWith(
                                    color: AppColors.g25Color,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerS,
                                ),
                                Text(
                                  S.of(context).onBoardingDescription2,
                                  style: AppTextStyles.normal1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.g75Color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            child: ListView(
                              primary: false,
                              children: [
                                Image.asset(
                                  AppImages.appIcon,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerX,
                                ),
                                Text(
                                  S.of(context).onBoardingTitle3,
                                  style: AppTextStyles.title2.copyWith(
                                    color: AppColors.g25Color,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimens.layoutSpacerS,
                                ),
                                Text(
                                  S.of(context).onBoardingDescription3,
                                  style: AppTextStyles.normal1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.g75Color,
                                  ),
                                )
                              ],
                            ),
                          ),
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

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
