import 'dart:async';
import 'dart:ffi';
import 'package:ualet/domain/history/transaction_item.dart';

import 'package:ualet/application/history/history_bloc.dart';
import 'package:ualet/domain/notifications/notification_item_valid_read.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/domain/dashboard/dashboard_investing_success.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:ualet/presentation/home/widgets/info_popup_migrate_user.dart';
import 'package:ualet/presentation/home/widgets/pie_chart/chart_values_options.dart';
import 'package:ualet/presentation/home/widgets/pie_chart/legend_options.dart';
import 'package:ualet/presentation/home/widgets/pie_chart/pie_chart.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page_col.dart';
import 'package:ualet/presentation/investing/widgets/investing_popup_success.dart';
import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:kt_dart/kt.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/application/dashboard/dashboard_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/dashboard/dashboard_fund.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:intl/intl.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/fundOverviewWidget.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/fund_overview_widget_mx.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/presentation/home/widgets/verify_update_sarlaft_popup.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';

class DashboardPage extends StatefulWidget {
  Function changePage;

  DashboardPage({this.changePage});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  //Currency Formatter
  NumberFormat formater;
  bool validShowPopUpInvestment = false;
  bool validShowPopUpMigrateWithout = false;
  bool validShowPopUpMigrateWith = false;
  List<TransactionItem> pendingTransactions;

