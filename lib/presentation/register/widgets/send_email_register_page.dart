import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:auto_route/auto_route.dart';
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
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';

class SendEmailRegisterPage extends HookWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final bool acceptedTerms;
  final bool acceptedPrivacy;

  bool isEmailSend = false;

  SendEmailRegisterPage(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.acceptedTerms,
      @required this.acceptedPrivacy});

  @override
  Widget build(BuildContext context) {
    var resendVisible = useState(false);
    String obfuscatedEmail = "${email[0]}*****@${email.split("@")[1]}";
    Future.delayed(Duration(seconds: 10), () {
      resendVisible.value = true;
    });
    return BlocProvider<RegisterBloc>(
      create: (context) => getIt<RegisterBloc>(),
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
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PrimaryButton(
                        text: S.of(context).emailConfirmButton,
                        action: () {
                          getIt<IFireBaseEventLogger>().registerConfirmEmail();

                          context.bloc<RegisterBloc>().add(
                                RegisterEvent.checkEmailConfirmed(email),
                              );
                        },
                      ),
                      Visibility(
                        maintainSize: false,
                        visible: resendVisible.value,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: AppDimens.layoutSpacerM),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              getIt<IFireBaseEventLogger>()
                                  .registerResendEmail();

                              context.bloc<RegisterBloc>().add(
                                    RegisterEvent.sendEmail(email, phoneNumber,
                                        acceptedTerms, acceptedPrivacy),
                                  );
                            },
                            child: Text(
                              S.of(context).alreadyHaveAnResendEmailButton,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.normal1.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          AppImages.emailIconSuccess,
                          height: 90,
                          width: 90,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).titleConfirmEmail,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.title2
                              .copyWith(color: AppColors.successColor),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          "${S.of(context).descriptionConfirmEmail} $obfuscatedEmail",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          state.emailConfirmedOption.fold(
            () {},
            (either) => either.fold(
              (l) {
                ToastHelper.createError(
                        message: S.of(context).registerEmailNotConfirmed)
                    .show(context);
              },
              (r) {
                if (!isEmailSend) {
                  isEmailSend = true;

                  ToastHelper.createSuccess(
                          message: S.of(context).registerEmailConfirmedSuccess)
                      .show(context);
                  Future.delayed(Duration(seconds: 1), () {
                    context.bloc<RegisterBloc>().add(
                          RegisterEvent.sendOTP(phoneNumber, 0), //Type register
                        );
                    context.bloc<RegisterBloc>().close();
                    ExtendedNavigator.rootNavigator.pushReplacementNamed(
                        Routes.sendOTPRegisterPage,
                        arguments: SendOTPRegisterPageArguments(
                            email: email,
                            name: name,
                            phoneNumber: phoneNumber,
                            acceptedTerms: acceptedTerms,
                            acceptedPrivacy: acceptedPrivacy,
                            recoverPassword: false));
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}
