import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/domain/sarlaft/ocupation_item.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/CustomSimpleAutoCompleteTextField/autocomplete_textfield.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/typeahed_form_field.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_autocomplete.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_menu.dart';
import 'package:ualet/presentation/register/widgets/number_text_input_formater.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class InfoFinanciera1 extends StatefulWidget {
  final GrandesMontosDataBloc dataBloc;
  final List<OcupationItem> items;
  final SarlaftItem sarlaftItem;
  final bool isUpdate;
  final double valor;

  const InfoFinanciera1(
      {Key key,
      this.dataBloc,
      @required this.items,
      this.sarlaftItem,
      this.isUpdate = false,
      @required this.valor})
      : super(key: key);

  @override
  _InfoFinanciera1State createState() => _InfoFinanciera1State();
}

class _InfoFinanciera1State extends State<InfoFinanciera1> {
  final TextEditingController _residenciaController = TextEditingController();
  final TextEditingController _origenFondosController = TextEditingController();
  final MoneyMaskedTextController _ingresosController =
      MoneyMaskedTextController(
          leftSymbol: '\$',
          precision: 0,
          thousandSeparator: '.',
          decimalSeparator: "");
  final MoneyMaskedTextController _egresosController =
      MoneyMaskedTextController(
          leftSymbol: '\$',
          precision: 0,
          thousandSeparator: '.',
          decimalSeparator: "");
  final MoneyMaskedTextController _otrosIngresosController =
      MoneyMaskedTextController(
          leftSymbol: '\$',
          precision: 0,
          thousandSeparator: '.',
          decimalSeparator: "");

  final MoneyMaskedTextController _activosController =
      MoneyMaskedTextController(
          leftSymbol: '\$',
          precision: 0,
          thousandSeparator: '.',
          decimalSeparator: "");
  final MoneyMaskedTextController _pasivosController =
      MoneyMaskedTextController(
          leftSymbol: '\$',
          precision: 0,
          thousandSeparator: '.',
          decimalSeparator: "");

  final _ciudadResidenciaController = TextEditingController();
  final _ciudadResidenciaKey = GlobalKey<AutoCompleteTextFieldState<String>>();
  final _ciudadEmpresaController = TextEditingController();
  final _ciudadEmpresaKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  final TextEditingController _ciiuController = TextEditingController();
  final TextEditingController _ocupacionController = TextEditingController();
  final TextEditingController _empresaController = TextEditingController();
  final TextEditingController _direccionEmpresaController =
      TextEditingController();
  final TextEditingController _telefonoEmpresaController =
      TextEditingController();
  final FocusNode _focusNumberOnly = FocusNode();

