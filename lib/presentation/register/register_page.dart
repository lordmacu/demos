import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
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
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

class RegisterPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var focusedName = useState(false);
    var focusedEmail = useState(false);
    var focusedPhone = useState(false);
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

    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            displayDoneButton: true,
            focusNode: focusPhone,
          ),
        ],
      );
    }

    return BlocProvider<RegisterBloc>(
      create: (context) => getIt<RegisterBloc>(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SafeArea(
              child: Container(
                child: ListView(
                  primary: false,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          right: AppDimens.layoutMargin,
                          top: AppDimens.layoutSpacerXs,
                          bottom: AppDimens.layoutSpacerXs),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                onPressed: () =>
                                    ExtendedNavigator.rootNavigator.pop(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width /
                                        2.5),
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
                              getForm(
                                  focusedName,
                                  nameController,
                                  context,
                                  focusName,
                                  focusedEmail,
                                  emailController,
                                  focusEmail,
                                  state,
                                  focusedPhone,
                                  phoneController,
                                  _buildConfig,
                                  focusPhone),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          _footer(context, state),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Form getForm(
      ValueNotifier<bool> focusedName,
      TextEditingController nameController,
      BuildContext context,
      FocusNode focusName,
      ValueNotifier<bool> focusedEmail,
      TextEditingController emailController,
      FocusNode focusEmail,
      RegisterState state,
      ValueNotifier<bool> focusedPhone,
      TextEditingController phoneController,
      KeyboardActionsConfig _buildConfig(BuildContext context),
      FocusNode focusPhone) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: focusedName.value || nameController.value.text.length != 0,
            child: Text(
              S.of(context).hintRegisterNameField,
              style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                  RegExp("[0-9!/\\\\().,;:_*´{}<>&%#\"\'¡?¿|!=+@`]"))
            ],
            focusNode: focusName,
            controller: nameController,
            decoration: InputDecoration(
              labelText: S.of(context).hintRegisterNameField,
              labelStyle: AppTextStyles.normal1.copyWith(
                  color: AppColors.g25Color, fontWeight: FontWeight.w400),
              counterStyle: TextStyle(color: Colors.transparent),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              errorMaxLines: 3,
            ),
            style: AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
            maxLength: 20,
            maxLengthEnforced: true,
            autocorrect: false,
            onChanged: (value) => context
                .bloc<RegisterBloc>()
                .add(RegisterEvent.nameChanged(value)),
            validator: (_) =>
                context.bloc<RegisterBloc>().state.name.value.fold(
                    (l) => l.maybeMap(
                        invalidName: (s) {
                          if (s.failedValue.length != 0) {
                            return S.of(context).registerNameInvalid;
                          } else {
                            return null;
                          }
                        },
                        nameTooShort: (_) => S.of(context).registerNameTooShort,
                        nameTooLong: (_) => S.of(context).registerNameTooLong,
                        orElse: () => null),
                    (r) => null),
          ),
          // SizedBox(
          //   height: AppDimens.layoutSpacerHeader,
          // ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible:
                focusedEmail.value || emailController.value.text.length != 0,
            child: Text(
              S.of(context).hintRegisterEmailField,
              style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
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
                  color: AppColors.g25Color, fontWeight: FontWeight.w400),
              counterStyle: TextStyle(color: Colors.transparent),
              errorText:
                  state.emailAvailable ? null : S.of(context).emailAlreadyInUse,
              errorMaxLines: 3,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            style: AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
            autocorrect: false,
            maxLength: 50,
            maxLengthEnforced: true,
            onChanged: (value) => context.bloc<RegisterBloc>().add(
                  RegisterEvent.emailChanged(value),
                ),
            validator: (_) => context
                .bloc<RegisterBloc>()
                .state
                .emailAddress
                .value
                .fold(
                    (l) => l.maybeMap(
                        emailHasSpace: (_) =>
                            S.of(context).registerEmailHasSpaces,
                        invalidEmail: (s) {
                          if (s.failedValue.length != 0) {
                            return S.of(context).errorEmailField;
                          } else {
                            return null;
                          }
                        },
                        emailHasSpaceBeginning: (s) {
                          if (s.failedValue.length != 0) {
                            return S.of(context).emailHasSpaceBeggining;
                          } else {
                            return null;
                          }
                        },
                        emailMissingDot: (s) {
                          if (s.failedValue.length != 0) {
                            return S.of(context).missingdotEmail;
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
          // SizedBox(
          //   height: AppDimens.layoutSpacerHeader,
          // ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible:
                focusedPhone.value || phoneController.value.text.length != 0,
            child: Text(
              S.of(context).hintRegisterPhonelField,
              style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
            ),
          ),
          // SizedBox(
          //   height: AppDimens.layoutSpacerXXs,
          // ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: KeyboardActions(
              config: _buildConfig(context),
              child: TextFormField(
                inputFormatters: [

                  FilteringTextInputFormatter.digitsOnly,

                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: S.of(context).hintRegisterPhonelField,
                  contentPadding: EdgeInsets.only(
                    bottom: 2,
                    left: AppDimens.layoutSpacerM,
                    right: AppDimens.layoutSpacerM,
                  ),
                  labelStyle: AppTextStyles.normal1.copyWith(
                      color: AppColors.g25Color, fontWeight: FontWeight.w400),
                  counterStyle: TextStyle(color: Colors.transparent),
                  errorMaxLines: 2,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  errorText: state.phoneNumberAvailable
                      ? null
                      : S.of(context).phoneNumberAlreadyUsed,
                  prefix: Text(
                    S.of(context).countryCode,
                  ),
                  prefixStyle: AppTextStyles.normal1
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                style:
                    AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
                autocorrect: false,
                maxLength: 12,
                maxLengthEnforced: true,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                focusNode: focusPhone,
                controller: phoneController,
                onChanged: (value) => context.bloc<RegisterBloc>().add(
                      RegisterEvent.phoneNumberChanged(value),
                    ),
                validator: (_) => context
                    .bloc<RegisterBloc>()
                    .state
                    .phoneNumber
                    .value
                    .fold(
                        (l) => l.maybeMap(
                            phoneNumberNotStartsWith3: (_) => getIt<IEnv>()
                                    .isColombia()
                                ? S.of(context).phoneNumberIncorrectOperator
                                : S.of(context).phoneNumberIncorrectOperatorMX,
                            phoneNumberToShort: (s) {
                              if (s.failedValue.length != 0) {
                                return S.of(context).phoneNumberTooShort;
                              } else {
                                return null;
                              }
                            },
                            invalidPhoneNumber: (_) =>
                                S.of(context).changePhoneNumberError,
                            orElse: () => null),
                        (r) => null),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Theme(
                data: ThemeData(
                    unselectedWidgetColor: AppColors.g25Color,
                    toggleableActiveColor: AppColors.primaryColor),
                child: Checkbox(
                  checkColor: AppColors.backgroundColor,
                  activeColor: AppColors.primaryColor,
                  value: state.acceptedTerms,
                  onChanged: (value) {
                    context
                        .bloc<RegisterBloc>()
                        .add(RegisterEvent.acceptedTermsChanged(value));
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
              InkWell(
                splashColor: Colors.transparent,
                onTap: () => ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.termsAndConditions),
                child: Text(
                  S.of(context).notHaveAnTermsButton,
                  style: AppTextStyles.normal1.copyWith(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _footer(BuildContext context, RegisterState state) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: AppDimens.layoutSpacerM,
      ),
      child: CustomButtonWithUndeline(
        primaryButtonText: S.of(context).continueButton,
        normalText: S.of(context).notHaveAnRegisterLabel,
        normalTextStyle: AppTextStyles.normal1
            .copyWith(color: AppColors.g50Color, fontWeight: FontWeight.w400),
        underlinedText: S.of(context).alreadyHaveAnRegisterButton,
        underLineTextStyle: AppTextStyles.normal1.copyWith(
            color: AppColors.primaryColor, fontWeight: FontWeight.w500),
        underlineButtonOnTap: () => ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.loginPage),
        primaryButtonOnTap: () {
          getIt<IFireBaseEventLogger>().registerNextData();

          context.bloc<RegisterBloc>().add(
                RegisterEvent.sendEmail(
                    state.emailAddress.value.fold((l) => null, (r) => r),
                    state.phoneNumber.value.fold((l) => null, (r) => r),
                    state.acceptedTerms,
                    state.acceptedPrivacy),
              );
          ExtendedNavigator.rootNavigator.pushReplacementNamed(
            Routes.sendEmailRegisterPage,
            arguments: SendEmailRegisterPageArguments(
                name: state.name.value.fold((l) => null, (r) => r),
                email: state.emailAddress.value.fold((l) => null, (r) => r),
                phoneNumber:
                    state.phoneNumber.value.fold((l) => null, (r) => r),
                acceptedTerms: state.acceptedTerms,
                acceptedPrivacy: true),
          );
        },
        primaryButtonEnabled: state.phoneNumberAvailable &&
            state.emailAvailable &&
            state.phoneNumberAvailable &&
            state.name.value.isRight() &&
            state.emailAddress.value.isRight() &&
            state.phoneNumber.value.isRight() &&
            state.acceptedTerms &&
            !state.isRetrieving,
      ),
    );
  }
}
