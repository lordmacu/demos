// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ualet/to_be_refactor/pages/splash/splash_page.dart';
import 'package:ualet/to_be_refactor/pages/index/index_page.dart';
import 'package:ualet/presentation/withdrawalMX/no_account_page.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/to_be_refactor/pages/login/login_page.dart';
import 'package:ualet/to_be_refactor/pages/home/home_page.dart';
import 'package:ualet/presentation/profile/profile_page.dart';
import 'package:ualet/presentation/notifications/notifications_page.dart';
import 'package:ualet/presentation/register/register_page.dart';
import 'package:ualet/presentation/register/register_page_mx.dart';
import 'package:ualet/presentation/core/widgets/info_pages/success_info_page.dart';
import 'package:ualet/to_be_refactor/pages/goals/goalsIntroVideo.dart';
import 'package:ualet/to_be_refactor/pages/goals/goals_page.dart';
import 'package:ualet/presentation/profiling/profiling_page.dart';
import 'package:ualet/presentation/profiling/widgets/profiling_success_page.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:ualet/presentation/register/create_password_page.dart';
import 'package:ualet/to_be_refactor/pages/login/recover_password_page.dart';
import 'package:ualet/to_be_refactor/pages/login/recover_password_page_mx.dart';
import 'package:ualet/presentation/terms/terms_and_conditions_page.dart';
import 'package:ualet/to_be_refactor/pages/goals/resume_goal_page.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/presentation/home/intro_home_page.dart';
import 'package:ualet/to_be_refactor/pages/portfolio/portfolio_page.dart';
import 'package:ualet/presentation/extract/extract_page.dart';
import 'package:ualet/presentation/help/help_page.dart';
import 'package:ualet/presentation/help/widgets/support_form_page.dart';
import 'package:ualet/presentation/help/widgets/support_success_page.dart';
import 'package:ualet/presentation/about/about_ualet_page.dart';
import 'package:ualet/presentation/investing/investing_page_mx.dart';
import 'package:ualet/presentation/investing/investing_page.dart';
import 'package:ualet/presentation/myaccount/my_account_page.dart';
import 'package:ualet/presentation/help/widgets/support_account_page.dart';
import 'package:ualet/presentation/mywallet/edit_debit_page.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_email_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_password_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_phone_number_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_email_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_otp_page.dart';
import 'package:ualet/presentation/investing/investing_goal_page.dart';
import 'package:ualet/presentation/investing/investing_goal_page_mx.dart';
import 'package:ualet/presentation/investing/investing_add_bank_account_page_mx.dart';
import 'package:ualet/presentation/investing/investing_add_bank_account_page.dart';
import 'package:ualet/presentation/investing/investing_overview_page.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/presentation/investing/investing_overview_page_mx.dart';
import 'package:ualet/presentation/investing/investing_success_page.dart';
import 'package:ualet/presentation/investing/investing_success_page_mx.dart';
import 'package:ualet/presentation/investing/investing_transaction_summary_mx.dart';
import 'package:ualet/presentation/investing/investing_transaction_summary.dart';
import 'package:ualet/presentation/investing/investing_verification_overview.dart';
import 'package:ualet/presentation/investing/investing_verification_overview_mx.dart';
import 'package:ualet/presentation/investing/investing_identity_confirmation_page_mx.dart';
import 'package:ualet/presentation/investing/investing_identity_confirmation_page.dart';
import 'package:ualet/presentation/investing/investing_domicilio_confirmation_page.dart';
import 'package:ualet/presentation/register/widgets/send_email_register_page.dart';
import 'package:ualet/presentation/register/widgets/send_otp_register_page.dart';
import 'package:ualet/presentation/mygoals/my_goals_page.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:ualet/presentation/withdrawalMX/withdrawal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/choose_goal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/choose_account_page.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/sent_otp_withdrawal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/withdrawal_summary_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/success_withdrawal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/transaction_summary_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_almost_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_summary_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_summary_page_mx.dart';
import 'package:ualet/presentation/mywallet/my_wallet_page_mx.dart';
import 'package:ualet/presentation/investing/grandes_montos/investing_grandes_montos_master.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:ualet/presentation/investing/identity_verification_co/intro_verification_form.dart';
import 'package:ualet/presentation/investing/identity_verification_co/intro_evidente_verification.dart';
import 'package:ualet/presentation/investing/identity_verification_co/verification_form.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:ualet/presentation/investing/identity_verification_co/evidente_verification.dart';
import 'package:ualet/presentation/usermigration/user_migration_page.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/presentation/mygoals/edit_debit_goal.dart';
import 'package:ualet/presentation/investing/investing_choose_bank_account_page.dart';
import 'package:ualet/presentation/investing/investing_choose_bank_account_page_mx.dart';
import 'package:ualet/presentation/investing/investing_pse_webview.dart';
import 'package:ualet/presentation/mygoals/edit_goal_page.dart';
import 'package:ualet/presentation/usermigration/create_goal_migration.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/presentation/usermigration/user_migration_intro_page.dart';
import 'package:ualet/presentation/usermigration/widgets/detail_debits_page.dart';
import 'package:ualet/presentation/usermigration/widgets/goal_creation_summary.dart';
import 'package:ualet/presentation/usermigration/widgets/finished_summary_page.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender.dart';
import 'package:ualet/to_be_refactor/pages/login/dialog/close_session_page.dart';
import 'package:ualet/presentation/beneficiaries/beneficiaries_page.dart';
import 'package:ualet/presentation/updateapp/update_app_page.dart';
import 'package:ualet/presentation/core/generic_web_view.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart';
import 'package:ualet/presentation/introduction/on_boarding_page.dart';
import 'package:ualet/presentation/usermigration/new_version/migration_intro_page.dart';
import 'package:ualet/presentation/mygoals/assign_to_goal_success_page.dart';
import 'package:ualet/presentation/investing/confirmation_evidente.dart';
import 'package:ualet/presentation/introduction/maintenance_page.dart';
import 'package:ualet/presentation/investing/entrevista/entrevista_page.dart';
import 'package:ualet/presentation/investing/entrevista/entrevista_webview.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const indexPage = '/index-page';
  static const noAccountPage = '/no-account-page';
  static const loginPage = '/login-page';
  static const homePage = '/home-page';
  static const profilePage = '/profile-page';
  static const notificationsPage = '/notifications-page';
  static const registerPage = '/register-page';
  static const registerPageMX = '/register-page-mX';
  static const successInfoPage = '/success-info-page';
  static const goalsVideo = '/goals-video';
  static const goalsPages = '/goals-pages';
  static const profilingPage = '/profiling-page';
  static const profilingSuccessPage = '/profiling-success-page';
  static const createPasswordPage = '/create-password-page';
  static const recoverPasswordPage = '/recover-password-page';
  static const recoverPasswordPageMX = '/recover-password-page-mX';
  static const termsAndConditions = '/terms-and-conditions';
  static const resumeGoalPage = '/resume-goal-page';
  static const introHomePage = '/intro-home-page';
  static const portfolioPage = '/portfolio-page';
  static const extractsPage = '/extracts-page';
  static const helpPage = '/help-page';
  static const helpSupportFormPage = '/help-support-form-page';
  static const supportSuccessPage = '/support-success-page';
  static const aboutUaletPage = '/about-ualet-page';
  static const investingIntroPageMx = '/investing-intro-page-mx';
  static const investingIntroPage = '/investing-intro-page';
  static const myAccountPage = '/my-account-page';
  static const supportAccountPage = '/support-account-page';
  static const editDebitPage = '/edit-debit-page';
  static const changeEmailPage = '/change-email-page';
  static const changePasswordPage = '/change-password-page';
  static const changePhoneNumber = '/change-phone-number';
  static const sendEmailPage = '/send-email-page';
  static const sendOTPPage = '/send-ot-pPage';
  static const investToGoal = '/invest-to-goal';
  static const investToGoalMx = '/invest-to-goal-mx';
  static const investingAddAccountPageMX = '/investing-add-account-page-mX';
  static const investingAddAccountPage = '/investing-add-account-page';
  static const investingOverviewPage = '/investing-overview-page';
  static const investingOverviewPageMX = '/investing-overview-page-mX';
  static const investingSuccessPage = '/investing-success-page';
  static const investingSuccessPageMX = '/investing-success-page-mX';
  static const investingTransactionSummaryPageMX =
      '/investing-transaction-summary-page-mX';
  static const investingTransactionSummary = '/investing-transaction-summary';
  static const investingVerificationOverview =
      '/investing-verification-overview';
  static const investingVerificationOverviewMx =
      '/investing-verification-overview-mx';
  static const investingIdentityConfirmationPageMX =
      '/investing-identity-confirmation-page-mX';
  static const investingIdentityConfirmationPage =
      '/investing-identity-confirmation-page';
  static const investingDomicilioConfirmationPage =
      '/investing-domicilio-confirmation-page';
  static const sendEmailRegisterPage = '/send-email-register-page';
  static const sendOTPRegisterPage = '/send-ot-pregister-page';
  static const myGoalsPage = '/my-goals-page';
  static const myGoalsPageMx = '/my-goals-page-mx';
  static const withDrawalPageMX = '/with-drawal-page-mX';
  static const chooseGoalPageMX = '/choose-goal-page-mX';
  static const chooseAccountPageMX = '/choose-account-page-mX';
  static const sendOTPWithdrawalPageMX = '/send-ot-pwithdrawal-page-mX';
  static const withdrawalSummaryPageMX = '/withdrawal-summary-page-mX';
  static const successWithdrawalPageMX = '/success-withdrawal-page-mX';
  static const transactionSummaryPageMX = '/transaction-summary-page-mX';
  static const bankTransferAlmostPage = '/bank-transfer-almost-page';
  static const bankTransferSummaryPage = '/bank-transfer-summary-page';
  static const bankTransferSummaryPageMX = '/bank-transfer-summary-page-mX';
  static const myWalletPageMX = '/my-wallet-page-mX';
  static const investingGrandesMontos = '/investing-grandes-montos';
  static const introVerificationForm = '/intro-verification-form';
  static const introEvidenteVerification = '/intro-evidente-verification';
  static const verificationForm = '/verification-form';
  static const evidenteVerification = '/evidente-verification';
  static const userMigrationPage = '/user-migration-page';
  static const editGoalDebitPage = '/edit-goal-debit-page';
  static const investingChooseAccount = '/investing-choose-account';
  static const investingChooseAccountMx = '/investing-choose-account-mx';
  static const investingPseWebView = '/investing-pse-web-view';
  static const editGoalPage = '/edit-goal-page';
  static const createGoalMigration = '/create-goal-migration';
  static const introUserMigrationPage = '/intro-user-migration-page';
  static const detailDebitsPage = '/detail-debits-page';
  static const goalCreationSummary = '/goal-creation-summary';
  static const finishedSummaryPage = '/finished-summary-page';
  static const videoSenderPage = '/video-sender-page';
  static const closeSessionPage = '/close-session-page';
  static const beneficiariesPage = '/beneficiaries-page';
  static const updateAppPage = '/update-app-page';
  static const genericWebView = '/generic-web-view';
  static const videoSenderIntroPage = '/video-sender-intro-page';
  static const onBoardingPage = '/on-boarding-page';
  static const migrationIntroPage = '/migration-intro-page';
  static const assignToGoalSuccess = '/assign-to-goal-success';
  static const confirmationEvidente = '/confirmation-evidente';
  static const maintenancePage = '/maintenance-page';
  static const entrevistaPage = '/entrevista-page';
  static const entrevistaWebView = '/entrevista-web-view';
  static const all = {
    splashScreen,
    indexPage,
    noAccountPage,
    loginPage,
    homePage,
    profilePage,
    notificationsPage,
    registerPage,
    registerPageMX,
    successInfoPage,
    goalsVideo,
    goalsPages,
    profilingPage,
    profilingSuccessPage,
    createPasswordPage,
    recoverPasswordPage,
    recoverPasswordPageMX,
    termsAndConditions,
    resumeGoalPage,
    introHomePage,
    portfolioPage,
    extractsPage,
    helpPage,
    helpSupportFormPage,
    supportSuccessPage,
    aboutUaletPage,
    investingIntroPageMx,
    investingIntroPage,
    myAccountPage,
    supportAccountPage,
    editDebitPage,
    changeEmailPage,
    changePasswordPage,
    changePhoneNumber,
    sendEmailPage,
    sendOTPPage,
    investToGoal,
    investToGoalMx,
    investingAddAccountPageMX,
    investingAddAccountPage,
    investingOverviewPage,
    investingOverviewPageMX,
    investingSuccessPage,
    investingSuccessPageMX,
    investingTransactionSummaryPageMX,
    investingTransactionSummary,
    investingVerificationOverview,
    investingVerificationOverviewMx,
    investingIdentityConfirmationPageMX,
    investingIdentityConfirmationPage,
    investingDomicilioConfirmationPage,
    sendEmailRegisterPage,
    sendOTPRegisterPage,
    myGoalsPage,
    myGoalsPageMx,
    withDrawalPageMX,
    chooseGoalPageMX,
    chooseAccountPageMX,
    sendOTPWithdrawalPageMX,
    withdrawalSummaryPageMX,
    successWithdrawalPageMX,
    transactionSummaryPageMX,
    bankTransferAlmostPage,
    bankTransferSummaryPage,
    bankTransferSummaryPageMX,
    myWalletPageMX,
    investingGrandesMontos,
    introVerificationForm,
    introEvidenteVerification,
    verificationForm,
    evidenteVerification,
    userMigrationPage,
    editGoalDebitPage,
    investingChooseAccount,
    investingChooseAccountMx,
    investingPseWebView,
    editGoalPage,
    createGoalMigration,
    introUserMigrationPage,
    detailDebitsPage,
    goalCreationSummary,
    finishedSummaryPage,
    videoSenderPage,
    closeSessionPage,
    beneficiariesPage,
    updateAppPage,
    genericWebView,
    videoSenderIntroPage,
    onBoardingPage,
    migrationIntroPage,
    assignToGoalSuccess,
    confirmationEvidente,
    maintenancePage,
    entrevistaPage,
    entrevistaWebView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case Routes.indexPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => IndexPage(),
          settings: settings,
        );
      case Routes.noAccountPage:
        if (hasInvalidArgs<NoAccountPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<NoAccountPageArguments>(args);
        }
        final typedArgs = args as NoAccountPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => NoAccountPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment,
              isWithdrawal: typedArgs.isWithdrawal,
              isWallet: typedArgs.isWallet,
              accArgs: typedArgs.accArgs,
              info: typedArgs.info,
              chosenGoals: typedArgs.chosenGoals,
              goals: typedArgs.goals,
              chosenAmmount: typedArgs.chosenAmmount,
              withdrawalAll: typedArgs.withdrawalAll,
              withdrawalInfo: typedArgs.withdrawalInfo,
              editGoal: typedArgs.editGoal,
              deleteGoal: typedArgs.deleteGoal,
              deleteDebit: typedArgs.deleteDebit,
              values: typedArgs.values,
              chosenGoal: typedArgs.chosenGoal),
          settings: settings,
        );
      case Routes.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginPage(),
          settings: settings,
        );
      case Routes.homePage:
        if (hasInvalidArgs<HomePageArguments>(args)) {
          return misTypedArgsRoute<HomePageArguments>(args);
        }
        final typedArgs = args as HomePageArguments ?? HomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(
              key: typedArgs.key,
              currentScreen: typedArgs.currentScreen,
              blocked: typedArgs.blocked),
          settings: settings,
        );
      case Routes.profilePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfilePage(),
          settings: settings,
        );
      case Routes.notificationsPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => NotificationsPage(),
          settings: settings,
        );
      case Routes.registerPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RegisterPage(),
          settings: settings,
        );
      case Routes.registerPageMX:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RegisterPageMX(),
          settings: settings,
        );
      case Routes.successInfoPage:
        if (hasInvalidArgs<SuccessInfoPageArguments>(args)) {
          return misTypedArgsRoute<SuccessInfoPageArguments>(args);
        }
        final typedArgs =
            args as SuccessInfoPageArguments ?? SuccessInfoPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SuccessInfoPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.goalsVideo:
        return MaterialPageRoute<dynamic>(
          builder: (context) => GoalsIntroVideo(),
          settings: settings,
        );
      case Routes.goalsPages:
        if (hasInvalidArgs<GoalsPagesArguments>(args)) {
          return misTypedArgsRoute<GoalsPagesArguments>(args);
        }
        final typedArgs = args as GoalsPagesArguments ?? GoalsPagesArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => GoalsPages(
              key: typedArgs.key,
              isFirstGoal: typedArgs.isFirstGoal,
              isMigration: typedArgs.isMigration,
              validNewGoal: typedArgs.validNewGoal),
          settings: settings,
        );
      case Routes.profilingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfilingPage().wrappedRoute(context),
          settings: settings,
        );
      case Routes.profilingSuccessPage:
        if (hasInvalidArgs<ProfilingSuccessPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ProfilingSuccessPageArguments>(args);
        }
        final typedArgs = args as ProfilingSuccessPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfilingSuccessPage(
              key: typedArgs.key, result: typedArgs.result),
          settings: settings,
        );
      case Routes.createPasswordPage:
        if (hasInvalidArgs<CreatePasswordPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreatePasswordPageArguments>(args);
        }
        final typedArgs = args as CreatePasswordPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreatePasswordPage(
              name: typedArgs.name,
              email: typedArgs.email,
              phoneNumber: typedArgs.phoneNumber,
              acceptedTerms: typedArgs.acceptedTerms,
              acceptedPrivacy: typedArgs.acceptedPrivacy,
              recoverPassword: typedArgs.recoverPassword),
          settings: settings,
        );
      case Routes.recoverPasswordPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RecoverPasswordPage(),
          settings: settings,
        );
      case Routes.recoverPasswordPageMX:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RecoverPasswordPageMX(),
          settings: settings,
        );
      case Routes.termsAndConditions:
        if (hasInvalidArgs<TermsAndConditionsArguments>(args)) {
          return misTypedArgsRoute<TermsAndConditionsArguments>(args);
        }
        final typedArgs = args as TermsAndConditionsArguments ??
            TermsAndConditionsArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => TermsAndConditions(key: typedArgs.key),
          settings: settings,
        );
      case Routes.resumeGoalPage:
        if (hasInvalidArgs<ResumeGoalPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ResumeGoalPageArguments>(args);
        }
        final typedArgs = args as ResumeGoalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResumeGoalPage(
              key: typedArgs.key,
              goalItem: typedArgs.goalItem,
              isFirstGoal: typedArgs.isFirstGoal,
              isMigration: typedArgs.isMigration),
          settings: settings,
        );
      case Routes.introHomePage:
        if (hasInvalidArgs<IntroHomePageArguments>(args)) {
          return misTypedArgsRoute<IntroHomePageArguments>(args);
        }
        final typedArgs =
            args as IntroHomePageArguments ?? IntroHomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IntroHomePage(
              key: typedArgs.key,
              isInvestment: typedArgs.isInvestment,
              goal: typedArgs.goal),
          settings: settings,
        );
      case Routes.portfolioPage:
        if (hasInvalidArgs<PortfolioPageArguments>(args)) {
          return misTypedArgsRoute<PortfolioPageArguments>(args);
        }
        final typedArgs =
            args as PortfolioPageArguments ?? PortfolioPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PortfolioPage(
              key: typedArgs.key,
              selectedFundIndex: typedArgs.selectedFundIndex),
          settings: settings,
        );
      case Routes.extractsPage:
        if (hasInvalidArgs<ExtractPageArguments>(args)) {
          return misTypedArgsRoute<ExtractPageArguments>(args);
        }
        final typedArgs =
            args as ExtractPageArguments ?? ExtractPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ExtractPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.helpPage:
        if (hasInvalidArgs<HelpPageArguments>(args)) {
          return misTypedArgsRoute<HelpPageArguments>(args);
        }
        final typedArgs = args as HelpPageArguments ?? HelpPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HelpPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.helpSupportFormPage:
        if (hasInvalidArgs<HelpSupportFormPageArguments>(args)) {
          return misTypedArgsRoute<HelpSupportFormPageArguments>(args);
        }
        final typedArgs = args as HelpSupportFormPageArguments ??
            HelpSupportFormPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HelpSupportFormPage(topic: typedArgs.topic),
          settings: settings,
        );
      case Routes.supportSuccessPage:
        if (hasInvalidArgs<SupportSuccessPageArguments>(args)) {
          return misTypedArgsRoute<SupportSuccessPageArguments>(args);
        }
        final typedArgs = args as SupportSuccessPageArguments ??
            SupportSuccessPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SupportSuccessPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.aboutUaletPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AboutUaletPage(),
          settings: settings,
        );
      case Routes.investingIntroPageMx:
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingIntroPageMx(),
          settings: settings,
        );
      case Routes.investingIntroPage:
        if (hasInvalidArgs<InvestingIntroPageArguments>(args)) {
          return misTypedArgsRoute<InvestingIntroPageArguments>(args);
        }
        final typedArgs = args as InvestingIntroPageArguments ??
            InvestingIntroPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingIntroPage(
              fromRegister: typedArgs.fromRegister,
              valueFromRegister: typedArgs.valueFromRegister),
          settings: settings,
        );
      case Routes.myAccountPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyAccountPage(),
          settings: settings,
        );
      case Routes.supportAccountPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SupportAccountPage(),
          settings: settings,
        );
      case Routes.editDebitPage:
        if (hasInvalidArgs<EditDebitPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<EditDebitPageArguments>(args);
        }
        final typedArgs = args as EditDebitPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => EditDebitPage(debit: typedArgs.debit),
          settings: settings,
        );
      case Routes.changeEmailPage:
        if (hasInvalidArgs<ChangeEmailPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ChangeEmailPageArguments>(args);
        }
        final typedArgs = args as ChangeEmailPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChangeEmailPage(
              email: typedArgs.email, phoneNumber: typedArgs.phoneNumber),
          settings: settings,
        );
      case Routes.changePasswordPage:
        if (hasInvalidArgs<ChangePasswordPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ChangePasswordPageArguments>(args);
        }
        final typedArgs = args as ChangePasswordPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChangePasswordPage(
              email: typedArgs.email, phoneNumber: typedArgs.phoneNumber),
          settings: settings,
        );
      case Routes.changePhoneNumber:
        if (hasInvalidArgs<ChangePhoneNumberArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ChangePhoneNumberArguments>(args);
        }
        final typedArgs = args as ChangePhoneNumberArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChangePhoneNumber(
              email: typedArgs.email, phoneNumber: typedArgs.phoneNumber),
          settings: settings,
        );
      case Routes.sendEmailPage:
        if (hasInvalidArgs<SendEmailPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SendEmailPageArguments>(args);
        }
        final typedArgs = args as SendEmailPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SendEmailPage(
              email: typedArgs.email,
              phoneNumber: typedArgs.phoneNumber,
              changeType: typedArgs.changeType,
              oldPassword: typedArgs.oldPassword,
              newPassword: typedArgs.newPassword,
              confirmPassword: typedArgs.confirmPassword),
          settings: settings,
        );
      case Routes.sendOTPPage:
        if (hasInvalidArgs<SendOTPPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SendOTPPageArguments>(args);
        }
        final typedArgs = args as SendOTPPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SendOTPPage(
              email: typedArgs.email,
              phoneNumber: typedArgs.phoneNumber,
              newNumber: typedArgs.newNumber,
              changetype: typedArgs.changetype,
              oldPassword: typedArgs.oldPassword,
              newPassword: typedArgs.newPassword,
              confirmPassword: typedArgs.confirmPassword),
          settings: settings,
        );
      case Routes.investToGoal:
        if (hasInvalidArgs<InvestingGoalPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<InvestingGoalPageArguments>(args);
        }
        final typedArgs = args as InvestingGoalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingGoalPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              leftSelected: typedArgs.leftSelected,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              values: typedArgs.values,
              periodicity: typedArgs.periodicity,
              onlyPSE: typedArgs.onlyPSE),
          settings: settings,
        );
      case Routes.investToGoalMx:
        if (hasInvalidArgs<InvestingGoalPageMxArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<InvestingGoalPageMxArguments>(args);
        }
        final typedArgs = args as InvestingGoalPageMxArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingGoalPageMx(
              key: typedArgs.key,
              goal: typedArgs.goal,
              leftSelected: typedArgs.leftSelected,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              values: typedArgs.values,
              periodicity: typedArgs.periodicity,
              onlyPSE: typedArgs.onlyPSE,
              fromRegister: typedArgs.fromRegister),
          settings: settings,
        );
      case Routes.investingAddAccountPageMX:
        if (hasInvalidArgs<InvestingAddAccountPageMXArguments>(args)) {
          return misTypedArgsRoute<InvestingAddAccountPageMXArguments>(args);
        }
        final typedArgs = args as InvestingAddAccountPageMXArguments ??
            InvestingAddAccountPageMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingAddAccountPageMX(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              isWithdrawal: typedArgs.isWithdrawal,
              isWallet: typedArgs.isWallet,
              accArgs: typedArgs.accArgs,
              info: typedArgs.info,
              finishedVinculation: typedArgs.finishedVinculation),
          settings: settings,
        );
      case Routes.investingAddAccountPage:
        if (hasInvalidArgs<InvestingAddAccountPageArguments>(args)) {
          return misTypedArgsRoute<InvestingAddAccountPageArguments>(args);
        }
        final typedArgs = args as InvestingAddAccountPageArguments ??
            InvestingAddAccountPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingAddAccountPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment,
              isWithdrawal: typedArgs.isWithdrawal,
              isWallet: typedArgs.isWallet,
              accArgs: typedArgs.accArgs,
              info: typedArgs.info),
          settings: settings,
        );
      case Routes.investingOverviewPage:
        if (hasInvalidArgs<InvestingOverviewPageArguments>(args)) {
          return misTypedArgsRoute<InvestingOverviewPageArguments>(args);
        }
        final typedArgs = args as InvestingOverviewPageArguments ??
            InvestingOverviewPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingOverviewPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              investment: typedArgs.investment,
              bankTransfer: typedArgs.bankTransfer,
              bankAccountItem: typedArgs.bankAccountItem,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              isFirstInvestment: typedArgs.isFirstInvestment),
          settings: settings,
        );
      case Routes.investingOverviewPageMX:
        if (hasInvalidArgs<InvestingOverviewPageMXArguments>(args)) {
          return misTypedArgsRoute<InvestingOverviewPageMXArguments>(args);
        }
        final typedArgs = args as InvestingOverviewPageMXArguments ??
            InvestingOverviewPageMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingOverviewPageMX(
              key: typedArgs.key,
              goal: typedArgs.goal,
              investment: typedArgs.investment,
              bankTransfer: typedArgs.bankTransfer,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.investingSuccessPage:
        if (hasInvalidArgs<InvestingSuccessPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<InvestingSuccessPageArguments>(args);
        }
        final typedArgs = args as InvestingSuccessPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingSuccessPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              item: typedArgs.item,
              investment: typedArgs.investment,
              isFirstInvestment: typedArgs.isFirstInvestment,
              successData: typedArgs.successData,
              typePopUp: typedArgs.typePopUp),
          settings: settings,
        );
      case Routes.investingSuccessPageMX:
        if (hasInvalidArgs<InvestingSuccessPageMXArguments>(args)) {
          return misTypedArgsRoute<InvestingSuccessPageMXArguments>(args);
        }
        final typedArgs = args as InvestingSuccessPageMXArguments ??
            InvestingSuccessPageMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingSuccessPageMX(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              finishedVinculation: typedArgs.finishedVinculation,
              isLoading: typedArgs.isLoading,
              bankTransferValue: typedArgs.bankTransferValue),
          settings: settings,
        );
      case Routes.investingTransactionSummaryPageMX:
        if (hasInvalidArgs<InvestingTransactionSummaryMXArguments>(args)) {
          return misTypedArgsRoute<InvestingTransactionSummaryMXArguments>(
              args);
        }
        final typedArgs = args as InvestingTransactionSummaryMXArguments ??
            InvestingTransactionSummaryMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingTransactionSummaryMX(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.investingTransactionSummary:
        if (hasInvalidArgs<InvestingTransactionSummaryArguments>(args)) {
          return misTypedArgsRoute<InvestingTransactionSummaryArguments>(args);
        }
        final typedArgs = args as InvestingTransactionSummaryArguments ??
            InvestingTransactionSummaryArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingTransactionSummary(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.investingVerificationOverview:
        if (hasInvalidArgs<InvestingVerificationOverviewArguments>(args)) {
          return misTypedArgsRoute<InvestingVerificationOverviewArguments>(
              args);
        }
        final typedArgs = args as InvestingVerificationOverviewArguments ??
            InvestingVerificationOverviewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingVerificationOverview(
              key: typedArgs.key,
              check1: typedArgs.check1,
              check2: typedArgs.check2,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.investingVerificationOverviewMx:
        if (hasInvalidArgs<InvestingVerificationOverviewMxArguments>(args)) {
          return misTypedArgsRoute<InvestingVerificationOverviewMxArguments>(
              args);
        }
        final typedArgs = args as InvestingVerificationOverviewMxArguments ??
            InvestingVerificationOverviewMxArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingVerificationOverviewMx(
              key: typedArgs.key,
              check1: typedArgs.check1,
              check2: typedArgs.check2,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              checkForm1: typedArgs.checkForm1,
              checkForm2: typedArgs.checkForm2,
              checkForm3: typedArgs.checkForm3,
              checkForm4: typedArgs.checkForm4,
              finishedVerification: typedArgs.finishedVerification),
          settings: settings,
        );
      case Routes.investingIdentityConfirmationPageMX:
        if (hasInvalidArgs<InvestingIdentityConfirmationPageMXArguments>(
            args)) {
          return misTypedArgsRoute<
              InvestingIdentityConfirmationPageMXArguments>(args);
        }
        final typedArgs =
            args as InvestingIdentityConfirmationPageMXArguments ??
                InvestingIdentityConfirmationPageMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingIdentityConfirmationPageMX(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.investingIdentityConfirmationPage:
        if (hasInvalidArgs<InvestingIdentityConfirmationPageArguments>(args)) {
          return misTypedArgsRoute<InvestingIdentityConfirmationPageArguments>(
              args);
        }
        final typedArgs = args as InvestingIdentityConfirmationPageArguments ??
            InvestingIdentityConfirmationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingIdentityConfirmationPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue),
          settings: settings,
        );
      case Routes.investingDomicilioConfirmationPage:
        if (hasInvalidArgs<InvestingDomicilioConfirmationPageArguments>(args)) {
          return misTypedArgsRoute<InvestingDomicilioConfirmationPageArguments>(
              args);
        }
        final typedArgs = args as InvestingDomicilioConfirmationPageArguments ??
            InvestingDomicilioConfirmationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingDomicilioConfirmationPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.sendEmailRegisterPage:
        if (hasInvalidArgs<SendEmailRegisterPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<SendEmailRegisterPageArguments>(args);
        }
        final typedArgs = args as SendEmailRegisterPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SendEmailRegisterPage(
              name: typedArgs.name,
              email: typedArgs.email,
              phoneNumber: typedArgs.phoneNumber,
              acceptedTerms: typedArgs.acceptedTerms,
              acceptedPrivacy: typedArgs.acceptedPrivacy),
          settings: settings,
        );
      case Routes.sendOTPRegisterPage:
        if (hasInvalidArgs<SendOTPRegisterPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<SendOTPRegisterPageArguments>(args);
        }
        final typedArgs = args as SendOTPRegisterPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SendOTPRegisterPage(
              email: typedArgs.email,
              name: typedArgs.name,
              phoneNumber: typedArgs.phoneNumber,
              acceptedTerms: typedArgs.acceptedTerms,
              acceptedPrivacy: typedArgs.acceptedPrivacy,
              recoverPassword: typedArgs.recoverPassword),
          settings: settings,
        );
      case Routes.myGoalsPage:
        if (hasInvalidArgs<MyGoalsPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<MyGoalsPageArguments>(args);
        }
        final typedArgs = args as MyGoalsPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyGoalsPage(
              key: typedArgs.key,
              items: typedArgs.items,
              initial: typedArgs.initial,
              notAssignedBalance: typedArgs.notAssignedBalance),
          settings: settings,
        );
      case Routes.myGoalsPageMx:
        if (hasInvalidArgs<MyGoalsPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<MyGoalsPageArguments>(args);
        }
        final typedArgs = args as MyGoalsPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyGoalsPage(
              key: typedArgs.key,
              items: typedArgs.items,
              initial: typedArgs.initial,
              notAssignedBalance: typedArgs.notAssignedBalance),
          settings: settings,
        );
      case Routes.withDrawalPageMX:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WithDrawalPage(),
          settings: settings,
        );
      case Routes.chooseGoalPageMX:
        if (hasInvalidArgs<ChooseGoalPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ChooseGoalPageArguments>(args);
        }
        final typedArgs = args as ChooseGoalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ChooseGoalPage(withdrawalInfo: typedArgs.withdrawalInfo),
          settings: settings,
        );
      case Routes.chooseAccountPageMX:
        if (hasInvalidArgs<ChooseAccountPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ChooseAccountPageArguments>(args);
        }
        final typedArgs = args as ChooseAccountPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChooseAccountPage(
              withdrawalInfo: typedArgs.withdrawalInfo,
              withdrawalAll: typedArgs.withdrawalAll,
              chosenAmmount: typedArgs.chosenAmmount,
              chosenGoals: typedArgs.chosenGoals,
              chosenGoal: typedArgs.chosenGoal,
              chosenValues: typedArgs.chosenValues,
              deleteGoal: typedArgs.deleteGoal,
              deleteDebit: typedArgs.deleteDebit,
              editGoal: typedArgs.editGoal,
              withdrawalType: typedArgs.withdrawalType,
              goalDebits: typedArgs.goalDebits,
              banksInfoDebits: typedArgs.banksInfoDebits,
              isFormDeleteGoal: typedArgs.isFormDeleteGoal),
          settings: settings,
        );
      case Routes.sendOTPWithdrawalPageMX:
        if (hasInvalidArgs<SendOTPWithdrawalPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<SendOTPWithdrawalPageArguments>(args);
        }
        final typedArgs = args as SendOTPWithdrawalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SendOTPWithdrawalPage(
              chosenGoals: typedArgs.chosenGoals,
              chosenAmmount: typedArgs.chosenAmmount,
              withdrawalAll: typedArgs.withdrawalAll,
              withdrawalInfo: typedArgs.withdrawalInfo,
              chosenAccount: typedArgs.chosenAccount,
              chosenValues: typedArgs.chosenValues,
              isValidDeleteDebit: typedArgs.isValidDeleteDebit,
              isValidDeleteGoal: typedArgs.isValidDeleteGoal,
              isValidReCalculateDebits: typedArgs.isValidReCalculateDebits),
          settings: settings,
        );
      case Routes.withdrawalSummaryPageMX:
        if (hasInvalidArgs<WithdrawalSummaryPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<WithdrawalSummaryPageArguments>(args);
        }
        final typedArgs = args as WithdrawalSummaryPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => WithdrawalSummaryPage(
              chosenGoals: typedArgs.chosenGoals,
              chosenAmmount: typedArgs.chosenAmmount,
              withdrawalAll: typedArgs.withdrawalAll,
              withdrawalInfo: typedArgs.withdrawalInfo,
              chosenAccount: typedArgs.chosenAccount,
              valuesChosen: typedArgs.valuesChosen,
              deleteGoal: typedArgs.deleteGoal,
              deleteDebit: typedArgs.deleteDebit,
              withdrawalType: typedArgs.withdrawalType,
              goalDebits: typedArgs.goalDebits),
          settings: settings,
        );
      case Routes.successWithdrawalPageMX:
        if (hasInvalidArgs<SuccessWithdrawalPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<SuccessWithdrawalPageArguments>(args);
        }
        final typedArgs = args as SuccessWithdrawalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SuccessWithdrawalPage(
              chosenAmmount: typedArgs.chosenAmmount,
              chosenGoals: typedArgs.chosenGoals,
              chosenValues: typedArgs.chosenValues,
              withdrawalAll: typedArgs.withdrawalAll,
              withdrawalFee: typedArgs.withdrawalFee,
              info: typedArgs.info,
              isValidDeleteGoal: typedArgs.isValidDeleteGoal),
          settings: settings,
        );
      case Routes.transactionSummaryPageMX:
        if (hasInvalidArgs<TransactionSummaryPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<TransactionSummaryPageArguments>(args);
        }
        final typedArgs = args as TransactionSummaryPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => TransactionSummaryPage(
              chosenGoals: typedArgs.chosenGoals,
              chosenValues: typedArgs.chosenValues,
              chosenAmmount: typedArgs.chosenAmmount,
              withdrawalAll: typedArgs.withdrawalAll,
              withdrawalFee: typedArgs.withdrawalFee,
              withdrawalInfo: typedArgs.withdrawalInfo),
          settings: settings,
        );
      case Routes.bankTransferAlmostPage:
        if (hasInvalidArgs<BankTransferAlmostPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<BankTransferAlmostPageArguments>(args);
        }
        final typedArgs = args as BankTransferAlmostPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => BankTransferAlmostPage(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              investment: typedArgs.investment,
              isFirstInvestment: typedArgs.isFirstInvestment,
              finishedVinculation: typedArgs.finishedVinculation),
          settings: settings,
        );
      case Routes.bankTransferSummaryPage:
        if (hasInvalidArgs<BankTransferSummaryPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<BankTransferSummaryPageArguments>(args);
        }
        final typedArgs = args as BankTransferSummaryPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => BankTransferSummaryPage(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment),
          settings: settings,
        );
      case Routes.bankTransferSummaryPageMX:
        if (hasInvalidArgs<BankTransferSummaryPageMXArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<BankTransferSummaryPageMXArguments>(args);
        }
        final typedArgs = args as BankTransferSummaryPageMXArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => BankTransferSummaryPageMX(
              accountItem: typedArgs.accountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue),
          settings: settings,
        );
      case Routes.myWalletPageMX:
        if (hasInvalidArgs<MyWalletPageMXArguments>(args)) {
          return misTypedArgsRoute<MyWalletPageMXArguments>(args);
        }
        final typedArgs =
            args as MyWalletPageMXArguments ?? MyWalletPageMXArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyWalletPageMX(key: typedArgs.key),
          settings: settings,
        );
      case Routes.investingGrandesMontos:
        if (hasInvalidArgs<InvestingGrandesMontosMasterArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<InvestingGrandesMontosMasterArguments>(args);
        }
        final typedArgs = args as InvestingGrandesMontosMasterArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingGrandesMontosMaster(
              key: typedArgs.key,
              goal: typedArgs.goal,
              isDebito: typedArgs.isDebito,
              investment: typedArgs.investment,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              bankItem: typedArgs.bankItem,
              cargarDocumentos: typedArgs.cargarDocumentos,
              isUpdate: typedArgs.isUpdate,
              sarlaftItem: typedArgs.sarlaftItem,
              validButtonReturn: typedArgs.validButtonReturn),
          settings: settings,
        );
      case Routes.introVerificationForm:
        if (hasInvalidArgs<IntroVerificationFormArguments>(args)) {
          return misTypedArgsRoute<IntroVerificationFormArguments>(args);
        }
        final typedArgs = args as IntroVerificationFormArguments ??
            IntroVerificationFormArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IntroVerificationForm(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              redirectHome: typedArgs.redirectHome),
          settings: settings,
        );
      case Routes.introEvidenteVerification:
        if (hasInvalidArgs<IntroEvidenteVerificationArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<IntroEvidenteVerificationArguments>(args);
        }
        final typedArgs = args as IntroEvidenteVerificationArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => IntroEvidenteVerification(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment),
          settings: settings,
        );
      case Routes.verificationForm:
        if (hasInvalidArgs<VerificationFormArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<VerificationFormArguments>(args);
        }
        final typedArgs = args as VerificationFormArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => VerificationForm(
              key: typedArgs.key,
              info: typedArgs.info,
              countries: typedArgs.countries,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment,
              bankAccountItem: typedArgs.bankAccountItem,
              redirectHome: typedArgs.redirectHome),
          settings: settings,
        );
      case Routes.evidenteVerification:
        if (hasInvalidArgs<EvidenteVerificationArguments>(args)) {
          return misTypedArgsRoute<EvidenteVerificationArguments>(args);
        }
        final typedArgs = args as EvidenteVerificationArguments ??
            EvidenteVerificationArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => EvidenteVerification(
              key: typedArgs.key,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment,
              bankAccountItem: typedArgs.bankAccountItem,
              redirectHome: typedArgs.redirectHome),
          settings: settings,
        );
      case Routes.userMigrationPage:
        if (hasInvalidArgs<UserMigrationPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<UserMigrationPageArguments>(args);
        }
        final typedArgs = args as UserMigrationPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserMigrationPage(
              userMigrationInfo: typedArgs.userMigrationInfo,
              balance: typedArgs.balance,
              goalQuincenal: typedArgs.goalQuincenal,
              goalMensual: typedArgs.goalMensual,
              goalTrimestral: typedArgs.goalTrimestral,
              goalPse: typedArgs.goalPse,
              quincenalDone: typedArgs.quincenalDone,
              mensualDone: typedArgs.mensualDone,
              trimestralDone: typedArgs.trimestralDone,
              pseDone: typedArgs.pseDone),
          settings: settings,
        );
      case Routes.editGoalDebitPage:
        if (hasInvalidArgs<EditGoalDebitPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<EditGoalDebitPageArguments>(args);
        }
        final typedArgs = args as EditGoalDebitPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => EditGoalDebitPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              debitItem: typedArgs.debitItem,
              goals: typedArgs.goals),
          settings: settings,
        );
      case Routes.investingChooseAccount:
        if (hasInvalidArgs<InvestingChooseAccountArguments>(args)) {
          return misTypedArgsRoute<InvestingChooseAccountArguments>(args);
        }
        final typedArgs = args as InvestingChooseAccountArguments ??
            InvestingChooseAccountArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingChooseAccount(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment),
          settings: settings,
        );
      case Routes.investingChooseAccountMx:
        if (hasInvalidArgs<InvestingChooseAccountMxArguments>(args)) {
          return misTypedArgsRoute<InvestingChooseAccountMxArguments>(args);
        }
        final typedArgs = args as InvestingChooseAccountMxArguments ??
            InvestingChooseAccountMxArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InvestingChooseAccountMx(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              finishedVinculation: typedArgs.finishedVinculation),
          settings: settings,
        );
      case Routes.investingPseWebView:
        if (hasInvalidArgs<InvestingPseWebViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<InvestingPseWebViewArguments>(args);
        }
        final typedArgs = args as InvestingPseWebViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              InvestingPseWebView(key: typedArgs.key, url: typedArgs.url),
          settings: settings,
        );
      case Routes.editGoalPage:
        if (hasInvalidArgs<EditGoalPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<EditGoalPageArguments>(args);
        }
        final typedArgs = args as EditGoalPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => EditGoalPage(
              key: typedArgs.key,
              goal: typedArgs.goal,
              relatedGoals: typedArgs.relatedGoals,
              relatedDebit: typedArgs.relatedDebit,
              info: typedArgs.info),
          settings: settings,
        );
      case Routes.createGoalMigration:
        if (hasInvalidArgs<CreateGoalMigrationArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreateGoalMigrationArguments>(args);
        }
        final typedArgs = args as CreateGoalMigrationArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateGoalMigration(
              key: typedArgs.key,
              debits: typedArgs.debits,
              goalQuincenal: typedArgs.goalQuincenal,
              goalMensual: typedArgs.goalMensual,
              goalTrimestral: typedArgs.goalTrimestral,
              goalPse: typedArgs.goalPse,
              userMigrationInfo: typedArgs.userMigrationInfo,
              balance: typedArgs.balance,
              quincenalDone: typedArgs.quincenalDone,
              mensualDone: typedArgs.mensualDone,
              trimestralDone: typedArgs.trimestralDone,
              pseDone: typedArgs.pseDone,
              periodicity: typedArgs.periodicity,
              blocc: typedArgs.blocc),
          settings: settings,
        );
      case Routes.introUserMigrationPage:
        if (hasInvalidArgs<IntroUserMigrationPageArguments>(args)) {
          return misTypedArgsRoute<IntroUserMigrationPageArguments>(args);
        }
        final typedArgs = args as IntroUserMigrationPageArguments ??
            IntroUserMigrationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IntroUserMigrationPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.detailDebitsPage:
        if (hasInvalidArgs<DetailDebitsPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<DetailDebitsPageArguments>(args);
        }
        final typedArgs = args as DetailDebitsPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => DetailDebitsPage(
              key: typedArgs.key,
              bloc: typedArgs.bloc,
              debits: typedArgs.debits,
              userMigrationInfo: typedArgs.userMigrationInfo,
              balance: typedArgs.balance,
              periodicity: typedArgs.periodicity,
              goalQuincenal: typedArgs.goalQuincenal,
              goalMensual: typedArgs.goalMensual,
              goalTrimestral: typedArgs.goalTrimestral,
              goalPse: typedArgs.goalPse,
              quincenalDone: typedArgs.quincenalDone,
              mensualDone: typedArgs.mensualDone,
              trimestralDone: typedArgs.trimestralDone,
              pseDone: typedArgs.pseDone),
          settings: settings,
        );
      case Routes.goalCreationSummary:
        if (hasInvalidArgs<GoalCreationSummaryArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<GoalCreationSummaryArguments>(args);
        }
        final typedArgs = args as GoalCreationSummaryArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => GoalCreationSummary(
              key: typedArgs.key,
              debits: typedArgs.debits,
              goalCreated: typedArgs.goalCreated,
              goalQuincenal: typedArgs.goalQuincenal,
              goalMensual: typedArgs.goalMensual,
              goalTrimestral: typedArgs.goalTrimestral,
              goalPse: typedArgs.goalPse,
              balance: typedArgs.balance,
              quincenalDone: typedArgs.quincenalDone,
              mensualDone: typedArgs.mensualDone,
              trimestralDone: typedArgs.trimestralDone,
              pseDone: typedArgs.pseDone,
              userMigrationInfo: typedArgs.userMigrationInfo,
              periodicity: typedArgs.periodicity),
          settings: settings,
        );
      case Routes.finishedSummaryPage:
        if (hasInvalidArgs<FinishedSummaryPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<FinishedSummaryPageArguments>(args);
        }
        final typedArgs = args as FinishedSummaryPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => FinishedSummaryPage(
              key: typedArgs.key,
              goalQuincenal: typedArgs.goalQuincenal,
              goalMensual: typedArgs.goalMensual,
              goalTrimestral: typedArgs.goalTrimestral,
              goalPse: typedArgs.goalPse),
          settings: settings,
        );
      case Routes.videoSenderPage:
        if (hasInvalidArgs<VideoSenderPageArguments>(args)) {
          return misTypedArgsRoute<VideoSenderPageArguments>(args);
        }
        final typedArgs =
            args as VideoSenderPageArguments ?? VideoSenderPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => VideoSenderPage(
              key: typedArgs.key,
              idFace: typedArgs.idFace,
              idINE: typedArgs.idINE,
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen,
              firstVideo: typedArgs.firstVideo),
          settings: settings,
        );
      case Routes.closeSessionPage:
        if (hasInvalidArgs<CloseSessionPageArguments>(args)) {
          return misTypedArgsRoute<CloseSessionPageArguments>(args);
        }
        final typedArgs =
            args as CloseSessionPageArguments ?? CloseSessionPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CloseSessionPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.beneficiariesPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => BeneficiariesPage(),
          settings: settings,
        );
      case Routes.updateAppPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UpdateAppPage(),
          settings: settings,
        );
      case Routes.genericWebView:
        if (hasInvalidArgs<GenericWebViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<GenericWebViewArguments>(args);
        }
        final typedArgs = args as GenericWebViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              GenericWebView(key: typedArgs.key, url: typedArgs.url),
          settings: settings,
        );
      case Routes.videoSenderIntroPage:
        if (hasInvalidArgs<VideoSenderIntroPageArguments>(args)) {
          return misTypedArgsRoute<VideoSenderIntroPageArguments>(args);
        }
        final typedArgs = args as VideoSenderIntroPageArguments ??
            VideoSenderIntroPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => VideoSenderIntroPage(
              key: typedArgs.key,
              idVideoFace: typedArgs.idVideoFace,
              goal: typedArgs.goal,
              idVideoINEIFE: typedArgs.idVideoINEIFE,
              bankTransfer: typedArgs.bankTransfer,
              bankTransferValue: typedArgs.bankTransferValue,
              bankAccountItem: typedArgs.bankAccountItem,
              multiple: typedArgs.multiple,
              goals: typedArgs.goals,
              valuesChosen: typedArgs.valuesChosen),
          settings: settings,
        );
      case Routes.onBoardingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => OnBoardingPage(),
          settings: settings,
        );
      case Routes.migrationIntroPage:
        if (hasInvalidArgs<MigrationIntroPageArguments>(args)) {
          return misTypedArgsRoute<MigrationIntroPageArguments>(args);
        }
        final typedArgs = args as MigrationIntroPageArguments ??
            MigrationIntroPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => MigrationIntroPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.assignToGoalSuccess:
        if (hasInvalidArgs<AssignToGoalSuccessArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<AssignToGoalSuccessArguments>(args);
        }
        final typedArgs = args as AssignToGoalSuccessArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => AssignToGoalSuccess(
              key: typedArgs.key,
              assignedTo: typedArgs.assignedTo,
              assignedFrom: typedArgs.assignedFrom,
              assignedValue: typedArgs.assignedValue),
          settings: settings,
        );
      case Routes.confirmationEvidente:
        if (hasInvalidArgs<ConfirmationEvidentePageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ConfirmationEvidentePageArguments>(args);
        }
        final typedArgs = args as ConfirmationEvidentePageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ConfirmationEvidentePage(
              goal: typedArgs.goal,
              bankTransfer: typedArgs.bankTransfer,
              investment: typedArgs.investment,
              isFirstInvestment: typedArgs.isFirstInvestment),
          settings: settings,
        );
      case Routes.maintenancePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MaintenancePage(),
          settings: settings,
        );
      case Routes.entrevistaPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EntrevistaPage(),
          settings: settings,
        );
      case Routes.entrevistaWebView:
        if (hasInvalidArgs<EntrevistaWebViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<EntrevistaWebViewArguments>(args);
        }
        final typedArgs = args as EntrevistaWebViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              EntrevistaWebView(key: typedArgs.key, url: typedArgs.url),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//NoAccountPage arguments holder class
class NoAccountPageArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isWithdrawal;
  final bool isWallet;
  final dynamic accArgs;
  final WithdrawalInfo info;
  final List<DashboardGoal> chosenGoals;
  final List<DashboardGoal> goals;
  final double chosenAmmount;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final bool editGoal;
  final bool deleteGoal;
  final bool deleteDebit;
  final List<double> values;
  final DashboardGoal chosenGoal;
  NoAccountPageArguments(
      {this.key,
      @required this.goal,
      this.bankTransfer = false,
      this.investment = 0,
      this.isWithdrawal = false,
      this.isWallet = false,
      @required this.accArgs,
      @required this.info,
      @required this.chosenGoals,
      @required this.goals,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalInfo,
      @required this.editGoal,
      @required this.deleteGoal,
      @required this.deleteDebit,
      @required this.values,
      this.chosenGoal});
}

//HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final int currentScreen;
  final bool blocked;
  HomePageArguments({this.key, this.currentScreen = 0, this.blocked = false});
}

//SuccessInfoPage arguments holder class
class SuccessInfoPageArguments {
  final Key key;
  SuccessInfoPageArguments({this.key});
}

//GoalsPages arguments holder class
class GoalsPagesArguments {
  final Key key;
  final bool isFirstGoal;
  final bool isMigration;
  final bool validNewGoal;
  GoalsPagesArguments(
      {this.key,
      this.isFirstGoal,
      this.isMigration = false,
      this.validNewGoal = false});
}

