import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';

class EnvironmentConfig {
  static const String apiEndpoint = '';
  static String cdnUrl =
      'https://cdn.banlinea.com/banlinea-products/UALET/V2.0';
  static String pseUrl =
      'https://pagosqa.ualet.com/Payments/PaymentConfirm/MzI2NDZ8OTE1Mzk4MTQ=';
  
  static double minMoneyValue = getIt<IEnv>().isColombia() ? 250000.0 : 100.00;
  static double bankCommission = getIt<IEnv>().isColombia() ? 1600 : 10;
  static double bankCommissionDebit = getIt<IEnv>().isColombia() ? 950 : 10;
  static double minGoalMoneyValue = getIt<IEnv>().isColombia() ? 10000 : 100.00;
  static double minGoalFeeValue = getIt<IEnv>().isColombia() ? 9900 : 10;
  static double minGoalAssignValue = getIt<IEnv>().isColombia() ? 10000 : 100;
  static double minGoalCuotaValue = getIt<IEnv>().isColombia() ? 10000 : 100;
  static String urlCalendly = 'https://calendly.com/mherrera-21/videollamda-ualet?month=2021-06';
}

class VersionUalet {
  static String versionAndroid = '2.0';
  static String versioniOS = '2.0';
}

