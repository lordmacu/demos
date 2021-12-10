import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ICustomerLevelRepoMx)
class CustomerLevelRepository implements ICustomerLevelRepoMx {
  static const int SPLASH = 0;
  static const int PERFILAMIENTO_MX = 17;
  static const int CREACION_META_1 = 18;
  static const int HOME = 19;
  static const int TU_IDENTIDAD_DOCUMENTO = 1;
  static const int TU_IDENTIDAD_DOMICILIO = 2;
  static const int ENTREVISTA = 21;
  static const int INVESTING_DONE = 7;

  final Dio _dio;

  final String api = "/User/updateCustomerlvl/";
  final String apiGetLevel = "/User/CustomerLevel";

  CustomerLevelRepository(this._dio);

  @override
  Future<Either<BaseFailure, bool>> updateCustomerLevel(int level) async {
    if (getIt<IEnv>().isColombia()) return right(true);
    try {
      var currentLevel =
          (await getCurrentCustomerLevel()).fold((l) => -3, (r) => r);
      if (currentLevel == -3) return left(BaseFailure.unexpected());
      if (currentLevel == INVESTING_DONE) return right(true);
      var response = await _dio.get("$api$level");
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, int>> getCurrentCustomerLevel() async {
    try {
      var response = await _dio.get(apiGetLevel);
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(response.data['Data']['Level']);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  redirect() async {
    var status = await getCurrentCustomerLevel();
    int level = -3;
    status.fold((l) => level = -4, (r) => level = r);
    print("====================================================");
    print("Redirect customer level MX: $level");
    print("====================================================");

    SharedPreferences _prefs = getIt<SharedPreferences>();
    switch (level) {
      case CustomerLevelRepository.SPLASH:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.successInfoPage);
        break;

      case CustomerLevelRepository.PERFILAMIENTO_MX:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.investingIntroPage,
        );
        break;
      case CustomerLevelRepository.CREACION_META_1:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.investingIntroPage,
        );
        break;
      case CustomerLevelRepository.HOME:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOCUMENTO:
         try {
          ExtendedNavigator.rootNavigator.pushNamed(
              Routes.investingVerificationOverviewMx,
              arguments: InvestingVerificationOverviewMxArguments(
                  check1: true,
                  check2: false,
                  goal: DashboardGoal.empty(),
                  bankTransfer: false,
                  bankTransferValue: 0,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  goals: List<DashboardGoal>.empty(),
                  multiple: false));
        } catch (e) {}
        break;

        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO:
         try {
          ExtendedNavigator.rootNavigator.pushNamed(
              Routes.investingVerificationOverviewMx,
              arguments: InvestingVerificationOverviewMxArguments(
                  check1: true,
                  check2: true,
                  goal: DashboardGoal.empty(),
                  bankTransfer: false,
                  bankTransferValue: 0,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  goals: List<DashboardGoal>.empty(),
                  multiple: false));
        } catch (e) {}
        break;
      case CustomerLevelRepository.ENTREVISTA:
        try {
          ExtendedNavigator.rootNavigator.pushNamed(
              Routes.investingVerificationOverviewMx,
              arguments: InvestingVerificationOverviewMxArguments(
                  check1: true,
                  check2: true,
                  goal: DashboardGoal.empty(),
                  bankTransfer: false,
                  bankTransferValue: 0,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  goals: List<DashboardGoal>.empty(),
                  multiple: false));
        } catch (e) {}
        break;
      case CustomerLevelRepository.INVESTING_DONE:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case -4:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.loginPage);
        break;
      default:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
    }
  }
}