//ProfilingSuccessPage arguments holder class
class ProfilingSuccessPageArguments {
  final Key key;
  final ProfilingResult result;
  ProfilingSuccessPageArguments({this.key, @required this.result});
}

//CreatePasswordPage arguments holder class
class CreatePasswordPageArguments {
  final String name;
  final String email;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;
  final bool recoverPassword;
  CreatePasswordPageArguments(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy,
      @required this.recoverPassword});
}

//TermsAndConditions arguments holder class
class TermsAndConditionsArguments {
  final Key key;
  TermsAndConditionsArguments({this.key});
}

//ResumeGoalPage arguments holder class
class ResumeGoalPageArguments {
  final Key key;
  final GoalItem goalItem;
  final bool isFirstGoal;
  final bool isMigration;
  ResumeGoalPageArguments(
      {this.key,
      @required this.goalItem,
      @required this.isFirstGoal,
      this.isMigration});
}

//IntroHomePage arguments holder class
class IntroHomePageArguments {
  final Key key;
  final bool isInvestment;
  final DashboardGoal goal;
  IntroHomePageArguments({this.key, this.isInvestment, this.goal});
}

//PortfolioPage arguments holder class
class PortfolioPageArguments {
  final Key key;
  final int selectedFundIndex;
  PortfolioPageArguments({this.key, this.selectedFundIndex});
}

