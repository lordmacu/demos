import 'package:ualet/domain/core/values.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
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

class SendOTPWithdrawalPage extends HookWidget {
  final List<DashboardGoal> chosenGoals;
  final double chosenAmmount;
  final List<double> chosenValues;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final BankInfo chosenAccount;
  final int isValidDeleteDebit;
  final int isValidDeleteGoal;
  final bool isValidReCalculateDebits;

  SendOTPWithdrawalPage(
      {@required this.chosenGoals,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalInfo,
      @required this.chosenAccount,
      this.chosenValues,
      this.isValidDeleteDebit,
      this.isValidDeleteGoal,
      this.isValidReCalculateDebits = false});

  @override
  Widget build(BuildContext context) {
    bool isValidDeleteDebitBool = false;
    bool isValidDeleteGoalBool = false;

    //Eliminar débitos
    if (isValidDeleteDebit == 1) {
      isValidDeleteDebitBool = true;
    } else {
      isValidDeleteDebitBool = false;
    }

    //Eliminar metas
    if (isValidDeleteGoal == 2) {
      isValidDeleteGoalBool = true;
    } else {
      isValidDeleteGoalBool = false;
    }

    //var ejm1 = isValidDeleteGoal;
    String phoneNumber = withdrawalInfo.phoneNumber;
    var resendVisible = useState(false);
    String obfuscatedPhoneNumber = "";
    if (phoneNumber.length >= 10) {
      obfuscatedPhoneNumber =
          "****${phoneNumber.substring(phoneNumber.length - 4)}";
    }
    Future.delayed(Duration(seconds: 10), () {
      resendVisible.value = true;
    });
    return BlocProvider<WithdrawalFormBloc>(
      create: (context) => getIt<WithdrawalFormBloc>()
        ..add(WithdrawalFormEvent.sendOTP(phoneNumber)),
      child: BlocConsumer<WithdrawalFormBloc, WithdrawalFormState>(
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
                      onTap: () => context
                          .bloc<WithdrawalFormBloc>()
                          .add(WithdrawalFormEvent.sendOTP(phoneNumber)),
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
                child: ListView(
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
                          .bloc<WithdrawalFormBloc>()
                          .add(WithdrawalFormEvent.otpChanged(value)),
                      errorText: context
                          .bloc<WithdrawalFormBloc>()
                          .state
                          .otp
                          .value
                          .fold((l) {
                        if (l.failedValue.length != 0) {
                          return S.of(context).otpInvalid;
                        } else {
                          return null;
                        }
                      }, (r) => null),
                      onComplete: (value) {
                        if (context
                            .bloc<WithdrawalFormBloc>()
                            .state
                            .otp
                            .value
                            .isRight()) {
                          context.bloc<WithdrawalFormBloc>().add(
                              WithdrawalFormEvent.validateOTP(
                                  phoneNumber, value));
                        } else {
                          ToastHelper.createError(
                                  message: S.of(context).otpInvalid)
                              .show(context);
                        }
                      },
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
              ToastHelper.createError(
                      message: S.of(context).registerNumberNotConfirmed)
                  .show(context);
            }, (r) {
              ToastHelper.createSuccess(message: S.of(context).successValidOtp)
                  .show(context);
              Future.delayed(Duration(seconds: 4), () {
                if (withdrawalAll) {
                  return context.bloc<WithdrawalFormBloc>().add(
                        WithdrawalFormEvent.withdrawalAll(
                            chosenAccount.bankAccountId.toString(),
                            isValidDeleteDebitBool,
                            isValidDeleteGoalBool,
                            isValidReCalculateDebits),
                      );
                } else {
                  print(
                      "chosenAmmount ${isValidDeleteGoalBool} ${isValidDeleteDebitBool} ${chosenGoals} ${chosenAccount.bankAccountId.toString()} ${chosenAmmount} chosenValues ${chosenValues}");

                  return context.bloc<WithdrawalFormBloc>().add(
                        WithdrawalFormEvent.withdrawalParcial(
                            chosenValues,
                            chosenAccount.bankAccountId.toString(),
                            chosenGoals,
                            chosenAmmount,
                            isValidDeleteDebitBool,
                            isValidDeleteGoalBool),
                      );
                }
              });
            });
          });

          if (withdrawalAll) {
            state.withdrawalAllOption.fold(() {}, (either) {
              either.fold((l) {
                ToastHelper.createError(
                    message: l.map(
                  unexpected: (value) => "",
                  fromServer: (value) => value.message,
                )).show(context);
                Future.delayed(Duration(seconds: 4), () {
                  ExtendedNavigator.rootNavigator
                      .popUntil(ModalRoute.withName(Routes.homePage));
                });
              }, (r) {
                ExtendedNavigator.rootNavigator.pushReplacementNamed(
                  Routes.successWithdrawalPageMX,
                  arguments: SuccessWithdrawalPageArguments(
                      chosenValues: chosenValues,
                      chosenAmmount: chosenAmmount,
                      chosenGoals: chosenGoals,
                      withdrawalAll: withdrawalAll,
                      withdrawalFee: getIt<IEnv>().isColombia() ? 1600 : 10,
                      info: withdrawalInfo,
                      isValidDeleteGoal: isValidDeleteGoal),
                );
              });
            });
          } else {
            state.withdrawalParcialOption.fold(() {}, (either) {
              either.fold((l) {
                ToastHelper.createError(
                    message: l.map(
                  unexpected: (value) => "",
                  fromServer: (value) => value.message,
                )).show(context);
                Future.delayed(Duration(seconds: 4), () {
                  ExtendedNavigator.rootNavigator
                      .popUntil(ModalRoute.withName(Routes.homePage));
                });
              }, (r) {
                ExtendedNavigator.rootNavigator.pushReplacementNamed(
                  Routes.successWithdrawalPageMX,
                  arguments: SuccessWithdrawalPageArguments(
                      chosenValues: chosenValues,
                      chosenAmmount: chosenAmmount,
                      chosenGoals: chosenGoals,
                      withdrawalAll: withdrawalAll,
                      withdrawalFee: getIt<IEnv>().isColombia() ? 1600 : 10,
                      info: withdrawalInfo,
                      isValidDeleteGoal: isValidDeleteGoal),
                );
              });
            });
          }
        },
      ),
    );
  }
}
