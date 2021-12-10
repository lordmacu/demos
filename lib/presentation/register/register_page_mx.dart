import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_afirm.dart';
import 'package:ualet/presentation/register/widgets/get_georefenciacion_dialog.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/register/register_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/custom_button_underline.dart';
import 'package:ualet/presentation/register/widgets/number_text_input_formater.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

class RegisterPageMX extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var focusedName = useState(false);
    var focusedEmail = useState(false);
    var focusedPhone = useState(false);
    var showLocalizationDialog = useState(true);
    var focusName = useFocusNode();
    var focusEmail = useFocusNode();
    var focusPhone = useFocusNode();
    var nameController = useTextEditingController();
    var emailController = useTextEditingController();
    var phoneController = useTextEditingController();
    focusName.addListener(() {
      if (focusName.hasFocus != focusedName.value) {
        focusedName.value = focusName.hasFocus;
      }
    });
    focusEmail.addListener(() {
      if (focusEmail.hasFocus != focusedEmail.value) {
        focusedEmail.value = focusEmail.hasFocus;
      }
    });
    focusPhone.addListener(() {
      if (focusPhone.hasFocus != focusedPhone.value) {
        focusedPhone.value = focusPhone.hasFocus;
      }
    });

    return BlocProvider<RegisterBloc>(
      create: (context) => getIt<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (showLocalizationDialog.value)
            Future.delayed(Duration.zero,
                () => showAlert(context, showLocalizationDialog));
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
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
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: AppColors.primaryColor,
                        alignment: Alignment.topLeft,
                        tooltip: "Volver",
                        onPressed: () {
                          ExtendedNavigator.rootNavigator
                              .pushReplacementNamed(Routes.onBoardingPage);
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 2.5),
                      child: Text(
                        S.of(context).registerTitle,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.title2
                            .copyWith(color: AppColors.g25Color),
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerL,
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
                            visible: focusedName.value ||
                                nameController.value.text.length != 0,
                            child: Text(
                              S.of(context).hintRegisterNameField,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.layoutSpacerXXs,
                          ),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(
                                  "[0-9!/\\\\().,;:_*´{}<>&%#\"\'¡?¿|!=+@`]"))
                            ],
                            focusNode: focusName,
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: S.of(context).hintRegisterNameField,
                              labelStyle: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g25Color,
                                  fontWeight: FontWeight.w400),
                              counterStyle:
                                  TextStyle(color: Colors.transparent),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              errorMaxLines: 3,
                            ),
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                            maxLength: 20,
                            maxLengthEnforced: true,
                            autocorrect: false,
                            onChanged: (value) => context
                                .bloc<RegisterBloc>()
                                .add(RegisterEvent.nameChanged(value)),
                            validator: (_) => context
                                .bloc<RegisterBloc>()
                                .state
                                .name
                                .value
                                .fold(
                                    (l) => l.maybeMap(
                                        invalidName: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .registerNameInvalid;
                                          } else {
                                            return null;
                                          }
                                        },
                                        nameTooShort: (_) =>
                                            S.of(context).registerNameTooShort,
                                        nameTooLong: (_) =>
                                            S.of(context).registerNameTooLong,
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
                            visible: focusedEmail.value ||
                                emailController.value.text.length != 0,
                            child: Text(
                              S.of(context).hintRegisterEmailField,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.layoutSpacerXXs,
                          ),
                          TextFormField(
                            focusNode: focusEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: S.of(context).hintRegisterEmailField,
                              labelStyle: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g25Color,
                                  fontWeight: FontWeight.w400),
                              counterStyle:
                                  TextStyle(color: Colors.transparent),
                              errorText: state.emailAvailable
                                  ? null
                                  : S.of(context).emailAlreadyInUse,
                              errorMaxLines: 3,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                            autocorrect: false,
                            maxLength: 50,
                            maxLengthEnforced: true,
                            onChanged: (value) =>
                                context.bloc<RegisterBloc>().add(
                                      RegisterEvent.emailChanged(value),
                                    ),
                            validator: (_) => context
                                .bloc<RegisterBloc>()
                                .state
                                .emailAddress
                                .value
                                .fold(
                                    (l) => l.maybeMap(
                                        emailHasSpace: (_) => S
                                            .of(context)
                                            .registerEmailHasSpaces,
                                        invalidEmail: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .errorEmailField;
                                          } else {
                                            return null;
                                          }
                                        },
                                        emailHasSpaceBeginning: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .emailHasSpaceBeggining;
                                          } else {
                                            return null;
                                          }
                                        },
                                        emailMissingDot: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .missingdotEmail;
                                          } else {
                                            return null;
                                          }
                                        },
                                        missingDotAfterExt: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .registerEmailMissingDotAfterExt;
                                          } else {
                                            return null;
                                          }
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
                            visible: focusedPhone.value ||
                                phoneController.value.text.length != 0,
                            child: Text(
                              S.of(context).hintRegisterMexico,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.layoutSpacerXXs,
                          ),
                          //Celular
                          TextFormField(
                            inputFormatters: [
                              NumberTextInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              labelText: S.of(context).hintRegisterMexico,
                              labelStyle: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g25Color,
                                  fontWeight: FontWeight.w400),
                              counterStyle:
                                  TextStyle(color: Colors.transparent),
                              errorMaxLines: 3,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              errorText: state.phoneNumberAvailable
                                  ? null
                                  : S.of(context).phoneNumberAlreadyUsed,
                              prefix: Text(
                                S.of(context).countryCodeMX,
                              ),
                              prefixStyle: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                            autocorrect: false,
                            maxLength: 12,
                            maxLengthEnforced: true,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            focusNode: focusPhone,
                            controller: phoneController,
                            onChanged: (value) =>
                                context.bloc<RegisterBloc>().add(
                                      RegisterEvent.phoneNumberChanged(value),
                                    ),
                            validator: (_) => context
                                .bloc<RegisterBloc>()
                                .state
                                .phoneNumber
                                .value
                                .fold(
                                    (l) => l.maybeMap(
                                        phoneNumberToShort: (s) {
                                          if (s.failedValue.length != 0) {
                                            return S
                                                .of(context)
                                                .phoneNumberTooShort;
                                          } else {
                                            return null;
                                          }
                                        },
                                        invalidPhoneNumber: (_) => S
                                            .of(context)
                                            .changePhoneNumberError,
                                        notValidOperatorMX: (_) => getIt<IEnv>()
                                                .isColombia()
                                            ? S
                                                .of(context)
                                                .phoneNumberIncorrectOperator
                                            : S
                                                .of(context)
                                                .phoneNumberIncorrectOperatorMX,
                                        orElse: () => null),
                                    (r) => null),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: AppColors.g25Color,
                                    toggleableActiveColor:
                                        AppColors.primaryColor),
                                child: Checkbox(
                                  checkColor: AppColors.backgroundColor,
                                  activeColor: AppColors.primaryColor,
                                  value: state.acceptedTerms,
                                  onChanged: (value) {
                                    context.bloc<RegisterBloc>().add(
                                        RegisterEvent.acceptedTermsChanged(
                                            value));
                                  },
                                ),
                              ),
                              Text(
                                S.of(context).notHaveAnTermsLabel,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g50Color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    ExtendedNavigator.rootNavigator.pushNamed(
                                        Routes.genericWebView,
                                        arguments: GenericWebViewArguments(
                                            url: S
                                                .of(context)
                                                .urlMediosElectronicos));
                                  },
                                  child: Text(
                                    S.of(context).acceptMediosElectronicos,
                                    style: AppTextStyles.normal1.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: AppColors.g25Color,
                                    toggleableActiveColor:
                                        AppColors.primaryColor),
                                child: Checkbox(
                                  checkColor: AppColors.backgroundColor,
                                  activeColor: AppColors.primaryColor,
                                  value: state.acceptedPrivacy,
                                  onChanged: (value) {
                                    context.bloc<RegisterBloc>().add(
                                        RegisterEvent.acceptedPrivacy(value));
                                  },
                                ),
                              ),
                              Text(
                                S.of(context).notHaveAnTermsLabel,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g50Color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    ExtendedNavigator.rootNavigator.pushNamed(
                                        Routes.genericWebView,
                                        arguments: GenericWebViewArguments(
                                            url: S
                                                .of(context)
                                                .urlMediosElectronicos));
                                  },
                                  child: Text(
                                    S.of(context).privacyAndPersonalDataMX,
                                    style: AppTextStyles.normal1.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          _footer(context, state),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _footer(BuildContext context, RegisterState state) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: CustomButtonWithUndeline(
        primaryButtonText: S.of(context).continueButton,
        normalText: S.of(context).notHaveAnRegisterLabel,
        normalTextStyle: AppTextStyles.normal1.copyWith(
            color: AppColors.g50Color,
            fontWeight: FontWeight.w400,
            fontSize: 12),
        underlinedText: S.of(context).alreadyHaveAnRegisterButton,
        underLineTextStyle: AppTextStyles.normal1.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 12),
        underlineButtonOnTap: () => ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.loginPage),
        primaryButtonOnTap: () {
          //Firebase 3
          // getIt<IFirebaseEventLoggerMX>().signUpPersonalData();
          context.bloc<RegisterBloc>().add(
                RegisterEvent.sendEmail(
                  state.emailAddress.value.fold((l) => null, (r) => r),
                  state.phoneNumber.value.fold((l) => null, (r) => r),
                  state.acceptedTerms,
                  state.acceptedPrivacy,
                ),
              );
          ExtendedNavigator.rootNavigator.pushReplacementNamed(
            Routes.sendEmailRegisterPage,
            arguments: SendEmailRegisterPageArguments(
                name: state.name.value.fold((l) => null, (r) => r),
                email: state.emailAddress.value.fold((l) => null, (r) => r),
                phoneNumber:
                    state.phoneNumber.value.fold((l) => null, (r) => r),
                acceptedTerms: state.acceptedTerms,
                acceptedPrivacy: state.acceptedPrivacy),
          );
        },
        primaryButtonEnabled: state.phoneNumberAvailable &&
            state.emailAvailable &&
            state.acceptedPrivacy &&
            state.name.value.fold(
                (l) => l.maybeMap(
                    invalidName: (_) => false,
                    nameTooShort: (_) => false,
                    nameTooLong: (_) => false,
                    orElse: () => true),
                (r) => true) &&
            state.emailAddress.value.fold(
                (l) => l.maybeMap(
                    emailHasSpace: (_) => false,
                    invalidEmail: (_) => false,
                    emailHasSpaceBeginning: (_) => false,
                    emailMissingDot: (_) => false,
                    missingDotAfterExt: (_) => false,
                    orElse: () => true),
                (r) => true) &&
            state.phoneNumber.value.fold(
                (l) => l.maybeMap(
                    invalidPhoneNumber: (_) => false,
                    phoneNumberToShort: (_) => false,
                    notValidOperatorMX: (_) => false,
                    orElse: () => true),
                (r) => true) &&
            state.acceptedTerms,
      ),
    );
  }
}

void showAlert(BuildContext context, ValueNotifier<bool> showLocalization) {
  showLocalization.value = false;
  showDialog(
      context: context,

      builder: (BuildContext context) =>GetGeoreferencing(
        buttonAction: () {
          showLocalization.value = false;
          context
              .bloc<RegisterBloc>()
              .add(RegisterEvent.getGeoreferenciacionGPS());
        },
      )
  ).then((value) {
    if (value == null) {
      showLocalization.value = true;
    }
  });
}