//ExtractPage arguments holder class
class ExtractPageArguments {
  final Key key;
  ExtractPageArguments({this.key});
}

//HelpPage arguments holder class
class HelpPageArguments {
  final Key key;
  HelpPageArguments({this.key});
}

//HelpSupportFormPage arguments holder class
class HelpSupportFormPageArguments {
  final String topic;
  HelpSupportFormPageArguments({this.topic});
}

//SupportSuccessPage arguments holder class
class SupportSuccessPageArguments {
  final Key key;
  SupportSuccessPageArguments({this.key});
}

//InvestingIntroPage arguments holder class
class InvestingIntroPageArguments {
  final bool fromRegister;
  final double valueFromRegister;
  InvestingIntroPageArguments(
      {this.fromRegister = false, this.valueFromRegister = 0});
}

//EditDebitPage arguments holder class
class EditDebitPageArguments {
  final DebitInfo debit;
  EditDebitPageArguments({@required this.debit});
}

//ChangeEmailPage arguments holder class
class ChangeEmailPageArguments {
  final String email;
  final String phoneNumber;
  ChangeEmailPageArguments({@required this.email, @required this.phoneNumber});
}

//ChangePasswordPage arguments holder class
class ChangePasswordPageArguments {
  final String email;
  final String phoneNumber;
  ChangePasswordPageArguments(
      {@required this.email, @required this.phoneNumber});
}

