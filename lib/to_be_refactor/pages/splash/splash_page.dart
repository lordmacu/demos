import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/register_restore_observer.dart';
import 'package:ualet/to_be_refactor/models/index/app_configuration_response_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/models/generic/table_model.dart';
import 'package:ualet/to_be_refactor/preferences/parameter.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:ualet/to_be_refactor/providers/controller/sqliteHelper.dart';
import 'package:ualet/to_be_refactor/services/index/splash_service.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/utils/extensions/build_context_x.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _versionAplication;
  final _preferenceUser = PreferenceUser();

  @override
  void initState() {
    super.initState();
    _preferenceUser.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Platform.isAndroid) {
      setState(() {
        PackageInfo packageInfo = getIt<PackageInfo>();
        _versionAplication = packageInfo.version;
      });
    } else if (Platform.isIOS) {
      setState(() {
        PackageInfo packageInfo = getIt<PackageInfo>();
        _versionAplication = packageInfo.version;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppConfigurationResponseModel>(
        future: _appConfiguration(context),
        builder:
            (context, AsyncSnapshot<AppConfigurationResponseModel> snapshot) {
          if (snapshot.hasData) {
            AppConfigurationResponseModel data = snapshot.data;
            PackageInfo packageInfo = getIt<PackageInfo>();

            Timer(Duration(seconds: 3), () async {
              await _preferenceUser.init();
              SharedPreferences _prefs = getIt<SharedPreferences>();

              if (data.data.updating) {
                ExtendedNavigator.rootNavigator
                    .pushReplacementNamed(Routes.maintenancePage);
                return;
              } else {
                if (_prefs.isMigrating) {
                  _prefs.isMigrating = false;
                  ExtendedNavigator.rootNavigator
                      .pushReplacementNamed(Routes.loginPage);
                  return;
                }

              if (packageInfo.version != null && data.data.currentVersion != null) {
                if (double.parse(packageInfo.version) < double.parse(data.data.currentVersion)) {
                  ExtendedNavigator.rootNavigator
                      .pushReplacementNamed(Routes.updateAppPage);
                } else {
                  if (getIt<SharedPreferences>().token.isNotEmpty) {
                    var isColombia = getIt<IEnv>().isColombia();
                    if (isColombia)
                      return await getIt<ICustomerLevelRepoCol>().redirect();
                    else
                      return await getIt<ICustomerLevelRepoMx>().redirect();
                  } else {
                    return _resumeRegister();
                  }
                }
              } else {
                if (getIt<SharedPreferences>().token.isNotEmpty) {
                  var isColombia = getIt<IEnv>().isColombia();
                  if (isColombia)
                    return await getIt<ICustomerLevelRepoCol>().redirect();
                  else
                    return await getIt<ICustomerLevelRepoMx>().redirect();
                } else {
                  return _resumeRegister();
                }
              }
              }
            });

            if (getIt<IEnv>().isColombia()) {
              return Scaffold(
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    SplashBackgroundWidget(
                        ualetsplash: 'assets/images/logo.png'),
                    SplashVigiladoWidget(
                        vigiladosplash: 'assets/images/vigilado.png'),
                    SplashCopyrigthWidget(
                        versionAplication: _versionAplication,
                        copyrightsplash: 'Copyright 2020 UALET'),
                  ],
                ),
              );
            } else {
              return Scaffold(
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    SplashBackgroundWidget(
                        ualetsplash: 'assets/images/logo.png'),
                    SplashCopyrigthWidget(
                        versionAplication: _versionAplication,
                        copyrightsplash: 'Copyright 2020 UALET'),
                    SplashScandiaWidget()
                  ],
                ),
              );
            }
          } else {
            return LoadingInProgressOverlay(isLoading: true);
          }
        });
  }

  Future<AppConfigurationResponseModel> _appConfiguration(
      BuildContext context) async {
    AppConfigurationResponseModel dataConfig;
    dataConfig = await getIt<SplashService>().appConfiguration();
    return dataConfig;
  }

  void _resumeRegister() async {
    var activeRoute = _preferenceUser.activeRoute;
    var params = resumeRegisterArgumentsMap();
    if (activeRoute == null ||
        !RegisterRestoreObserver.CheckRestore(_preferenceUser.activeRoute)) {
      ExtendedNavigator.rootNavigator
          .pushReplacementNamed(Routes.onBoardingPage);
      return;
    }
    ExtendedNavigator.rootNavigator
        .pushReplacementNamed(activeRoute, arguments: params);
  }

  Object resumeRegisterArgumentsMap() {
    if (_preferenceUser.activeRouteParams == null) return null;
    var arguments = _preferenceUser.activeRouteParams;
    switch (_preferenceUser.activeRoute) {
      case Routes.sendEmailRegisterPage:
        return emailFromJson(arguments);
      case Routes.sendOTPRegisterPage:
        return otpFromJson(arguments);
    }
  }

  emailFromJson(Map<String, dynamic> json) {
    return SendEmailRegisterPageArguments(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      acceptedTerms: json['acceptedTerms'],
      acceptedPrivacy: json['acceptedPrivacy']
    );
  }

  Map<String, dynamic> emailToJson(SendEmailRegisterPageArguments a) {
    return {
      'name': a.name,
      'email': a.email,
      'phoneNumber': a.phoneNumber,
      'acceptedTerms': a.acceptedTerms,
    };
  }

  otpFromJson(Map<String, dynamic> json) {
    return SendOTPRegisterPageArguments(
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        acceptedTerms: json['acceptedTerms'],
        acceptedPrivacy: json['acceptedPrivacy'],
        recoverPassword: json['recoverPassword']);


  }

  Map<String, dynamic> otpToJson(SendOTPRegisterPageArguments a) {
    return {
      'name': a.name,
      'email': a.email,
      'phoneNumber': a.phoneNumber,
      'acceptedTerms': a.acceptedTerms,
      'recoverPassword': a.recoverPassword,
    };
  }

  void redirectNavigation(int customerLevel) {
    print("===================================================");
    print("REDIRECT NAVIGATION WITH CUSTOMER LEVEL: $customerLevel");
    print("===================================================");
    SharedPreferences _prefs = getIt<SharedPreferences>();

    switch (customerLevel) {
      case CustomerLevelRepository.SPLASH:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.successInfoPage);
        break;

      case CustomerLevelRepository.PERFILAMIENTO_MX:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.goalsVideo,
        );
        break;
      case CustomerLevelRepository.CREACION_META_1:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CustomerLevelRepository.HOME:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOCUMENTO:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.investingVerificationOverview,
                arguments: InvestingVerificationOverviewArguments(
                  check1: true,
                  check2: false,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  bankTransfer: false,
                  bankTransferValue: 0,
                  goal: _prefs.currentInvestingGoal,
                ));
        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.investingVerificationOverview,
                arguments: InvestingVerificationOverviewArguments(
                  check1: true,
                  check2: true,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  bankTransfer: false,
                  bankTransferValue: 0,
                  goal: _prefs.currentInvestingGoal,
                ));
        break;
      case CustomerLevelRepository.INVESTING_DONE:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      default:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
    }
  }
}

