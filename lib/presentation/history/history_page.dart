import 'package:ualet/application/history/history_bloc.dart';
import 'package:ualet/domain/history/profitability_item.dart';
import 'package:ualet/domain/history/transaction_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/history/widgets/graph_selector_tabbar.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/history/widgets/chart_two_page.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:ualet/to_be_refactor/widgets/chart_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class HistoryPage extends HookWidget {
  final mxFormatter = NumberFormaters.mxFormater;
  final coFormatter = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  final dateFormatter = new DateFormat.MMM('es_MX');

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter =
        getIt<IEnv>().isColombia() ? coFormatter : mxFormatter;
    var graphType = useState(0);
    return BlocProvider<HistoryBloc>(
      create: (context) => getIt<HistoryBloc>()
        ..add(HistoryEvent.getTransactions(graphType.value)),
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
              loadSuccess: (data) {
                int pending = 0;
                int transactionAmmount = 0;
                double totalInvestment = 0;
                double averageProfitability = 0;
                List<TransactionItem> pendingTransactions = [];
                List<TransactionItem> graphTransactions = [];
                List<TransactionItem> lstTransactionsSucess = [];
                List<ProfitabilityItem> lstGraphNameValue = [];

                //Rentabilidad
                lstGraphNameValue = data.profitabilities
                    .asList()
                    .where((i) => i.name == 'anual')
                    .toList();
                averageProfitability = lstGraphNameValue[0].value;

                //Inversión
                if (data.graphTransactions.asList().length > 0) {
                  totalInvestment =
                      data.graphTransactions[0].valueBalance != null
                          ? data.graphTransactions[0].valueBalance
                          : 0;
                }

                //Movimientos - Pendientes
                pendingTransactions = data.graphTransactions
                    .asList()
                    .where((i) => i.state == 4)
                    .toList();

                //Movimientos - Diferentes a Pendientes
                graphTransactions = data.graphTransactions
                    .asList()
                    .where((i) => i.state != 4)
                    .toList();

                //Movimientos - Exitosas
                lstTransactionsSucess = data.graphTransactions
                    .asList()
                    .where((i) => i.state == 6 || i.state == 7)
                    .toList();

                pending = pendingTransactions.length;
                transactionAmmount = graphTransactions.length;

                double transactionHeight = transactionAmmount * 80.0;
                bool showGraph =
                    hasTransactions(graphTransactions, graphType.value);

                List<Color> lineColors = List<Color>();
                lineColors.add(AppColors.primaryColor);

                return Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: SafeArea(
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                        left: AppDimens.layoutMargin,
                        right: AppDimens.layoutMargin,
                        bottom: AppDimens.layoutSpacerL,
                      ),
                      children: <Widget>[
                        SizedBox(
                          height: AppDimens.layoutSpacerS,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.primaryColor,
                                size: AppDimens.layoutMargin,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () => ExtendedNavigator.rootNavigator
                                  .pushReplacementNamed(Routes.homePage),
                            ),
                            Text(S.of(context).myHistory,
                                style: AppTextStyles.subtitle2
                                    .copyWith(color: AppColors.g75Color))
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        // GraphSelectorTabBar(
                        //   tabActivated: graphType.value,
                        //   onClickLeft: () {
                        //     graphType.value = 0;
                        //     context.bloc<HistoryBloc>().add(
                        //         HistoryEvent.getTransactions(graphType.value));
                        //   },
                        //   onClickMiddle: () {
                        //     graphType.value = 1;
                        //     context.bloc<HistoryBloc>().add(
                        //         HistoryEvent.getTransactions(graphType.value));
                        //   },
                        //   onClickRight: () {
                        //     graphType.value = 2;
                        //     context.bloc<HistoryBloc>().add(
                        //         HistoryEvent.getTransactions(graphType.value));
                        //   },
                        // ),
                        // SizedBox(
                        //   height: AppDimens.layoutSpacerS,
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: AppColors.whiteColor,
                        //     borderRadius: BorderRadius.circular(
                        //         AppDimens.dialogBorderRadius),
                        //   ),
                        //   padding: EdgeInsets.all(
                        //     AppDimens.layoutSpacerS,
                        //   ),
                        //   height: 320,
                        //   child: Column(
                        //     children: [
                        //       showGraph
                        //           ? ChartTwoWidget(
                        //               minX: 0,
                        //               maxX: 11,
                        //               minY: 0,
                        //               maxY: 10,
                        //               valuePeriod: graphType.value,
                        //               mapSumTransactionToMonth:
                        //                   getGraphSumTransactionToMonth(
                        //                       lstTransactionsSucess),
                        //             )
                        //           : Container(
                        //               margin: EdgeInsets.only(
                        //                 left: AppDimens.layoutHSpacerS,
                        //                 right: AppDimens.layoutHSpacerS,
                        //               ),
                        //               height: 160,
                        //               child: Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.center,
                        //                 children: <Widget>[
                        //                   Text(
                        //                     "😅",
                        //                     style: TextStyle(fontSize: 40.0),
                        //                     textAlign: TextAlign.center,
                        //                   ),
                        //                   SizedBox(
                        //                     height: AppDimens.layoutSpacerM,
                        //                   ),
                        //                   Text(
                        //                     S.of(context).showgraphMessage,
                        //                     textAlign: TextAlign.center,
                        //                     style: AppTextStyles.subtitle1
                        //                         .copyWith(
                        //                             color: AppColors.g50Color,
                        //                             fontWeight:
                        //                                 FontWeight.w400),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //       Divider(),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             S.of(context).investTextField,
                        //             style: AppTextStyles.normal1.copyWith(
                        //               color: AppColors.g75Color,
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //           Text(
                        //             "${coFormatter.format(totalInvestment)}",
                        //             style: AppTextStyles.normal2.copyWith(
                        //               color: AppColors.g75Color,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Divider(),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             S.of(context).performance,
                        //             style: AppTextStyles.normal1.copyWith(
                        //               color: AppColors.g75Color,
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Text(
                        //                 "${averageProfitability.toStringAsFixed(2)}%",
                        //                 style: AppTextStyles.normal2.copyWith(
                        //                   color: AppColors.g75Color,
                        //                 ),
                        //               ),
                        //               _iconRentability(
                        //                   averageProfitability > 0),
                        //             ],
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        Text(
                          S.of(context).myHistoryRentability,
                          style: AppTextStyles.subtitle2.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(
                                AppDimens.dialogBorderRadius),
                          ),
                          padding: EdgeInsets.all(
                            AppDimens.layoutSpacerM,
                          ),
                          child: ListView.separated(
                            primary: false,
                            itemCount: data.profitabilities.size,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemBuilder: (context, index) {
                              var item = data.profitabilities[index];
                              String name =
                                  "${item.name[0].toUpperCase()}${item.name.substring(1)}";
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    name,
                                    style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${item.value.toStringAsFixed(2)}% E.A.",
                                        style: AppTextStyles.normal2.copyWith(
                                          color: AppColors.g75Color,
                                        ),
                                      ),
                                      _iconRentability(item.isPositive),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        Text(
                          S.of(context).withdrawalTransactionSummaryMovements,
                          style: AppTextStyles.subtitle2
                              .copyWith(color: AppColors.g75Color),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        pending > 0
                            ? Container(
                                height: pending > 1 ? 180 : 92,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.dialogBorderRadius),
                                ),
                                padding: EdgeInsets.all(
                                  AppDimens.layoutSpacerM,
                                ),
                                child: ListView.separated(
                                  primary: false,
                                  itemCount: pending,
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemBuilder: (context, index) {
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
                                                item.name,
                                                style: AppTextStyles.caption1
                                                    .copyWith(
                                                  color: AppColors.g50Color,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "${date.day}/${date.month}/${date.year}",
                                                style: AppTextStyles.caption1
                                                    .copyWith(
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
                                                "${item.type == "5" ? item.accountNumer : coFormatter.format(item.value)}",
                                                style: AppTextStyles.normal2
                                                    .copyWith(
                                                        color: AppColors
                                                            .g75Color)),
                                            Text(
                                              "${S.of(context).inProgress} ",
                                              style: AppTextStyles.caption2
                                                  .copyWith(
                                                color: AppColors.infoColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                  left: AppDimens.layoutHSpacerS,
                                  right: AppDimens.layoutHSpacerS,
                                ),
                                height: 180,
                                color: AppColors.backgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "😅",
                                      style: TextStyle(fontSize: 40.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerM,
                                    ),
                                    Text(
                                      S.of(context).historyNoProcessMovements,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.subtitle1.copyWith(
                                          color: AppColors.g50Color,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerM,
                                    ),
                                    Text(
                                        S
                                            .of(context)
                                            .historyNoProcessMovementsDescription,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g75Color,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        Text(
                          S.of(context).movements,
                          style: AppTextStyles.subtitle2
                              .copyWith(color: AppColors.g75Color),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        transactionAmmount > 0
                            ? Container(
                                height: transactionAmmount < 7
                                    ? transactionAmmount > 1
                                        ? transactionHeight
                                        : 92.0
                                    : 550.0,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.dialogBorderRadius),
                                ),
                                padding: EdgeInsets.all(
                                  AppDimens.layoutSpacerM,
                                ),
                                child: ListView.separated(
                                  primary: false,
                                  itemCount: transactionAmmount,
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemBuilder: (context, index) {
                                    TransactionItem item =
                                        data.graphTransactions[index];
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
                                                item.name,
                                                style: AppTextStyles.normal2
                                                    .copyWith(
                                                  color: AppColors.g75Color,
                                                ),
                                              ),
                                              Text(
                                                "${date.day}/${date.month}/${date.year}",
                                                style: AppTextStyles.caption1
                                                    .copyWith(
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
                                                "${formatter.format(item.value)}",
                                                style: AppTextStyles.normal2
                                                    .copyWith(
                                                        color: AppColors
                                                            .g75Color)),
                                            _printValidTransaction(
                                                item.state,
                                                context,
                                                item.transactionStateName),
                                            item.faildetail != "null"
                                                ? Text(
                                                    item.faildetail,
                                                    style: AppTextStyles
                                                        .caption1
                                                        .copyWith(
                                                      color: AppColors.g50Color,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                  left: AppDimens.layoutHSpacerS,
                                  right: AppDimens.layoutHSpacerS,
                                ),
                                height: 180,
                                color: AppColors.backgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "😅",
                                      style: TextStyle(fontSize: 40.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerM,
                                    ),
                                    Text(
                                      S.of(context).myGoalsNoMovements,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.subtitle1.copyWith(
                                          color: AppColors.g50Color,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerM,
                                    ),
                                    Text(
                                      S
                                          .of(context)
                                          .historyNoMovementsDescription,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.normal1.copyWith(
                                        color: AppColors.g75Color,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  _printValidTransaction(
      int valueTransaction, context, String transactionStateName) {
    switch (valueTransaction) {
      case 1:
        return Text(transactionStateName,
            style:
                AppTextStyles.normal5.copyWith(color: AppColors.successColor));
        break;
      case 2:
        return Text(transactionStateName,
            style:
                AppTextStyles.caption2.copyWith(color: AppColors.dangerColor));
        break;
      case 3:
        return Text(transactionStateName,
            style:
                AppTextStyles.caption2.copyWith(color: AppColors.dangerColor));
        break;
      case 4:
        return Text(transactionStateName,
            style: AppTextStyles.normal5.copyWith(color: AppColors.infoColor));
        break;
      case 5:
        return Text(transactionStateName,
            style: AppTextStyles.normal5.copyWith(color: AppColors.infoColor));
        break;
      case 6:
        return Text(transactionStateName,
            style:
                AppTextStyles.normal5.copyWith(color: AppColors.successColor));
        break;
      case 7:
        return Text(transactionStateName,
            style:
                AppTextStyles.normal5.copyWith(color: AppColors.successColor));
        break;
    }
  }

  _iconRentability(bool isPositive) {
    if (isPositive) {
      return Icon(
        Icons.arrow_drop_up,
        size: 22.0,
        color: AppColors.successColor,
      );
    } else {
      return Icon(
        Icons.arrow_drop_down,
        size: 22.0,
        color: AppColors.dangerColor,
      );
    }
  }

  Map<double, double> getGraphData(
      List<TransactionItem> transactions, int type) {
    Map<double, double> points = {};
    //points[0] = 0;
    double acum = 0;

    for (int i = 0; i < transactions.length; i++) {
      points[acum] = i.toDouble();
      acum += 10;
    }

    return points;
  }

  Map<int, double> getGraphSumTransactionToMonth(
      List<TransactionItem> transactions) {
    Map<int, double> sumTransactionToMonth = {};
    List<int> lstMonthsTransactions = [];
    List<TransactionItem> lstFilterTransactions = [];

    for (int i = 0; i < transactions.length; i++) {
      if (lstMonthsTransactions.length == 0) {
        lstMonthsTransactions.add(transactions[i].createDate.month);
      } else {
        if (!lstMonthsTransactions.contains(transactions[i].createDate.month)) {
          lstMonthsTransactions.add(transactions[i].createDate.month);
        }
      }
    }

    double acum = 0;
    for (var i = 0; i < lstMonthsTransactions.length; i++) {
      acum = 0;
      lstFilterTransactions = transactions
          .where((e) => e.createDate.month == lstMonthsTransactions[i])
          .toList();
      for (var j = 0; j < lstFilterTransactions.length; j++) {
        acum = acum + lstFilterTransactions[j].value;
        sumTransactionToMonth[lstMonthsTransactions[i]] = acum;
      }
    }
    return sumTransactionToMonth;
  }

  bool hasTransactions(List<TransactionItem> transactions, int type) {
    Duration daysDisplayed =
        Duration(days: type == 0 ? 30 : type == 1 ? 90 : 180);
    DateTime firstDate = DateTime.now().subtract(daysDisplayed);
    int ammount = 0;
    for (int i = 0; i < transactions.length; i++) {
      DateTime transactionDate = transactions[i].createDate;
      if (transactionDate.isAfter(firstDate)) {
        ammount++;
      }
    }

    return ammount > 0;
  }
}
