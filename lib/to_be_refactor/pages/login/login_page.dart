import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/to_be_refactor/models/login/login_response_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/app_icon/app_icon.dart';
import 'package:ualet/presentation/core/widgets/buttons/custom_flat_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_password_field.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/models/login/login_request_model.dart';
import 'package:ualet/to_be_refactor/services/login/login_service.dart';
import 'package:ualet/to_be_refactor/utils/validators_util.dart';
import 'package:flutter/services.dart';
import 'package:huawei_push/push.dart';

import 'package:kt_dart/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _credentialFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  final _credentialFocus = FocusNode();
  final _passwordFocus = FocusNode();

  TextEditingController _credentialController;
  TextEditingController _passwordController;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  bool _buttonEnabled = false;
  bool _passwordCorrect = false;
  bool _isLoading = false;
  String _token = '';

  Future<void> _unFocus() async {
    if (_credentialFocus.hasFocus) _credentialFocus.unfocus();
    if (_passwordFocus.hasFocus) _passwordFocus.unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
    await Future.delayed(Duration(milliseconds: 200));
  }

  bool _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = AutovalidateMode.always; // Start validating on every change.
      return false;
    } else {
      form.save();
      return true;
    }
  }

  @override
  void initState() {
    _credentialController = TextEditingController();
    _passwordController = TextEditingController();
    final listener = () {
      var passCorrect = _passwordCorrect;
      if (_credentialController.value.text.isNotEmpty &&
          _passwordController.value.text.isNotEmpty) {
        passCorrect = true;
        setState(() {
          _buttonEnabled = passCorrect;
          _passwordCorrect = passCorrect;
        });
      } else
        setState(() {
          _buttonEnabled = false;
        });
    };
    _credentialController.addListener(listener);
    _passwordController.addListener(listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _contentPage(context),
          LoadingInProgressOverlay(isLoading: _isLoading)
        ],
      ),
    );
  }

  Widget _contentPage(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.layoutMargin,
              vertical: AppDimens.layoutSpacerL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppIconWidget(),
              const SizedBox(height: AppDimens.layoutSpacerL * 1.0),
              _formData(),
              _recoveryPassword(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SectionBottomSheet(
          isEnabled: _buttonEnabled,
          action: _submitLogin,
          textButton: S.of(context).signInButton,
          isValidRedirect: true,
          textInf: S.of(context).notHaveAnAccountLabel,
          textUnderline: S.of(context).notHaveAnAccountButton,
          redirectUnderline: () {
            if (getIt<IEnv>().isColombia())
              return ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.registerPage);
            else
              return ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.registerPageMX);
          },
        )
      ],
    );
  }

  Widget _formData() {
    return Form(
      key: _formKey,
      autovalidateMode:_autoValidate ,
       child: Column(
        children: <Widget>[
          _createFieldEmailPhone(S.of(context).hintCredentialField),
          const SizedBox(height: 10.0),
          _createFieldPassword(S.of(context).hintPasswordField),
        ],
      ),
    );
  }

  Widget _createFieldEmailPhone(String textField) {
    return CustomTextFormField(
      autovalidate: AutovalidateMode.always,
      key: _credentialFieldKey,
      keyboardType: TextInputType.emailAddress,
      focusNode: _credentialFocus,
      controller: _credentialController,
      decoration: InputDecoration(hintText: textField, errorMaxLines: 2),
      textInputAction: TextInputAction.next,
      validator: (value) => validateCredential(value, "MX"),
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
    );
  }

  Widget _createFieldPassword(String textField) {
    return CustomPasswordField(
      key: _passwordFieldKey,
      controller: _passwordController,
      focusNode: _passwordFocus,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: S.of(context).hintPasswordField,
        errorMaxLines: 2,
      ),
      autovalidate: AutovalidateMode.always,
      enableFloatingLabel: true,
      validator: (value) {
        if (value != "") {
          if (_passwordCorrect) {
            return null;
          } else {
            return "Formato inválido.";
          }
        } else {
          return null;
        }
      },
    );
  }

  Widget _recoveryPassword() {
    return CustomFlatButton(
      text: S.of(context).loginRecoveryPassword,
      action: () => ExtendedNavigator.rootNavigator
          .pushNamed(Routes.recoverPasswordPageMX),
    );
  }

  void _submitLogin() async {
    if (_handleSubmitted()) {
      await _unFocus();

      if (_buttonEnabled) {
        _login();
      }
    }
  }

  _login() async {

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    dynamic deviceData;

   // String resultId = await Push.getId();
   // String resultOdid = await Push.getOdid();

    if (Platform.isAndroid) {
      deviceData = await deviceInfoPlugin.androidInfo;
    } else if (Platform.isIOS) {
      deviceData = await deviceInfoPlugin.iosInfo;
    }

    getIt<IFireBaseEventLogger>().singIn();

    LoginRequestModel requestLogin = LoginRequestModel()
      ..userName = _credentialFieldKey.currentState.value
      ..password = _passwordFieldKey.currentState.value
      ..platformId = Platform.isIOS ? 2 : 1
      ..deviceId = _token != '' ? _token : 'firebase'
      ..model = deviceData != null ? deviceData.model : ''
      ..machine = deviceData != null
          ? Platform.isIOS ? deviceData.utsname.machine : deviceData.brand
          : '';

    setState(() {
      _isLoading = true;
    });
    getIt<LoginService>().login(requestLogin).then((value) async {
      SharedPreferences _prefs = getIt<SharedPreferences>();
      setState(() {
        _isLoading = false;
        _prefs.validPopUpInvestingSuccess = false;
        _prefs.validMigrateShowButtonDeleteGoal = false;
        _prefs.validPopUpUpdateSarlaft = false;
        _prefs.isValidUserUpdateSarlaft = false;
        if (value.result) {
          _validUserMigrate();
        } else {
          ToastHelper.createError(message: value.message).show(context);
        }
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
      });
      print("Got error: ${e.error}");
    });
  }

  _validUserMigrate() {
    setState(() {
      _isLoading = true;
    });
    getIt<LoginService>().validateIntroMigrate().then((value) async {
      setState(() {
        _isLoading = false;
      });

      print(value);
      if (value.result) {
        if (!value.data.validateIntroductory) {
          ExtendedNavigator.rootNavigator.pushReplacementNamed(
            Routes.migrationIntroPage,
          );
        } else {
          var isColombia = getIt<IEnv>().isColombia();
          if (isColombia) {
            await getIt<ICustomerLevelRepoCol>()
                .redirect(); //Usuario no requiere migración
          } else {
            await getIt<ICustomerLevelRepoMx>().redirect();
          }
        }
      } else {
        var isColombia = getIt<IEnv>().isColombia();
        print(isColombia);
        if (isColombia) {
          await getIt<ICustomerLevelRepoCol>()
              .redirect(); //Usuario no requiere migración
        } else {
          await getIt<ICustomerLevelRepoMx>().redirect();
          ToastHelper.createError(message: 'Ocurrio un error con el usuario')
              .show(context);
        }
      }
    }).catchError((e) {
      setState(() {
        _isLoading = false;
        ToastHelper.createError(message: 'Ocurrio un error con el usuario')
            .show(context);
      });
      print("Got error: ${e.error}");
    });
  }

  void _redirectNavigation(int customerLevel) {
    print("===================================================");
    print("REDIRECT NAVIGATION WITH CUSTOMER LEVEL: $customerLevel");
    print("===================================================");
    SharedPreferences _prefs = getIt<SharedPreferences>();
    switch (customerLevel) {
      case CustomerLevelRepository.SPLASH:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.successInfoPage);
        break;

      case CustomerLevelRepository.PERFILAMIENTO_MX:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(
          Routes.goalsVideo,
        );
        break;
      case CustomerLevelRepository.CREACION_META_1:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CustomerLevelRepository.HOME:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOCUMENTO:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.investingVerificationOverview,
                arguments: InvestingVerificationOverviewArguments(
                  check1: true,
                  check2: false,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  bankTransfer: false,
                  bankTransferValue: 0,
                  goal: _prefs.currentInvestingGoal,
                ));
        break;
      case CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO:
        ExtendedNavigator.rootNavigator
            .pushReplacementNamed(Routes.investingVerificationOverview,
                arguments: InvestingVerificationOverviewArguments(
                  check1: true,
                  check2: true,
                  bankAccountItem: _prefs.currentInvestingAccount,
                  bankTransfer: false,
                  bankTransferValue: 0,
                  goal: _prefs.currentInvestingGoal,
                ));
        break;
      case CustomerLevelRepository.INVESTING_DONE:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
      default:
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
        break;
    }
  }

}
