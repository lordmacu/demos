import 'dart:convert';

import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/application/investing_grandes_montos/watcher/grandes_montos_watcher_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/sarlaft/Quanto/quanto_credit_history_item.dart';
import 'package:ualet/domain/sarlaft/i_sarlaft_repository.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/grandes_montos/pages/documentos_1.dart';
import 'package:ualet/presentation/investing/grandes_montos/pages/info_financiera_1.dart';
import 'package:ualet/presentation/investing/grandes_montos/pages/info_financiera_2.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

class InvestingGrandesMontosMaster extends StatelessWidget {
  final DashboardGoal goal;
  final bool isDebito;
  final double investment;
  final bool cargarDocumentos;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool isUpdate;
  final SarlaftItem sarlaftItem;
  final BankAccountItem bankItem;
  final bool validButtonReturn;

  const InvestingGrandesMontosMaster(
      {Key key,
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
      this.validButtonReturn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GrandesMontosWatcherBloc>(
            create: (context) {
              if (!cargarDocumentos) {
                return getIt<GrandesMontosWatcherBloc>()
                  ..add(GrandesMontosWatcherEvent.toInfoFinanciera1());
              } else {
                return getIt<GrandesMontosWatcherBloc>()
                  ..add(GrandesMontosWatcherEvent.toAdjuntarDocumentos1());
              }
            },
          ),
          BlocProvider<GrandesMontosDataBloc>(
            create: (context) => getIt<GrandesMontosDataBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<GrandesMontosWatcherBloc, GrandesMontosWatcherState>(
              listener: (context, state) {
                state.map(
                    infoFinanciera1: (info) {
                      context.bloc<GrandesMontosDataBloc>().add(
                          GrandesMontosDataEvent.setData(
                              info.items, info.cities, info.countries));
                      if (isUpdate)
                        context.bloc<GrandesMontosDataBloc>().add(
                            GrandesMontosDataEvent.setSarlaftData(sarlaftItem));
                    },
                    infoFinanciera2: (_) {},
                    adjuntarDocumentos1: (data) {
                      context.bloc<GrandesMontosDataBloc>().add(
                          GrandesMontosDataEvent.setRequiredFiles(data.files));
                    },
                    loading: (_) {},
                    end: (_) {},
                    error: (_) {});
              },
            )
          ],
          child: _masterBlocBuilder(context),
        ));
  }

  Widget _masterBlocBuilder(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GrandesMontosWatcherBloc, GrandesMontosWatcherState>(
        builder: (context, watcherState) {
          return BlocBuilder<GrandesMontosDataBloc, GrandesMontosDataState>(
            builder: (context, dataState) {
              return _buildRoot(context, watcherState, dataState);
            },
          );
        },
      ),
    );
  }

  _buildRoot(BuildContext context, GrandesMontosWatcherState watcherState,
      GrandesMontosDataState dataState) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
            children: [
              SizedBox(height: AppDimens.layoutSpacerS),

              watcherState.map(
                error: (value) {
                  return Center(
                    child: Text("Error descargando los datos: ${value.error}"),
                  );
                },
                end: (_) {
                  _nextPage(context, watcherState, dataState);

                  return Container();
                },
                infoFinanciera1: (data) {
                  // context
                  //     .bloc<GrandesMontosDataBloc>()
                  //     .add(GrandesMontosDataEvent.setData(data.items));
                  return InfoFinanciera1(
                    valor: investment,
                    items: data.items,
                    dataBloc: context.bloc<GrandesMontosDataBloc>(),
                    isUpdate: isUpdate,
                    sarlaftItem: sarlaftItem,
                  );
                },
                infoFinanciera2: (_) => InfoFinanciera2(
                  dataBloc: context.bloc<GrandesMontosDataBloc>(),
                ),
                adjuntarDocumentos1: (_) => Documentos1(
                  dataBloc: context.bloc<GrandesMontosDataBloc>(),
                ),
                loading: (_) => Stack(
                  children: <Widget>[
                    // Container(
                    //   color: AppColors.whiteColor,
                    // ),
                    LoadingInProgressOverlay(isLoading: true),
                  ],
                ),
              ), //Map
              PrimaryButton(
                  enabled: _isButtonActivated(context, watcherState,
                      context.bloc<GrandesMontosDataBloc>()),
                  text: S.of(context).continueButton,
                  action: _isButtonActivated(context, watcherState,
                          context.bloc<GrandesMontosDataBloc>())
                      ? () {
                          _nextPage(context, watcherState, dataState);
                        }
                      : null),
              SizedBox(height: AppDimens.layoutSpacerL),
            ],
          ),
        ],
      ),
    );
  }

  bool _isButtonActivated(BuildContext context,
      GrandesMontosWatcherState watcherState, GrandesMontosDataBloc dataBloc) {
    bool active = false;
    watcherState.map(
        infoFinanciera1: (_) => active = dataBloc.isButtonActivated1() &&
            dataBloc.state.sarlaftItem.totalAssets > investment,
        infoFinanciera2: (_) => active = dataBloc.isButtonActivated2(),
        adjuntarDocumentos1: (_) => active = dataBloc.isButtonActivated3(),
        loading: (_) => active = false,
        end: (_) => active = false,
        error: (_) => active = false);
    print(active);
    return active;
  }

  _nextPage(BuildContext context, GrandesMontosWatcherState watcherState,
      GrandesMontosDataState dataState) {
    print("Navigating");
    watcherState.map(
        error: (value) => null,
        end: (_) => null,
        infoFinanciera1: (_) {
          getIt<IFireBaseEventLogger>().investmentMovementsTop1();

          context
              .bloc<GrandesMontosWatcherBloc>()
              .add(GrandesMontosWatcherEvent.toInfoFinanciera2());
        },
        infoFinanciera2: (_) async {
          getIt<IFireBaseEventLogger>().investmentMovementsTop2();

          print("aquiiii ");
          if (isUpdate) {
            _pushUpdate(context, watcherState, dataState);
          } else {
            showDialog(
              context: context,
                builder: (BuildContext context) =>
                    LoadingInProgressOverlay(isLoading: true),
            );
            var response = await getIt<ISarlaftRepository>()
                .postSarlaft(dataState.sarlaftItem);
            bool error = false;

            response.fold((l) {
              error = true;
              print("ERROR");
              print(l);

              ExtendedNavigator.rootNavigator.pop();
              ToastHelper.createError(
                  duration: Duration(seconds: 5),
                  message: l.map(
                      unexpected: (e) => "Error Inesperado",
                      fromServer: (e) => e.message)).show(context);
            }, (r) => null);

            if (error) return;

            dynamic dataUser = getIt<SharedPreferences>().userData;
            if (dataUser != null) {
              final decoreUserData = json.decode(dataUser);
              QuantoCreditHistoryItem requestQuanto = QuantoCreditHistoryItem(
                  clave: '',
                  identificacion: decoreUserData["Identification"],
                  primerApellido: decoreUserData["LastName"],
                  producto: '',
                  tipoIdentificacion:
                      decoreUserData["IdentificationType"].toString(),
                  usuario: '',
                  ingress: dataState.sarlaftItem.monthlyIncome != 0
                      ? dataState.sarlaftItem.monthlyIncome.toInt()
                      : 0,
                  egress: dataState.sarlaftItem.monthlyOutcome != 0
                      ? dataState.sarlaftItem.monthlyOutcome.toInt()
                      : 0);

              var responseQuanto = await getIt<ISarlaftRepository>()
                  .postCreditHystoryPLus(requestQuanto);

              print(responseQuanto);
            }

            ExtendedNavigator.rootNavigator.pop();
          /*  ExtendedNavigator.rootNavigator
                .pushNamed(Routes.investingOverviewPage,
                    arguments: InvestingOverviewPageArguments(
                      goal: goal,
                      bankTransfer: !isDebito,
                      investment: investment,
                      goals: goals,
                      valuesChosen: valuesChosen,
                      bankAccountItem: bankItem,
                    ));*/
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.investingGrandesMontos,
                arguments: InvestingGrandesMontosMasterArguments(
                    cargarDocumentos: true,
                    goal: goal,
                    isDebito: isDebito,
                    investment: investment,
                    valuesChosen: valuesChosen,
                    bankItem: bankItem));
          }
        },
        adjuntarDocumentos1: (_) async {
          //Firebase 32
          // getIt<IFireBaseEventLogger>().investSuperiorMovementsDocs();
          // getIt<IFireBaseEventLogger>().eventInvestMovementsSuperiorD();

          // if (error) return; //TODO descomentar despues de pruebas

          // if (isDebito) {
          //   ExtendedNavigator.rootNavigator.pushReplacementNamed(
          //       Routes.investingAddAccountPage,
          //       arguments: InvestingAddAccountPageArguments(goal: goal,goals: goals,
          //  multiple: multiple,
          // valuesChosen: valuesChosen,));
          // } else {

          getIt<IFireBaseEventLogger>().investmentMovementsTopDocuments();

          showDialog(
            context: context,
              builder: (BuildContext context) =>LoadingInProgressOverlay(isLoading: true)
              ,
          );
          var response = await getIt<ISarlaftRepository>()
              .sendFiles(dataState.filesResponse.asList());
          ExtendedNavigator.rootNavigator.pop();
          response.fold((l) {
            ToastHelper.createError(
                message: l.map(
                    unexpected: (e) => "Error inesperado",
                    fromServer: (e) => "Error: ${e.message}")).show(context);
          }, (r) {
            ExtendedNavigator.rootNavigator
                .pushNamed(Routes.investingOverviewPage,
                    arguments: InvestingOverviewPageArguments(
                      goal: goal,
                      bankTransfer: !isDebito,
                      investment: investment,
                      goals: goals,
                      valuesChosen: valuesChosen,
                      bankAccountItem: bankItem,
                    ));
            //GOTO SUCCESS
            if (isDebito) {
              //TO CHOOSE ACCOUNT
              ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.investingChooseAccount,
                      arguments: InvestingChooseAccountArguments(
                        goal: goal,
                        bankTransfer: false,
                        investment: investment,
                      ));

              // ExtendedNavigator.rootNavigator
              //     .pushReplacementNamed(Routes.investingSuccessPage,
              //         arguments: InvestingSuccessPageArguments(
              //           goal: goal,
              //           item: bankItem,
              //           goals: goals,
              //           multiple: multiple,
              //           valuesChosen: valuesChosen,
              //         ));
            } else
              ExtendedNavigator.rootNavigator.pushReplacementNamed(
                  Routes.bankTransferAlmostPage,
                  arguments: BankTransferAlmostPageArguments(
                      goal: goal,
                      bankTransfer: true,
                      investment: investment,
                      valuesChosen: valuesChosen,
                      bankTransferValue: investment,
                      multiple: false));
          });

          // }
        },
        loading: (_) => null);
  }

  _pushUpdate(BuildContext context, GrandesMontosWatcherState watcherState,
      GrandesMontosDataState dataState) async {
    showDialog(
      context: context,
        builder: (BuildContext context) =>
         LoadingInProgressOverlay(isLoading: true),
    );

    var response =
        await getIt<ISarlaftRepository>().updateSarlaft(dataState.sarlaftItem);
    bool error = false;
  //  ExtendedNavigator.rootNavigator.pop();
    response.fold((l) {
      error = true;
      ToastHelper.createError(
          message: l.map(
              unexpected: (e) => "Error Inesperado",
              fromServer: (e) => e.message)).show(context);
    }, (r) {
      showGeneralDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.4),
          barrierDismissible: false,
          barrierLabel: "Label",
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (ctx, anim1, anim2) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: CustomDialog(
                buttonText: S.of(context).understand,
                icon: Icons.check_circle_outline,
                iconColor: AppColors.successColor,
                title: S.of(context).updateSarlaftSuccessTitle,
                description: S.of(context).updateSarlaftSuccessDescription,
                buttonAction: () => ExtendedNavigator.rootNavigator
                    .pushReplacementNamed(Routes.homePage),
              ),
            );
          },
          transitionBuilder: (ctx, anim1, anim2, child) {
            return SlideTransition(
              position: Tween(begin: Offset(0, 1), end: Offset(0, 0.28))
                  .animate(anim1),
              child: child,
            );
          });
    });

    if (error) return; //
    dynamic dataUser = getIt<SharedPreferences>().userData;
    if (dataUser != null) {
      final decoreUserData = json.decode(dataUser);
      QuantoCreditHistoryItem requestQuanto = QuantoCreditHistoryItem(
          clave: '',
          identificacion: decoreUserData["Identification"],
          primerApellido: decoreUserData["LastName"],
          producto: '',
          tipoIdentificacion: decoreUserData["IdentificationType"].toString(),
          usuario: '',
          ingress: dataState.sarlaftItem.monthlyIncome != 0
              ? dataState.sarlaftItem.monthlyIncome.toInt()
              : 0,
          egress: dataState.sarlaftItem.monthlyOutcome != 0
              ? dataState.sarlaftItem.monthlyOutcome.toInt()
              : 0);

      var responseQuanto = await getIt<ISarlaftRepository>()
          .postCreditHystoryPLus(requestQuanto);

      print(responseQuanto);
    }
    //ExtendedNavigator.rootNavigator.pop();
  }

  _prevPage(BuildContext context, GrandesMontosWatcherState watcherState) {
    print("Navigating");
    watcherState.map(
        error: (value) => ExtendedNavigator.of(context).pop(),
        end: (_) => null,
        infoFinanciera1: (_) => ExtendedNavigator.of(context).pop(),
        infoFinanciera2: (_) => context
            .bloc<GrandesMontosWatcherBloc>()
            .add(GrandesMontosWatcherEvent.toInfoFinanciera1()),
        adjuntarDocumentos1: (_) => ExtendedNavigator.rootNavigator.pop(),
        loading: (_) => null);
  }
}
