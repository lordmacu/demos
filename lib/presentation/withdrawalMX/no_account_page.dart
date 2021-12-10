import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/value_objects.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/investing/widgets/account_number_text_input_formatter.dart';
import 'package:ualet/presentation/investing/widgets/add_account_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_menu.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class NoAccountPage extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isWithdrawal;
  final bool isWallet;
  final ChooseAccountPageArguments accArgs;
  final WithdrawalInfo info;
  final List<DashboardGoal> chosenGoals;
  final DashboardGoal chosenGoal;
  final List<DashboardGoal> goals;
  final bool withdrawalAll;

  final double chosenAmmount;
  final WithdrawalInfo withdrawalInfo;
  final bool editGoal;
  final bool deleteGoal;

  final bool deleteDebit;
  final List<double> values;

  const NoAccountPage(
      {Key key,
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
      this.chosenGoal})
      : super(key: key);

  _NoAccountPage createState() => _NoAccountPage(
      goal: this.goal,
      bankTransfer: this.bankTransfer,
      investment: this.investment,
      isWithdrawal: this.isWithdrawal,
      isWallet: this.isWallet,
      accArgs: this.accArgs,
      info: this.info,
      chosenGoal: this.chosenGoal,
      goals: this.goals,
      chosenAmmount: this.chosenAmmount,
      withdrawalInfo: this.withdrawalInfo,
      editGoal: this.editGoal,
      withdrawalAll: this.withdrawalAll,
      deleteGoal: this.deleteGoal,
      deleteDebit: this.deleteDebit,
      values: this.values,
      chosenGoals: this.chosenGoals);
}

class _NoAccountPage extends State<NoAccountPage> {
  final DashboardGoal goal;
  final List<DashboardGoal> chosenGoals;
  final DashboardGoal chosenGoal;
  final bool bankTransfer;
  final double investment;
  final bool isWithdrawal;
  final bool isWallet;
  final List<DashboardGoal> goals;
  final double chosenAmmount;
  final WithdrawalInfo withdrawalInfo;

  final ChooseAccountPageArguments accArgs;
  final WithdrawalInfo info;
  final bool withdrawalAll;
  final bool editGoal;
  final bool deleteGoal;
  final bool deleteDebit;
  final List<double> values;
  _NoAccountPage(
      {Key key,
      this.goal,
      this.bankTransfer = false,
      this.investment = 0,
      this.isWithdrawal = false,
      this.isWallet = false,
      this.accArgs,
      this.info,
      this.chosenGoal,
      this.goals,
      this.chosenAmmount,
      this.withdrawalInfo,
      this.withdrawalAll,
      this.editGoal,
      this.deleteGoal,
      this.deleteDebit,
      this.values,
      this.chosenGoals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
          text: S.of(context).registerAccount,
          action: () {
            var chosenGoals2 = goals.length == 0 ? [chosenGoal] : goals;
            var valuesChosen = goals.length == 0 ? [chosenAmmount] : values;
            return getIt<IEnv>().isColombia()
                ? ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.investingAddAccountPage,
                    arguments: InvestingAddAccountPageArguments(
                      goal: DashboardGoal.empty(),
                      bankTransfer: false,
                      investment: 0,
                      isWallet: true,
                    ),
                  )
                : ExtendedNavigator.rootNavigator
                    .pushReplacementNamed(Routes.investingAddAccountPageMX,
                        arguments: InvestingAddAccountPageMXArguments(
                          goal: goal,
                          bankTransfer: true,
                          bankTransferValue: chosenAmmount,
                          goals: goals,
                          multiple: false,
                          accArgs: accArgs,
                          valuesChosen: valuesChosen,
                          finishedVinculation: false,
                          isWithdrawal: isWithdrawal
                        ));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: AppColors.primaryColor,
                    alignment: Alignment.topLeft,
                    tooltip: "Volver",
                    onPressed: () =>
                        ExtendedNavigator.rootNavigator.pop(context),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    S.of(context).registerAccount,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                S.of(context).noaccountEmoji,
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                S.of(context).titleDontHaveAccount,
                style: AppTextStyles.subtitle2.copyWith(
                  color: AppColors.g25Color,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                S.of(context).titleDontHaveAccountDescription,
                textAlign: TextAlign.center,
                style: AppTextStyles.normal4.copyWith(
                  color: AppColors.txtColorGrey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            S.of(context).titleDontHaveAccountDescriptionTwopro,
                        style: AppTextStyles.normal4.copyWith(
                            color: AppColors.txtColorGrey,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: getIt<IEnv>().isColombia()
                                ? S
                                    .of(context)
                                    .titleDontHaveAccountDescriptionTwo
                                : S
                                    .of(context)
                                    .titleDontHaveAccountDescriptionTwoMx,
                            style: AppTextStyles.normal4.copyWith(
                              color: AppColors.txtColorGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
