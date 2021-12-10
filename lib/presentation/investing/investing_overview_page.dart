import 'dart:convert';

import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/pse_investment_time_dialog.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ualet/application/investingMX/investingMxDocAccept/investing_mx_doc_accept_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';

class InvestingOverviewPage extends StatefulWidget {
  final DashboardGoal goal;
  final double investment;
  final bool bankTransfer;
  final BankAccountItem bankAccountItem;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool isFirstInvestment;

  const InvestingOverviewPage({
    Key key,
    this.goal,
    this.investment = 0,
    this.bankTransfer = false,
    this.bankAccountItem,
    this.goals,
    this.valuesChosen,
    this.isFirstInvestment = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InvestingOverviewPageState();
}

class _InvestingOverviewPageState extends State<InvestingOverviewPage> {
  final copFormatter = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  SharedPreferences _prefs = getIt<SharedPreferences>();
  dynamic decoreAppConfiguration;
  double bankCommission = 0;
  double bankCommissionDebit = 0;

  @override
  void initState() {
    //Obtener los costos bancarios, inversión minima de la tabla "AppConfiguration"
    if (_prefs.appConfiguration != '') {
      decoreAppConfiguration = json.decode(_prefs.appConfiguration);
      bankCommission = decoreAppConfiguration["BankCommission"] != null
          ? decoreAppConfiguration["BankCommission"]
          : EnvironmentConfig.bankCommission;
      bankCommissionDebit =
          decoreAppConfiguration["BankCommissionDebit"] != null
              ? decoreAppConfiguration["BankCommissionDebit"]
              : EnvironmentConfig.bankCommissionDebit;
    } else {
      bankCommission = EnvironmentConfig.bankCommission;
      bankCommissionDebit = EnvironmentConfig.bankCommissionDebit;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestingMxDocAcceptBloc>(
          create: (context) => getIt<InvestingMxDocAcceptBloc>()
            ..add(InvestingMxDocAcceptEvent.initial()),
        )
      ],
      child: BlocBuilder<InvestingMxDocAcceptBloc, InvestingMxDocAcceptState>(
          builder: (context, state) => _buildRoot(context, state)),
    );
  }

  Widget _buildRoot(BuildContext context, InvestingMxDocAcceptState state) {
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
                top: AppDimens.layoutSpacerX * 2),
            child: PrimaryButton(
              text: S.of(context).nextButton,
              action: () {
                if (widget.bankTransfer) {
                  getIt<IFireBaseEventLogger>().investmentPseNextCost();
                  _showPopUpPSE(
                    context,
                  );
                } else {
                  getIt<IFireBaseEventLogger>().investmentDebitNextCost();
                  navigateToNextStep(context);
                }
              },
            ),
          ),
          body: SafeArea(
              child: Container(
                  child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
            primary: false,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      ExtendedNavigator.rootNavigator.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              _headerInvestIntro(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _headerInvestDescription(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _overviewContainer(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),

              //Button
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
            ],
          ))));
    }
  }

  Widget _headerInvestIntro(context) {
    return Text(
      S.of(context).addMoney,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Widget _headerInvestDescription(context) {
    return Text(
      widget.bankTransfer
          ? S.of(context).withdrawalDescriptionCO
          : S.of(context).withdrawalDescriptionCO2,
      style: AppTextStyles.normal1.copyWith(
        color: AppColors.g90Color,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _overviewContainer(BuildContext context) {
    String fee = "";
    String total = "";

    fee = copFormatter.format(widget.investment);
    total = copFormatter.format(widget.investment +
        (widget.bankTransfer ? bankCommission : bankCommissionDebit));

    return Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppDimens.dialogBorderRadius,
            ),
          ),
        ),
        padding: EdgeInsets.all(AppDimens.layoutMargin),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.bankTransfer
                      ? S.of(context).yourInvestment
                      : S.of(context).debitValue,
                  style: AppTextStyles.normal4,
                ),
                Text(
                  "$fee",
                  style: AppTextStyles.normal2.copyWith(
                    color: AppColors.g75Color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).withdrawalFee, style: AppTextStyles.normal4),
                Text(
                    copFormatter.format(widget.bankTransfer
                        ? bankCommission
                        : bankCommissionDebit),
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(S.of(context).total, style: AppTextStyles.normal4),
                  Text("$total",
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ))
                ]),
          ],
        ));
  }

  _showPopUpPSE(
    BuildContext context,
  ) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: PSEInvestmentTimeDialog(
            acceptCallBack: () {
              ExtendedNavigator.rootNavigator.pop();
              navigateToNextStep(context);
            },
            undoCallback: () {
              ExtendedNavigator.rootNavigator.pop();
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.28)).animate(anim1),
          child: child,
        );
      },
    );
  }

  navigateToNextStep(BuildContext context) async {
    context
        .bloc<InvestingMxDocAcceptBloc>()
        .add(InvestingMxDocAcceptEvent.isSubmitting(false));
    var repo = getIt<ICustomerLevelRepoCol>();
    double investment = widget.investment;
    print(investment);

    var response1 = await repo.getCurrentCustomerLevel();
    // var responseBlackListConsult = await repo.getValidBlackListConsult();

    bool redirected = false;
    print(response1);

    response1.fold((l) {
      context
          .bloc<InvestingMxDocAcceptBloc>()
          .add(InvestingMxDocAcceptEvent.isSubmitting(false));
      ToastHelper.createError(
          message: l.map(
              unexpected: (e) => "Error inesperado :(",
              fromServer: (e) => "Error: ${e.message}")).show(context);
    }, (r) {
      print("este es el customerlevel  $r");
      context
          .bloc<InvestingMxDocAcceptBloc>()
          .add(InvestingMxDocAcceptEvent.isSubmitting(false));
      print("First Try: $r");
      print(CustomerLevelRepositoryCol.HOME);
      print(CustomerLevelRepositoryCol.CREACION_META_1);

      if (r == CustomerLevelRepositoryCol.HOME ||
          r == CustomerLevelRepositoryCol.CREACION_META_1) {
        redirected = true;
        ExtendedNavigator.rootNavigator.pushNamed(
          Routes.investingVerificationOverview,
          arguments: InvestingVerificationOverviewArguments(
            bankTransfer: widget.bankTransfer,
            bankTransferValue: widget.investment,
            goal: widget.goal,
            bankAccountItem: widget.bankAccountItem,
            valuesChosen: widget.valuesChosen,
          ),
        );
      } else if (r == CustomerLevelRepositoryCol.MOSTRAR_REGISTRADURIA) {
        redirected = true;
        ExtendedNavigator.rootNavigator.pushNamed(
          Routes.investingVerificationOverview,
          arguments: InvestingVerificationOverviewArguments(
            bankTransfer: widget.bankTransfer,
            bankTransferValue: widget.investment,
            goal: widget.goal,
            bankAccountItem: widget.bankAccountItem,
            valuesChosen: widget.valuesChosen,
          ),
        );
      }
    });

    if (redirected) return;
    var response = await repo.verifyNextRedirection(investment);
    response.fold((l) {
      ToastHelper.createError(
          message: l.map(
              unexpected: (e) => "Error inesperado",
              fromServer: (e) => "Error: ${e.message}")).show(context);
    }, (r) {
      switch (r.customerLevel) {
        case CustomerLevelRepositoryCol.CARGUE_DOCUMENTOS:


          showDialog(
              context: context,
              barrierDismissible: false,
            builder: (BuildContext context) =>Align(
              alignment: Alignment.center,
              child: CustomDialog(
                description: r.message,
                title: r.title,
                buttonText: S.of(context).continueButton,
                buttonAction: () {
                  getIt<IFireBaseEventLogger>().investmentMovementsTop();
                  ExtendedNavigator.rootNavigator.pushReplacementNamed(
                      Routes.investingGrandesMontos,
                      arguments: InvestingGrandesMontosMasterArguments(
                          cargarDocumentos: true,
                          goal: widget.goal,
                          isDebito: widget.bankTransfer,
                          investment: investment,
                          valuesChosen: widget.valuesChosen,
                          bankItem: widget.bankAccountItem));
                },
                icon: Icons.add_to_home_screen,
                iconColor: AppColors.successColor,
              ),
            )
               );
          break;
        case CustomerLevelRepositoryCol.MOSTRAR_SARLAFT:

          showDialog(
              context: context,
              barrierDismissible: false,
            builder: (BuildContext context) =>Align(
              alignment: Alignment.center,
              child: CustomDialog(
                buttonText: S.of(context).continueButton,
                buttonAction: () {
                  getIt<IFireBaseEventLogger>().investmentMovementsTop();
                  ExtendedNavigator.rootNavigator.pushReplacementNamed(
                      Routes.investingGrandesMontos,
                      arguments: InvestingGrandesMontosMasterArguments(
                          cargarDocumentos: false,
                          goal: widget.goal,
                          isDebito: !widget.bankTransfer,
                          investment: investment,
                          valuesChosen: widget.valuesChosen,
                          bankItem: widget.bankAccountItem));
                },
                // description: S.of(context).sarlaftPopupSubtitle,
                description: r.message,
                // title: S.of(context).sarlaftPopupTitle,
                title: r.title,
                icon: Icons.add_to_home_screen,
                iconColor: AppColors.successColor,
              ),
            )
            );
          break;

        case CustomerLevelRepositoryCol.MOSTRAR_EVIDENTE:
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.evidenteVerification,
            arguments: EvidenteVerificationArguments(
                bankAccountItem: widget.bankAccountItem,
                bankTransfer: widget.bankTransfer,
                investment: widget.investment,
                goal: widget.goal),
          );
          break;

        default:
          if (!widget.bankTransfer) {
            //TO CHOOSE ACCOUNT
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.investingChooseAccount,
                arguments: InvestingChooseAccountArguments(
                    goal: widget.goal,
                    bankTransfer: false,
                    investment: widget.investment));
          } else
            ExtendedNavigator.rootNavigator
                .pushReplacementNamed(Routes.bankTransferAlmostPage,
                    arguments: BankTransferAlmostPageArguments(
                      goal: widget.goal,
                      bankTransfer: true,
                      bankTransferValue: widget.investment,
                      investment: widget.investment,
                      isFirstInvestment: widget.isFirstInvestment,
                    ));
          break;
      }
    });
  }
}
