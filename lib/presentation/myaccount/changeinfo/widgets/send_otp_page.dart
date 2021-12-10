import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/myaccount/changeinfo/change_info_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_pin_field.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SendOTPPage extends HookWidget {
  final String email;
  final String phoneNumber;
  final String newNumber;

  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final ChangeType changetype;

  SendOTPPage(
      {@required this.email,
      @required this.phoneNumber,
      @required this.newNumber,
      @required this.changetype,
      @required this.oldPassword,
      @required this.newPassword,
      @required this.confirmPassword});

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusOtp = FocusNode();

    var resendVisible = useState(false);
    var controller = useTextEditingController();
    String obfuscatedPhoneNumber = "";
    if (newNumber != null) {
      if (newNumber.length >= 10) {
        obfuscatedPhoneNumber = "****${newNumber.substring(6)}";
      }
    }

    Future.delayed(Duration(seconds: 10), () {
      resendVisible.value = true;
    });
    return BlocProvider<ChangeInfoBloc>(
      create: (context) => getIt<ChangeInfoBloc>(),
      child: BlocConsumer<ChangeInfoBloc, ChangeInfoState>(
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
            return Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: Visibility(
                  visible: resendVisible.value,
                  maintainInteractivity: false,
                  maintainSize: false,
                  maintainState: true,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppDimens.layoutSpacerM),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => context
                          .bloc<ChangeInfoBloc>()
                          .add(ChangeInfoEvent.sendOTP(phoneNumber)),
                      child: Text(
                        S.of(context).alreadyHaveAnResendOtpButton,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.normal1.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                        left: AppDimens.layoutMarginM,
                        right: AppDimens.layoutMarginM,
                        top: AppDimens.layoutSpacerX * 1.5,
                      ),
                      children: <Widget>[
                        Image.asset(
                          AppImages.phoneIconSuccess,
                          height: 90,
                          width: 90,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).titleConfirmOtp,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.title2
                              .copyWith(color: AppColors.successColor),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          "${S.of(context).descriptionConfirmOtp} $obfuscatedPhoneNumber",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: CustomPinCodeFields(
                            autoHideKeyboard: true,
                            activeBackgroundColor: AppColors.whiteColor,
                            autofocus: false,
                            borderColor: Colors.transparent,
                            fieldBackgroundColor: AppColors.whiteColor,
                            fieldHeight: 60,
                            fieldWidth: 60,
                            fieldBorderStyle: FieldBorderStyle.Square,
                            borderRadius: BorderRadius.circular(
                                AppDimens.textFieldBorderRadius),
                            activeBorderColor: Colors.transparent,
                            responsive: true,
                            borderWidth: 0,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            textStyle: AppTextStyles.title1
                                .copyWith(fontWeight: FontWeight.w400),
                            onChange: (value) => context
                                .bloc<ChangeInfoBloc>()
                                .add(ChangeInfoEvent.otpChanged(value)),
                            errorText: context
                                .bloc<ChangeInfoBloc>()
                                .state
                                .otp
                                .value
                                .fold((l) {
                              if (l.failedValue.length != 0) {
                                return S.of(context).otpInvalid;
                              } else {
                                return null;
                              }
                            }, (r) {
                              return null;
                            }),
                            onComplete: (value) {
                              if (context
                                  .bloc<ChangeInfoBloc>()
                                  .state
                                  .otp
                                  .value
                                  .isRight()) {
                                context.bloc<ChangeInfoBloc>().add(
                                    ChangeInfoEvent.validateOTP(
                                        phoneNumber, value));
                              } else {
                                controller.clear();
                                showDialog(
                                  context: context,
                                    builder: (BuildContext context)=>CustomDialog(
                                      buttonText:
                                      S.of(context).createPasswordButton,
                                      icon: Icons.highlight_off,
                                      iconColor: AppColors.bgToastInvalid2,
                                      title: S.of(context).otpInvalid,
                                      buttonAction: () =>
                                          ExtendedNavigator.rootNavigator.pop(),
                                    )

                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          top: AppDimens.layoutMargin),
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: AppColors.primaryColor,
                      alignment: Alignment.topLeft,
                      tooltip: "Volver",
                      onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          state.phoneConfirmedOption.fold(() {}, (either) {
            either.fold((l) {
              controller.clear();
              showDialog(
                context: context,
                  builder: (BuildContext context)=>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.highlight_off,
                    iconColor: AppColors.bgToastInvalid2,
                    title: S.of(context).errorValidOtp,
                    description: S.of(context).otpInvalidDescription,
                    buttonAction: () => ExtendedNavigator.rootNavigator.pop(),
                  )
                 ,
              );
            }, (r) {
              if (changetype == ChangeType.email) {
                context
                    .bloc<ChangeInfoBloc>()
                    .add(ChangeInfoEvent.changeEmail(email));
              } else if (changetype == ChangeType.password) {
                context.bloc<ChangeInfoBloc>().add(
                    ChangeInfoEvent.changePassword(
                        oldPassword, newPassword, confirmPassword));
              } else if (changetype == ChangeType.phoneNumber) {
                context
                    .bloc<ChangeInfoBloc>()
                    .add(ChangeInfoEvent.changePhoneNumber(phoneNumber));
              }
            });
          });

          state.changeEmailOption.fold(() {}, (either) {
            either.fold((l) {
              context.bloc<ChangeInfoBloc>().close();
              showDialog(
                context: context,
                  builder: (BuildContext context)=>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.highlight_off,
                    iconColor: AppColors.bgToastInvalid2,
                    title: l.map(
                        unexpected: (_) => "", fromServer: (v) => v.message),
                    description: "",
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .popUntil(ModalRoute.withName(Routes.myAccountPage)),
                  )

              );
            }, (r) {
              context.bloc<ChangeInfoBloc>().close();
              showDialog(
                context: context,
                  builder: (BuildContext context)=>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.successColor,
                    title: S.of(context).changeEmailModalTitle,
                    description: S.of(context).changePhoneNumberModalDescription,
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .pushNamedAndRemoveUntil(
                        Routes.homePage, (route) => false),
                  )

              );
            });
          });

          state.changePasswordOption.fold(() {}, (either) {
            context.bloc<ChangeInfoBloc>().close();
            either.fold((l) {
              showDialog(
                context: context,
                  builder: (BuildContext context) =>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.highlight_off,
                    iconColor: AppColors.bgToastInvalid2,
                    title: l.map(
                        unexpected: (_) => "", fromServer: (v) => v.message),
                    description:
                    S.of(context).changePasswordModalErrorDescription,
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .popUntil(ModalRoute.withName(Routes.myAccountPage)),
                  )

              );
            }, (r) {
              context.bloc<ChangeInfoBloc>().close();
              showDialog(
                context: context,
                  builder: (BuildContext context) =>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.successColor,
                    title: S.of(context).changePasswordModalTitle,
                    description: S.of(context).changePasswordModalDescription,
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .pushReplacementNamed(Routes.loginPage),
                  )

              );
            });
          });

          state.changePhoneNumberOption.fold(() {}, (either) {
            either.fold((l) {
              context.bloc<ChangeInfoBloc>().close();
              showDialog(
                context: context,
                  builder: (BuildContext context) =>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.highlight_off,
                    iconColor: AppColors.bgToastInvalid2,
                    title: l.map(
                        unexpected: (_) => "", fromServer: (v) => v.message),
                    description: "",
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .popUntil(ModalRoute.withName(Routes.myAccountPage)),
                  )

              );
            }, (r) {
              context.bloc<ChangeInfoBloc>().close();
              showDialog(
                context: context,
                  builder: (BuildContext context) =>CustomDialog(
                    buttonText: S.of(context).createPasswordButton,
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.successColor,
                    title: S.of(context).changePhoneNumberModalTitle,
                    description: S.of(context).changePhoneNumberModalDescription,
                    buttonAction: () => ExtendedNavigator.rootNavigator
                        .pushNamedAndRemoveUntil(
                        Routes.homePage, (route) => false),
                  )

              );
            });
          });
        },
      ),
    );
  }
}

enum ChangeType { password, email, phoneNumber }