//ChangePhoneNumber arguments holder class
class ChangePhoneNumberArguments {
  final String email;
  final String phoneNumber;
  ChangePhoneNumberArguments(
      {@required this.email, @required this.phoneNumber});
}

//SendEmailPage arguments holder class
class SendEmailPageArguments {
  final String email;
  final String phoneNumber;
  final ChangeType changeType;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  SendEmailPageArguments(
      {@required this.email,
      @required this.phoneNumber,
      @required this.changeType,
      @required this.oldPassword,
      @required this.newPassword,
      @required this.confirmPassword});
}

//SendOTPPage arguments holder class
class SendOTPPageArguments {
  final String email;
  final String phoneNumber;
  final String newNumber;
  final ChangeType changetype;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  SendOTPPageArguments(
      {@required this.email,
      @required this.phoneNumber,
      @required this.newNumber,
      @required this.changetype,
      @required this.oldPassword,
      @required this.newPassword,
      @required this.confirmPassword});
}

//InvestingGoalPage arguments holder class
class InvestingGoalPageArguments {
  final Key key;
  final DashboardGoal goal;
  final bool leftSelected;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> values;
  final int periodicity;
  final bool onlyPSE;
  InvestingGoalPageArguments(
      {this.key,
      this.goal,
      @required this.leftSelected,
      this.multiple = false,
      this.goals,
      this.values,
      this.periodicity = 1,
      this.onlyPSE = false});
}

