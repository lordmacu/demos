import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/mygoals/popups/asign_to_goal_dialog.dart';
import 'package:ualet/presentation/mygoals/popups/delete_goal_debit_multiple.dart';
import 'package:ualet/to_be_refactor/pages/home/floating_bottom.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/sign_out_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:kt_dart/collection.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_bloc.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/mygoals/popups/delete_goal_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots.dart';
import 'popups/warning_forgot_debit_mx_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/presentation/core/widgets/ColumnBuilder.dart';
import 'package:ualet/presentation/core/widgets/WidgetSize.dart';
import 'package:ualet/presentation/mygoals/goal.dart';

class MyGoalsPage extends StatefulWidget {
  final KtList<DashboardGoal> items;
  final double notAssignedBalance;
  final int initial;
  MyGoalsPage(
      {Key key,
      @required this.items,
      this.initial = 1,
      @required this.notAssignedBalance})
      : super(key: key);
  @override
  _MyGoalsPageState createState() => _MyGoalsPageState();
}

class _MyGoalsPageState extends State<MyGoalsPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  DashboardGoal currentGoal;
  int _currentPage = 0;
  int _numPages = 0;
  int currentTab = -1;
  NumberFormat formater;
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;
  SharedPreferences _prefs = getIt<SharedPreferences>();
  bool _isVisible = false;
  String leftSymbol;

  List<double> sizePageView = [];
  KtList<DashboardGoal> items;
  double notAssignedBalance;

  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    bool isColombia = getIt<IEnv>().isColombia();
    leftSymbol = isColombia ? "$leftSymbol" : "";
    formater = isColombia ? NumberFormaters.copFormater : formatCurrencyMx;
    notAssignedBalance = widget.notAssignedBalance;

    items = widget.items.sortedBy((s) => s.created);
    currentGoal = items.asList()[widget.initial];
    _numPages = items.asList().length;

    for (var i = 0; i < _numPages; i++) {
      sizePageView.add(1500);
    }
    _currentPage = widget.initial;
    _pageController =
        PageController(initialPage: widget.initial, viewportFraction: 0.96);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 270));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.4), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.4, end: 1.0), weight: 30.0)
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.2), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.2, end: 1.0), weight: 30.0)
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.2), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.2, end: 1.0), weight: 30.0)
    ]).animate(animationController);
    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      currentGoal = items.asList()[_currentPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    items.forEach((element) {
      print(element.migrate);
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider<WithdrawalBloc>(
          create: (context) => getIt<WithdrawalBloc>()
            ..add(
              WithdrawalEvent.getItems(false),
            ),
        ),
        BlocProvider<WithdrawalFormBloc>(
          create: (context) => getIt<WithdrawalFormBloc>(),
        ),
      ],
      child: BlocBuilder<WithdrawalBloc, WithdrawalState>(
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
            loadSuccess: (data) {
              WithdrawalInfo info = data.info;
              return BlocConsumer<WithdrawalFormBloc, WithdrawalFormState>(
                builder: (context, state) {
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
                    var _media = MediaQuery.of(context).size;
                    String feeText =
                        "$leftSymbol${formater.format(currentGoal.fee)}";

                    return Scaffold(
                      backgroundColor: AppColors.backgroundColor,
                      body: Stack(
                        children: [
                          SafeArea(
                            child: Container(
                              child: ListView(
                                children: <Widget>[
                                  SizedBox(
                                    height: AppDimens.layoutSpacerHeader,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: AppDimens.layoutMargin,
                                      right: AppDimens.layoutMargin,
                                      top: AppDimens.layoutSpacerXs,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
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
                                                    ExtendedNavigator
                                                        .rootNavigator
                                                        .pop(),
                                              ),
                                              Text(
                                                S.of(context).myGoalsTitle,
                                                style: AppTextStyles.subtitle2
                                                    .copyWith(
                                                        color:
                                                            AppColors.g75Color),
                                              ),
                                            ],
                                          ),
                                        ),
                                        items.asList().length < 5
                                            ? Container(
                                                child: InkWell(
                                                  onTap: () {
                                                    ExtendedNavigator
                                                        .rootNavigator
                                                        .pushNamed(
                                                            Routes.goalsPages,
                                                            arguments:
                                                                GoalsPagesArguments(
                                                                    isFirstGoal:
                                                                        false,
                                                                    validNewGoal:
                                                                        true));
                                                  },
                                                  child: Container(
                                                    height: AppDimens
                                                        .heightButtonNotification,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: AppDimens
                                                                .layoutSpacerS),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(AppDimens
                                                                .buttonBorderRadius),
                                                        border: Border.all(
                                                            width: 1.3,
                                                            color: AppColors
                                                                .primaryColor)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          S
                                                              .of(context)
                                                              .createGoal,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppTextStyles
                                                              .caption2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              left: AppDimens
                                                                  .layoutSpacerXs),
                                                          child: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            size: AppDimens
                                                                .iconContentSizeM,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimens.layoutMargin,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: AppDimens.layoutMarginM * 0.9,
                                      right: AppDimens.layoutMargin,
                                    ),
                                    child: Visibility(
                                      maintainSize: false,
                                      maintainAnimation: false,
                                      maintainSemantics: false,
                                      visible: items.asList().length > 1,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          for (int i = 0; i < _numPages; i++)
                                            SlideDots(i == _currentPage
                                                ? true
                                                : false)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimens.layoutSpacerHeader,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        1.1,
                                    color: AppColors.backgroundColor,
                                    child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      controller: _pageController,
                                      itemCount: items.asList().length,
                                      onPageChanged: (i) => _onPageChanged(i),
                                      allowImplicitScrolling: true,
                                      itemBuilder: (context, index) {
                                        var goal = items.get(index);
                                        List<DebitInfo> debits = info.debits;
                                        List<DebitInfo> goalDebits = [];
                                        DebitInfo debit;
                                        for (int i = 0;
                                            i < debits.length;
                                            i++) {
                                          if (debits[i]
                                              .goalId
                                              .contains(goal.id)) {
                                            debit = debits[i];
                                            goalDebits.add(debits[i]);
                                          }
                                        }

                                        DebitInfo debit2 = DebitInfo.empty();
                                        for (var d in info.debits) {
                                          if (d.goalId
                                              .contains(currentGoal.id)) {
                                            debit2 = d;
                                          }
                                        }
                                        List<DashboardGoal> relGoals = [];
                                        for (var g in items.asList()) {
                                          if (debit2.goalId.contains(g.id) &&
                                              currentGoal.id != g.id) {
                                            relGoals.add(g);
                                          }
                                        }

                                        var parser = EmojiParser();
                                        var setEmoji = parser.info(goal.emoji);
                                        var nameEmoji = setEmoji.full;
                                        var percent = goal.percentComplete;
                                        var percentString = "";
                                        if (percent >= 100.0) {
                                          percent = 100;
                                          percentString = "100%";
                                        } else {
                                          percentString =
                                              " ${percent.toStringAsPrecision(2)}%";
                                        }
                                        var goalTransactions =
                                            goal.goalTransactions;

                                        var monthsPassed = ((_compare(
                                                        DateTime.now(),
                                                        goal.created)
                                                    .inDays) /
                                                30)
                                            .floor();

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xfff1ecfa)
                                                          .withOpacity(0.7),
                                                      spreadRadius: 5,
                                                      blurRadius: 8,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  color: AppColors.whiteColor,
                                                  borderRadius: BorderRadius
                                                      .circular(AppDimens
                                                          .dialogBorderRadius)),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: AppDimens
                                                      .layoutMarginHorizontalScroll),
                                              padding: EdgeInsets.only(
                                                top: AppDimens.layoutMarginS,
                                                left: AppDimens.layoutMarginS,
                                                right: AppDimens.layoutMarginS,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Text(
                                                        parser
                                                            .emojify(nameEmoji),
                                                        style: TextStyle(
                                                            fontSize: 40.0),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                        width: AppDimens
                                                            .layoutHSpacerS,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          goal.name,
                                                          style: AppTextStyles
                                                              .subtitle2
                                                              .copyWith(
                                                            color: AppColors
                                                                .g50Color,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: AppDimens
                                                        .layoutHSpacerS,
                                                  ),
                                                  Divider(
                                                    color: AppColors
                                                        .backgroundColor,
                                                    thickness: 1.0,
                                                  ),
                                                  SizedBox(
                                                    height: AppDimens
                                                        .layoutHSpacerS,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CircularPercentIndicator(
                                                                radius: 85,
                                                                lineWidth: 9,
                                                                animateFromLastPercent:
                                                                    true,
                                                                animation: true,
                                                                circularStrokeCap:
                                                                    CircularStrokeCap
                                                                        .round,
                                                                percent:
                                                                    (percent /
                                                                        100),
                                                                progressColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .backgroundColor,
                                                                startAngle: 0,
                                                                reverse: true,
                                                                center: Text(
                                                                  percentString,
                                                                  style: AppTextStyles
                                                                      .subtitle2
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: AppDimens
                                                                    .layoutMarginS,
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    S
                                                                        .of(context)
                                                                        .myGoalsBalance,
                                                                    style: AppTextStyles.menu1.copyWith(
                                                                        color: AppColors
                                                                            .g75Color,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    getIt<IEnv>()
                                                                            .isColombia()
                                                                        ? "\$${formater.format(goal.currentAmt)}"
                                                                        : "${formater.format(goal.currentAmt)}",
                                                                    style: AppTextStyles
                                                                        .subtitle2
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.primaryColor),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                    width: AppDimens
                                                                        .layoutSpacerXXs,
                                                                  ),
                                                                  Text(
                                                                    S
                                                                        .of(context)
                                                                        .myGoalsGoal,
                                                                    style: AppTextStyles.menu1.copyWith(
                                                                        color: AppColors
                                                                            .g75Color,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    getIt<IEnv>()
                                                                            .isColombia()
                                                                        ? "\$${formater.format(goal.goalAmt)}"
                                                                        : "${formater.format(goal.goalAmt)}",
                                                                    style: AppTextStyles
                                                                        .normal2
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.g50Color),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 30),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            getIt<IFireBaseEventLogger>()
                                                                .goalDelete();

                                                            _showPopupWithdrawal(
                                                              context,
                                                              goal,
                                                              info,
                                                              goal.tieneDomiciliacionprogramada,
                                                              goal.currentAmt >
                                                                  0,
                                                            );
                                                          },
                                                          child: Container(
                                                              child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons.delete,
                                                                size: 20,
                                                                color: AppColors
                                                                    .redColor,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            20),
                                                                child: Text(
                                                                  S
                                                                      .of(context)
                                                                      .delete,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: AppColors
                                                                          .redColor),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            getIt<IFireBaseEventLogger>()
                                                                .goalSavingsEdit();

                                                            getIt<IFireBaseEventLogger>()
                                                                .goalEdit();
 
                                                            ExtendedNavigator
                                                                .rootNavigator
                                                                .pushNamed(
                                                              Routes
                                                                  .editGoalPage,
                                                              arguments:
                                                                  EditGoalPageArguments(
                                                                relatedGoals:
                                                                    relGoals,
                                                                goal:
                                                                    currentGoal,
                                                                relatedDebit:
                                                                    debit2,
                                                                info: info,
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                              child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons.edit,
                                                                size: 20,
                                                                color: AppColors
                                                                    .primaryColor,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            20),
                                                                child: Text(
                                                                  S
                                                                      .of(context)
                                                                      .edit,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            getIt<IFireBaseEventLogger>()
                                                                .assignMoney();

                                                            _showPopUpAsign(
                                                                context,
                                                                state,
                                                                items.asList(),
                                                                goal);
                                                          },
                                                          child: Container(
                                                              child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .attach_money,
                                                                size: 20,
                                                                color: AppColors
                                                                    .primaryColor,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            20),
                                                                child: Text(
                                                                  S
                                                                      .of(context)
                                                                      .asign,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xfff1ecfa)
                                                          .withOpacity(0.7),
                                                      spreadRadius: 5,
                                                      blurRadius: 8,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  color: AppColors.whiteColor,
                                                  borderRadius: BorderRadius
                                                      .circular(AppDimens
                                                          .dialogBorderRadius)),
                                              margin: EdgeInsets.only(
                                                left: AppDimens
                                                    .layoutMarginHorizontalScroll,
                                                right: AppDimens
                                                    .layoutMarginHorizontalScroll,
                                                top: 25,
                                              ),
                                              padding: EdgeInsets.only(
                                                  left: AppDimens.layoutMarginS,
                                                  right:
                                                      AppDimens.layoutMarginS,
                                                  top: AppDimens.layoutMargin,
                                                  bottom:
                                                      AppDimens.layoutMarginS),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Text(
                                                        S
                                                            .of(context)
                                                            .myGoalsMonthlySavings,
                                                        style: AppTextStyles
                                                            .normal1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .g75Color,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      Text(
                                                        getIt<IEnv>()
                                                                .isColombia()
                                                            ? "\$${formater.format(0)}"
                                                            : "${formater.format(0)}",
                                                        style: AppTextStyles
                                                            .normal2
                                                            .copyWith(
                                                          color: AppColors
                                                              .g75Color,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: AppDimens
                                                        .layoutSpacerXs,
                                                  ),
                                                  Divider(
                                                    color: AppColors
                                                        .backgroundColor,
                                                    thickness: 1.0,
                                                  ),
                                                  SizedBox(
                                                    height: AppDimens
                                                        .layoutSpacerXs,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            S
                                                                .of(context)
                                                                .myGoalsTimeElapsed,
                                                            style: AppTextStyles
                                                                .normal1
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g75Color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          Text(
                                                            S
                                                                .of(context)
                                                                .myGoalsTotalTime,
                                                            style: AppTextStyles
                                                                .caption1
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g50Color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Text(
                                                            monthsPassed > 1
                                                                ? "$monthsPassed meses"
                                                                : "$monthsPassed mes",
                                                            style: AppTextStyles
                                                                .normal2
                                                                .copyWith(
                                                              color: AppColors
                                                                  .g75Color,
                                                            ),
                                                          ),
                                                          Text(
                                                            goal.numMonths > 1
                                                                ? "${goal.numMonths} meses"
                                                                : "${goal.numMonths} mes",
                                                            style: AppTextStyles
                                                                .caption1
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g50Color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: AppDimens
                                                    .layoutMarginHorizontalScroll,
                                                right: AppDimens
                                                    .layoutMarginHorizontalScroll,
                                              ),
                                              padding: EdgeInsets.only(
                                                  left: AppDimens.layoutMarginS,
                                                  right:
                                                      AppDimens.layoutMarginS,
                                                  top: AppDimens.layoutMargin,
                                                  bottom:
                                                      AppDimens.layoutMarginS),
                                              child: Text(
                                                S.of(context).myGoalsMovements,
                                                style: AppTextStyles.subtitle2
                                                    .copyWith(
                                                        color:
                                                            AppColors.g75Color),
                                              ),
                                            ),
                                            goal.goalTransactions.length == 0
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                      left: AppDimens
                                                          .layoutHSpacerS,
                                                      right: AppDimens
                                                          .layoutHSpacerS,
                                                    ),
                                                    color: AppColors
                                                        .backgroundColor,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          "😅",
                                                          style: TextStyle(
                                                              fontSize: 40.0),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: AppDimens
                                                              .layoutSpacerM,
                                                        ),
                                                        Text(
                                                          S
                                                              .of(context)
                                                              .myGoalsNoMovements,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppTextStyles
                                                              .subtitle1
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .g50Color,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        SizedBox(
                                                          height: AppDimens
                                                              .layoutSpacerM,
                                                        ),
                                                        Text(
                                                            S
                                                                .of(context)
                                                                .myGoalsNoMovementsDescription,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppTextStyles
                                                                .normal1
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g75Color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                      ],
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: Container(
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              offset:
                                                                  Offset(0, 4),
                                                              spreadRadius: 0.5,
                                                              blurRadius: 8.0)
                                                        ],
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius: BorderRadius
                                                            .circular(AppDimens
                                                                .dialogBorderRadius)),
                                                    margin: EdgeInsets.only(
                                                      left: AppDimens
                                                          .layoutMarginHorizontalScroll,
                                                      right: AppDimens
                                                          .layoutMarginHorizontalScroll,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: AppDimens
                                                            .layoutMarginS,
                                                        right: AppDimens
                                                            .layoutMarginS,
                                                        top: AppDimens
                                                            .layoutMargin,
                                                        bottom: AppDimens
                                                            .layoutMarginS),
                                                    child: ListView.separated(
                                                      primary: false,
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              Divider(
                                                        color: AppColors
                                                            .backgroundColor,
                                                        indent: 20.5,
                                                        endIndent: 20.5,
                                                        height: 0,
                                                        thickness: 1,
                                                      ),
                                                      itemCount:
                                                          goalTransactions
                                                              .length,
                                                      itemBuilder:
                                                          (context, ind) {
                                                        var createDate =
                                                            DateTime.parse(
                                                                goalTransactions[
                                                                        ind][
                                                                    "CreateDate"]);
                                                        var value =
                                                            goalTransactions[
                                                                ind]["Value"];
                                                        var state =
                                                            goalTransactions[
                                                                ind]["State"];

                                                        var type = "";
                                                        if (goal.id ==
                                                            goalTransactions[
                                                                    ind]
                                                                ["GoalTo"]) {
                                                          type = "Inversión";
                                                        } else {
                                                          type = "Retiro";
                                                        }

                                                        return Padding(
                                                          padding: const EdgeInsets
                                                                  .only(
                                                              top: AppDimens
                                                                  .layoutSpacerS,
                                                              bottom: AppDimens
                                                                  .layoutSpacerS),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: <Widget>[
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      type,
                                                                      style: AppTextStyles.normal1.copyWith(
                                                                          color: AppColors
                                                                              .g75Color,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    Text(
                                                                      "${createDate.day}/${createDate.month}/${createDate.year}",
                                                                      style: AppTextStyles.caption1.copyWith(
                                                                          color: AppColors
                                                                              .g50Color,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            AppDimens.layoutSpacerXs),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  _transactionType(
                                                                      type,
                                                                      value),
                                                                  _transactionState(
                                                                      state)
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  state.assignMoneyOption.fold(() {}, (either) {
                    either.fold((l) {
                      ToastHelper.createError(
                          message: l.maybeMap(
                              fromServer: (value) => value.message,
                              orElse: () => "")).show(context);
                    }, (r) {
                      ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.assignToGoalSuccess,
                        arguments: AssignToGoalSuccessArguments(
                          assignedTo: state.goalToAssign,
                          assignedFrom: state.goalFromAssign,
                          assignedValue: state.valueAssigned,
                        ),
                      );
                    });
                  });
                  state.deleteGoalOption.fold(() {}, (either) {
                    either.fold((l) {
                      ToastHelper.createError(
                          message: l.maybeMap(
                              fromServer: (value) => value.message,
                              orElse: () => "")).show(context);
                    }, (r) {
                      ToastHelper.createSuccess(
                              message: S.of(context).deleteGoalSuccess)
                          .show(context);
                      Future.delayed(Duration(seconds: 4), () {
                        ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                          Routes.homePage,
                          ModalRoute.withName(Routes.homePage),
                        );
                      });
                    });
                  });
                },
              );
            },
            loadFailure: (state) {
              return Container(
                child: Center(
                  child: Text(state.failure.map(
                      unexpected: (s) => "", fromServer: (s) => s.message)),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Duration _compare(DateTime x, DateTime y) {
    return Duration(
        microseconds:
            (x.microsecondsSinceEpoch - y.microsecondsSinceEpoch).abs());
  }

  _showPopUpAsign(BuildContext context, WithdrawalFormState state,
      List<DashboardGoal> goalsWithBalance, DashboardGoal goalCheck) {
    List<DashboardGoal> goalsWithBalancePopUp = List<DashboardGoal>();

    var filterList = goalsWithBalancePopUp.where((e) => e.id == 0).toList();
    if (filterList.length == 0) {
      //Insertar por defecto "Dinero sin asignar"
      DashboardGoal objNotAssigned = DashboardGoal(
          id: 0,
          name: 'Dinero sin asignar',
          goalAmt: 0,
          currentAmt: notAssignedBalance,
          emoji: 'money_mouth_face',
          tieneDomiciliacionprogramada: false,
          fee: 0,
          periodicity: 1,
          numMonths: 0,
          percentComplete: 0.0,
          goalBalance: [],
          goalTransactions: [],
          migrate: false,
          created: DateTime.now(),
          color: '',
          percentColor: 0,
          assignedBalanceValue: 0);
      goalsWithBalancePopUp.add(objNotAssigned);
    }

    if (goalsWithBalance.length > 0) {
      for (var i = 0; i < goalsWithBalance.length; i++) {
        //La meta siempre deberá tener dinero disponible para ser desplegada en este pop up
        if (goalsWithBalance[i].currentAmt > 0) {
          goalsWithBalancePopUp.add(goalsWithBalance[i]);
        }
      }
    }

    //Eliminar del listado la misma meta seleccionada previamente, ya que no se puede asignar dinero entre la misma meta.
    var filterListDelete =
        goalsWithBalancePopUp.where((e) => e.id == goalCheck.id).toList();
    if (filterListDelete.length > 0) {
      goalsWithBalancePopUp.removeWhere((e) => e.id == goalCheck.id);
    }

    //Ordenar el listado
    goalsWithBalancePopUp.sort((a, b) => a.id.compareTo(b.id));

    if (goalsWithBalancePopUp.length > 0) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: AsignToGoalDialog(
              goals: goalsWithBalancePopUp,
              goalCheck: goalCheck,
              notAssignedBalance: widget.notAssignedBalance,
              contextFather: context,
              state: state,
              undoCallBack: () {
                // getIt<IFireBaseEventLogger>().eventEditGoalDeleteNoConfirm();

                ExtendedNavigator.rootNavigator.pop();
              },
              acceptCallBack: () {

                getIt<IFireBaseEventLogger>().assignMoneyToGoalSuccess({
                  "Price": "${goalCheck.goalBalance[0]["NetBalance"]}",
                  "Currency": "COP",
                  "Nombre Meta": goalCheck.name
                });

                ExtendedNavigator.rootNavigator.pop();
                context
                    .bloc<WithdrawalFormBloc>()
                    .add(WithdrawalFormEvent.assignMoney(goalCheck));
              },
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    }
  }

  Widget _buildDebit(List<DebitInfo> debitItems, WithdrawalInfo info) {
    String periodicity = '';
    switch (debitItems.first.periodicity) {
      case DashboardGoal.MENSUAL:
        periodicity = 'Mensual';
        break;
      case DashboardGoal.QUINCENCAL:
        periodicity = 'Quincenal';
        break;
      case DashboardGoal.TRIMESTRAL:
        periodicity = 'Trimestral';
        break;
      default:
    }
    List<Widget> lst = [];
    for (var item in debitItems) {
      double debitsTotal = debitItems.fold(0, (a, b) => a += b.value);
      // String amountText = "\$${formater.format(item.value)}";
      String amountText = "$leftSymbol${formater.format(debitsTotal)}";
      String feeText = "$leftSymbol${formater.format(currentGoal.fee)}";
      var w = Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMarginHorizontalScroll),
            height: 130,
            padding: EdgeInsets.all(
              AppDimens.layoutMarginS,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(
                AppDimens.dialogBorderRadius,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // CachedNetworkImage(
                    //   imageUrl: item.bankImageUrl,
                    //   width: 80,
                    // ),
                    SizedBox(
                      width: AppDimens.layoutMarginS,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.bankAccountName,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.g50Color,
                          ),
                        ),
                        Text(
                          "${S.of(context).thisGoal}:  $feeText",
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.successColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${S.of(context).total}:           ",
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.g50Color,
                              ),
                            ),
                            Text(
                              "$amountText",
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.g50Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          periodicity,
                          style: AppTextStyles.normal2.copyWith(
                            color: AppColors.g50Color,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      // ExtendedNavigator.rootNavigator.pushNamed(
                      //     Routes.editDebitPage,
                      //     arguments: EditDebitPageArguments(
                      //         debitItem: item, goal: item.linkedGoal));
                      DebitInfo debit = DebitInfo.empty();
                      for (var d in info.debits) {
                        if (d.goalId.contains(currentGoal.id)) {
                          debit = d;
                        }
                      }
                      List<DashboardGoal> relGoals = [];
                      for (var g in items.asList()) {
                        if (debit.goalId.contains(g.id) &&
                            currentGoal.id != g.id) {
                          relGoals.add(g);
                        }
                      }
                      if (currentGoal.migrate) {
                        ToastHelper.createError(
                                message: S.of(context).cantEditDebit)
                            .show(context);
                        return;
                      }
                      ExtendedNavigator.rootNavigator.pushNamed(
                          Routes.editGoalDebitPage,
                          arguments: EditGoalDebitPageArguments(
                              debitItem: item,
                              goal: currentGoal,
                              goals: relGoals));
                      ;
                    })
              ],
            ),
          ),
          SizedBox(height: AppDimens.layoutSpacerS),
        ],
      );
      lst.add(w);
    }

    return Column(
      children: lst,
    );
    // return Container();
  }

  Widget _transactionState(transactionState) {
    if (transactionState == 1) {
      return Text(
        S.of(context).myGoalMovementsSuccessful,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.successColor,
        ),
      );
    } else if (transactionState == 2) {
      return Text(
        S.of(context).myGoalMovementsSuccessful,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.successColor,
        ),
      );
    } else {
      return Text(
        S.of(context).myGoalMovementsSuccessful,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.successColor,
        ),
      );
    }
  }

  Widget _transactionType(type, value) {
    if (type.contains("Inversión") || type.contains("Retiro")) {
      return Text(
        "$leftSymbol${formater.format(value)}",
        style: AppTextStyles.normal2.copyWith(
          color: AppColors.g75Color,
        ),
      );
    } else {
      return Text(
        "-$leftSymbol${formater.format(value)}",
        style: AppTextStyles.normal2.copyWith(
          color: AppColors.g75Color,
        ),
      );
    }
  }

  _showPopupWithdrawal(BuildContext context, DashboardGoal goal,
      WithdrawalInfo info, bool hasDebits, bool hasBalance) {
    if (hasBalance) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: DeleteGoalDialog(
              hasBalance: true,
              descriptionText: S.of(context).deleteGoalQuestion,
              questionText: S.of(context).deleteGoalDisclaimer,
              leftText: S.of(context).deleteGoalButton,
              righText: S.of(context).deleteGoalgoBackButton,
              leftAction: () {

                getIt<IFireBaseEventLogger>().goalDeleteConfirm({
                  "Price": "${goal.goalBalance[0]["NetBalance"]}",
                  "Currency": "COP",
                  "nombre meta": goal.name
                });

                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                context
                    .bloc<WithdrawalFormBloc>()
                    .add(WithdrawalFormEvent.deleteGoal(goal));
              },
              rightAction: () {
                getIt<IFireBaseEventLogger>().goalDeleteNoConfirm();
                ExtendedNavigator.rootNavigator.pop();
              },
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.25)).animate(anim1),
            child: child,
          );
        },
      );
    } else {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: DeleteGoalDialog(
              descriptionText: S.of(context).deleteGoalQuestion,
              leftText: S.of(context).deleteGoalButton,
              righText: S.of(context).deleteGoalgoBackButton,
              leftAction: () {
                // getIt<IFireBaseEventLogger>().eventEditGoalDeleteConfirm({
                //   "Price": "${goal.goalBalance[0]["NetBalance"]}",
                //   "Currency": "COP",
                //   "nombre meta": goal.name
                // });

                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                context
                    .bloc<WithdrawalFormBloc>()
                    .add(WithdrawalFormEvent.deleteGoal(goal));
              },
              rightAction: () {
                // getIt<IFireBaseEventLogger>().eventEditGoalDeleteNoConfirm();

                ExtendedNavigator.rootNavigator.pop();
              },
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.25)).animate(anim1),
            child: child,
          );
        },
      );
    }
  }
}
