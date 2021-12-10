// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/myaccount/account_bloc.dart';
import 'infrastructure/myaccount/account_repository.dart';
import 'application/my_wallet/bank_delete/bankdelete_bloc.dart';
import 'application/beneficiaries/beneficiaries_bloc.dart';
import 'infrastructure/beneficiaries/beneficiaries_repo.dart';
import 'application/myaccount/changeinfo/change_info_bloc.dart';
import 'infrastructure/core/core_injectable_module.dart';
import 'infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'infrastructure/customerLevel/customer_level_repo.dart';
import 'application/dashboard/dashboard_bloc.dart';
import 'infrastructure/dashboard/dashboard_repository.dart';
import 'application/edit_debit/edit_debit_bloc.dart';
import 'application/goals/edit_goal/edit_goals_bloc.dart';
import 'application/extract/extract_bloc.dart';
import 'infrastructure/extract/extract_repository.dart';
import 'to_be_refactor/services/extracts/extracts_service.dart';
import 'application/faq/faq_bloc.dart';
import 'infrastructure/faq/faq_repository.dart';
import 'application/goals/goals_bloc.dart';
import 'infrastructure/goals/goals_repository.dart';
import 'application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'application/investing_grandes_montos/watcher/grandes_montos_watcher_bloc.dart';
import 'application/history/history_bloc.dart';
import 'infrastructure/history/history_repository.dart';
import 'infrastructure/hubsPot/hubs_pot_repo.dart';
import 'domain/myaccount/i_account_repository.dart';
import 'infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'domain/beneficiaries/i_beneficiaries_repo.dart';
import 'domain/customer_level/i_customer_level_repo_col.dart';
import 'domain/customer_level/i_customer_level_repo.dart';
import 'domain/dashboard/i_dashbboard_repository.dart';
import 'infrastructure/core/core_current_env.dart';
import 'domain/extract/i_extract_repository.dart';
import 'domain/faq/i_faq_repository.dart';
import 'infrastructure/facebook/facebook_event_logger.dart';
import 'infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'domain/goals/i_goals_repository.dart';
import 'domain/history/i_history_repository.dart';
import 'domain/hubs_pot/i_hubs_pot_repo.dart';
import 'domain/identification/i_identification_repository.dart';
import 'domain/investing/i_investing_repository.dart';
import 'domain/investing/i_investing_repository_mx.dart';
import 'domain/my_wallet/i_my_wallet_repository.dart';
import 'domain/notifications/i_notifications_repository.dart';
import 'domain/portfolio/i_portfolio_repository.dart';
import 'domain/profiling/i_profiling_mx_repository.dart';
import 'domain/profiling/i_profiling_repository.dart';
import 'domain/register/i_register_repository.dart';
import 'domain/sarlaft/i_sarlaft_repository.dart';
import 'domain/support/i_support_message_repository.dart';
import 'domain/terms/i_terms_repository.dart';
import 'domain/user_migration/i_user_migration_repository.dart';
import 'domain/user_verification/i_user_verification_repository.dart';
import 'domain/videosender/i_video_sender_repository.dart';
import 'domain/withdrawalMX/i_withdrawal_repository.dart';
import 'infrastructure/identification/identification_repo_mx.dart';
import 'application/investingMX/investing_choose_goal/investing_choose_goal_bloc.dart';
import 'application/investingMX/investingDom/investing_dom_bloc.dart';
import 'application/investingMX/investingMxDocAccept/investing_mx_doc_accept_bloc.dart';
import 'application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'application/investingMX/investingIdVerification/investing_mx_id_verification_bloc.dart';
import 'application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'infrastructure/investing/investing_repo_mx.dart';
import 'infrastructure/investing/investing_repo_mx_true.dart';
import 'to_be_refactor/services/login/login_service.dart';
import 'application/my_wallet/my_wallet_bloc.dart';
import 'infrastructure/my_wallet/my_wallet_repository.dart';
import 'to_be_refactor/services/notification/notification_service.dart';
import 'application/notifications/notifications_bloc.dart';
import 'infrastructure/push_notifications/notifications_repository.dart';
import 'infrastructure/profiling/profiling_mx_repository.dart';
import 'infrastructure/profiling/profiling_repository.dart';
import 'application/portfolio/portfolio_bloc.dart';
import 'infrastructure/portfolio/portfolio_repository.dart';
import 'application/profiling/profiling_form/profiling_form_bloc.dart';
import 'to_be_refactor/services/profiling/profiling_service.dart';
import 'application/profiling/profiling_watcher/profiling_watcher_bloc.dart';
import 'infrastructure/push_notifications/push_notifications_provider.dart';
import 'application/register/register_bloc.dart';
import 'infrastructure/register/register_repository.dart';
import 'to_be_refactor/services/register/register_service.dart';
import 'infrastructure/sarlaft/sarlaft_repository.dart';
import 'to_be_refactor/services/index/splash_service.dart';
import 'application/support/support_form_bloc.dart';
import 'infrastructure/support/support_repository.dart';
import 'application/terms/terms_bloc.dart';
import 'infrastructure/terms/terms_repository.dart';
import 'application/user_migration/user_migration_bloc.dart';
import 'infrastructure/user_migration/user_migration_repository.dart';
import 'application/user_verification/user_verification_bloc.dart';
import 'infrastructure/user_verification/user_verification_repository.dart';
import 'infrastructure/videosender/video_sender_repository.dart';
import 'application/withdrawalMX/withdrawal_bloc.dart';
import 'application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'infrastructure/withdrawalMX/withdrawal_repository.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';
const _prodReplica = 'prodReplica';
const _dev_mx = 'dev_mx';
const _prod_mx = 'prod_mx';
const _test = 'test';
const _test_mx = 'test_mx';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  gh.lazySingleton<Dio>(() => coreInjectableModule.dioDev, registerFor: {_dev});
  gh.lazySingleton<Dio>(() => coreInjectableModule.dio, registerFor: {_prod});
  gh.lazySingleton<Dio>(() => coreInjectableModule.dioReplica,
      registerFor: {_prodReplica});
  gh.lazySingleton<Dio>(() => coreInjectableModule.dioDevMx,
      registerFor: {_dev_mx});
  gh.lazySingleton<Dio>(() => coreInjectableModule.dioPrevMx,
      registerFor: {_prod_mx});
  gh.factory<EditDebitBloc>(() => EditDebitBloc());
  gh.lazySingleton<ExtractsService>(() => ExtractsService(get<Dio>()));
  gh.factory<GrandesMontosDataBloc>(() => GrandesMontosDataBloc());
  gh.lazySingleton<IAppsFlyerEventLogger>(() => AppsFlyerEventLoggerMX());
  gh.lazySingleton<IBeneficiariesRepo>(() => BeneficiariesRepo(get<Dio>()));
  gh.lazySingleton<ICustomerLevelRepoCol>(
      () => CustomerLevelRepositoryCol(get<Dio>()));
  gh.lazySingleton<ICustomerLevelRepoMx>(
      () => CustomerLevelRepository(get<Dio>()));
  gh.lazySingleton<IExtractsRepository>(() => ExtractsRepository(get<Dio>()));
  gh.lazySingleton<IFacebookEventLogger>(() => FacebookEventLogger(),
      registerFor: {_dev, _prod, _prodReplica});
  gh.lazySingleton<IFacebookEventLogger>(() => FacebookEventLoggerDeact(),
      registerFor: {_dev_mx, _prod_mx, _test_mx});
  gh.lazySingleton<IFireBaseEventLogger>(() => FireBaseEventLogger(),
      registerFor: {_dev, _prod, _dev_mx, _prodReplica});
  gh.lazySingleton<IGoalsRepository>(() => GoalsRepository(get<Dio>()));
  gh.lazySingleton<IHistoryRepository>(() => HistoryRepository(get<Dio>()));
  gh.lazySingleton<IHubsPotRepo>(() => HubsPotRepo(get<Dio>()));
  gh.lazySingleton<IInvestingRepository>(
      () => InvestingRepositoryMx(get<Dio>()));
  gh.lazySingleton<IMyWalletRepository>(() => MyWalletRepository(get<Dio>()));
  gh.lazySingleton<IPortfolioRepository>(() => PortfolioRepository(get<Dio>()));
  gh.lazySingleton<IProfilingRepository>(() => ParamsRepository(get<Dio>()));
  gh.lazySingleton<ISarlaftRepository>(() => SarlaftRepository(get<Dio>()));
  gh.lazySingleton<ISupportMessageRepository>(
      () => SupportMessageRepository(get<Dio>()));
  gh.lazySingleton<ITermsRepository>(() => TermsRepository(get<Dio>()));
  gh.lazySingleton<IUserVerificationRepository>(
      () => UserVerificationRepository(get<Dio>()));
  gh.lazySingleton<IVideoSenderRepository>(
      () => VideoSenderRepository(get<Dio>()));
  gh.factory<InvestingChooseGoalBloc>(() => InvestingChooseGoalBloc());
  gh.factory<InvestingDomBloc>(
      () => InvestingDomBloc(get<IInvestingRepository>()));
  gh.factory<InvestingMxDocAcceptBloc>(() => InvestingMxDocAcceptBloc());
  gh.factory<InvestingMxIdVerificationBloc>(
      () => InvestingMxIdVerificationBloc());
  gh.factory<InvestingMxMainBloc>(
      () => InvestingMxMainBloc(get<IInvestingRepository>()));
  gh.factory<MyWalletBloc>(() => MyWalletBloc(get<IMyWalletRepository>()));
  final packageInfo = await coreInjectableModule.packageInfo;
  gh.factory<PackageInfo>(() => packageInfo);
  gh.factory<PortfolioBloc>(() => PortfolioBloc(get<IPortfolioRepository>()));
  gh.lazySingleton<ProfilingService>(() => ProfilingService(get<Dio>()));
  gh.lazySingleton<RegisterService>(() => RegisterService(get<Dio>()));
  final sharedPreferences = await coreInjectableModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SplashService>(
      () => SplashService(get<SharedPreferences>(), get<Dio>()));
  gh.factory<String>(() => coreInjectableModule.tuIdentidadApiKey,
      instanceName: 'TuIdentidadApiKey');
  gh.factory<SupportFormBloc>(
      () => SupportFormBloc(get<ISupportMessageRepository>()));
  gh.factory<TermsBloc>(() => TermsBloc(get<ITermsRepository>()));
  gh.factory<UserVerificationBloc>(() => UserVerificationBloc(
      get<IUserVerificationRepository>(), get<IHubsPotRepo>()));
  gh.factory<BankdeleteBloc>(() => BankdeleteBloc(get<IMyWalletRepository>()));
  gh.factory<BeneficiariesBloc>(
      () => BeneficiariesBloc(get<IBeneficiariesRepo>()));
  gh.factory<ExtractBloc>(() => ExtractBloc(get<IExtractsRepository>()));
  gh.factory<GrandesMontosWatcherBloc>(() => GrandesMontosWatcherBloc(
        get<IInvestingRepository>(),
        get<IUserVerificationRepository>(),
        get<ISarlaftRepository>(),
      ));
  gh.factory<HistoryBloc>(() => HistoryBloc(get<IHistoryRepository>()));
  gh.lazySingleton<IAccountRepository>(
      () => AccountRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IDashboardRepository>(
      () => DashboardRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IFAQRepository>(
      () => FAQRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IIdentificationRepository>(
      () => IdentificationRepositoryMx(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IInvestingRepositoryMx>(
      () => InvestingRepositoryMxTrue(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<INotificationsRepository>(
      () => NotificationsRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IProfilingMxRepository>(
      () => ParamsMxRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IRegisterRepository>(
      () => RegisterRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IUserMigrationRepository>(
      () => UserMigrationRepository(get<Dio>(), get<SharedPreferences>()));
  gh.lazySingleton<IWithdrawalRepository>(
      () => WithdrawalRepository(get<Dio>(), get<SharedPreferences>()));
  gh.factory<InvestingMxDomBloc>(
      () => InvestingMxDomBloc(get<IInvestingRepositoryMx>()));
  gh.lazySingleton<LoginService>(
      () => LoginService(get<SharedPreferences>(), get<Dio>()));
  gh.lazySingleton<NotificationService>(
      () => NotificationService(get<SharedPreferences>(), get<Dio>()));
  gh.factory<NotificationsBloc>(
      () => NotificationsBloc(get<INotificationsRepository>()));
  gh.factory<ProfilingFormBloc>(
      () => ProfilingFormBloc(get<IProfilingMxRepository>()));
  gh.factory<ProfilingWatcherBloc>(
      () => ProfilingWatcherBloc(get<IProfilingMxRepository>()));
  gh.factory<RegisterBloc>(() => RegisterBloc(
        get<IRegisterRepository>(),
        get<LoginService>(),
        get<SharedPreferences>(),
      ));
  gh.factory<UserMigrationBloc>(
      () => UserMigrationBloc(get<IUserMigrationRepository>()));
  gh.factory<WithdrawalBloc>(
      () => WithdrawalBloc(get<IWithdrawalRepository>()));
  gh.factory<WithdrawalFormBloc>(
      () => WithdrawalFormBloc(get<IWithdrawalRepository>()));
  gh.factory<AccountBloc>(() => AccountBloc(get<IAccountRepository>()));
  gh.factory<ChangeInfoBloc>(() => ChangeInfoBloc(get<IAccountRepository>()));
  gh.factory<DashboardBloc>(() => DashboardBloc(get<IDashboardRepository>()));
  gh.factory<EditGoalsBloc>(() =>
      EditGoalsBloc(get<IGoalsRepository>(), get<IWithdrawalRepository>()));
  gh.factory<FAQBloc>(() => FAQBloc(get<IFAQRepository>()));
  gh.factory<GoalsBloc>(() => GoalsBloc(
        get<IGoalsRepository>(),
        get<ICustomerLevelRepoMx>(),
        get<IUserMigrationRepository>(),
      ));

  // Eager singletons must be registered in the right order
  gh.singleton<IEnv>(EnvCol(), registerFor: {_dev, _prod, _test, _prodReplica});
  gh.singleton<IEnv>(EnvMx(), registerFor: {_dev_mx, _prod_mx, _test_mx});
  gh.singleton<PushNotificationsProvider>(PushNotificationsProvider(),
      registerFor: {_prod, _prod_mx, _prodReplica});
  gh.singleton<PushNotificationsProvider>(PushNotificationProviderDev(),
      registerFor: {_dev, _dev_mx});
  return get;
}

class _$CoreInjectableModule extends CoreInjectableModule {}
