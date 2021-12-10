import 'package:ualet/application/beneficiaries/beneficiaries_bloc.dart';
import 'package:ualet/domain/beneficiaries/beneficiary_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/beneficiaries/percentage_formater.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/register/widgets/number_text_input_formater.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class BeneficiariesPage extends StatefulWidget {
  @override
  _BeneficiariesPageState createState() => _BeneficiariesPageState();
}

class _BeneficiariesPageState extends State<BeneficiariesPage> {
  final List<TextEditingController> nameControllers = [];
  final List<TextEditingController> phoneControllers = [];
  final List<MoneyMaskedTextController> percentageControllers = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BeneficiariesBloc>(
        create: (context) => getIt<BeneficiariesBloc>()
          ..add(BeneficiariesEvent.getBeneficiaries()),
        child: BlocListener<BeneficiariesBloc, BeneficiariesState>(
          listener: (context, state) {
            state.postOrFailure.fold(() => null, (a) {
              a.fold(
                  (l) => ToastHelper.createError(
                      message: l.map(
                          unexpected: (_) => "Error inesperado",
                          fromServer: (e) => e.message)).show(context),
                  (r) async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>  CustomDialog(
                      icon: Icons.check_circle_outline,
                      iconColor: AppColors.successColor,
                      buttonAction: () => ExtendedNavigator.rootNavigator
                          .popUntil(ModalRoute.withName(Routes.myAccountPage)),
                      buttonText: S.of(context).continueButton,
                      title: S.of(context).beneficiaryAdded,
                      description: S.of(context).beneficiaryPopupSubtitle,
                    ));
              });
            });
          },
          child: BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return LoadingInProgressOverlay(isLoading: true);
              } else {

                print("aquiii esta ");
                return _buildRoot(context, state);
              }
            },
          ),
        ));
  }

  Widget _buildRoot(BuildContext context, BeneficiariesState state) {
    bool enabled = context.bloc<BeneficiariesBloc>().isButtonActive();
    print(enabled);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
            enabled: enabled,
            text: S.of(context).continueButton,
            action: () {
              FocusScope.of(context).unfocus();

              context
                  .bloc<BeneficiariesBloc>()
                  .add(BeneficiariesEvent.postBeneficiaries());
            }
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
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                color: AppColors.primaryColor,
                alignment: Alignment.topLeft,
                tooltip: "Volver",
                onPressed: () => ExtendedNavigator.rootNavigator.pop(),
              ),
              Text(S.of(context).beneficiariesTitle,
                  style:
                      AppTextStyles.title2.copyWith(color: AppColors.g25Color)),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              Text(S.of(context).beneficiariesSubTitle,
                  style: AppTextStyles.normal4),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _buildBeneficiaries(context, state),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _addBeneficiaryButton(context, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addBeneficiaryButton(BuildContext context, BeneficiariesState state) {
    if (state.benficiaries.size == 3) return Container();
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: InkWell(
          onTap: () {
            nameControllers.add(TextEditingController());
            context
                .bloc<BeneficiariesBloc>()
                .add(BeneficiariesEvent.addBeneficiary());
          },
          child: Text(S.of(context).addBeneficiaryButton,
              style: AppTextStyles.normalUnder1
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ),
    );
  }

  Widget _removeBeneficiaryButton(
      BuildContext context, BeneficiariesState state, int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: InkWell(
          onTap: () {
            nameControllers.add(TextEditingController());
            context
                .bloc<BeneficiariesBloc>()
                .add(BeneficiariesEvent.removeBeneficiary(index));
          },
          child: Text(S.of(context).removeBeneficiaryButton,
              style: AppTextStyles.normalUnder1
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ),
    );
  }

  Widget _buildBeneficiaries(BuildContext context, BeneficiariesState state) {
    List<Widget> list = [];
    for (int i = 0; i < state.benficiaries.size; i++) {
      list.add(_buildBeneciciary(context, i, state.benficiaries[i]));
      list.add(SizedBox(
        height: AppDimens.layoutSpacerS,
      ));
      list.add(_removeBeneficiaryButton(context, state, i));
      list.add(Divider());
      list.add(SizedBox(
        height: AppDimens.layoutSpacerS,
      ));
    }
    return Column(children: list, key: GlobalKey());
  }

  Widget _buildBeneciciary(
      BuildContext context, int index, BeneficiaryItem item) {
    List<Widget> list = [];
    list.add(_nameField(context, index, item));
    list.add(SizedBox(
      height: AppDimens.layoutSpacerS,
    ));
    list.add(_phoneField2(context, index, item));
    list.add(SizedBox(
      height: AppDimens.layoutSpacerS,
    ));
    list.add(_percentField(context, index, item));
    return Column(
      children: list,
    );
  }

  Widget _nameField(BuildContext context, int index, BeneficiaryItem item) {
    String textField = S.of(context).beneficiaryName + " ${index + 1}";

    String valuenameFied="";
    return Column(
      children: <Widget>[
        Container(
          child: Focus(
            child: CustomTextFormField(

              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp("[0-9!/\\\\().,;:_*´{}<>&%#\"\'¡?¿|!=+@`]")),
                LengthLimitingTextInputFormatter(32)
              ],
              keyboardType: TextInputType.text,
              initialValue: item.name,
              style: AppTextStyles.normal4,
              decoration: InputDecoration(
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
                hintText: textField,
                contentPadding: EdgeInsets.only(left: 20),

                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.successColor),
                hintStyle: AppTextStyles.normal4.copyWith(
                  color: AppColors.g25Color,
                ),
                // hintStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: 'open-sans-regular',
                //     color: AppColors.g25Color),
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
              onChanged: (value) {
                valuenameFied=value;

              },

              // validator: utils.validateEmpty,
              validator: (String value) {
                return value == '' ? "Debe llenar este campo" : null;
              },
            ),
            onFocusChange: (hasFocus) {
              if(hasFocus) {
               }else{

                context
                    .bloc<BeneficiariesBloc>()
                    .add(BeneficiariesEvent.editBeneficiary(
                    index,
                    item.copyWith(
                      name: valuenameFied,
                    )));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _phoneField2(BuildContext context, int index, BeneficiaryItem item) {
    String textField = S.of(context).beneficiaryNumber + " ${index + 1}";
    String textField2 = NumberTextInputFormatter()
        .formatEditUpdate(TextEditingValue(text: item.number),
            TextEditingValue(text: item.number))
        .text;

    String valuenameFied="";

    return Column(
      children: <Widget>[
        Container(
          child: Focus(
            child: CustomTextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumberTextInputFormatter(),
                LengthLimitingTextInputFormatter(12)
              ],
              style: AppTextStyles.normal4,
              keyboardType:
              TextInputType.numberWithOptions(decimal: false, signed: false),
              initialValue: textField2,
              // initialValue: item.number,
              decoration: InputDecoration(
                prefix: textField2 != ""
                    ? Text(
                  S.of(context).countryCodeMX,
                )
                    : null,
                prefixStyle: textField2 != ""
                    ? AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400)
                    : null,
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
                hintText: textField,
                contentPadding: EdgeInsets.only(left: 20),
                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.successColor),
                hintStyle: AppTextStyles.normal4.copyWith(
                  color: AppColors.g25Color,
                ),
                // hintStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: 'open-sans-regular',
                //     color: AppColors.g25Color),
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

              onChanged: (value) {

                valuenameFied=value.replaceAll(" ", "");
              },

              // validator: utils.validateEmpty,
              validator: (String value) {
                return value == '' ? "Debe llenar este campo" : null;
              },
            ),
            onFocusChange: (hasFocus) {
              if(hasFocus) {
              }else{

                context
                    .bloc<BeneficiariesBloc>()
                    .add(BeneficiariesEvent.editBeneficiary(
                    index,
                    item.copyWith(
                      number: valuenameFied,
                    )));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _percentField(BuildContext context, int index, BeneficiaryItem item) {
    String textField = S.of(context).beneficiaryPercentage + " ${index + 1}";
    double valuenameFied=0;

    return Column(
      children: <Widget>[
        Container(
          child: Focus(
            child: CustomTextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PercentageInputFormatter(),
                LengthLimitingTextInputFormatter(4)
              ],
              style: AppTextStyles.normal4,
              keyboardType:
              TextInputType.numberWithOptions(decimal: false, signed: false),
              initialValue: "${item.percentage.toStringAsFixed(0)}%",
              decoration: InputDecoration(
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
                hintText: textField,
                contentPadding: EdgeInsets.only(left: 20),
                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.successColor),
                hintStyle: AppTextStyles.normal4.copyWith(
                  color: AppColors.g25Color,
                ),
                // hintStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: 'open-sans-regular',
                //     color: AppColors.g25Color),
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

              onChanged: (value) {
                double dValue = double.parse(value.replaceAll("%", ""));
                print(value);
                valuenameFied=dValue;

              },
              autovalidate: AutovalidateMode.always,
              // validator: utils.validateEmpty,
              validator: (String value) {
                if (!context.bloc<BeneficiariesBloc>().isPercentageComplete()) {
                  return "Los porcentajes deben sumar 100%";
                }
                int dValue = int.parse(value.replaceAll("%", ""));
                if (dValue > 100) return "El porcentaje debe estar entre 0 y 100";
                return value == '' ? "Debe llenar este campo" : null;
              },
            ),

            onFocusChange: (hasFocus) {


               if(hasFocus) {
              }else{

                context
                    .bloc<BeneficiariesBloc>()
                    .add(BeneficiariesEvent.editBeneficiary(
                    index,
                    item.copyWith(
                      percentage: valuenameFied,
                    )));
              }
            },
          ),
        ),
      ],
    );
  }
}
