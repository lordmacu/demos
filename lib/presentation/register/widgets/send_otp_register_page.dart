import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/register/register_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_pin_field.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';

class SendOTPRegisterPage extends HookWidget {
  final String email;
  final String name;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;
  final bool recoverPassword;

  SendOTPRegisterPage(
      {@required this.email,
      @required this.name,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy,
      @required this.recoverPassword});

  @override
  Widget build(BuildContext context) {
    var resendVisible = useState(false);
    String obfuscatedPhoneNumber = "";
    if (phoneNumber.length >= 10) {
      obfuscatedPhoneNumber = "****${phoneNumber.substring(6)}";
    }
    Future.delayed(Duration(seconds: 10), () {
      resendVisible.value = true;
    });
    return BlocProvider<RegisterBloc>(
      create: (context) {
        if (recoverPassword) {
          return getIt<RegisterBloc>()
            ..add(RegisterEvent.sendOTP(
                phoneNumber,
                recoverPassword
                    ? 2
                    : 0)); //Type 0 = Register, 2 = Cambio Contraseña.
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
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
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
                      onTap: () {
                        getIt<IFireBaseEventLogger>().registerResendCode();

                        context.bloc<RegisterBloc>().add(RegisterEvent.sendOTP(
                            phoneNumber,
                            recoverPassword
                                ? 2
                                : 0)); //Type 0 = Register, 2 = Cambio Contraseña.
                      },
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
                        CustomPinCodeFields(
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
                              .bloc<RegisterBloc>()
                              .add(RegisterEvent.otpChanged(value)),
                          errorText: context
                              .bloc<RegisterBloc>()
                              .state
                              .otp
                              .value
                              .fold((l) {
                            if (l.failedValue.length != 0) {
                              return S.of(context).otpInvalid;
                            } else
                              return null;
                          }, (r) => null),
                          onComplete: (value) {
                            if (context
                                .bloc<RegisterBloc>()
                                .state
                                .otp
                                .value
                                .isRight()) {
                              context.bloc<RegisterBloc>().add(
                                  RegisterEvent.validateOTP(
                                      phoneNumber,
                                      value,
                                      recoverPassword
                                          ? 2
                                          : 0)); //Type 0 = Register, 2 = Cambio Contraseña.
                            } else {
                              ToastHelper.createError(
                                      message: S.of(context).otpInvalid)
                                  .show(context);
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          state.phoneConfirmedOption.fold(() {}, (either) {
            either.fold(
              (l) {
                ToastHelper.createError(
                        message: S.of(context).registerNumberNotConfirmed)
                    .show(context);
              },
              (r) {
                ToastHelper.createSuccess(
                        message: S.of(context).registerNumberConfirmSucces)
                    .show(context);
                Future.delayed(
                  Duration(seconds: 4),
                  () {
                    ExtendedNavigator.rootNavigator.pushReplacementNamed(
                        Routes.createPasswordPage,
                        arguments: CreatePasswordPageArguments(
                            name: name,
                            email: email,
                            phoneNumber: phoneNumber,
                            acceptedTerms: acceptedTerms,
                            acceptedPrivacy: acceptedPrivacy,
                            recoverPassword: recoverPassword));
                  },
                );
              },
            );
          });
          if (state.otpSent) {
            ToastHelper.createSuccess(
              message: S.of(context).successSendOtp,
            ).show(context);
            Future.delayed(
              Duration(seconds: 2),
              () {
                context
                    .bloc<RegisterBloc>()
                    .add(RegisterEvent.changeSentOTP(false));
              },
            );
          }
        },
      ),
    );
  }
}
