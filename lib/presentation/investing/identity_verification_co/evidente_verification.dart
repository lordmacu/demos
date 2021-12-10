import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/confirmation_evidente.dart';
import 'package:ualet/presentation/investing/identity_verification_co/widgets/custom_button_selected.dart';
import 'package:ualet/presentation/investing/identity_verification_co/widgets/evidente_error_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

class EvidenteVerification extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final BankAccountItem bankAccountItem;
  final bool redirectHome;
  EvidenteVerification({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.investment = 0,
    this.bankAccountItem,
    this.redirectHome = false,
  }) : super(key: key);

  @override
  _EvidenteVerificationState createState() => _EvidenteVerificationState();
}

class _EvidenteVerificationState extends State<EvidenteVerification> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _pages;
  final repo = getIt<ICustomerLevelRepoCol>();
  SharedPreferences _prefs = getIt<SharedPreferences>();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserVerificationBloc>()
        ..add(UserVerificationEvent.getQuestions()),
      child: BlocConsumer<UserVerificationBloc, UserVerificationState>(
        builder: (context, state) {
          _pages = state.questions.length;
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
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(bottom: AppDimens.layoutMarginM),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < _pages; i++)
                      SlideDots(i == _currentPage ? true : false)
                  ],
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
                  children: [
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    Text(
                      S.of(context).identityVerificationTitle,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.title2.copyWith(
                        color: AppColors.g25Color,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    Container(
                      height: 520,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: _onPageChanged,
                        itemCount: state.questions.length,
                        itemBuilder: (context, index) {
                          List possibleAnswers =
                              state.questions[index]["Respuesta"];
                          String questionId = state.questions[index]["id"];
                          return Container(
                            child: Column(
                              children: [
                                Text(
                                  state.questions[index]["texto"],
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.normal1.copyWith(
                                    color: AppColors.g75Color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimens.layoutMarginM,
                                ),
                                Container(
                                  height: 400,
                                  child: ListView.builder(
                                    itemCount: possibleAnswers.length,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.layoutSpacerM,
                                    ),
                                    primary: false,
                                    itemBuilder: (BuildContext context, int i) {
                                      var possibleAnswer = possibleAnswers[i];
                                      String answerId = possibleAnswer["id"];
                                      print(
                                          {"disabled": state.buttonsDisabled});
                                      return Column(
                                        children: [
                                          CustomButtonSelected(
                                            onPressed: () {
                                              if (_currentPage ==
                                                  state.questions.length - 1) {
                                                context
                                                    .bloc<
                                                        UserVerificationBloc>()
                                                    .add(UserVerificationEvent
                                                        .changeButtonsDisabled(
                                                      true,
                                                    ));
                                                setState(() {
                                                  _currentPage = 0;
                                                });

                                                context
                                                    .bloc<
                                                        UserVerificationBloc>()
                                                    .add(
                                                      UserVerificationEvent
                                                          .answerOneQuestion(
                                                        answerId,
                                                        questionId,
                                                      ),
                                                    );
                                                context
                                                    .bloc<
                                                        UserVerificationBloc>()
                                                    .add(
                                                      UserVerificationEvent
                                                          .answerQuestions(),
                                                    );
                                              } else {
                                                context
                                                    .bloc<
                                                        UserVerificationBloc>()
                                                    .add(UserVerificationEvent
                                                        .changeButtonsDisabled(
                                                            true));

                                                Future.delayed(
                                                    Duration(milliseconds: 500),
                                                    () {
                                                  _pageController.animateToPage(
                                                    _currentPage + 1,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.easeInOut,
                                                  );
                                                  context
                                                      .bloc<
                                                          UserVerificationBloc>()
                                                      .add(
                                                        UserVerificationEvent
                                                            .answerOneQuestion(
                                                          answerId,
                                                          questionId,
                                                        ),
                                                      );
                                                });
                                              }
                                            },
                                            text: possibleAnswer["texto"],
                                            isDisabled: state.buttonsDisabled,
                                          ),
                                          SizedBox(
                                            height: AppDimens.layoutSpacerM,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        // physics: NeverScrollableScrollPhysics(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          state.getQuestionsOption.fold(() {}, (either) {
            either.fold((l) {
              showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: false,
                builder: (context) {
                  return EvidenteErrorDialog(
                    buttonAction: () {
                      if (!widget.redirectHome) {
                        ExtendedNavigator.rootNavigator.popUntil(
                          ModalRoute.withName(
                            Routes.verificationForm,
                          ),
                        );
                      } else {
                        ExtendedNavigator.rootNavigator
                            .pushReplacementNamed(Routes.homePage);
                      }
                    },
                    buttonText: S.of(context).errorEvidenteButton,
                    subtitle: l.map(
                      unexpected: (a) => "Error inesperado",
                      fromServer: (s) => s.message,
                    ),
                    title: S.of(context).errorEvidenteTitle,
                  );
                },
              );
            }, (r) {
              context
                  .bloc<UserVerificationBloc>()
                  .add(UserVerificationEvent.fillQuestions(r));
            });
          });
          state.validateEvidente.fold(() {}, (either) {
            bool error = false;
            either.fold((l) {
              error = true;
              ToastHelper.createError(
                  message: l.map(
                      unexpected: (s) => "Server error",
                      fromServer: (s) => s.message)).show(context);
              context
                  .bloc<UserVerificationBloc>()
                  .add(UserVerificationEvent.getQuestions());
            }, (r) async {
              if (error) {
                return;
              }

              showDialog(
                  context: context, builder: (BuildContext context) =>  LoadingInProgressOverlay(isLoading: true));


              var repoEnrollment =
                  await getIt<IInvestingRepository>().softEnrollment();

              repoEnrollment.fold(
                  (l) => {
                        ToastHelper.createError(
                                message: l.map(
                                    unexpected: (e) => "Error inesperado :(",
                                    fromServer: (e) => "Error: ${e.message}"))
                            .show(context)
                      }, (r) async {
                getIt<IFireBaseEventLogger>().verificationSuccess();

                var responseLvl =
                    await repo.verifyNextRedirection(widget.investment);

                responseLvl.fold((l) {
                  ToastHelper.createError(
                          message: l.map(
                              unexpected: (e) => "Error inesperado",
                              fromServer: (e) => "Error: ${e.message}"))
                      .show(context);
                }, (r) {
                  switch (r.customerLevel) {
                    case CustomerLevelRepositoryCol.MOSTRAR_SARLAFT:
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                        builder: (BuildContext context) =>  Align(
                            alignment: Alignment.center,
                            child: CustomDialog(
                              buttonText: S.of(context).continueButton,
                              buttonAction: () {
                                getIt<IFireBaseEventLogger>()
                                    .investmentMovementsTop();
                                ExtendedNavigator.rootNavigator
                                    .pushReplacementNamed(
                                        Routes.investingGrandesMontos,
                                        arguments:
                                            InvestingGrandesMontosMasterArguments(
                                                cargarDocumentos: false,
                                                goal: widget.goal,
                                                isDebito: !widget.bankTransfer,
                                                investment: widget.investment,
                                                bankItem:
                                                    widget.bankAccountItem));
                              },
                              // description: S.of(context).sarlaftPopupSubtitle,
                              description: r.message,
                              // title: S.of(context).sarlaftPopupTitle,
                              title: r.title,
                              icon: Icons.add_to_home_screen,
                              iconColor: AppColors.successColor,
                            ),
                          ));
                      break;
                    case CustomerLevelRepositoryCol.CARGUE_DOCUMENTOS:
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>  Align(
                            alignment: Alignment.center,
                            child: CustomDialog(
                              description: r.message,
                              title: r.title,
                              buttonText: S.of(context).continueButton,
                              buttonAction: () => ExtendedNavigator
                                  .rootNavigator
                                  .pushReplacementNamed(
                                      Routes.investingGrandesMontos,
                                      arguments:
                                          InvestingGrandesMontosMasterArguments(
                                              cargarDocumentos: true,
                                              goal: widget.goal,
                                              isDebito: !widget.bankTransfer,
                                              investment: widget.investment,
                                              bankItem:
                                                  widget.bankAccountItem)),
                              icon: Icons.add_to_home_screen,
                              iconColor: AppColors.successColor,
                            ),
                          ));
                      break;

                    default:
                      if (widget.bankTransfer) {
                        ExtendedNavigator.rootNavigator.pushReplacementNamed(
                            Routes.bankTransferAlmostPage,
                            arguments: BankTransferAlmostPageArguments(
                                goal: widget.goal,
                                bankTransfer: true,
                                bankTransferValue: widget.investment,
                                investment: widget.investment));
                        return;
                      } else {
                        ExtendedNavigator.rootNavigator.pushReplacementNamed(
                          Routes.confirmationEvidente,
                          arguments: ConfirmationEvidentePageArguments(
                            goal: widget.goal,
                            bankTransfer: widget.bankTransfer,
                            investment: widget.investment,
                          ),
                        );
                      }
                      break;
                  }
                });
              });
            });
          });
        },
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
