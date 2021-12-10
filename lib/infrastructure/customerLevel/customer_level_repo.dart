import 'dart:convert';

import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/customer_level/redirection_item.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
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

@LazySingleton(as: ICustomerLevelRepoCol)
class CustomerLevelRepositoryCol implements ICustomerLevelRepoCol {
  static const int SPLASH = 0;
  static const int PERFILAMIENTO = 17;
  static const int CREACION_META_1 = 18;
  static const int HOME = 19;
  static const int BLOQUEADO_LISTA_RESTRICTIVA = -1;
  static const int BLOQUEADO_REGISTRADURIA = -2;
  static const int PASA_REGISTRADURIA = 1;
  static const int EVIDENTE_EXITOSO = 2;
  static const int EVIDENTE_AFIN = 3;
  static const int VINCULADO_SIMPLE = 7;
  static const int SARLAFT = 6;
  static const int MOSTRAR_EVIDENTE = 8;
  static const int MOSTRAR_SARLAFT = 4;
  static const int CARGUE_DOCUMENTOS = 10;
  static const int MOSTRAR_REGISTRADURIA = 9;

  final Dio _dio;

  final String apiLevel = "/User/updateCustomerlvl/";
  final String apiRedirect = "/User/VerifyTheInvestment/";
  final String apiGetLevel = "/User/CustomerLevel";
  final String apiGetBlackListConsult = "/User/ValidBlackListConsult";

  CustomerLevelRepositoryCol(this._dio);

  Future<Either<BaseFailure, bool>> updateCustomerLevel(int level) async {
    if (!getIt<IEnv>().isColombia()) return right(true);
    print("____________________________________________________");
    print("update customer level: $level");
    print("____________________________________________________");
    try {
      var response = await _dio.get("$apiLevel$level");
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

  @override
  Future<Either<BaseFailure, bool>> getValidBlackListConsult() async {
    try {
      var response = await _dio.get(apiGetBlackListConsult);
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(response.data['IsValid']);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  redirect() async {
    var status = await getCurrentCustomerLevel();
    var consultValidBlackList = await getValidBlackListConsult();

    int level = -3;
    bool validValueBlackList = false;

    status.fold((l) => level = -4, (r) => level = r);
    consultValidBlackList.fold(
        (l) => validValueBlackList = false, (r) => validValueBlackList = r);

    print("====================================================");
    print("Redirect customer level COL: $level");
    print("====================================================");

    switch (level) {
      case SPLASH:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.successInfoPage);
        break;
      case PERFILAMIENTO:
        // ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.goalsVideo);
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.homePage,
        );
        break;
      case CREACION_META_1:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.homePage,
        );
        break;
      case HOME:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.homePage,
        );
        break;
      case BLOQUEADO_LISTA_RESTRICTIVA:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage,
            arguments: HomePageArguments(blocked: true));
        break;
      case BLOQUEADO_REGISTRADURIA:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage,
            arguments: HomePageArguments(blocked: true));
        break;
      case PASA_REGISTRADURIA:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      // ExtendedNavigator.rootNavigator.pushReplacementNamed(
      //     Routes.evidenteVerification,
      //     arguments: EvidenteVerificationArguments(redirectHome: true));
      // break;
      case MOSTRAR_EVIDENTE:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
            Routes.evidenteVerification,
            arguments: EvidenteVerificationArguments(redirectHome: true));
        break;
      case EVIDENTE_EXITOSO:
      case EVIDENTE_AFIN:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.homePage,
        );
        break;
      case VINCULADO_SIMPLE:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case SARLAFT:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CARGUE_DOCUMENTOS:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case MOSTRAR_REGISTRADURIA:
        if (validValueBlackList) {
          ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        } else {
          SharedPreferences prefs = getIt<SharedPreferences>();
          UserInfoRegistraduria info = prefs.userInfoRegistraduria;
          List countriesDyn = prefs.regCountries;

          if (info == null || countriesDyn == null) {
            print("====================================================");
            print("Redirect customer REGISTRADURIA BUT WITHOUT DATA");
            print("====================================================");
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.introVerificationForm,
                arguments: IntroVerificationFormArguments(redirectHome: true));
          } else {
            print("====================================================");
            print("Redirect customer REGISTRADURIA WITH PRELOADED DATA");
            print("====================================================");
            List<String> countries =
                countriesDyn.map<String>((e) => e.toString()).toList();
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.verificationForm,
                arguments: VerificationFormArguments(
                    info: info, countries: countries, redirectHome: true));
          }
        }

        break;
      case -4:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.loginPage);
        break;
      default:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.loginPage);
    }
  }

  @override
  Future<Either<BaseFailure, bool>> setAfterHome() async {
    var response = await getCurrentCustomerLevel();
    bool error = false;
    response.fold((l) => null, (r) {
      if (r == PERFILAMIENTO || r == CREACION_META_1) {
        error = false;
      } else {
        error = true;
        print("INVALID UPDATE: CURRENT LEVEL IS NOT PERFILAMIENTO or META_1");
      }
    });
    if (error) return right(true);
    return await updateCustomerLevel(HOME);
  }

  @override
  Future<Either<BaseFailure, bool>> setAfterMeta() async {
    var response = await getCurrentCustomerLevel();
    bool error = false;
    response.fold((l) => null, (r) {
      if (r == PERFILAMIENTO || r == CREACION_META_1) {
        error = false;
      } else {
        error = true;
        print("INVALID UPDATE: CURRENT LEVEL IS NOT PERFILAMIENTO or META_1");
      }
    });
    if (error) return right(true);
    return await updateCustomerLevel(CREACION_META_1);
  }

  @override
  Future<Either<BaseFailure, bool>> setAfterPassword() async {
    return await updateCustomerLevel(SPLASH);
  }

  @override
  Future<Either<BaseFailure, bool>> setAfterPerfilamiento() async {
    return await updateCustomerLevel(PERFILAMIENTO);
  }

  @override
  Future<Either<BaseFailure, RedirectionItem>> verifyNextRedirection(
      double investment) async {
    print("====================================================");
    print("Verify Next Redirection");
    print("====================================================");
    try {
      var map = {
        'Amount': investment,
        'Action': 2,
      };
      var response = await _dio.post(apiRedirect, data: json.encode(map));
      if (!response.data["Result"]) {
        print("Result False");
        return right(RedirectionItem(
          customerLevel: 0,
          // customerLevel: CARGUE_DOCUMENTOS,
          forceRedirect: false,
          message: "",
          title: '',
        ));
      }
      if (!response.data['Data']['ForceRedirectToForm']) {
        print("forced false");
        return right(RedirectionItem(
          customerLevel: 0,
          // customerLevel: CARGUE_DOCUMENTOS,
          forceRedirect: false,
          message: "",
          title: '',
        ));
      }
      var data = response.data['Data'];
      var r = RedirectionItem(
        customerLevel: data['CustomerLevel'],
        // customerLevel: CARGUE_DOCUMENTOS,
        forceRedirect: data['ForceRedirectToForm'],
        message: data['Message'],
        title: data['Title'],
      );
      return right(r);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