//InvestingGoalPageMx arguments holder class
class InvestingGoalPageMxArguments {
  final Key key;
  final DashboardGoal goal;
  final bool leftSelected;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> values;
  final int periodicity;
  final bool onlyPSE;
  final bool fromRegister;
  InvestingGoalPageMxArguments(
      {this.key,
      this.goal,
      @required this.leftSelected,
      this.multiple = false,
      this.goals,
      this.values,
      this.periodicity = 1,
      this.onlyPSE = false,
      this.fromRegister = false});
}

//InvestingAddAccountPageMX arguments holder class
class InvestingAddAccountPageMXArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final dynamic bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool isWithdrawal;
  final bool isWallet;
  final dynamic accArgs;
  final WithdrawalInfo info;
  final bool finishedVinculation;
  InvestingAddAccountPageMXArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.isWithdrawal = false,
      this.isWallet = false,
      this.accArgs,
      this.info,
      this.finishedVinculation});
}

//InvestingAddAccountPage arguments holder class
class InvestingAddAccountPageArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isWithdrawal;
  final bool isWallet;
  final dynamic accArgs;
  final WithdrawalInfo info;
  InvestingAddAccountPageArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.investment = 0,
      this.isWithdrawal = false,
      this.isWallet = false,
      this.accArgs,
      this.info});
}

