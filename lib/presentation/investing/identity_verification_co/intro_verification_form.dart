import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';

import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_menu.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroVerificationForm extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool redirectHome;
  IntroVerificationForm({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.bankAccountItem,
    this.multiple = false,
    this.goals,
    this.valuesChosen,
    this.redirectHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusDocument = FocusNode();
    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            displayDoneButton: true,
            focusNode: _focusDocument,
          ),
        ],
      );
    }

    return BlocProvider<UserVerificationBloc>(
      create: (context) =>
          getIt<UserVerificationBloc>()..add(UserVerificationEvent.setUpForm()),
      child: BlocConsumer<UserVerificationBloc, UserVerificationState>(
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
            return WillPopScope(
                child: Scaffold(
                  backgroundColor: AppColors.backgroundColor,
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
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: AppColors.primaryColor,
                          alignment: Alignment.topLeft,
                          tooltip: "Volver",
                          onPressed: () =>
                              ExtendedNavigator.rootNavigator.pop(),
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
                        Text(
                          S.of(context).identityVerificationDescription,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutMarginM,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropdownMenu(
                                itemsList: state.idTypes,
                                onChanged: (value) {
                                  context.bloc<UserVerificationBloc>().add(
                                        UserVerificationEvent
                                            .documentTypeChanged(value),
                                      );
                                },
                                label: S.of(context).idDocumentType,
                              ),
                              SizedBox(
                                height: AppDimens.layoutSpacerS,
                              ),
                              CustomTextFormField(
                                decoration: InputDecoration(
                                  hintText: S.of(context).documentNumber,
                                  hintStyle: AppTextStyles.normal1
                                      .copyWith(color: AppColors.g25Color),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.layoutMarginS,
                                      vertical: AppDimens.layoutHSpacerS),
                                ),
                                maxLength: 20,
                                maxLengthEnforced: true,
                                focusNode: _focusDocument,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  context.bloc<UserVerificationBloc>().add(
                                        UserVerificationEvent.documentChanged(
                                            value),
                                      );
                                },
                              ),
                              (!state.isDocumentUsed &&
                                      state.userInfo.id.length > 3)
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        "${S.of(context).userAlreadyRegistered}",
                                        style: TextStyle(
                                            color: AppColors.redColor,
                                            fontSize: 13),
                                      ),
                                    )
                                  : Container(),
                              CustomTextFormField(
                                decoration: InputDecoration(
                                  hintText: S.of(context).surname,
                                  hintStyle: AppTextStyles.normal1
                                      .copyWith(color: AppColors.g25Color),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.layoutMarginS,
                                      vertical: AppDimens.layoutHSpacerS),
                                ),
                                maxLength: 130,
                                maxLengthEnforced: true,
                                inputFormatters: [
                                  new FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z ñÑ]"))
                                ],
                                onChanged: (value) =>
                                    context.bloc<UserVerificationBloc>().add(
                                          UserVerificationEvent.surnameChanged(
                                              value),
                                        ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        _footer(context, state),
                      ],
                    ),
                  ),
                ),
                onWillPop: () {});
          }
        },
        listener: (context, state) {
          if (!state.isDocumentUsed) {
            /*   ToastHelper.createError(
                message: S.of(context).userAlreadyRegistered, duration: Duration(seconds: 5))
                .show(context);*/

          }
          state.registraduriaInfoOption.fold(
            () {},
            (either) {
              either.fold((l) {
                ToastHelper.createError(
                    message: l.map(
                        unexpected: (s) => "Server error",
                        fromServer: (s) => s.message)).show(context);
              }, (r) {
                SharedPreferences prefs = getIt<SharedPreferences>();
                prefs.userInfoRegistraduria = r;
                prefs.regCountries = state.countries;
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.verificationForm,
                  arguments: VerificationFormArguments(
                    info: r,
                    countries: state.countries,
                    bankAccountItem: bankAccountItem,
                    bankTransfer: bankTransfer,
                    redirectHome: redirectHome,
                    goal: goal,
                    investment: bankTransferValue,
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }

  Padding _footer(BuildContext context, UserVerificationState state) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
          text: "${S.of(context).confirm}",
          enabled: state.userInfo.idType != 0 &&
              state.userInfo.id != "" &&
              state.userInfo.surname != "" &&
              state.isDocumentUsed,
          action: () {
            getIt<IFireBaseEventLogger>().verificationData();
            context.bloc<UserVerificationBloc>().add(
                  UserVerificationEvent.getInfoRegistraduria(
                    state.userInfo,
                  ),
                );
          }),
    );
  }

  _showDialogBlockBlackList(BuildContext context) {
    return showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: CustomDialog(
              buttonText: S.of(context).dialogBlockBlackListButton,
              icon: Icons.warning,
              iconColor: AppColors.dangerColor,
              title: S.of(context).dialogBlockBlackListTitle,
              description: S.of(context).dialogBlockBlackListDescription,
              buttonAction: () => ExtendedNavigator.rootNavigator.pop(),
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.32)).animate(anim1),
            child: child,
          );
        });
  }
}
