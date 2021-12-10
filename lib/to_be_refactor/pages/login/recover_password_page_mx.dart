import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/recover_password_request_model.dart';
import 'package:ualet/to_be_refactor/models/register/valid_email_model.dart';
import 'package:ualet/to_be_refactor/models/register/valid_phone_number_model.dart';
import 'package:ualet/to_be_refactor/services/login/login_service.dart';
import 'package:ualet/to_be_refactor/services/register/register_service.dart';
import 'package:ualet/to_be_refactor/utils/validators_util.dart';

class RecoverPasswordPageMX extends StatefulWidget {
  @override
  _RecoverPasswordMXState createState() => _RecoverPasswordMXState();
}

class _RecoverPasswordMXState extends State<RecoverPasswordPageMX> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _credentialFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _credentialFocus = FocusNode();

  TextEditingController _credentialController;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _buttonEnabled = false;
  bool _isLoading = false;

  Future<void> _unFocus() async {
    if (_credentialFocus.hasFocus) _credentialFocus.unfocus();
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
    final listener = () {
      if (_credentialController.value.text.isNotEmpty &&
          validateCredential(_credentialController.value.text, "MX") == null)
        setState(() {
          _buttonEnabled = true;
        });
      else
        setState(() {
          _buttonEnabled = false;
        });
    };
    _credentialController.addListener(listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _contentPage(context),
            LoadingInProgressOverlay(isLoading: _isLoading)
          ],
        ),
      ),
    );
  }

  Widget _contentPage(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _iconReturn(),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutMargin,
                        vertical: AppDimens.layoutSpacerS),
                    child: Column(
                      children: [
                        _createText(),
                        const SizedBox(height: AppDimens.layoutSpacerL * 1.0),
                        _formData(),
                      ],
                    ),
                  ),
                ),
                SectionBottomSheet(
                  isValidRedirect: false,
                  action: _buttonEnabled ? _submitRecoveryPassword : null,
                  textButton: S.of(context).recoveryPasswordButton,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _iconReturn() {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.layoutSpacerS, top: AppDimens.layoutSpacerM),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: AppDimens.buttonBack.height,
        ),
        onPressed: () {
          ExtendedNavigator.rootNavigator.pop();
        },
      ),
    );
  }

  Widget _createText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(S.of(context).titleRecoveryPassword,
            style: AppTextStyles.title2.copyWith(color: AppColors.g25Color)),
        const SizedBox(height: AppDimens.layoutSpacerL * 1.0),
        Text(S.of(context).descriptionRecoveryPassword,
            style: AppTextStyles.normal4.copyWith(color: AppColors.g75Color)),
      ],
    );
  }

  Widget _formData() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(S.of(context).inputRecoveryPassword,
                  style: AppTextStyles.normal4
                      .copyWith(color: AppColors.g75Color)),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutHSpacerS,
          ),
          _createFieldEmailPhone(S.of(context).hintCredentialField),
        ],
      ),
    );
  }

  Widget _createFieldEmailPhone(String textField) {
    return CustomTextFormField(
        autovalidate: AutovalidateMode.always,
        key: _credentialFieldKey,
        focusNode: _credentialFocus,
        controller: _credentialController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: textField,
          errorMaxLines: 2,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        textInputAction: TextInputAction.next,
        enableFloatingLabel: false,
        validator: (value) => validateCredential(value, "MX"));
  }

  void _submitRecoveryPassword() async {
    if (_handleSubmitted()) {
      await _unFocus();
      _validPhone();
    }
  }

  _validPhone() {
    ValidPhoneNumberModel requestValidPhone = ValidPhoneNumberModel()
      ..phone = _credentialFieldKey.currentState.value;

    setState(() {
      _isLoading = true;
    });
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_credentialFieldKey.currentState.value);

    if(emailValid){
      _validEmail(_credentialFieldKey.currentState.value);
    }else{
      getIt<RegisterService>()
          .phoneNumberAvailable(requestValidPhone)
          .then((value) {


        if (!value.result) {

           _redirectValidOtp(_credentialFieldKey.currentState.value);

        } else {
          setState(() {
            _isLoading = false;
          });

        }
      }).catchError((e) {
        setState(() {
          _isLoading = false;
        });
        print("Got error: ${e.error}");
      });
    }

  }

  _validEmail(String valueData) {
    ValidEmailModel requestValidemail = ValidEmailModel()..email = valueData;
    getIt<RegisterService>().emailAvailable(requestValidemail).then((value) {
      if (value.result || value.message != 'El email ya esta en uso') {
        ToastHelper.createError(
                message:
                    'El número celular o correo electrónico, no es correcto.')
            .show(context);

        setState(() {
          _isLoading = false;
        });
      } else {
        _phoneNumberByEmail(valueData);
      }
    }).catchError((e) {
      setState(() {
        _isLoading = false;
      });
      print("Got error: ${e.error}");
    });
  }

  _phoneNumberByEmail(String valueData) {
    RecoverPasswordRequestModel requestValidemail =
        RecoverPasswordRequestModel()..email = valueData;

    getIt<LoginService>()
      ..phoneNumberByEmail(requestValidemail).then((value) {
        setState(() {
          _isLoading = false;
        });
        if (value.result) {
          _redirectValidOtp(value.data.phoneNumber);
        }
      }).catchError((e) {
        setState(() {
          _isLoading = false;
        });
        print("Got error: ${e.error}");
      });
  }

  _redirectValidOtp(String value) {
    ExtendedNavigator.rootNavigator
        .pushReplacementNamed(Routes.sendOTPRegisterPage,
            arguments: SendOTPRegisterPageArguments(
              email: "",
              name: "",
              phoneNumber: value,
              acceptedTerms: false,
              recoverPassword: true,
            ));
  }
}
