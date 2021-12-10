import 'dart:convert';

import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ualet/application/investingMX/investingMxDocAccept/investing_mx_doc_accept_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/fileViewers/pdf_viewer.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';

class InvestingOverviewPageMX extends StatefulWidget {
  final DashboardGoal goal;
  final double investment;
  final bool bankTransfer;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingOverviewPageMX(
      {Key key,
      this.goal,
      this.investment = 0,
      this.bankTransfer = false,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InvestingOverviewPageStateMX();
}

class _InvestingOverviewPageStateMX extends State<InvestingOverviewPageMX> {

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

  NumberFormat mxFormatter = NumberFormaters.mxFormater;

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

  Scaffold _buildRoot(BuildContext context, InvestingMxDocAcceptState state) {
    bool isActivated =
        context.bloc<InvestingMxDocAcceptBloc>().isButtonActivated();
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.layoutMarginM,
            right: AppDimens.layoutMarginM,
            bottom: AppDimens.layoutSpacerL,
          ),
          child: PrimaryButton(
            text: S.of(context).continueButton,
            action: isActivated
                ? () async {
                    if (widget.bankTransfer) {
                      //Firebase 28
                      // getIt<IFirebaseEventLoggerMX>()
                      //     .speiInvestmentAditionalValue();
                    } else {
                      //Firebase 24
                      // getIt<IFirebaseEventLoggerMX>()
                      //     .domiciliacionInvestAditionalValue();
                    }
                    SharedPreferences _prefs = getIt<SharedPreferences>();
                    _prefs.setCheck1 = state.checkBox1;
                    _prefs.setCheck2 = state.checkBox2;
                    _prefs.setCheck3 = state.checkBox3;
                    _prefs.setCheck4 = state.checkBox4;

                    bool error = false;
                    var lvl = (await getIt<ICustomerLevelRepoMx>()
                            .getCurrentCustomerLevel())
                        .fold((l) {
                      error = true;
                      return -3;
                    }, (r) => r);
                    if (error) {
                      ToastHelper.createError(
                              message: "Error inesperado, intente de nuevo")
                          .show(context);
                      return;
                    }

                    if (lvl == CustomerLevelRepository.INVESTING_DONE) {
                      ExtendedNavigator.rootNavigator.pushNamed(
                          Routes.investingVerificationOverviewMx,
                          arguments: InvestingVerificationOverviewMxArguments(
                            bankAccountItem: widget.bankAccountItem,
                            bankTransfer: widget.bankTransfer,
                            bankTransferValue: widget.investment,
                            check1: true,
                            check2: true,
                            goal: widget.goal,
                            goals: widget.goals,
                            multiple: widget.multiple,
                            valuesChosen: widget.valuesChosen,
                          ));
                    } else {
                      if (lvl ==
                          CustomerLevelRepository.TU_IDENTIDAD_DOCUMENTO) {
                        ExtendedNavigator.rootNavigator.pushNamed(
                            Routes.investingVerificationOverviewMx,
                            arguments: InvestingVerificationOverviewMxArguments(
                              bankAccountItem: widget.bankAccountItem,
                              bankTransfer: widget.bankTransfer,
                              bankTransferValue: widget.investment,
                              check1: true,
                              check2: false,
                              goal: widget.goal,
                              goals: widget.goals,
                              multiple: widget.multiple,
                              valuesChosen: widget.valuesChosen,
                            ));
                      } else if (lvl ==
                          CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO) {
                        ExtendedNavigator.rootNavigator.pushNamed(
                            Routes.investingVerificationOverviewMx,
                            arguments: InvestingVerificationOverviewMxArguments(
                              bankAccountItem: widget.bankAccountItem,
                              bankTransfer: widget.bankTransfer,
                              bankTransferValue: widget.investment,
                              check1: true,
                              check2: true,
                              goal: widget.goal,
                              goals: widget.goals,
                              multiple: widget.multiple,
                              valuesChosen: widget.valuesChosen,
                            ));
                      } else {
                        ExtendedNavigator.rootNavigator.pushNamed(
                            Routes.investingVerificationOverviewMx,
                            arguments: InvestingVerificationOverviewMxArguments(
                              bankAccountItem: widget.bankAccountItem,
                              bankTransfer: widget.bankTransfer,
                              bankTransferValue: widget.investment,
                              check1: false,
                              check2: false,
                              goal: widget.goal,
                              goals: widget.goals,
                              multiple: widget.multiple,
                              valuesChosen: widget.valuesChosen,
                            ));
                      }
                    }
                  }
                : null,
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
            _overviewContainer(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            //Marco general
            _checkboxRow(context, S.of(context).aceptoEl,
                S.of(context).marcoGeneral, "assets/docs/mga.pdf", (value) {
              context
                  .bloc<InvestingMxDocAcceptBloc>()
                  .add(InvestingMxDocAcceptEvent.checkBox1());
            }, state.checkBox1),
            //Justificacion racionalidad
            _checkboxRow(
              context,
              S.of(context).aceptoLa,
              S.of(context).justificacionRacionalidad,
              "assets/docs/jru.pdf",
              (value) {
                context
                    .bloc<InvestingMxDocAcceptBloc>()
                    .add(InvestingMxDocAcceptEvent.checkBox2());
              },
              state.checkBox2,
            ),
            //terminos y condiciones
            Row(
              children: <Widget>[
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  value: state.checkBox3,
                  onChanged: (value) {
                    context
                        .bloc<InvestingMxDocAcceptBloc>()
                        .add(InvestingMxDocAcceptEvent.checkBox3());
                  },
                ),
                FlatButton(
                  onPressed: () => ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.termsAndConditions),
                  padding: EdgeInsets.zero,
                  child: RichText(
                    text: TextSpan(
                        style: AppTextStyles.normal4,
                        text: S.of(context).acepto,
                        children: [
                          TextSpan(
                            style: AppTextStyles.normalUnder1
                                .copyWith(color: AppColors.primaryColor),
                            text: S.of(context).termsTitle,
                          )
                        ]),
                  ),
                )
              ],
            ),
            //medios electronicos
            _checkboxRowWeb(
                context,
                S.of(context).acepto,
                S.of(context).mediosElectronicos,
                S.of(context).urlMediosElectronicos, (value) {
              context
                  .bloc<InvestingMxDocAcceptBloc>()
                  .add(InvestingMxDocAcceptEvent.checkBox4());
            }, state.checkBox4),
            //Button
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
          ],
        ))));
  }

  Widget _headerInvestIntro(context) {
    return Container(
      child: Text(
        S.of(context).addMoney,
        style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
        textAlign: TextAlign.left,
      ),
      margin: EdgeInsets.only(bottom: 20),
    );
  }

  Widget _overviewContainer(BuildContext context) {
    String fee = '';
    String total = '';
    if (!widget.multiple) {
      fee = mxFormatter.format(widget.investment);
      total = mxFormatter.format(widget.investment + bankCommission);
    } else {
      double totalValue = 0;
      widget.valuesChosen.forEach((element) {
        totalValue += element;
      });
      fee = mxFormatter.format(totalValue);
      total = mxFormatter.format(totalValue + bankCommission);
    }
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
                Text(S.of(context).yourInvestment,
                    style: AppTextStyles.normal4),
                Text("$fee",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).bankFee, style: AppTextStyles.normal4),
                Text(mxFormatter.format(bankCommission),
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

  Widget _checkboxRow(
      BuildContext context,
      String leadingText,
      String underlinedText,
      String path,
      Function(bool) onChanged,
      bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          activeColor: AppColors.primaryColor,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: InkWell(
            onTap: path != ""
                ? () {
                    ExtendedNavigator.rootNavigator.push(MaterialPageRoute(
                        builder: (BuildContext context) => PdfViewer(
                              path: path,
                            )));
                  }
                : null,
            child: RichText(
              text: TextSpan(
                  style: AppTextStyles.normal4,
                  text: leadingText,
                  children: [
                    TextSpan(
                        style: AppTextStyles.normalUnder1
                            .copyWith(color: AppColors.primaryColor),
                        text: underlinedText)
                  ]),
            ),
          ),
        )
      ],
    );
  }

  Widget _checkboxRowWeb(BuildContext context, String leadingText,
      String underlinedText, String url, Function(bool) onChanged, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          activeColor: AppColors.primaryColor,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: InkWell(
            onTap: url != ""
                ? () {
                    ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.genericWebView,
                        arguments: GenericWebViewArguments(url: url));
                  }
                : null,
            child: RichText(
              text: TextSpan(
                  style: AppTextStyles.normal4,
                  text: leadingText,
                  children: [
                    TextSpan(
                        style: AppTextStyles.normalUnder1
                            .copyWith(color: AppColors.primaryColor),
                        text: underlinedText)
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
