import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../injection.dart';

class InvestingChooseAccountMx extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool finishedVinculation;

  InvestingChooseAccountMx({
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.multiple = false,
    this.goals,
    this.valuesChosen,
    this.finishedVinculation,
  });

  @override
  Widget build(BuildContext context) {
    print(" Values chosen: $valuesChosen");
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestingMxDomBloc>(
          create: (context) => getIt<InvestingMxDomBloc>()
            ..add(InvestingMxDomEvent.getBankAccounts()),
        )
      ],
      child: BlocConsumer<InvestingMxDomBloc, InvestingMxDomState>(
          listener: (context, state) {
        if (state.banksFetched && state.bankAccounts.length == 0) {
          ExtendedNavigator.rootNavigator
              .pushReplacementNamed(Routes.investingAddAccountPageMX,
                  arguments: InvestingAddAccountPageMXArguments(
                    goal: goal,
                    bankTransfer: bankTransfer,
                    bankTransferValue: bankTransferValue,
                    goals: goals,
                    multiple: multiple,
                    valuesChosen: valuesChosen,
                    finishedVinculation: finishedVinculation,
                  ));
        }
      }, builder: (context, state) {
        if (state.isSubmitting) {
          return Stack(
            children: <Widget>[
              Container(
                color: AppColors.backgroundColor,
              ),
              LoadingInProgressOverlay(isLoading: true)
            ],
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: AppDimens.layoutMarginM,
                right: AppDimens.layoutMarginM,
                bottom: AppDimens.layoutSpacerL,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryButton(
                      text: S.of(context).nextButton,
                      action: () {
                        if (!bankTransfer) {
                          ExtendedNavigator.rootNavigator
                              .pushNamed(Routes.investingSuccessPageMX,
                                  arguments: InvestingSuccessPageMXArguments(
                                    goal: goal,
                                    bankAccountItem: state.bankChosen,
                                    goals: goals,
                                    multiple: multiple,
                                    valuesChosen: valuesChosen,
                                    finishedVinculation: finishedVinculation,
                                    bankTransferValue: bankTransferValue
                                  ));
                        } else {
                          ExtendedNavigator.rootNavigator.pushNamed(
                            Routes.bankTransferSummaryPageMX,
                            arguments: BankTransferSummaryPageMXArguments(
                                accountItem: state.bankChosen,
                                goal: goal,
                                bankTransfer: bankTransfer,
                                bankTransferValue: bankTransferValue,
                                goals: goals,
                                multiple: multiple,
                                valuesChosen: valuesChosen),
                          );
                        }
                      },
                      enabled: state.bankChosen.bankId != -1,
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(
                    left: AppDimens.layoutMargin,
                    right: AppDimens.layoutMargin,
                    top: AppDimens.layoutSpacerXs,
                    bottom: AppDimens.layoutSpacerXs),
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: AppColors.primaryColor,
                    alignment: Alignment.topLeft,
                    tooltip: "Volver",
                    onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                  ),
                  Text(
                    S.of(context).investingGoalsChooseAccountTitle,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutMarginS,
                  ),
                  Text(
                    bankTransfer
                        ? getIt<IEnv>().isColombia()
                            ? S.of(context).investingChooseAccountDescription
                            : S.of(context).investingChooseAccountDescriptionMx
                        : S
                            .of(context)
                            .investingChooseAccountDescriptionTransfer,
                    style: AppTextStyles.normal1.copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.g75Color),
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      primary: false,
                      itemCount: state.bankAccounts.length,
                      itemBuilder: (context, index) {
                        BankInfo bank = state.bankAccounts[index];
                        String obfuscatedAccountNumber =
                            "**** ${bank.accountNumber.substring(bank.accountNumber.length - 4)}";
                        String accountType = "";
                        if (bank.accountTypeId == 1) {
                          accountType = S.of(context).accountType1;
                        } else if (bank.accountTypeId == 2) {
                          accountType = S.of(context).accountType2;
                        } else {
                          accountType = S.of(context).accountType1;
                        }
                        return InkWell(
                          onTap: () => context.bloc<InvestingMxDomBloc>().add(
                                InvestingMxDomEvent.chooseAccount(bank),
                              ),
                          splashColor: Colors.transparent,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.dialogBorderRadius,
                                  ),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                        color: state.bankChosen.id !=
                                                bank.bankAccountId
                                            ? AppColors.whiteColor
                                            : AppColors.successColor),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                    right: AppDimens.layoutMarginS,
                                    top: AppDimens.layoutMarginS,
                                    bottom: AppDimens.layoutMarginS),
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor:
                                          AppColors.g25Color),
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: bank.bankAccountId,
                                        groupValue: state.bankChosen.id,
                                        activeColor: AppColors.successColor,
                                        onChanged: (value) => context
                                            .bloc<InvestingMxDomBloc>()
                                            .add(
                                              InvestingMxDomEvent.chooseAccount(
                                                  bank),
                                            ),
                                      ),
                                      CachedNetworkImage(
                                          imageUrl: bank.bankLogo),
                                      SizedBox(
                                        width: AppDimens.layoutSpacerS,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            accountType,
                                            style: AppTextStyles.caption1
                                                .copyWith(
                                                    color: AppColors.g50Color,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Text(
                                            obfuscatedAccountNumber,
                                            style: AppTextStyles.normal2
                                                .copyWith(
                                                    color: AppColors.g50Color),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppDimens.layoutSpacerS,
                                      ),
                                      Expanded(
                                        child: Text(
                                          bank.stateName,
                                          style:
                                              AppTextStyles.caption2.copyWith(
                                            color: bank.status == 2
                                                ? AppColors.successColor
                                                : AppColors.infoColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.layoutSpacerS,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
