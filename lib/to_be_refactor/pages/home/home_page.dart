import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/history/history_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/no_funds_warning_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/profile/profile_page.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/pages/home/dashboard_page.dart';
import 'package:ualet/to_be_refactor/pages/home/floating_bottom.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/sign_out_dialog.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

class HomePage extends StatefulWidget {
  final int currentScreen;
  final bool blocked;

  HomePage({Key key, this.currentScreen = 0, this.blocked = false})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentTab = 0;

  final List<Widget> screens = [DashboardPage(), HistoryPage(), ProfilePage()];

  Widget currentScreen = DashboardPage();

  final PageStorageBucket bucket = PageStorageBucket();

  AnimationController animationController;
  Animation degOneTranslationAnimation, degTwoTranslationAnimation;
  Animation rotationAnimation;

  bool _isVisible = false;
  double balance = 0.0;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    getIt<IDashboardRepository>().getBalance().then((value) {
      setState(() {
        balance = value;
      });
    });
    switch (widget.currentScreen) {
      case 1:
        currentScreen = DashboardPage(
          changePage: () {
            setState(() {
              currentScreen = HistoryPage();
              currentTab = 1;
            });
          },
        );
        currentTab = 0;
        break;
      case 2:
        currentScreen = HistoryPage();
        currentTab = 1;
        break;
      case 3:
        currentScreen = ProfilePage();
        currentTab = 2;
        break;
      default:
        currentScreen = DashboardPage(
          changePage: () {
            setState(() {
              currentScreen = HistoryPage();
              currentTab = 1;
            });
          },
        );
    }
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 270));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.4), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.4, end: 1.0), weight: 30.0)
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.2), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.2, end: 1.0), weight: 30.0)
    ]).animate(animationController);
    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _pageStorage(),
            Visibility(
              child: Container(
                height: _media.height,
                width: _media.width,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
              ),
              maintainInteractivity: false,
              maintainSize: false,
              maintainState: false,
              visible: _isVisible,
            ),
            Positioned(
              bottom: 0,
              left: _media.width / 2,
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(315),
                    degOneTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      FloatingBottom(
                        background: AppColors.whiteColor,
                        width: 60.0,
                        height: 60.0,
                        icon: Icon(
                          Icons.trending_up,
                          color: AppColors.successColor,
                        ),
                        onClick: () {
                          getIt<IFireBaseEventLogger>().savingsInvestment();

                          animationController.reverse();
                          setState(() {
                            _isVisible = false;
                          });
                          ExtendedNavigator.rootNavigator
                              .pushNamed(Routes.investingIntroPage);
                        },
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                      Text(
                        S.of(context).homeInvertir,
                        style: AppTextStyles.normal1.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: _media.width / 2,
              child: Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degTwoTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degTwoTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      FloatingBottom(
                          background: AppColors.whiteColor,
                          width: 60.0,
                          height: 60.0,
                          icon: Icon(Icons.trending_down,
                              color: AppColors.dangerColor),
                          onClick: () {
                            
                            getIt<IFireBaseEventLogger>().savingsWithdrall();

                            animationController.reverse();
                            setState(() {
                              _isVisible = false;
                            });
                            balance = 1000;
                            if (balance > 0.0) {
                              ExtendedNavigator.rootNavigator
                                  .pushNamed(Routes.withDrawalPageMX);
                            } else {
                              showGeneralDialog(
                                context: context,
                                barrierColor: Colors.black.withOpacity(0.4),
                                barrierDismissible: true,
                                barrierLabel: "Label",
                                transitionDuration: Duration(milliseconds: 600),
                                pageBuilder: (ctx, anim1, anim2) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: NoFundsWarningDialog(),
                                  );
                                },
                                transitionBuilder: (ctx, anim1, anim2, child) {
                                  return SlideTransition(
                                    position: Tween(
                                            begin: Offset(0, 1),
                                            end: Offset(0, 0.1))
                                        .animate(anim1),
                                    child: child,
                                  );
                                },
                              ).then((value) {
                                ExtendedNavigator.rootNavigator
                                    .pushNamedAndRemoveUntil(
                                  Routes.homePage,
                                  (route) => route.isFirst,
                                );
                              });
                            }
                          }),
                      SizedBox(
                        height: AppDimens.layoutSpacerS,
                      ),
                      Text(
                        S.of(context).homeRetirar,
                        style: AppTextStyles.normal1.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buttonNavigation(context),
        bottomNavigationBar: _navigationBottom(context),
      ),
    );
  }

  Widget _pageStorage() {
    return PageStorage(
      child: currentScreen,
      bucket: bucket,
    );
  }

  Widget _navigationBottom(context) {
    var _media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = DashboardPage(
                          changePage: () {
                            setState(() {
                              currentScreen = HistoryPage();
                              currentTab = 1;
                            });
                          },
                        );
                        currentTab = 0;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            size: 30.0,
                            color: currentTab == 0
                                ? AppColors.primaryColor
                                : AppColors.g25Color,
                          ),
                          Text(S.of(context).navHomeHomeText,
                              style: AppTextStyles.caption2.copyWith(
                                  color: currentTab == 0
                                      ? AppColors.primaryColor
                                      : AppColors.g25Color)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = HistoryPage();
                        currentTab = 1;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.format_list_bulleted,
                            size: 30.0,
                            color: currentTab == 1
                                ? AppColors.primaryColor
                                : AppColors.g25Color,
                          ),
                          Text(S.of(context).navHomeMovementsText,
                              style: AppTextStyles.caption2.copyWith(
                                  color: currentTab == 1
                                      ? AppColors.primaryColor
                                      : AppColors.g25Color)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
                      child: Text(S.of(context).navHomeSaveMoneyText,
                          style: AppTextStyles.caption2
                              .copyWith(color: AppColors.g25Color)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 2;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 30.0,
                            color: currentTab == 2
                                ? AppColors.primaryColor
                                : AppColors.g25Color,
                          ),
                          Text(S.of(context).navHomeProfileText,
                              style: AppTextStyles.caption2.copyWith(
                                  color: currentTab == 2
                                      ? AppColors.primaryColor
                                      : AppColors.g25Color)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _menuBottom(context);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.more_horiz,
                            size: 30.0,
                            color: AppColors.g25Color,
                          ),
                          Text(S.of(context).navHomeMoreOptionsText,
                              style: AppTextStyles.caption2
                                  .copyWith(color: AppColors.g25Color)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          child: Container(
            height: 75,
            width: _media.width,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
          ),
          maintainInteractivity: false,
          maintainSize: false,
          maintainState: false,
          visible: _isVisible,
        ),
      ],
    );
  }

  void _menuBottom(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                color: AppColors.menuBottomColor,
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 76.0,
                        height: 3,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.assignment_ind,
                            size: 24.0,
                            color: AppColors.successColor,
                          ),
                          title: Text(
                            S.of(context).bottomSheetMyAccount,
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          onTap: () async {
                            await getIt<IFireBaseEventLogger>().menuMyAccount();

                            ExtendedNavigator.rootNavigator
                                .pushNamed(Routes.myAccountPage);
                          }),
                      ListTile(
                        leading: Icon(
                          Icons.account_balance_wallet,
                          size: 24.0,
                          color: AppColors.successColor,
                        ),
                        title: Text(
                          S.of(context).bottomSheetMyWallet,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onTap: () async {
                          
                          await getIt<IFireBaseEventLogger>().menuMyWallet();

                          ExtendedNavigator.rootNavigator
                              .pushReplacementNamed(Routes.myWalletPageMX);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.insert_drive_file,
                          size: 24.0,
                          color: AppColors.successColor,
                        ),
                        title: Text(
                          S.of(context).bottomSheetExtracts,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onTap: () async {
                          
                          await getIt<IFireBaseEventLogger>().menuExtractDocuments();

                          ExtendedNavigator.rootNavigator
                              .pushNamed(Routes.extractsPage);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.assignment,
                          size: 24.0,
                          color: AppColors.successColor,
                        ),
                        title: Text(
                          S.of(context).bottomSheetTerms,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onTap: () async {
                          
                          await getIt<IFireBaseEventLogger>().menuTermsConditions();

                          ExtendedNavigator.rootNavigator
                              .pushNamed(Routes.termsAndConditions);
                        },
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.help_outline,
                            size: 24.0,
                            color: AppColors.successColor,
                          ),
                          title: Text(
                            S.of(context).bottomSheetHelp,
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          onTap: () async {
                            
                            await getIt<IFireBaseEventLogger>().menuHelp();

                            ExtendedNavigator.rootNavigator
                                .pushNamed(Routes.helpPage);
                          }),
                      ListTile(
                        leading: Icon(
                          Icons.perm_device_information,
                          size: 24.0,
                          color: AppColors.successColor,
                        ),
                        title: Text(
                          S.of(context).bottomSheetAbout,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onTap: () async {
                          
                          await getIt<IFireBaseEventLogger>().menuAboutUalet();

                          ExtendedNavigator.rootNavigator
                              .pushReplacementNamed(Routes.aboutUaletPage);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          size: 24.0,
                          color: AppColors.borderSwiper,
                        ),
                        title: Text(
                          S.of(context).bottomSheetLogout,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black.withOpacity(0.4),
                            barrierDismissible: true,
                            barrierLabel: "Label",
                            transitionDuration: Duration(milliseconds: 600),
                            pageBuilder: (ctx, anim1, anim2) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: SignOutDialog(
                                  buttonAcceptText: S.of(context).goBack,
                                  buttonRejectText: S.of(context).yesSignOut,
                                  reject: () {
                                    getIt<SharedPreferences>().token = null;
                                    ExtendedNavigator.rootNavigator
                                        .pushNamedAndRemoveUntil(
                                      Routes.onBoardingPage,
                                      (route) => false,
                                    );
                                  },
                                  accept: () {
                                    ExtendedNavigator.rootNavigator.pop();
                                  },
                                ),
                              );
                            },
                            transitionBuilder: (ctx, anim1, anim2, child) {
                              return SlideTransition(
                                position: Tween(
                                        begin: Offset(0, 1),
                                        end: Offset(0, 0.36))
                                    .animate(anim1),
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        height: AppDimens.layoutSpacerM,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _buttonNavigation(context) {
    return _isVisible
        ? FloatingBottom(
            color: AppColors.whiteColor,
            background: AppColors.whiteColor,
            width: 60.0,
            height: 60.0,
            icon: Icon(
              Icons.clear,
              color: AppColors.g25Color,
            ),
            onClick: !widget.blocked
                ? () {
                    if (animationController.isCompleted) {
                      setState(() {
                        _isVisible = false;
                      });
                      animationController.reverse();
                    } else {
                      setState(() {
                        _isVisible = true;
                      });
                      animationController.forward();
                    }
                  }
                : null,
          )
        : FloatingBottom(
            color: AppColors.whiteColor,
            background:
                !widget.blocked ? AppColors.primaryColor : AppColors.greyColor,
            width: 60.0,
            height: 60.0,
            icon: Icon(Icons.attach_money, size: 35.0),
            onClick: !widget.blocked
                ? () {
                    print(widget.blocked);
                    if (animationController.isCompleted) {
                      setState(() {
                        _isVisible = false;
                      });
                      animationController.reverse();
                    } else {
                      setState(() {
                        _isVisible = true;
                      });
                      animationController.forward();
                    }
                  }
                : () {
                    print(widget.blocked);
                    print("Blocked");
                    ToastHelper.createError(
                            message: S.of(context).accountBlocked,
                            duration: Duration(seconds: 3))
                        .show(context);
                  },
          );
  }
}
