import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/hubs_pot/i_hubs_pot_repo.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/register/register_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/register/widgets/confirm_register_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';

import 'widgets/password_reset_dialog.dart';

class CreatePasswordPage extends HookWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;
  final bool recoverPassword;

  CreatePasswordPage(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy,
      @required this.recoverPassword});

  @override
  Widget build(BuildContext context) {
    var focusedPassword = useState(false);
    var focusedConfirm = useState(false);
    var focusPassword = useFocusNode();
    var focusConfirm = useFocusNode();
    var passwordController = useTextEditingController();
    var confirmController = useTextEditingController();
    var canSeePassword = useState(false);
    var canSeeConfirm = useState(false);
    focusPassword.addListener(() {
      if (focusPassword.hasFocus != focusedPassword.value) {
        focusedPassword.value = focusPassword.hasFocus;
      }
    });
    focusConfirm.addListener(() {
      if (focusConfirm.hasFocus != focusedConfirm.value) {
        focusedConfirm.value = focusConfirm.hasFocus;
      }
    });
    return BlocProvider<RegisterBloc>(
      create: (context) {
        if (recoverPassword) {
          return getIt<RegisterBloc>()
            ..add(RegisterEvent.getEmailByPhoneNumber(phoneNumber));
        } else {
          return getIt<RegisterBloc>();
        }
      },
      child: BlocConsumer<RegisterBloc, RegisterState>(
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
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(
                    left: AppDimens.layoutMarginM,
                    right: AppDimens.layoutMarginM,
                    bottom: AppDimens.layoutSpacerL,
                  ),
                  child: PrimaryButton(
                    text: S.of(context).continueButton,
                    action: () {
                      getIt<IFireBaseEventLogger>().registerCreatePassword();

                      if (recoverPassword) {
                        context.bloc<RegisterBloc>().add(
                              RegisterEvent.changePassword(
                                state.emailByPhone,
                                state.password.value.fold((l) => "new", (r) => r),
                                state.confirmPassword.value
                                    .fold((l) => "confirm", (r) => r),
                              ),
                            );
                      } else {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          barrierDismissible: true,
                          barrierLabel: "Label",
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder: (ctx, anim1, anim2) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: ConfirmRegisterDialog(
                                buttonAction: () async {
                                  getIt<IFireBaseEventLogger>()
                                      .registerWelcomePage();
                                  await getIt<IAppsFlyerEventLogger>().logEvent(
                                      AFEvents.COMPLETE_REGISTRATION, {});

                                  ExtendedNavigator.rootNavigator.pop();
                                  context.bloc<RegisterBloc>().add(
                                        RegisterEvent.register(
                                          name,
                                          email,
                                          phoneNumber,
                                          state.password.value
                                              .fold((l) => "", (r) => r),
                                          acceptedTerms,
                                          acceptedPrivacy,
                                        ),
                                      );
                                },
                                buttonText: S.of(context).continueButton,
                              ),
                            );
                          },
                          transitionBuilder: (ctx, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, -1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
                      }
                    },
                    enabled: state.arePasswordsSame &&
                        !state.finishedRegister &&
                        state.password.value.fold(
                            (l) => l.maybeMap(
                                  invalidPassword: (_) => false,
                                  orElse: () => true,
                                ),
                            (r) => true) &&
                        state.confirmPassword.value.fold(
                            (l) => l.maybeMap(
                                invalidPassword: (_) => false,
                                orElse: () => true),
                            (r) => true),
                  ),
                ),
                body: SafeArea(
                  child: Container(
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          right: AppDimens.layoutMargin,
                          top: AppDimens.layoutSpacerXs,
                          bottom: AppDimens.layoutSpacerXs),
                      children: <Widget>[
                        SizedBox(
                          height: AppDimens.layoutSpacerHeader,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 3),
                          child: Text(
                            S.of(context).titleCreatePassword,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.title2
                                .copyWith(color: AppColors.g25Color),
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        RichText(
                          text: TextSpan(
                            text: S.of(context).changePasswordDescription,
                            children: [
                              TextSpan(
                                  style: AppTextStyles.normal4.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoColor),
                                  text: S
                                      .of(context)
                                      .changePasswordDescriptionTrailing)
                            ],
                            style: AppTextStyles.normal4.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: focusedPassword.value ||
                                    passwordController.value.text.length != 0,
                                child: Text(
                                  S.of(context).hintCreatePasswordField,
                                  style: AppTextStyles.normal1
                                      .copyWith(color: AppColors.g75Color),
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.layoutSpacerXXs,
                              ),
                              TextFormField(
                                focusNode: focusPassword,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText:
                                      S.of(context).hintCreatePasswordField,
                                  labelStyle: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g25Color,
                                      fontWeight: FontWeight.w400),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  errorMaxLines: 3,
                                  errorText: !state.arePasswordsSame &&
                                          confirmController.value.text.length >
                                              7 &&
                                          passwordController.value.text.length > 7
                                      ? S.of(context).changePasswordErrorSame
                                      : null,
                                  suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    icon: canSeePassword.value
                                        ? Icon(
                                            Icons.visibility,
                                            color: AppColors.primaryColor,
                                          )
                                        : Icon(Icons.visibility_off,
                                            color: AppColors.primaryColor),
                                    onPressed: () {
                                      canSeePassword.value =
                                          !canSeePassword.value;
                                    },
                                  ),
                                ),
                                style: AppTextStyles.normal1.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLength: 15,
                                maxLengthEnforced: true,
                                autocorrect: false,
                                obscureText: !canSeePassword.value,
                                onChanged: (value) => context
                                    .bloc<RegisterBloc>()
                                    .add(RegisterEvent.passwordChanged(value)),
                                validator: (_) => context
                                    .bloc<RegisterBloc>()
                                    .state
                                    .password
                                    .value
                                    .fold(
                                        (l) => l.maybeMap(
                                            invalidPassword: (s) {
                                              return S
                                                  .of(context)
                                                  .changePasswordErrorLabel;
                                            },
                                            orElse: () => null),
                                        (r) => null),
                              ),
                              SizedBox(
                                height: AppDimens.layoutSpacerHeader,
                              ),
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: focusedConfirm.value ||
                                    confirmController.value.text.length != 0,
                                child: Text(
                                  S.of(context).hintCreatePasswordConfirmField,
                                  style: AppTextStyles.normal1
                                      .copyWith(color: AppColors.g75Color),
                                ),
                              ),
                              TextFormField(
                                focusNode: focusConfirm,
                                controller: confirmController,
                                decoration: InputDecoration(
                                  labelText: S
                                      .of(context)
                                      .hintCreatePasswordConfirmField,
                                  labelStyle: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g25Color,
                                      fontWeight: FontWeight.w400),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  errorMaxLines: 3,
                                  errorText: !state.arePasswordsSame &&
                                          confirmController.value.text.length >
                                              7 &&
                                          passwordController.value.text.length > 7
                                      ? S.of(context).changePasswordErrorSame
                                      : null,
                                  suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    icon: canSeeConfirm.value
                                        ? Icon(
                                            Icons.visibility,
                                            color: AppColors.primaryColor,
                                          )
                                        : Icon(Icons.visibility_off,
                                            color: AppColors.primaryColor),
                                    onPressed: () {
                                      canSeeConfirm.value = !canSeeConfirm.value;
                                    },
                                  ),
                                ),
                                style: AppTextStyles.normal1
                                    .copyWith(fontWeight: FontWeight.w400),
                                maxLength: 15,
                                maxLengthEnforced: true,
                                autocorrect: false,
                                obscureText: !canSeeConfirm.value,
                                onChanged: (value) => context
                                    .bloc<RegisterBloc>()
                                    .add(RegisterEvent.confirmPasswordChanged(
                                        value)),
                                validator: (_) => context
                                    .bloc<RegisterBloc>()
                                    .state
                                    .confirmPassword
                                    .value
                                    .fold(
                                        (l) => l.maybeMap(
                                            invalidPassword: (s) {
                                              return S
                                                  .of(context)
                                                  .changePasswordErrorLabel;
                                            },
                                            orElse: () => null),
                                        (r) => null),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onWillPop: () {}
            );
          }
        },
        listener: (context, state) {
          if (recoverPassword) {
            state.changePasswordOption.fold(() {}, (either) {
              either.fold((l) {
                context.bloc<RegisterBloc>().close();
                ToastHelper.createError(
                        message: S.of(context).notExpectedErrorCreatePassword)
                    .show(context);
                Future.delayed(Duration(seconds: 4), () {
                  ExtendedNavigator.rootNavigator
                      .pushReplacementNamed(Routes.indexPage);
                });
              }, (r) {
                ToastHelper.createSuccess(
                        message: S.of(context).changePasswordModalTitle)
                    .show(context);
                Future.delayed(Duration(seconds: 4), () {
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.4),
                    barrierDismissible: true,
                    barrierLabel: "Label",
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (ctx, anim1, anim2) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: PasswordResetDialog(
                          action: () => ExtendedNavigator.rootNavigator
                              .pushReplacementNamed(Routes.loginPage),
                        ),
                      );
                    },
                    transitionBuilder: (ctx, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(anim1),
                        child: child,
                      );
                    },
                  ).then((value) {
                    ExtendedNavigator.rootNavigator
                        .pushReplacementNamed(Routes.loginPage);
                  });
                });
              });
            });
          } else {
            state.registerOption.fold(() {}, (either) {
              either.fold((l) {
                context.bloc<RegisterBloc>().close();
                ToastHelper.createError(
                    message: l.maybeMap(
                        fromServer: (value) => value.message,
                        orElse: () => "")).show(context);
                Future.delayed(Duration(seconds: 4), () {
                  ExtendedNavigator.rootNavigator
                      .pushReplacementNamed(Routes.indexPage);
                });
              }, (r) async {
                //Envio HubsPot
                var repoHubsPot = getIt<IHubsPotRepo>();
                var responseHubsPot = await repoHubsPot.sendData(false);
                responseHubsPot.fold(
                    (l) => {
                          ToastHelper.createError(
                              message: l.maybeMap(
                                  fromServer: (value) => value.message,
                                  orElse: () => "")).show(context)
                        }, (r) async {
                  //Firebase 7
                  // getIt<IFireBaseEventLogger>().createPassword();

                  //CustomerLevel password
                  await getIt<ICustomerLevelRepoCol>().setAfterPassword();
                  ToastHelper.createSuccess(
                          message: S.of(context).registerSuccess)
                      .show(context);
                  Future.delayed(Duration(seconds: 4), () {
                    ExtendedNavigator.rootNavigator
                        .pushReplacementNamed(Routes.successInfoPage);
                  });
                });
              });
            });
          }
        },
      ),
    );
  }
}