  KeyboardActionsConfig buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayDoneButton: true,
          focusNode: _focusNumberOnly,
        ),
      ],
    );
  }

  String initValueCIIU;
  String initValueOcupation;

  @override
  void initState() {
    super.initState();
    var item = widget.sarlaftItem;
    if (!widget.isUpdate) return;
    _residenciaController.text = item.address;
    _origenFondosController.text = item.foundsOrigin;
    _ingresosController.text = item.monthlyIncome.toStringAsFixed(0);
    _egresosController.text = item.monthlyOutcome.toStringAsFixed(0);
    _otrosIngresosController.text = item.otherIncome.toStringAsFixed(0);
    _activosController.text = item.totalAssets.toStringAsFixed(0);
    _pasivosController.text = item.totalLiability.toStringAsFixed(2);
    _empresaController.text = item.workPlaceName;
    _direccionEmpresaController.text = item.workAddress;
    _telefonoEmpresaController.text = item.workPhone;
    _ciudadResidenciaController.text =
        widget.dataBloc.state.cities[item.cityResidenceId.toString()];
    _ciudadEmpresaController.text =
        widget.dataBloc.state.cities[item.cityWorkId.toString()];
    var ocItem = widget.dataBloc.state.ocupacionesList.firstWhere(
      (element) => element.code == widget.sarlaftItem.ciiuCode,
      orElse: () => null,
    );
    if (ocItem != null) {
      initValueCIIU = "${ocItem.code}";
      initValueOcupation = ocItem.name;
    }
    print(widget.dataBloc.state.sarlaftItem);
  }

  @override
  Widget build(BuildContext context) {
    List<String> lst = widget.items.map<String>((e) => e.name).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        //Title
        Text(S.of(context).financialInformation,
            style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
            textAlign: TextAlign.right),
        SizedBox(
          height: AppDimens.layoutSpacerL,
        ),
        //Subtitle
        Container(
          padding: EdgeInsets.only(right: AppDimens.layoutMarginM),
          child: Text(
            S.of(context).finantialInformationSubTitle,
            style: AppTextStyles.normal4,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        //City Residence
        CustomDropdownAutocomplete(
          textSend: widget.dataBloc.state.resCityText,
          controller: _ciudadResidenciaController,
          sonKey: _ciudadResidenciaKey,
          clearOnSubmit: false,
          label: S.of(context).whereDoYouLive,
          suggestions: widget.dataBloc.state.cities.values.toList(),
          textSubmitted: (value) {
            widget.dataBloc
                .add(GrandesMontosDataEvent.updateCityOfResidence(value));
          },
          disabled: false,
        ),
        //Residencia
        _normalField(context, _residenciaController,
            S.of(context).residencyAddress, false, (value) {
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateDireccionResidencia(value));
        }),
        //Ocupacion
        _typeaheadBox(context, lst, (value) {
          widget.dataBloc.add(GrandesMontosDataEvent.updateOcupacion(value));
          _ciiuController.text = "${widget.dataBloc.getCIIU(value)}";
        }, S.of(context).ocupation, _ocupacionController, initValueOcupation),
        SizedBox(height: AppDimens.layoutSpacerM),
        //CIUU
        _typeaheadBox(context, widget.dataBloc.state.ciuuList, (value) {
          widget.dataBloc.add(GrandesMontosDataEvent.updateCiiu(value));
        }, S.of(context).ciiu, _ciiuController, initValueCIIU),
        SizedBox(height: AppDimens.layoutSpacerM),
        //Empleado Conditional
        _empleadoConditional(context),
        //Origen
        _normalField(
            context, _origenFondosController, S.of(context).fundsOrigin, true,
            (value) {
          widget.dataBloc.add(GrandesMontosDataEvent.updateOrigenFondos(value));
        }),
        //Ingresos egresos
        _rowIngresosEgresos(context),
        //Otros ingresos
        _moneyField(
            context, _otrosIngresosController, S.of(context).otherIncome,
            (value) {
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateOtrosIngresos(value));
        }, (e) => null),
        //Activos y pasivos
        _rowPasivosActivos(context),
        SizedBox(height: AppDimens.layoutSpacerHeader),
      ],
    );
  }

  Widget _empleadoConditional(BuildContext context) {
    if (!widget.dataBloc.state.showWorkStuff) return Container();
    return Column(
      children: [
        //Company Name
        _normalField(context, _empresaController,
            S.of(context).whichCompanyDoYouWork, false, (value) {
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateWorkplaceName(value));
        }),
        //Company City
        CustomDropdownAutocomplete(
          controller: _ciudadEmpresaController,
          sonKey: _ciudadEmpresaKey,
          textSend: widget.dataBloc.state.companyCityText,
          clearOnSubmit: false,
          label: S.of(context).companyCity,
          suggestions: widget.dataBloc.state.cities.values.toList(),
          textSubmitted: (value) {
            widget.dataBloc
                .add(GrandesMontosDataEvent.updateWorkplaceCity(value));
          },
        ),
        //Company Address
        _normalField(context, _direccionEmpresaController,
            S.of(context).companyAddress, false, (value) {
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateWorkplaceAddress(value));
        }),
        //Comapny Phone
        _numberOnlyField(context, _telefonoEmpresaController,
            S.of(context).companyPhone, 10, true, (value) {
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateWorkplaceTelephone(value));
        }),
      ],
    );
  }

  Widget _normalField(
    BuildContext context,
    TextEditingController controller,
    String label,
    bool forcedOnlyLetters,
    Function(String) onChanged,
  ) {
    var textField = label;
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: CustomTextFormField(
            controller: controller,
            textAlign: TextAlign.start,
            inputFormatters: forcedOnlyLetters
                ? [FilteringTextInputFormatter.allow(RegExp("[A-zÀ-ú]"))]
                : [],
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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _numberOnlyField(
      BuildContext context,
      TextEditingController controller,
      String label,
      int maxLength,
      bool maxLengthEnforced,
      Function(String) onChanged) {
    var textField = label;
    return Column(
      children: <Widget>[
        CustomTextFormField(
          controller: controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.start,
          keyboardType: TextInputType.number,
          focusNode: _focusNumberOnly,
          maxLength: maxLength,
          maxLengthEnforced: maxLengthEnforced,
          decoration: InputDecoration(
            counterStyle: TextStyle(color: Colors.transparent),
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
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _typeaheadBox(
      BuildContext context,
      List<String> list,
      Function(String) onChange,
      String label,
      TextEditingController controller,
      String initialValue) {
    return TypeaheadFormField(
      itemsList: list,
      onChanged: onChange,
      label: label,
      controller: controller,
      initialValue: initialValue,
    );
  }

  Widget _dropdown(BuildContext context, List<String> list,
      Function(String) onChange, String label) {
    return CustomDropdownMenu(
        itemsList: list, onChanged: onChange, label: label);
  }

  Widget _rowIngresosEgresos(BuildContext context) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _moneyField(
                  context, _ingresosController, S.of(context).monthlyIncome,
                  (value) {
                widget.dataBloc
                    .add(GrandesMontosDataEvent.updateIngresosMensuales(value));
              }, (e) => null)),
          Container(
            width: calcWidth,
            child: _moneyField(
                context, _egresosController, S.of(context).monthlySpendings,
                (value) {
              widget.dataBloc
                  .add(GrandesMontosDataEvent.updateEgresosMensuales(value));
            }, (e) => null),
          ),
        ],
      ),
    );
  }

  Widget _rowPasivosActivos(BuildContext context) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _moneyField(
                  context, _activosController, S.of(context).assets, (value) {
                widget.dataBloc
                    .add(GrandesMontosDataEvent.updateTotalActivos(value));
              },
                  (v) => widget.dataBloc.state.sarlaftItem.totalAssets <=
                          widget.valor
                      ? "Sus activos deben ser mayores al monto de inversión."
                      : null)),
          Container(
            width: calcWidth,
            child: _moneyField(
                context, _pasivosController, S.of(context).liabilities,
                (value) {
              widget.dataBloc
                  .add(GrandesMontosDataEvent.updateTotalPasivos(value));
            }, (e) => null),
          ),
        ],
      ),
    );
  }

  Widget _moneyField(
      BuildContext context,
      MoneyMaskedTextController controller,
      String label,
      Function(double) onChanged,
      String Function(String) validator) {
    var textField = label;
    return Column(
      children: <Widget>[
        Container(
          height: 130,
          child: CustomTextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            textAlign: TextAlign.start,
            autovalidate: AutovalidateMode.always,
            style: TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              prefixStyle: TextStyle(
                  fontFamily: 'open-sans-semi-bold',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                  color: AppColors.g90Color),
              contentPadding: EdgeInsets.only(left: 20),
              labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.g90Color),
              hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'open-sans-regular',
                  color: AppColors.g25Color),
              errorMaxLines: 4,
            ),
            validator: validator,
            onChanged: (value) {
              double dValue = controller.numberValue;
              onChanged(dValue);
            },
          ),
        ),
      ],
    );
  }
}
