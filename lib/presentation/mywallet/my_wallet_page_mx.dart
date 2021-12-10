import 'package:ualet/application/my_wallet/bank_delete/bankdelete_bloc.dart';
import 'package:ualet/domain/my_wallet/i_my_wallet_repository.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/mywallet/widgets/delete_debit_dialog.dart';
import 'package:ualet/presentation/mywallet/widgets/edit_debit_goal_dialog.dart';
import 'package:ualet/presentation/mywallet/widgets/indication_painter_mx.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/recalculated_goals_dialog.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/mywallet/widgets/delete_account_dialog.dart';
import 'package:ualet/to_be_refactor/utils/bubble_indication_painter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/my_wallet/my_wallet_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/my_wallet/my_wallet_data.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:kt_dart/collection.dart';

import 'widgets/delete_account_debits_dialog.dart';

class MyWalletPageMX extends StatefulWidget {
  MyWalletPageMX({Key key}) : super(key: key);

  @override
  _MyWalletPageStateMX createState() => _MyWalletPageStateMX();
}

class _MyWalletPageStateMX extends State<MyWalletPageMX> {
  PageController _pageController;
  bool isLeft = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _onMyAccountButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onMyDebitsButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyWalletBloc>(
          create: (context) =>
              getIt<MyWalletBloc>()..add(MyWalletEvent.loadData()),
        ),
        BlocProvider<BankdeleteBloc>(
          create: (context) => getIt<BankdeleteBloc>(),
        ),
      ],
      child: BlocBuilder<MyWalletBloc, MyWalletState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => Text('Error :c'),
            //LOADING
            loading: (_) => Stack(
              children: <Widget>[
                Container(
                  color: AppColors.whiteColor,
                ),
                LoadingInProgressOverlay(isLoading: true),
              ],
            ),
            //LOAD FAILED
            loadFailure: (failure) =>
                Text("Error: ${failure.failure.toString()}"),
            //SUCCESS
            loadSuccess: (success) => _buildRoot(context, success.data),
          );
        },
      ),
    );
  }

  Widget _buildRoot(BuildContext context, MyWalletData data) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerM,
        ),
        child: Visibility(
          // visible: data.showPaint,
          visible: false,
          child: PrimaryButton(
            text: S.of(context).buttonAddAccount,
            enabled: data.showPaint,
            action: () async {
              getIt<IFireBaseEventLogger>().menuAddAccount();

              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.investingAddAccountPage,
                arguments: InvestingAddAccountPageArguments(
                  goal: DashboardGoal.empty(),
                  bankTransfer: false,
                  investment: 0,
                  isWallet: true,
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(
              left: AppDimens.layoutMarginS,
              right: AppDimens.layoutMarginS,
              top: AppDimens.layoutSpacerXs,
              bottom: AppDimens.layoutSpacerXs),
          children: <Widget>[
            //BackButton
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              color: AppColors.primaryColor,
              alignment: Alignment.topLeft,
              tooltip: "Volver",
              onPressed: () => ExtendedNavigator.rootNavigator.pop(),
            ),
            //Header
            Text(
              S.of(context).myWalletHeader,
              style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            //Selector
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimens.buttonBarSlideRadius,
                  ),
                  color: AppColors.whiteColor),
              height: 70,
              child: CustomPaint(
                size: Size.infinite,
                painter: TabIndicationPainterMX(
                    pageController: _pageController,
                    radius: AppDimens.buttonSelectedSlideRadius,
                    dxEntry: 5.0,
                    dxTarget: width / 2 - 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _onMyAccountButtonPress,
                        child: Text(
                          S.of(context).myWalletAccounts,
                          style: AppTextStyles.normal2.copyWith(
                            color: !isLeft
                                ? AppColors.g25Color
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _onMyDebitsButtonPress,
                        child: Text(
                          getIt<IEnv>().isColombia()
                              ? S.of(context).myWalletDebits
                              : S.of(context).myWalletDebitsMX,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.normal2.copyWith(
                            color: isLeft
                                ? AppColors.g25Color
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            //PageViewer
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (i) {
                          if (i == 0) {
                            setState(() {
                              isLeft = true;
                              getIt<IFireBaseEventLogger>().walletMyAccounts();
                            });
                          } else if (i == 1) {
                            setState(() {
                              isLeft = false;
                              getIt<IFireBaseEventLogger>().walletMyDebits();
                            });
                          }
                        },
                        children: <Widget>[
                          //Cuentas
                          _buildCuentas(data),
                          //Domiciliaciones
                          _buildDomiciliaciones(data),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ConstrainedBox _buildDomiciliaciones(MyWalletData data) {
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 400,
            child: ListView.builder(
                primary: false,
                itemCount: data.debitsList.size,
                itemBuilder: (context, index) =>
                    _buildDomItem(data.debitsList[index], data.goalsList)),
          ),
        ));
  }

  Widget _buildDomItem(DebitInfo item, KtList<DashboardGoal> goals) {
    String periodicity = '';
    String bankAccountType = "";
    if (item.bankAccountTypeId == 1) {
      bankAccountType = "Cuenta de ahorros";
    } else if (item.bankAccountId == 2) {
      bankAccountType = "Cuenta corriente";
    } else {
      bankAccountType = "Cuenta bancaria";
    }
    switch (item.periodicity) {
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
    List<DashboardGoal> itemGoals =
        goals.filter((g) => item.goalId.contains(g.id)).asList();
    String amountText = getIt<IEnv>().isColombia() ? NumberFormaters.copFormater.format(item.value) :  NumberFormaters.mxFormater.format(item.value);
    return Column(
      children: <Widget>[
        Container(
          height: 92,
          padding: EdgeInsets.all(
            AppDimens.layoutMarginS,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(
              AppDimens.dialogBorderRadius,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item.bankUrl.trim().trimRight(),
                    width: 70,
                  ),
                  SizedBox(
                    width: AppDimens.layoutSpacerS,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bankAccountType,
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.g75Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        getIt<IEnv>().isColombia() ? "\$$amountText" : amountText,
                        style: AppTextStyles.caption2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                      Text(
                        periodicity,
                        style: AppTextStyles.normal2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      getIt<IFireBaseEventLogger>().myDebitsDelete();

                      return showGeneralDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.4),
                        barrierDismissible: true,
                        barrierLabel: "Label",
                        transitionDuration: Duration(milliseconds: 600),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: DeleteDebitDialog(
                              leftButtonAction: () async {
                                getIt<IFireBaseEventLogger>()
                                    .myDebitsDeleteConfirm();

                                ExtendedNavigator.rootNavigator.pop();
                                var response =
                                    await getIt<IMyWalletRepository>()
                                        .deleteDebit(item);

                                response.fold(
                                    (l) => ToastHelper.createError(
                                            message: l.map(
                                                unexpected: (e) =>
                                                    "Error inesperado",
                                                fromServer: (e) => e.message))
                                        .show(context), (r) {
                                  ExtendedNavigator.rootNavigator
                                      .pushNamedAndRemoveUntil(
                                    Routes.myWalletPageMX,
                                    ModalRoute.withName(
                                      Routes.homePage,
                                    ),
                                  );
                                });
                              },
                              leftButtonText: S.of(context).deleteAccountTrue,
                              rightButtonAction: () {
                                getIt<IFireBaseEventLogger>()
                                    .myDebitsDeleteNoReturn();
                                ExtendedNavigator.rootNavigator.pop(false);
                              },
                              rightButtonText: S.of(context).deleteAccountFalse,
                            ),
                          );
                        },
                        transitionBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0.23))
                                    .animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: AppColors.dangerColor,
                          size: 20,
                        ),
                        Text(
                          S.of(context).delete,
                          style: AppTextStyles.menu1.copyWith(
                            color: AppColors.dangerColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppDimens.layoutSpacerS,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      getIt<IFireBaseEventLogger>().myDebitsEdit();

                      ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.editDebitPage,
                        arguments: EditDebitPageArguments(debit: item),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        Text(
                          S.of(context).edit,
                          style: AppTextStyles.menu1.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: AppDimens.layoutSpacerS),
      ],
    );
  }

  BlocConsumer _buildCuentas(MyWalletData data) {
    return BlocConsumer<BankdeleteBloc, BankdeleteState>(
      listener: (bankContext, bankState) {
        bankState.deleteOrFailure.fold(() => {}, (either) {
          either.fold((l) {
            ToastHelper.createError(
                message: l.map(
                    unexpected: (s) => "unexpected",
                    fromServer: (s) => s.message)).show(context);
            bankContext.bloc<BankdeleteBloc>().add(BankdeleteEvent.resetBloc());
          }, (r) {
            ToastHelper.createSuccess(message: S.of(context).deleteAccountToast)
                .show(context);
            Future.delayed(Duration(seconds: 4), () {
              ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                Routes.myWalletPageMX,
                ModalRoute.withName(Routes.homePage),
              );
            });
          });
        });
      },
      builder: (bankContext, bankState) {
        return ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
                height: 400,
                child: ListView.builder(
                  primary: false,
                  itemCount: data.accountsList.size,
                  itemBuilder: (context, index) {
                    List<DebitInfo> debitsAssociated = [];

                    for (int i = 0; i < data.debitsList.size; i++) {
                      if (data.debitsList[i].bankAccountId ==
                              data.accountsList[index].id) {
                        debitsAssociated.add(data.debitsList[i]);
                      }
                    }

                    return _buildCuentaItem(data.accountsList[index],
                        debitsAssociated, bankContext);
                  },
                )),
          ),
        );
      },
    );
  }

  Widget _buildCuentaItem(BankAccountItem item,
      List<DebitInfo> debitsAssociated, BuildContext bankContext) {
    String accNumText = item.number.length >= 4
        ? item.number.substring(item.number.length - 4, item.number.length)
        : item.number;
    String stateName = "";
    if (item.status == 2) {
      stateName = "Inscrita";
    } else if (item.status == 1) {
      stateName = "En Proceso";
    } else {
      stateName = "Rechazada";
    }
    String bankAccountType = "";
    if (item.typeId == 1) {
      bankAccountType = "Cuenta de ahorros";
    } else if (item.typeId == 2) {
      bankAccountType = "Cuenta corriente";
    } else {
      bankAccountType = "Cuenta bancaria";
    }
    return Column(
      children: [
        Container(
          height: 92,
          padding: EdgeInsets.all(AppDimens.layoutSpacerM),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(
              AppDimens.dialogBorderRadius,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    width: 80,
                    imageUrl: item.accountImg,
                  ),
                  SizedBox(
                    width: AppDimens.layoutSpacerS,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bankAccountType,
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.g75Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "**** $accNumText",
                        style: AppTextStyles.normal2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                      Text(
                        stateName,
                        style: AppTextStyles.caption2.copyWith(
                          color: item.status == 2
                              ? AppColors.successColor
                              : AppColors.infoColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (debitsAssociated.length > 0) {
                        return showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          barrierDismissible: true,
                          barrierLabel: "Label",
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: DeleteAccountDebitsDialog(
                                leftButtonAction: () {
                                  bankContext.bloc<BankdeleteBloc>().add(
                                        BankdeleteEvent.deleteBankAccount(
                                          item,
                                        ),
                                      );
                                  ExtendedNavigator.rootNavigator.pop();
                                },
                                leftButtonText: S.of(context).deleteAccountTrue,
                                rightButtonAction: () =>
                                    ExtendedNavigator.rootNavigator.pop(false),
                                rightButtonText:
                                    S.of(context).deleteAccountFalse,
                                debitsAssociated: debitsAssociated,
                              ),
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                      begin: Offset(0, 1), end: Offset(0, 0.15))
                                  .animate(animation),
                              child: child,
                            );
                          },
                        );
                      } else {
                        return showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          barrierDismissible: true,
                          barrierLabel: "Label",
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: DeleteAccountDialog(
                                descriptionText:
                                    S.of(context).deleteAccountDescription,
                                leftButtonAction: () {
                                  bankContext.bloc<BankdeleteBloc>().add(
                                        BankdeleteEvent.deleteBankAccount(
                                          item,
                                        ),
                                      );
                                  ExtendedNavigator.rootNavigator.pop(true);
                                },
                                leftButtonText: S.of(context).deleteAccountTrue,
                                rightButtonAction: () {
                                  ExtendedNavigator.rootNavigator.pop(false);
                                },
                                rightButtonText:
                                    S.of(context).deleteAccountFalse,
                              ),
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                      begin: Offset(0, 1), end: Offset(0, 0.3))
                                  .animate(animation),
                              child: child,
                            );
                          },
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_outline,
                            size: 20, color: AppColors.dangerColor),
                        Text(
                          S.of(context).delete,
                          style: AppTextStyles.menu1.copyWith(
                            color: AppColors.dangerColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
      ],
    );
  }
}