  final coFormatter = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final dateFormatter =
      new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);

    formater = getIt<IEnv>().isColombia()
        ? NumberFormat.currency(
            customPattern: "\u00A4#,##0.00\u00A0",
            symbol: "\$",
            decimalDigits: 0)
        : NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);
  }

  previousPortfolio() {
    setState(() {
      selectedFundIndex == 0
          ? selectedFundIndex = funds.size - 1
          : selectedFundIndex--;
    });
  }

  nextPorfolio() {
    setState(() {
      selectedFundIndex == funds.size - 1
          ? selectedFundIndex = 0
          : selectedFundIndex++;
    });
  }

  var rendimiento = 0.0;
  String rendimientoText = "";
  KtList<DashboardGoal> goals;
  KtList<DashboardGoal> goalsInfo;
  KtList<DashboardFund> funds;
  DashboardUserItem userItem;
  NotificationValidRead notificationValidRead;
  bool verifyUserUpdateSarlaft = false;
  DashboardTotalApprovedTransactionsItem approvedTransactions;
  bool validMigratePopUp = false;
  bool validMigrateWithPopUp = false;
  SharedPreferences _prefs = getIt<SharedPreferences>();

  bool showVideoRecord = true;

  //SelectedFundIndex
  int selectedFundIndex = 0;

  showErrorInvest(context, infoHome) {
    DateTime date = new DateTime.now();

    if (_prefs.getBool("${date.month}") == null) {
      _prefs.setBool("${date.month}", false);
    }

    if (!_prefs.getBool("${date.month}")) {
      _prefs.setBool("${date.month}", true);

      var messageVerify =
          infoHome.VerifyTheInvestmentUserFirsts.replaceAll("<b>", "");


      if (messageVerify.length > 0) {
        Flushbar(
          messageText: Text(
            messageVerify,
            textAlign: TextAlign.left,
            style: AppTextStyles.normal1.copyWith(
                color: AppColors.successToastAccentColor,
                fontWeight: FontWeight.w400),
          ),
          borderRadius: 12.0,
          margin: EdgeInsets.symmetric(
              vertical: AppDimens.layoutSpacerS,
              horizontal: AppDimens.layoutMargin),
          backgroundColor: AppColors.successToastColor,
          flushbarPosition: FlushbarPosition.TOP,
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.layoutSpacerXs,
              vertical: AppDimens.layoutSpacerHeader),
          onTap: (item) {
            ExtendedNavigator.rootNavigator
                .pushNamed(Routes.notificationsPage);
          },
          icon: Icon(
            Icons.check_circle_outline,
            size: 18.0,
            color: AppColors.successToastAccentColor,
          ),
          duration: Duration(seconds: 10),
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) =>
          getIt<DashboardBloc>()..add(DashboardEvent.getInformation()),
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async => ExtendedNavigator.rootNavigator
                .pushReplacementNamed(Routes.homePage),
            child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              return state.maybeMap(
                loading: (_) => Stack(
                  children: <Widget>[
                    Container(
                      color: AppColors.primaryColor,
                    ),
                    LoadingInProgressOverlay(isLoading: true),
                  ],
                ),
                loadFail: (state) {
                  return Text('Error :c');
                },
                loadSuccess: (state) {
                  var infoHome = state.data;
                  return BlocProvider<HistoryBloc>(
                      create: (context) => getIt<HistoryBloc>()
                        ..add(HistoryEvent.getTransactions(2)),
                      child: BlocBuilder<HistoryBloc, HistoryState>(
                          builder: (context, state) {
                        return state.map(
                            initial: (_) => Container(),
                            loadInProgress: (_) => Stack(
                                  children: <Widget>[
                                    Container(
                                      color: AppColors.backgroundColor,
                                    ),
                                    LoadingInProgressOverlay(isLoading: true),
                                  ],
                                ),
                            loadFailure: (failure) => Scaffold(
                                  body: SafeArea(
                                    child: ListView(
                                      primary: false,
                                      children: [
                                        Container(
                                          child: Text(
                                            failure.failure.map(
                                                unexpected: (_) => "Unexpected",
                                                fromServer: (s) => s.message),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            loadSuccess: (dataHis) {
                              pendingTransactions = dataHis.graphTransactions
                                  .asList()
                                  .where((i) => i.state == 4)
                                  .toList();

                              var item = dataHis.profitabilities
                                  .first((x) => x.name == "anual");
                              rendimiento =
                                  double.parse(item.value.toStringAsFixed(2));
                              rendimientoText =
                                  "${item.value.toStringAsFixed(2)}% E.A.";

                              approvedTransactions =
                                  infoHome.approvedTransactions;

                              // Verificar si el usuario requiere actualización de data en sarlaft.
                              if (infoHome.verifyUserUpdateSarlaft) {
                                //Solo mostrar una vez el PopUp
                                if (!_prefs.validPopUpUpdateSarlaft) {
                                  Future.delayed(
                                      Duration(seconds: 1),
                                      () => _showPopupVerifyUserUpdateSarlaft(
                                          context, infoHome.userSarlaft));
                                }
                              }

                              if (approvedTransactions.isWithdrawal &&
                                  approvedTransactions.totalValue > 0) {
                                //Solo mostrar una vez el PopUp con la sessión activa
                                if (!_prefs.validPopUpInvestingSuccess) {
                                  //Mostrar una vez el PopUp en el home
                                  if (!validShowPopUpInvestment) {
                                    Future.delayed(
                                        Duration(seconds: 1),
                                        () => _showPopupApprovedTransactions(
                                            context));
                                  }
                                }
                              }

                              if (getIt<IEnv>().isColombia()) {
                                if (infoHome.video["videoStatus"] != null) {
                                  setVideoLoaded(true);

                                  if (showVideoRecord) {
                                    if (infoHome.video["videoStatus"] == 2) {
                                      Future.delayed(Duration(seconds: 1),
                                          () => showDialogVideo(context));
                                    }
                                  }
                                } else {
                                  setVideoLoaded(false);
                                }
                              }

                              Future.delayed(Duration(seconds: 1),
                                  () => showErrorInvest(context, infoHome));
                              return buildMainContainer(infoHome);
                            });
                      }));
                },
                orElse: () => Container(),
              );
            }),
          ),
        ),
      ),
    );
  }

  setVideoLoaded(loaded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("videoLoaded", loaded);
  }

  showDialogVideo(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("videoLoaded", null);

    showDialog(
      context: context,
      builder: (BuildContext context) =>  CustomDialogExtend(
        icon: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Icon(
            Icons.videocam_off,
            color: AppColors.redColor,
            size: 45,
          ),
        ),
        iconColor: AppColors.redColor,
        title: S.of(context).recordVideoAgainErrorTitle,
        description: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(S.of(context).recordVideoAgainError,
                  style: AppTextStyles.normal1.copyWith(
                      color: AppColors.g75Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: PrimaryButton(
                text: S.of(context).recordVideoAgain,
                action: () async {
                  setState(() {
                    showVideoRecord = false;
                  });
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoSenderIntroPageCol()),
                  );

                  ExtendedNavigator.rootNavigator.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  convertFormated(value) {
    if (getIt<IEnv>().isColombia()) {
      return coFormatter.format(value);
    } else {
      return dateFormatter.format(value);
    }
  }

  Container buildMainContainer(DashboardData data) {
    userItem = data.user;
    goals = data.goals;
    funds = data.funds;
    notificationValidRead = data.validNotification;

    return Container(
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: AppDimens.layoutMarginXS),
        child: ListView(
          children: <Widget>[
            _header(),
            _balance(userItem.riskProfile, goals),
            pendingTransactions.length > 0
                ? Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutMargin),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: AppDimens.layoutSpacerM),
                        _headerPendingTransactions(),
                        SizedBox(height: AppDimens.layoutSpacerM),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(
                                AppDimens.dialogBorderRadius),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  offset: Offset(0, 4),
                                  spreadRadius: 0.5,
                                  blurRadius: 8.0)
                            ],
                          ),
                          padding: EdgeInsets.all(
                            AppDimens.layoutSpacerM,
                          ),
                          child: ListView.separated(
                            primary: false,
                            itemCount: pendingTransactions.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemBuilder: (context, index) {
                              if (index < 6) {
                                TransactionItem item =
                                    pendingTransactions[index];

                                DateTime date = item.createDate;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pendingTransactions[index].name,
                                            style:
                                                AppTextStyles.caption1.copyWith(
                                              color: AppColors.g50Color,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "${date.day}/${date.month}/${date.year}",
                                            style:
                                                AppTextStyles.caption1.copyWith(
                                              color: AppColors.g50Color,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            "${item.type == "5" ? item.accountNumer : convertFormated(item.value)}",
                                            style: AppTextStyles.normal2
                                                .copyWith(
                                                    color: AppColors.g75Color)),
                                        Text(
                                          "${S.of(context).inProgress} ",
                                          style:
                                              AppTextStyles.caption2.copyWith(
                                            color: AppColors.infoColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: AppDimens.layoutSpacerM),
                        SizedBox(height: AppDimens.layoutSpacerM),
                      ],
                    ),
                  )
                : Container(),
            _goals(),
            _portfolio(),
            SizedBox(height: AppDimens.layoutSpacerL),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.layoutMargin, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            userItem.name.length > 0
                ? S.of(context).greeting +
                    ", " +
                    "${userItem.name[0]}${userItem.name.substring(1).toLowerCase()}"
                : S.of(context).greeting + ", ",
            style: AppTextStyles.subtitle2.copyWith(
              color: AppColors.g75Color,
            ),
          ),
          Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                  notificationValidRead.notificationsNotIsRead < 99
                      ? notificationValidRead.notificationsNotIsRead.toString()
                      : "+99",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 10)),
              showBadge: notificationValidRead.notificationsNotIsRead > 0
                  ? true
                  : false,
              badgeColor: AppColors.successColor,
              child: InkWell(
                onTap: () {
                  ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.notificationsPage);
                },
                child: Container(
                  height: AppDimens.heightButtonNotification,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerS),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.buttonBorderRadius),
                      border: Border.all(
                          width: 1.3, color: AppColors.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).notifications,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption2.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerXs,
                      ),
                      Icon(
                        Icons.notifications_none,
                        size: AppDimens.iconContentSizeM,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _showPopupApprovedTransactions(context) {
    setState(() {
      validShowPopUpInvestment = true;
      _prefs.validPopUpInvestingSuccess = true;
    });
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: InvestingSuccessDialog(
              buttonAction: () {
                String transType = '';
                if (goals.size > 0) {
                  if (goals[0].tieneDomiciliacionprogramada) {
                    transType = 'DOMICILIACION';
                  } else {
                    transType = 'TRANSFERENCIA INTERBANCARIA';
                  }
                }

                getIt<IFireBaseEventLogger>().successEntryMoney({
                  "Tipo-transaccion": transType,
                  "Revenue": approvedTransactions.totalValue.toString(),
                  "Currency": "COP",
                });

                //AppsFlyer 1 Fase 2 Parte 1
                getIt<IAppsFlyerEventLogger>()
                    .logEvent(AFEvents.INGRESO_EXITOSO_DINERO, {
                  "tipo_transaccion": transType,
                  "af_revenue": approvedTransactions.totalValue.toString(),
                  "af_currency": "MXN",
                });

                //Firebase  1  Fase 2 Parte 1
                // getIt<IFirebaseEventLoggerMX>().successTransaccion({
                //   "Tipo-transaccion": transType,
                //   "Revenue": approvedTransactions.totalValue.toString(),
                //   "Currency": "MXN",
                // });
                ExtendedNavigator.rootNavigator.pop();
              },
              buttonText: S.of(context).buttonPopUpInvestingSuccess,
            ));
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  _showPopupVerifyUserUpdateSarlaft(context, UserInfo dataSarlaft) {
    setState(() {
      _prefs.validPopUpUpdateSarlaft = true;
    });
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: VerifyUpdateSarlaftDialog(
              typeDialog: 1,
              buttonActionPrimary: () {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.investingGrandesMontos, (route) => false,
                    arguments: InvestingGrandesMontosMasterArguments(
                        cargarDocumentos: false,
                        isUpdate: true,
                        sarlaftItem: dataSarlaft.sarlaftItem,
                        validButtonReturn: true));
              },
              buttonActionSecondary: () {
                ExtendedNavigator.rootNavigator.pop();
                _showPopupVerifyUserBlockUpdateSarlaft(context, dataSarlaft);
              },
              title: S.of(context).verifyUpdateSarlaftInfoTitle,
              subTitleOne: S.of(context).verifyUpdateSarlaftInfoSubTitleOne,
              subTitleOneBold:
                  S.of(context).verifyUpdateSarlaftInfoSubTitleOneBold,
              subTitleOneNext: '',
              subTitleTwo: S.of(context).verifyUpdateSarlaftInfoSubTitleTwo,
              buttonTextPrimary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextPrimary,
              buttonTextSecondary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextSecondary,
            ));
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  _showPopupVerifyUserBlockUpdateSarlaft(context, UserInfo dataSarlaft) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: VerifyUpdateSarlaftDialog(
              typeDialog: 2,
              buttonActionPrimary: () {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.investingGrandesMontos, (route) => false,
                    arguments: InvestingGrandesMontosMasterArguments(
                        cargarDocumentos: false,
                        isUpdate: true,
                        sarlaftItem: dataSarlaft.sarlaftItem,
                        validButtonReturn: true));
              },
              buttonActionSecondary: () {
                ExtendedNavigator.rootNavigator.pop();
              },
              title: S.of(context).verifyUpdateSarlaftInfoBlockTitle,
              subTitleOne:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOne,
              subTitleOneBold:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOneBold,
              subTitleOneNext:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOneNext,
              subTitleTwo:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleTwo,
              buttonTextPrimary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextPrimary,
              buttonTextSecondary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextSecondary,
            ));
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _videoNotice() {
    var media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: 290.0,
          width: media.width * 1.0,
          margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.5),
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                    offset: Offset(0, 0))
              ]),
        ),
        Column(
          children: <Widget>[
            Container(height: 150),
            ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: 140.0,
                width: media.width * 1.0,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(S.of(context).thisIsUalet,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: 'open-sans-semi-bold',
                            fontSize: 24.0)),
                    Text(
                      S.of(context).getToKnowRoboAdvisor,
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                      // style: TextStyle(
                      //     color: AppColors.whiteColor,
                      //     fontFamily: 'open-sans-semi-bold',
                      //     fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _balance(profileName, KtList<DashboardGoal> goals) {
    var _media = MediaQuery.of(context).size;
    return userItem.balance == 0
        ? _cardBalanceFoundsNot(_media, profileName)
        : _cardBalanceFoundsSuccess(_media, profileName, goals);
  }

  Widget _cardBalanceFoundsNot(Size size, String profileName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
      height: 352.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 1.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.backgroundSplashTopColor,
                      AppColors.backgroundSplashBottomColor
                    ],
                    stops: [
                      0.3,
                      0.9
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.symmetric(vertical: AppDimens.layoutMarginS),
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMarginS,
                vertical: AppDimens.layoutMarginS),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.layoutMarginMin,
                      vertical: AppDimens.layoutMarginMin),
                  child: Text(
                    "${S.of(context).youAre} $profileName",
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "😅",
                        style: TextStyle(fontSize: AppDimens.iconContentSizeL),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerHeader,
                      ),
                      Text(
                        S.of(context).subTitleCardFoundsNot,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle2.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerHeader,
                      ),
                      Text(
                        S.of(context).subTitleTwoCardFoundsNot,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption3,
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.layoutMarginXS,
                            vertical: AppDimens.layoutMarginMin),
                        child: InkWell(
                          onTap: () {
                            ExtendedNavigator.rootNavigator
                                .pushNamed(Routes.investingIntroPage);
                          },
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimens.layoutSpacerS),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1.3, color: AppColors.whiteColor)),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).buttonCardFoundsNot,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.normal1.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Text(efectivo,
                      //     style: AppTextStyles.normal4
                      //         .copyWith(color: AppColors.whiteColor)),
                      // Text("Títulos ${userItem.titles.toStringAsFixed(0)}",
                      //     style: AppTextStyles.normal4
                      //         .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBalanceFoundsSuccess(
      Size size, String profileName, KtList<DashboardGoal> goals) {
    String efectivo =
        "${S.of(context).cash}: ${formater.format(userItem.efectivo)}";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
      height: (goals.size == 0 || goals.size == 1)
          ? 370.0
          : (goals.size == 2 || goals.size == 3)
              ? 390
              : (goals.size == 4 || goals.size == 5)
                  ? 420
                  : 370,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: size.width * 1.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.backgroundSplashTopColor,
                      AppColors.backgroundSplashBottomColor
                    ],
                    stops: [
                      0.3,
                      0.9
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.symmetric(vertical: AppDimens.layoutMarginS),
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMarginS,
                vertical: AppDimens.layoutMarginS),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _cardBalanceFoundsSuccessHeader(
                    "${S.of(context).youAre} $profileName"),
                _cardBalanceBodyPercentIndicator(goals),
                _cardBalanceFoundsSuccessFooter()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBalanceFoundsSuccessHeader(String profileName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMarginMin,
                vertical: AppDimens.layoutMarginMin),
            child: Text(
              profileName,
              style: AppTextStyles.subtitle2.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            ExtendedNavigator.rootNavigator
                .pushNamed(Routes.investingIntroPage);
          },
          child: Container(
            height: AppDimens.heightButtonNotification,
            padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerS),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppDimens.buttonBorderRadius),
                border: Border.all(width: 1.3, color: AppColors.whiteColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Agregar dinero',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.caption2.copyWith(
                      color: AppColors.whiteColor, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppDimens.layoutSpacerXs),
                  child: Icon(
                    Icons.attach_money,
                    size: AppDimens.iconContentSizeS,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _cardBalanceBodyPercentIndicator(KtList<DashboardGoal> goals) {
    String efectivo =
        "${S.of(context).cash}: ${formater.format(userItem.efectivo)}";
    bool isVisibleGraphic = true;
    double totalValueGoals = 0;
    double totalNotAssignedValue = 0;
    Map<String, double> dataMap = {};
    List<Color> colorList = [];
    bool showGoals = false;
    double total = 0;
    if (goals.size == 0) {
      colorList.add(AppColors.whiteColor.withOpacity(0.9));
      dataMap = {S.of(context).moneyNotAssignInBalance: 100};
    } else {
      for (var i = 0; i < goals.size; i++) {
        if (goals[i].assignedBalanceValue != 0) {
          if (goals[i].assignedBalanceValue != null) {
            totalValueGoals += goals[i].assignedBalanceValue;
          }
          //Color Graphic
          if (goals[i].color != null) {
            colorList.add(HexColor(goals[i].color));
          } else {
            isVisibleGraphic = false;
          }
          //Percent Graphic
          if (goals[i].name != null && goals[i].percentColor != null) {
            dataMap[goals[i].name] = goals[i].percentColor;
            total = total + goals[i].percentColor;
          } else {
            isVisibleGraphic = false;
          }
          showGoals = true;
        }
      }
      totalNotAssignedValue = (userItem.balance - totalValueGoals);
    }

    //Agregar a la grafica el dinero no asignado.
    if (totalNotAssignedValue > 0) {
      colorList.add(AppColors.whiteColor.withOpacity(0.9));
      dataMap[S.of(context).moneyNotAssignInBalance] = 100 - total;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Visibility(
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 0,
                chartRadius: MediaQuery.of(context).size.width / 4.5,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 12,
                centerText: "",
                sweepAngleLimit: (showGoals && goals.size > 0) ? 0.3 : 0.0,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: false,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),
              ),
              visible: isVisibleGraphic,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Visibility(
                    child: _notAssignBalanceInGoals(
                        "${formater.format(userItem.balance)}"),
                    visible: (!showGoals)),
                Visibility(
                    child: _assignBalanceInGoals(goals, totalNotAssignedValue),
                    visible: (showGoals && goals.size > 0)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _assignBalanceInGoals(
      KtList<DashboardGoal> goals, double totalNotAssignedValue) {
    return Column(
      children: [
        _notAssignBalanceInGoals("${formater.format(totalNotAssignedValue)}"),
        Column(
            children: goals
                .asList()
                .map(
                  (element) => Column(
                    children: [
                      SizedBox(
                        height: AppDimens.layoutHSpacerSS,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: AppDimens.layoutSpacerS,
                            height: AppDimens.layoutSpacerS,
                            margin: EdgeInsets.only(
                                right: AppDimens.layoutMarginHorizontalScroll),
                            decoration: BoxDecoration(
                                color: element.color != null
                                    ? HexColor(element.color)
                                    : AppColors.whiteColor,
                                shape: BoxShape.circle),
                          ),
                          Expanded(
                            child: Text(
                              element.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.normal2.copyWith(
                                fontSize: AppDimens.normalSTextSize,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "${formater.format(element.assignedBalanceValue != null ? element.assignedBalanceValue : 0)}",
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                .toList())
      ],
    );
  }

  Widget _notAssignBalanceInGoals(String value) {
    return Row(
      children: <Widget>[
        Container(
          width: AppDimens.layoutSpacerS,
          height: AppDimens.layoutSpacerS,
          margin:
              EdgeInsets.only(right: AppDimens.layoutMarginHorizontalScroll),
          decoration: BoxDecoration(
              color: AppColors.whiteColor, shape: BoxShape.circle),
        ),
        Expanded(
          child: Text(
            S.of(context).moneyNotAssignInBalance,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.normal2.copyWith(
              fontSize: AppDimens.normalSTextSize,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            value,
            style: AppTextStyles.normal2.copyWith(
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget _cardBalanceFoundsSuccessFooter() {
    String efectivo =
        "${S.of(context).cash}: ${formater.format(userItem.efectivo)}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).yourBalance,
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                "${formater.format(userItem.balance)}",
                style: AppTextStyles.title2
                    .copyWith(color: AppColors.whiteColor, fontSize: 20.0.sp),
              ),
              !getIt<IEnv>().isColombia()
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(efectivo,
                              style: AppTextStyles.normal4
                                  .copyWith(color: AppColors.whiteColor)),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Rendimiento \n anual',
              style: AppTextStyles.normal2.copyWith(
                fontSize: AppDimens.captionTextSize,
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerXs,
            ),
            Row(
              children: <Widget>[
                Text(
                  rendimientoText,
                  style: AppTextStyles.normal4.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.whiteColor),
                ),
                Icon(
                  rendimiento < 0 ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  color: rendimiento < 0
                      ? AppColors.dangerColor
                      : AppColors.colorGreen,
                  size: 19.0,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _goals() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          SizedBox(height: AppDimens.layoutSpacerM),
          _headerGoals(),
          SizedBox(height: AppDimens.layoutSpacerM),
          _cardViewGoals(context),
        ],
      ),
    );
  }

  Widget _headerPendingTransactions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          S.of(context).latestMovements,
          style: AppTextStyles.subtitle2.copyWith(
            color: AppColors.g75Color,
          ),
        ),
        InkWell(
          onTap: () {
            widget.changePage();
          },
          child: Container(
            height: AppDimens.heightButtonNotification,
            padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerS),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppDimens.buttonBorderRadius),
                border: Border.all(width: 1.3, color: AppColors.primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).viewAll,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.caption2.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppDimens.layoutSpacerXs),
                  child: Icon(
                    Icons.menu,
                    size: AppDimens.iconContentSizeM,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _headerGoals() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          S.of(context).yourGoalsHome,
          style: AppTextStyles.subtitle2.copyWith(
            color: AppColors.g75Color,
          ),
        ),
        goals.size < 5
            ? InkWell(
                onTap: () {
                  ExtendedNavigator.rootNavigator.pushNamed(Routes.goalsPages,
                      arguments: GoalsPagesArguments(
                          isFirstGoal: false, validNewGoal: true));
                },
                child: Container(
                  height: AppDimens.heightButtonNotification,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerS),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.buttonBorderRadius),
                      border: Border.all(
                          width: 1.3, color: AppColors.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).createGoal,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption2.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppDimens.layoutSpacerXs),
                        child: Icon(
                          Icons.add_circle_outline,
                          size: AppDimens.iconContentSizeM,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _cardViewGoals(context) {
    List<Widget> list = [];

    for (int i = 0; i < goals.size; i++) {
      list.add(_cardGoals(goals[i], goals, (goals.size - 1) - i));
    }
    if (goals.size < 5) {
      list.add(_cardCreateGoals());
    }
    // list = list.reversed.toList();

    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: list,
        ),
      ),
    );
  }

  Widget _cardGoals(
      DashboardGoal goal, KtList<DashboardGoal> detailGoals, int initial) {
    var parser = EmojiParser();
    var setEmoji = parser.info('${goal.emoji}');
    var nameEmoji = setEmoji.full;
    var percent = goal.percentComplete;
    var percentString = "";
    if (percent >= 100) {
      percent = 100;
      percentString = "100%";
    } else {
      percentString = "${percent.toStringAsPrecision(2)}%";
    }
    return InkWell(
      onTap: () => ExtendedNavigator.rootNavigator.pushNamed(Routes.myGoalsPage,
          arguments: MyGoalsPageArguments(
              items: detailGoals,
              initial: initial,
              notAssignedBalance: userItem.notAssignedBalance)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 150.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.visibility,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                        Text(
                          S.of(context).view,
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  parser.emojify(nameEmoji),
                  style: TextStyle(fontSize: 40.0),
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    goal.name,
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g50Color,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 45.0,
                      lineWidth: 5.0,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: percent / 100,
                      center: Text(
                        percentString,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: 'open-sans-semi-bold',
                            fontSize: 12.0),
                      ),
                      progressColor: AppColors.primaryColor,
                      backgroundColor: AppColors.backgroundColor,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${formater.format(goal.currentAmt)}",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontFamily: 'open-sans-semi-bold',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text("${formater.format(goal.goalAmt)}",
                                style: TextStyle(
                                    color: AppColors.g50Color,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardCreateGoals() {
    return GestureDetector(
      onTap: () {
        ExtendedNavigator.rootNavigator.pushNamed(Routes.goalsPages,
            arguments:
                GoalsPagesArguments(isFirstGoal: false, validNewGoal: true));
      },
      child: DottedBorder(
        dashPattern: [8],
        strokeWidth: 2.0,
        radius: Radius.circular(20.0),
        borderType: BorderType.RRect,
        color: AppColors.primaryColor.withOpacity(0.5),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            width: 158.0,
            height: 202.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add_circle_outline,
                  size: AppDimens.iconContentSizeML,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: AppDimens.layoutSpacerXs),
                Text(
                  S.of(context).createNewGoalHome,
                  style: AppTextStyles.subtitle2.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }

  Widget _portfolio() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppDimens.layoutMargin,
          vertical: AppDimens.layoutSpacerL),
      child: Column(
        children: <Widget>[
          _headerPortfolio(),
          SizedBox(height: AppDimens.layoutSpacerM),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    offset: Offset(0, 4),
                    spreadRadius: 0.5,
                    blurRadius: 8.0)
              ],
            ),
            child: GestureDetector(
              onTap: () {
                ExtendedNavigator.rootNavigator.pushNamed(Routes.portfolioPage,
                    arguments: PortfolioPageArguments(
                        selectedFundIndex: selectedFundIndex));
              },
              child: FundOverviewWidget(
                  selectedFundIndex: selectedFundIndex,
                  funds: funds,
                  userItem: userItem,
                  onPreviousPressed: previousPortfolio,
                  onNextPressed: nextPorfolio),
            ),
          )
        ],
      ),
    );
  }

  Widget _headerPortfolio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).knowYourPortfolio,
          style: AppTextStyles.subtitle2.copyWith(
            color: AppColors.g75Color,
          ),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerS),
          decoration: BoxDecoration(
              color: AppColors.successSoftColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 0.5, color: AppColors.successColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userItem.riskProfile,
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.successColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _blog(userRecurrent) {
    return Container(
      child: Column(
        children: <Widget>[
          _headerBlog(),
          SizedBox(height: 15.0),
          userRecurrent != 0 ? _videoNotice() : Container(),
          _cardsBlog(),
        ],
      ),
    );
  }

  Widget _headerBlog() {
    final _media = MediaQuery.of(context).size;
    return Container(
      width: _media.width * 1.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        "Los P*t@s del ahorro",
        style: TextStyle(
            color: AppColors.g75Color,
            fontFamily: 'open-sans-semi-bold',
            fontSize: 18.0),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _cardsBlog() {
    final _media = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: _media.width * 1.0,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.5),
                  spreadRadius: 1.0,
                  blurRadius: 20.0,
                  offset: Offset(0, 0))
            ]),
        child: Column(
          children: <Widget>[
            _articleBlog(),
            _articleBlog(),
            _articleBlog(),
          ],
        ));
  }

  Widget _articleBlog() {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width * 1.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: media.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "10 gastos que debes evitar",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.g50Color,
                      fontFamily: 'open-sans-semi-bold'),
                ),
                Text(
                    "Aunque el 66% de los adultos recibió educación para el ahorro, apenas el 44% ahorra de manera fomal.",
                    style: TextStyle(
                        fontSize: 10.0,
                        color: AppColors.g75Color,
                        fontFamily: 'open-sans-semi-bold')),
              ],
            ),
          ),
          Container(
            width: media.width * 0.2,
            child: Column(
              children: <Widget>[
                Container(
                  width: 68.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://previews.123rf.com/images/buhta/buhta1704/buhta170400179/76874191-men-s-wallet-money-in-cash.jpg"))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