//InvestingOverviewPage arguments holder class
class InvestingOverviewPageArguments {
  final Key key;
  final DashboardGoal goal;
  final double investment;
  final bool bankTransfer;
  final BankAccountItem bankAccountItem;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool isFirstInvestment;
  InvestingOverviewPageArguments(
      {this.key,
      this.goal,
      this.investment = 0,
      this.bankTransfer = false,
      this.bankAccountItem,
      this.goals,
      this.valuesChosen,
      this.isFirstInvestment = false});
}

//InvestingOverviewPageMX arguments holder class
class InvestingOverviewPageMXArguments {
  final Key key;
  final DashboardGoal goal;
  final double investment;
  final bool bankTransfer;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingOverviewPageMXArguments(
      {this.key,
      this.goal,
      this.investment = 0,
      this.bankTransfer = false,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//InvestingSuccessPage arguments holder class
class InvestingSuccessPageArguments {
  final Key key;
  final DashboardGoal goal;
  final BankAccountItem item;
  final double investment;
  final bool isFirstInvestment;
  final Map<dynamic, dynamic> successData;
  final int typePopUp;
  InvestingSuccessPageArguments(
      {this.key,
      @required this.goal,
      @required this.item,
      this.investment,
      this.isFirstInvestment = false,
      this.successData,
      this.typePopUp});
}

//InvestingSuccessPageMX arguments holder class
class InvestingSuccessPageMXArguments {
  final Key key;
  final DashboardGoal goal;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool finishedVinculation;
  final bool isLoading;
  final double bankTransferValue;
  InvestingSuccessPageMXArguments(
      {this.key,
      this.goal,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen,
      this.finishedVinculation = false,
      this.isLoading = false,
      this.bankTransferValue = 0});
}

//InvestingTransactionSummaryMX arguments holder class
class InvestingTransactionSummaryMXArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingTransactionSummaryMXArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//InvestingTransactionSummary arguments holder class
class InvestingTransactionSummaryArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingTransactionSummaryArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.multiple = false,
      this.goals,
      this.valuesChosen});
}

//InvestingVerificationOverview arguments holder class
class InvestingVerificationOverviewArguments {
  final Key key;
  final bool check1;
  final bool check2;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingVerificationOverviewArguments(
      {this.key,
      this.check1,
      this.check2,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//InvestingVerificationOverviewMx arguments holder class
class InvestingVerificationOverviewMxArguments {
  final Key key;
  final bool check1;
  final bool check2;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool checkForm1;
  final bool checkForm2;
  final bool checkForm3;
  final bool checkForm4;
  final bool finishedVerification;
  InvestingVerificationOverviewMxArguments(
      {this.key,
      this.check1 = false,
      this.check2 = false,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen,
      this.checkForm1,
      this.checkForm2,
      this.checkForm3,
      this.checkForm4,
      this.finishedVerification = false});
}

//InvestingIdentityConfirmationPageMX arguments holder class
class InvestingIdentityConfirmationPageMXArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingIdentityConfirmationPageMXArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//InvestingIdentityConfirmationPage arguments holder class
class InvestingIdentityConfirmationPageArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  InvestingIdentityConfirmationPageArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0});
}

//InvestingDomicilioConfirmationPage arguments holder class
class InvestingDomicilioConfirmationPageArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  InvestingDomicilioConfirmationPageArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//SendEmailRegisterPage arguments holder class
class SendEmailRegisterPageArguments {
  final String name;
  final String email;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;
  SendEmailRegisterPageArguments(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy});
}

//SendOTPRegisterPage arguments holder class
class SendOTPRegisterPageArguments {
  final String email;
  final String name;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;
  final bool recoverPassword;
  SendOTPRegisterPageArguments(
      {@required this.email,
      @required this.name,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy,
      @required this.recoverPassword});
}

//MyGoalsPage arguments holder class
class MyGoalsPageArguments {
  final Key key;
  final KtList<DashboardGoal> items;
  final int initial;
  final double notAssignedBalance;
  MyGoalsPageArguments(
      {this.key,
      @required this.items,
      this.initial = 1,
      @required this.notAssignedBalance});
}

//ChooseGoalPage arguments holder class
class ChooseGoalPageArguments {
  final WithdrawalInfo withdrawalInfo;
  ChooseGoalPageArguments({@required this.withdrawalInfo});
}

//ChooseAccountPage arguments holder class
class ChooseAccountPageArguments {
  final WithdrawalInfo withdrawalInfo;
  final bool withdrawalAll;
  final double chosenAmmount;
  final List<DashboardGoal> chosenGoals;
  final DashboardGoal chosenGoal;
  final List<double> chosenValues;
  final bool deleteGoal;
  final bool deleteDebit;
  final bool editGoal;
  final bool withdrawalType;
  final List<DebitInfo> goalDebits;
  final List<BankInfo> banksInfoDebits;
  final bool isFormDeleteGoal;
  ChooseAccountPageArguments(
      {@required this.withdrawalInfo,
      @required this.withdrawalAll,
      @required this.chosenAmmount,
      @required this.chosenGoals,
      @required this.chosenGoal,
      @required this.chosenValues,
      this.deleteGoal = false,
      this.deleteDebit = false,
      this.editGoal = false,
      this.withdrawalType = false,
      this.goalDebits,
      this.banksInfoDebits,
      this.isFormDeleteGoal = false});
}

//SendOTPWithdrawalPage arguments holder class
class SendOTPWithdrawalPageArguments {
  final List<DashboardGoal> chosenGoals;
  final double chosenAmmount;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final BankInfo chosenAccount;
  final List<double> chosenValues;
  final int isValidDeleteDebit;
  final int isValidDeleteGoal;
  final bool isValidReCalculateDebits;
  SendOTPWithdrawalPageArguments(
      {@required this.chosenGoals,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalInfo,
      @required this.chosenAccount,
      this.chosenValues,
      this.isValidDeleteDebit,
      this.isValidDeleteGoal,
      this.isValidReCalculateDebits = false});
}

//WithdrawalSummaryPage arguments holder class
class WithdrawalSummaryPageArguments {
  final List<DashboardGoal> chosenGoals;
  final double chosenAmmount;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final BankInfo chosenAccount;
  final List<double> valuesChosen;
  final bool deleteGoal;
  final bool deleteDebit;
  final bool withdrawalType;
  final List<DebitInfo> goalDebits;
  WithdrawalSummaryPageArguments(
      {@required this.chosenGoals,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalInfo,
      @required this.chosenAccount,
      @required this.valuesChosen,
      this.deleteGoal = false,
      this.deleteDebit = false,
      this.withdrawalType = false,
      this.goalDebits});
}

//SuccessWithdrawalPage arguments holder class
class SuccessWithdrawalPageArguments {
  final double chosenAmmount;
  final List<DashboardGoal> chosenGoals;
  final List<double> chosenValues;
  final bool withdrawalAll;
  final double withdrawalFee;
  final WithdrawalInfo info;
  final int isValidDeleteGoal;
  SuccessWithdrawalPageArguments(
      {@required this.chosenAmmount,
      @required this.chosenGoals,
      @required this.chosenValues,
      @required this.withdrawalAll,
      @required this.withdrawalFee,
      this.info,
      this.isValidDeleteGoal});
}

//TransactionSummaryPage arguments holder class
class TransactionSummaryPageArguments {
  final List<DashboardGoal> chosenGoals;
  final List<double> chosenValues;
  final double chosenAmmount;
  final bool withdrawalAll;
  final double withdrawalFee;
  final WithdrawalInfo withdrawalInfo;
  TransactionSummaryPageArguments(
      {@required this.chosenGoals,
      @required this.chosenValues,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalFee,
      this.withdrawalInfo});
}

