import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/investingMX/investingIdVerification/investing_mx_id_verification_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/identification/i_identification_repository.dart';
import 'package:ualet/domain/investing/user_id_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/identification/identification_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:tu_identidad/tu_identidad.dart';

class InvestingIdentityConfirmationPage extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;

  const InvestingIdentityConfirmationPage(
      {Key key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      InvestingIdentityConfirmationPageState();
}

class InvestingIdentityConfirmationPageState
    extends State<InvestingIdentityConfirmationPage> {
  //Controllers
  TextEditingController _docTypeController = TextEditingController();
  TextEditingController _curpController = TextEditingController();
  TextEditingController _namesController = TextEditingController();
  TextEditingController _firstLastNameController = TextEditingController();
  TextEditingController _secondLastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  dynamic sdkResult;
  dynamic resultDataValidResponse;
  dynamic resultDataValidResponseData;
  Future<UserIdInfo> fUserIdInfo;

  @override
  void initState() {
    fUserIdInfo = sdkTuIdentidad();
    super.initState();
  }

  Future<UserIdInfo> sdkTuIdentidad() async {
    UserIdInfo userIdInfoR;
    final result = await TuIdentidad.ine(
        getIt.get(instanceName: "TuIdentidadApiKey"), TuIdentidad.INE);
    setState(() {
      // sdkResult = null;
      sdkResult = result;
      print(result);

      if (sdkResult["status"] && sdkResult["response"] != null) {
        resultDataValidResponse = json.decode(sdkResult["response"]);

        if (resultDataValidResponse["data"] != null) {
          resultDataValidResponseData = resultDataValidResponse["data"];
          print(resultDataValidResponseData);
          userIdInfoR = UserIdInfo(
            cityState: "",
            id: "",
            mz1: "",
            birthDate: resultDataValidResponseData["dateOfBirth"],
            curp: resultDataValidResponseData["curp"],
            docType: '1',
            firstLastname: resultDataValidResponseData["firstLastName"],
            gender: resultDataValidResponseData["sex"],
            names: resultDataValidResponseData["name"],
            secondLastname: resultDataValidResponseData["secondLastName"],
            // birthCity: resultDataValidResponse['']
            expedDate: DateTime.now().toIso8601String(),
          );
          //_preferenceUser.validDocumentTuIdentidad = json.encode(userIdInfo);
        }
      }
    });
    return userIdInfoR;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestingMxIdVerificationBloc>(
          create: (context) => getIt<InvestingMxIdVerificationBloc>(),
        ),
      ],
      child: BlocBuilder<InvestingMxIdVerificationBloc,
          InvestingMxIdVerificationState>(
        builder: (context, state) {
          return _futureBuilder(context);
        },
      ),
    );
  }

  Widget _futureBuilder(BuildContext context) {
    return FutureBuilder(
      future: fUserIdInfo,
      builder: (context, AsyncSnapshot<UserIdInfo> snapshot) {
        if (snapshot.hasData) {
          return _buildRoot(context, snapshot.data);
        } else
          return Container();
      },
    );
  }

  Widget _buildRoot(BuildContext context, UserIdInfo userIdInfo) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
            primary: true,
            children: <Widget>[
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              //Title
              _title(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _subTitle(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              //doc type
              _normalField(context, _docTypeController, userIdInfo.docType,
                  S.of(context).idDocumentType),
              //curp
              _normalField(context, _curpController, userIdInfo.curp,
                  S.of(context).curp),
              //names
              _normalField(context, _namesController, userIdInfo.names,
                  S.of(context).names),
              //lastnames
              _lastNamesRow(context, userIdInfo),
              _normalField(context, _dateOfBirthController,
                  userIdInfo.birthDate, S.of(context).birthDateLabel),
              _normalField(context, _genderController, userIdInfo.gender,
                  S.of(context).genderLabel),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _buttonNext(context, userIdInfo),
              _repeatButton(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).identityVerificationTitle,
        style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      ),
    );
  }

  Widget _subTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 50),
      child: Text(
        S.of(context).identityVerificationSubTitle,
        style: AppTextStyles.normal4,
      ),
    );
  }

  Widget _normalField(BuildContext context, TextEditingController controller,
      String text, String label) {
    var textField = label;
    controller.text = text;
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: CustomTextFormField(
            enabled: false,
            readOnly: true,
            controller: controller,
            // initialValue: "aa",
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              prefixStyle: TextStyle(
                  fontFamily: 'open-sans-semi-bold',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: AppColors.g90Color),
              contentPadding: EdgeInsets.only(left: 20),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.g90Color),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'open-sans-regular',
                  color: AppColors.g25Color),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.primarySoftColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
            ),
            onFieldSubmitted: (value) {},
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _lastNamesRow(BuildContext context, userIdInfo) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _normalField(context, _firstLastNameController,
                  userIdInfo.firstLastname, S.of(context).firstLastName)),
          Container(
            width: calcWidth,
            child: _normalField(context, _secondLastNameController,
                userIdInfo.secondLastname, S.of(context).secondLastName),
          ),
        ],
      ),
    );
  }

  Widget _buttonNext(BuildContext context, UserIdInfo userIdInfo) {
    bool isActivated = true;
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        // bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).confirm,
        action: isActivated
            ? () async {
                // ExtendedNavigator.rootNavigator.pushNamed(
                //     Routes.investingSuccessPage,
                //     arguments:
                //         InvestingSuccessPageArguments(goal: widget.goal));

                /*
                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.investingVerificationOverview,
                        arguments: InvestingVerificationOverviewArguments(
                          check1: true,
                          check2: false,
                          goal: widget.goal,
                          bankTransfer: widget.bankTransfer,
                          bankTransferValue: widget.bankTransferValue,
                        ));
                        */

/*
                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.investingDomicilioConfirmationPage,
                        arguments: InvestingIdentityConfirmationPageArguments(
                          goal: widget.goal,
                        ));

                        */
                getIt<IIdentificationRepository>()
                    .updateIdentificationPost(userIdInfo);
                final result = await TuIdentidad.address(
                    getIt.get(instanceName: "TuIdentidadApiKey"));
                setState(() {
                  sdkResult = result;
                });
              }
            : null,
      ),
    );
  }

  Widget _repeatButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        sdkTuIdentidad();
      },
      padding: EdgeInsets.zero,
      child: Text("asdfasd",
          style: AppTextStyles.normalUnder1
              .copyWith(color: AppColors.primaryColor)),
    );
  }
}
