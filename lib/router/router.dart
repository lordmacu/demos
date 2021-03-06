import 'package:ualet/presentation/beneficiaries/beneficiaries_page.dart';
import 'package:ualet/presentation/core/generic_web_view.dart';
import 'package:ualet/presentation/extract/extract_page.dart';
import 'package:ualet/presentation/investing/entrevista/entrevista_page.dart';
import 'package:ualet/presentation/investing/entrevista/entrevista_webview.dart';
import 'package:ualet/presentation/investing/investing_add_bank_account_page_mx.dart';
import 'package:ualet/presentation/investing/investing_choose_bank_account_page_mx.dart';
import 'package:ualet/presentation/investing/investing_goal_page_mx.dart';
import 'package:ualet/presentation/investing/investing_page_mx.dart';
import 'package:ualet/presentation/investing/investing_verification_overview_mx.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart';
import 'package:ualet/presentation/notifications/notifications_page.dart';
import 'package:ualet/presentation/introduction/maintenance_page.dart';
import 'package:ualet/presentation/investing/grandes_montos/investing_grandes_montos_master.dart';
import 'package:ualet/presentation/investing/identity_verification_co/evidente_verification.dart';
import 'package:ualet/presentation/investing/identity_verification_co/intro_evidente_verification.dart';
import 'package:ualet/presentation/investing/identity_verification_co/intro_verification_form.dart';
import 'package:ualet/presentation/investing/identity_verification_co/verification_form.dart';
import 'package:ualet/presentation/investing/investing_choose_bank_account_page.dart';
import 'package:ualet/presentation/investing/investing_pse_webview.dart';
import 'package:ualet/presentation/mygoals/assign_to_goal_success_page.dart';
import 'package:ualet/presentation/mygoals/edit_debit_goal.dart';
import 'package:ualet/presentation/mygoals/edit_goal_page.dart';
import 'package:ualet/presentation/updateapp/update_app_page.dart';
import 'package:ualet/presentation/usermigration/create_goal_migration.dart';
import 'package:ualet/presentation/usermigration/new_version/migration_intro_page.dart';
import 'package:ualet/presentation/usermigration/user_migration_intro_page.dart';
import 'package:ualet/presentation/usermigration/user_migration_page.dart';
import 'package:ualet/presentation/usermigration/widgets/detail_debits_page.dart';
import 'package:ualet/presentation/usermigration/widgets/finished_summary_page.dart';
import 'package:ualet/presentation/usermigration/widgets/goal_creation_summary.dart';
import 'package:ualet/to_be_refactor/pages/login/dialog/close_session_page.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:ualet/presentation/about/about_ualet_page.dart';
import 'package:ualet/presentation/core/widgets/info_pages/success_info_page.dart';
import 'package:ualet/presentation/help/help_page.dart';
import 'package:ualet/presentation/help/widgets/support_account_page.dart';
import 'package:ualet/presentation/help/widgets/support_form_page.dart';
import 'package:ualet/presentation/help/widgets/support_success_page.dart';
import 'package:ualet/presentation/home/intro_home_page.dart';
import 'package:ualet/presentation/introduction/introductory_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_almost_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_summary_page.dart';
import 'package:ualet/presentation/investing/bank_transfer_summary_page_mx.dart';
import 'package:ualet/presentation/investing/investing_add_bank_account_page.dart';
import 'package:ualet/presentation/investing/investing_goal_page.dart';
import 'package:ualet/presentation/investing/investing_identity_confirmation_page.dart';
import 'package:ualet/presentation/investing/investing_identity_confirmation_page_mx.dart';
import 'package:ualet/presentation/investing/investing_domicilio_confirmation_page.dart';
import 'package:ualet/presentation/investing/investing_overview_page.dart';
import 'package:ualet/presentation/investing/investing_overview_page_mx.dart';
import 'package:ualet/presentation/investing/investing_page.dart';
import 'package:ualet/presentation/investing/investing_success_page.dart';
import 'package:ualet/presentation/investing/investing_success_page_mx.dart';
import 'package:ualet/presentation/investing/investing_transaction_summary.dart';
import 'package:ualet/presentation/investing/investing_transaction_summary_mx.dart';
import 'package:ualet/presentation/investing/investing_verification_overview.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_email_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_password_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/change_phone_number_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_email_page.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_otp_page.dart';
import 'package:ualet/presentation/myaccount/my_account_page.dart';
import 'package:ualet/presentation/mygoals/my_goals_page.dart';
import 'package:ualet/presentation/mywallet/my_wallet_page_mx.dart';
import 'package:ualet/presentation/profiling/profiling_page.dart';
import 'package:ualet/presentation/profiling/widgets/profiling_success_page.dart';
import 'package:ualet/presentation/register/register_page_mx.dart';
import 'package:ualet/presentation/register/widgets/send_email_register_page.dart';
import 'package:ualet/presentation/register/widgets/send_otp_register_page.dart';
import 'package:ualet/presentation/terms/terms_and_conditions_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/choose_account_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/choose_goal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/sent_otp_withdrawal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/success_withdrawal_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/transaction_summary_page.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/withdrawal_summary_page.dart';
import 'package:ualet/presentation/withdrawalMX/withdrawal_page.dart';
import 'package:ualet/to_be_refactor/pages/goals/goalsIntroVideo.dart';
import 'package:ualet/to_be_refactor/pages/goals/goals_page.dart';
import 'package:ualet/to_be_refactor/pages/goals/resume_goal_page.dart';
import 'package:ualet/to_be_refactor/pages/home/home_page.dart';
import 'package:ualet/to_be_refactor/pages/index/index_page.dart';
import 'package:ualet/to_be_refactor/pages/login/login_page.dart';
import 'package:ualet/to_be_refactor/pages/login/recover_password_page.dart';
import 'package:ualet/to_be_refactor/pages/login/recover_password_page_mx.dart';
import 'package:ualet/presentation/mywallet/edit_debit_page.dart';
import 'package:ualet/presentation/notifications/notifications_page.dart';
import 'package:ualet/to_be_refactor/pages/portfolio/portfolio_page.dart';
import 'package:ualet/presentation/profile/profile_page.dart';
import 'package:ualet/presentation/register/create_password_page.dart';
import 'package:ualet/presentation/register/register_page.dart';
import 'package:ualet/presentation/introduction/on_boarding_page.dart';
import 'package:ualet/to_be_refactor/pages/splash/splash_page.dart';
import 'package:ualet/presentation/investing/confirmation_evidente.dart';
import 'package:ualet/presentation/withdrawalMX/no_account_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashScreen splashScreen;
  IndexPage indexPage;
  NoAccountPage noAccountPage;
  LoginPage loginPage;
  HomePage homePage;
  ProfilePage profilePage;
  NotificationsPage notificationsPage;
  RegisterPage registerPage;
  RegisterPageMX registerPageMX;
  SuccessInfoPage successInfoPage;
  GoalsIntroVideo goalsVideo;
  GoalsPages goalsPages;
  ProfilingPage profilingPage;
  ProfilingSuccessPage profilingSuccessPage;
  CreatePasswordPage createPasswordPage;
  RecoverPasswordPage recoverPasswordPage;
  RecoverPasswordPageMX recoverPasswordPageMX;
  TermsAndConditions termsAndConditions;
  ResumeGoalPage resumeGoalPage;
  IntroHomePage introHomePage;
  PortfolioPage portfolioPage;
  ExtractPage extractsPage;
  HelpPage helpPage;
  HelpSupportFormPage helpSupportFormPage;
  SupportSuccessPage supportSuccessPage;
  AboutUaletPage aboutUaletPage;
  InvestingIntroPageMx investingIntroPageMx;
  InvestingIntroPage investingIntroPage;
  MyAccountPage myAccountPage;
  SupportAccountPage supportAccountPage;
  EditDebitPage editDebitPage;
  ChangeEmailPage changeEmailPage;
  ChangePasswordPage changePasswordPage;
  ChangePhoneNumber changePhoneNumber;
  SendEmailPage sendEmailPage;
  SendOTPPage sendOTPPage;
  InvestingGoalPage investToGoal;
  InvestingGoalPageMx investToGoalMx;
  InvestingAddAccountPageMX investingAddAccountPageMX;
  InvestingAddAccountPage investingAddAccountPage;
  InvestingOverviewPage investingOverviewPage;
  InvestingOverviewPageMX investingOverviewPageMX;
  InvestingSuccessPage investingSuccessPage;
  InvestingSuccessPageMX investingSuccessPageMX;
  InvestingTransactionSummaryMX investingTransactionSummaryPageMX;
  InvestingTransactionSummary investingTransactionSummary;
  InvestingVerificationOverview investingVerificationOverview;
  InvestingVerificationOverviewMx investingVerificationOverviewMx;
  InvestingIdentityConfirmationPageMX investingIdentityConfirmationPageMX;
  InvestingIdentityConfirmationPage investingIdentityConfirmationPage;
  InvestingDomicilioConfirmationPage investingDomicilioConfirmationPage;
  SendEmailRegisterPage sendEmailRegisterPage;
  SendOTPRegisterPage sendOTPRegisterPage;
  MyGoalsPage myGoalsPage;
  MyGoalsPage myGoalsPageMx;
  WithDrawalPage withDrawalPageMX;
  ChooseGoalPage chooseGoalPageMX;
  ChooseAccountPage chooseAccountPageMX;
  SendOTPWithdrawalPage sendOTPWithdrawalPageMX;
  WithdrawalSummaryPage withdrawalSummaryPageMX;
  SuccessWithdrawalPage successWithdrawalPageMX;
  TransactionSummaryPage transactionSummaryPageMX;
  BankTransferAlmostPage bankTransferAlmostPage;
  BankTransferSummaryPage bankTransferSummaryPage;
  BankTransferSummaryPageMX bankTransferSummaryPageMX;
  MyWalletPageMX myWalletPageMX;
  InvestingGrandesMontosMaster investingGrandesMontos;
  IntroVerificationForm introVerificationForm;
  IntroEvidenteVerification introEvidenteVerification;
  VerificationForm verificationForm;
  EvidenteVerification evidenteVerification;
  UserMigrationPage userMigrationPage;
  EditGoalDebitPage editGoalDebitPage;
  InvestingChooseAccount investingChooseAccount;
  InvestingChooseAccountMx investingChooseAccountMx;
  InvestingPseWebView investingPseWebView;
  EditGoalPage editGoalPage;
  CreateGoalMigration createGoalMigration;
  IntroUserMigrationPage introUserMigrationPage;
  DetailDebitsPage detailDebitsPage;
  GoalCreationSummary goalCreationSummary;
  FinishedSummaryPage finishedSummaryPage;
  VideoSenderPage videoSenderPage;
  CloseSessionPage closeSessionPage;
  BeneficiariesPage beneficiariesPage;
  UpdateAppPage updateAppPage;
  GenericWebView genericWebView;
  VideoSenderIntroPage videoSenderIntroPage;
  OnBoardingPage onBoardingPage;
  MigrationIntroPage migrationIntroPage;
  AssignToGoalSuccess assignToGoalSuccess;
  ConfirmationEvidentePage confirmationEvidente;
  MaintenancePage maintenancePage;
  EntrevistaPage entrevistaPage;
  EntrevistaWebView entrevistaWebView;
}