//BankTransferAlmostPage arguments holder class
class BankTransferAlmostPageArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final dynamic bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final double investment;
  final bool isFirstInvestment;
  final bool finishedVinculation;
  BankTransferAlmostPageArguments(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.bankTransferValue,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.investment = 0,
      this.isFirstInvestment = false,
      this.finishedVinculation = false});
}

//BankTransferSummaryPage arguments holder class
class BankTransferSummaryPageArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  BankTransferSummaryPageArguments(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.investment});
}

//BankTransferSummaryPageMX arguments holder class
class BankTransferSummaryPageMXArguments {
  final BankAccountItem accountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final DashboardGoal goal;
  final bool bankTransfer;
  final dynamic bankTransferValue;
  BankTransferSummaryPageMXArguments(
      {@required this.accountItem,
      @required this.multiple,
      @required this.goals,
      @required this.valuesChosen,
      @required this.goal,
      @required this.bankTransfer,
      @required this.bankTransferValue});
}

//MyWalletPageMX arguments holder class
class MyWalletPageMXArguments {
  final Key key;
  MyWalletPageMXArguments({this.key});
}

//InvestingGrandesMontosMaster arguments holder class
class InvestingGrandesMontosMasterArguments {
  final Key key;
  final DashboardGoal goal;
  final bool isDebito;
  final double investment;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final BankAccountItem bankItem;
  final bool cargarDocumentos;
  final bool isUpdate;
  final SarlaftItem sarlaftItem;
  final bool validButtonReturn;
  InvestingGrandesMontosMasterArguments(
      {this.key,
      this.goal,
      this.isDebito,
      this.investment = 0,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.bankItem,
      @required this.cargarDocumentos,
      this.isUpdate = false,
      this.sarlaftItem,
      this.validButtonReturn = false});
}

//IntroVerificationForm arguments holder class
class IntroVerificationFormArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool redirectHome;
  IntroVerificationFormArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.redirectHome = false});
}

//IntroEvidenteVerification arguments holder class
class IntroEvidenteVerificationArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final dynamic investment;
  IntroEvidenteVerificationArguments(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.investment});
}

//VerificationForm arguments holder class
class VerificationFormArguments {
  final Key key;
  final UserInfoRegistraduria info;
  final List<String> countries;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final BankAccountItem bankAccountItem;
  final bool redirectHome;
  VerificationFormArguments(
      {this.key,
      @required this.info,
      @required this.countries,
      this.goal,
      this.bankTransfer = false,
      this.investment = 0,
      this.bankAccountItem,
      this.redirectHome});
}

//EvidenteVerification arguments holder class
class EvidenteVerificationArguments {
  final Key key;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final BankAccountItem bankAccountItem;
  final bool redirectHome;
  EvidenteVerificationArguments(
      {this.key,
      this.goal,
      this.bankTransfer = false,
      this.investment = 0,
      this.bankAccountItem,
      this.redirectHome = false});
}

//UserMigrationPage arguments holder class
class UserMigrationPageArguments {
  final UserMigrationInfo userMigrationInfo;
  final BalanceItem balance;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  UserMigrationPageArguments(
      {@required this.userMigrationInfo,
      @required this.balance,
      @required this.goalQuincenal,
      @required this.goalMensual,
      @required this.goalTrimestral,
      @required this.goalPse,
      this.quincenalDone = false,
      this.mensualDone = false,
      this.trimestralDone = false,
      this.pseDone = false});
}

//EditGoalDebitPage arguments holder class
class EditGoalDebitPageArguments {
  final Key key;
  final DashboardGoal goal;
  final DebitInfo debitItem;
  final List<DashboardGoal> goals;
  EditGoalDebitPageArguments(
      {this.key,
      @required this.goal,
      @required this.debitItem,
      @required this.goals});
}

//InvestingChooseAccount arguments holder class
class InvestingChooseAccountArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  InvestingChooseAccountArguments(
      {this.goal, this.bankTransfer = false, this.investment = 0});
}

//InvestingChooseAccountMx arguments holder class
class InvestingChooseAccountMxArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool finishedVinculation;
  InvestingChooseAccountMxArguments(
      {this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.finishedVinculation});
}

//InvestingPseWebView arguments holder class
class InvestingPseWebViewArguments {
  final Key key;
  final String url;
  InvestingPseWebViewArguments({this.key, @required this.url});
}

//EditGoalPage arguments holder class
class EditGoalPageArguments {
  final Key key;
  final DashboardGoal goal;
  final List<DashboardGoal> relatedGoals;
  final DebitInfo relatedDebit;
  final WithdrawalInfo info;
  EditGoalPageArguments(
      {this.key,
      @required this.goal,
      this.relatedGoals,
      this.relatedDebit,
      this.info});
}

//CreateGoalMigration arguments holder class
class CreateGoalMigrationArguments {
  final Key key;
  final KtList<UserMigrationItem> debits;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final UserMigrationInfo userMigrationInfo;
  final BalanceItem balance;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  final int periodicity;
  final UserMigrationBloc blocc;
  CreateGoalMigrationArguments(
      {this.key,
      @required this.debits,
      @required this.goalQuincenal,
      @required this.goalMensual,
      @required this.goalTrimestral,
      @required this.goalPse,
      @required this.userMigrationInfo,
      @required this.balance,
      this.quincenalDone = false,
      this.mensualDone = false,
      this.trimestralDone = false,
      this.pseDone = false,
      this.periodicity = 1,
      @required this.blocc});
}

//IntroUserMigrationPage arguments holder class
class IntroUserMigrationPageArguments {
  final Key key;
  IntroUserMigrationPageArguments({this.key});
}

//DetailDebitsPage arguments holder class
class DetailDebitsPageArguments {
  final Key key;
  final UserMigrationBloc bloc;
  final List<UserMigrationItem> debits;
  final UserMigrationInfo userMigrationInfo;
  final BalanceItem balance;
  final int periodicity;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  DetailDebitsPageArguments(
      {this.key,
      @required this.bloc,
      @required this.debits,
      @required this.userMigrationInfo,
      @required this.balance,
      this.periodicity = 1,
      @required this.goalQuincenal,
      @required this.goalMensual,
      @required this.goalTrimestral,
      @required this.goalPse,
      this.quincenalDone = false,
      this.mensualDone = false,
      this.trimestralDone = false,
      this.pseDone = false});
}

//GoalCreationSummary arguments holder class
class GoalCreationSummaryArguments {
  final Key key;
  final List<UserMigrationItem> debits;
  final DashboardGoal goalCreated;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final BalanceItem balance;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  final UserMigrationInfo userMigrationInfo;
  final int periodicity;
  GoalCreationSummaryArguments(
      {this.key,
      @required this.debits,
      @required this.goalCreated,
      @required this.goalQuincenal,
      @required this.goalMensual,
      @required this.goalTrimestral,
      @required this.goalPse,
      this.balance,
      this.quincenalDone = false,
      this.mensualDone = false,
      this.trimestralDone = false,
      this.pseDone = false,
      @required this.userMigrationInfo,
      this.periodicity});
}

//FinishedSummaryPage arguments holder class
class FinishedSummaryPageArguments {
  final Key key;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  FinishedSummaryPageArguments(
      {this.key,
      @required this.goalQuincenal,
      @required this.goalMensual,
      @required this.goalTrimestral,
      @required this.goalPse});
}

//VideoSenderPage arguments holder class
class VideoSenderPageArguments {
  final Key key;
  final String idFace;
  final String idINE;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool firstVideo;
  VideoSenderPageArguments(
      {this.key,
      this.idFace = "TestFlutterFace",
      this.idINE = "TestFlutterINEIFE",
      this.goal,
      this.bankTransfer,
      this.bankTransferValue,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen,
      this.firstVideo = true});
}

//CloseSessionPage arguments holder class
class CloseSessionPageArguments {
  final Key key;
  CloseSessionPageArguments({this.key});
}

//GenericWebView arguments holder class
class GenericWebViewArguments {
  final Key key;
  final String url;
  GenericWebViewArguments({this.key, @required this.url});
}

//VideoSenderIntroPage arguments holder class
class VideoSenderIntroPageArguments {
  final Key key;
  final String idVideoFace;
  final DashboardGoal goal;
  final String idVideoINEIFE;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  VideoSenderIntroPageArguments(
      {this.key,
      this.idVideoFace = "userFace",
      this.goal,
      this.idVideoINEIFE = "userID",
      this.bankTransfer,
      this.bankTransferValue,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen});
}

//MigrationIntroPage arguments holder class
class MigrationIntroPageArguments {
  final Key key;
  MigrationIntroPageArguments({this.key});
}

//AssignToGoalSuccess arguments holder class
class AssignToGoalSuccessArguments {
  final Key key;
  final DashboardGoal assignedTo;
  final DashboardGoal assignedFrom;
  final double assignedValue;
  AssignToGoalSuccessArguments(
      {this.key,
      @required this.assignedTo,
      @required this.assignedFrom,
      @required this.assignedValue});
}

//ConfirmationEvidentePage arguments holder class
class ConfirmationEvidentePageArguments {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isFirstInvestment;
  ConfirmationEvidentePageArguments(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.investment,
      this.isFirstInvestment = false});
}

//EntrevistaWebView arguments holder class
class EntrevistaWebViewArguments {
  final Key key;
  final String url;
  EntrevistaWebViewArguments({this.key, @required this.url});
}