class SplashCopyrigthWidget extends StatelessWidget {
  const SplashCopyrigthWidget({
    Key key,
    @required String versionAplication,
    @required this.copyrightsplash,
  })  : _versionAplication = versionAplication,
        super(key: key);

  final String _versionAplication;
  final String copyrightsplash;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: context.screenWidth(dividedBy: 1.5),
        padding: const EdgeInsets.only(bottom: 80.0),
        child: Text(
            S
                .of(context)
                .splashPageVersionLabel(_versionAplication, copyrightsplash),
            textAlign: TextAlign.center,
            style:
                AppTextStyles.caption1.copyWith(color: AppColors.whiteColor)),
      ),
    );
  }
}

class SplashScandiaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: context.screenWidth(dividedBy: 1.5),
        padding: EdgeInsets.only(bottom: 35.0),
        child: Image.asset(
          AppImages.skandiaSplashLogo,
          height: 25,
        ),
      ),
    );
  }
}

class SplashVigiladoWidget extends StatelessWidget {
  const SplashVigiladoWidget({
    Key key,
    @required this.vigiladosplash,
  }) : super(key: key);

  final String vigiladosplash;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 70),
        child: Stack(
          children: <Widget>[Image.asset(vigiladosplash, height: 150.0)],
        ),
      ),
    );
  }
}

class SplashBackgroundWidget extends StatelessWidget {
  const SplashBackgroundWidget({
    Key key,
    @required this.ualetsplash,
  }) : super(key: key);

  final String ualetsplash;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            AppColors.backgroundSplashTopColor,
            AppColors.backgroundSplashBottomColor
          ],
              stops: [
            0.3,
            0.9
          ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter)),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 100),
          child: Container(
            child: Stack(
              children: <Widget>[Image.asset(ualetsplash, width: 220.0)],
            ),
          ),
        ),
      ),
    );
  }
}
