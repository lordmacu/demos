import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/domain/sarlaft/pep_family_member.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/CustomSimpleAutoCompleteTextField/autocomplete_textfield.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_autocomplete.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ualet/domain/sarlaft/pay_taxes_not_colombia_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ualet/domain/identification/i_identification_repository.dart';
import 'package:ualet/injection.dart';

class InfoFinanciera2 extends StatefulWidget {
  final GrandesMontosDataBloc dataBloc;

  const InfoFinanciera2({Key key, this.dataBloc}) : super(key: key);

  @override
  _InfoFinanciera2State createState() => _InfoFinanciera2State();
}

class _InfoFinanciera2State extends State<InfoFinanciera2> {
  List<GlobalKey> keys = [];
  List<TextEditingController> controllers = [];

  Map<String, String> idTypes = {};
  List<String> ListidTypes = [];

  Future getTypes() async {
    var isError = false;
    var mapOption = await getIt<IIdentificationRepository>().getIdTypes();
    setState(() {
      mapOption.fold((l) => isError = true, (r) => idTypes = r);
    });

    idTypes.forEach((key, value) {
      ListidTypes.add(key);
    });

    setState(() {
      print("aquiii los tipos ${ListidTypes}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getTypes();

    for (int i = 0; i < widget.dataBloc.state.numTaxesExtra; i++) {
      keys.add(GlobalKey<AutoCompleteTextFieldState<String>>());
      controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: AppColors.primaryColor,
          alignment: Alignment.topLeft,
          tooltip: "Volver",
          onPressed: () => ExtendedNavigator.rootNavigator.pop(),
        ),
        //Title
        Text(S.of(context).pepTitle,
            style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
            textAlign: TextAlign.right),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
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
          height: AppDimens.layoutSpacerL,
        ),
        //recursos publicos

        _switchWidget(context, S.of(context).pepText1, (value) {
          print("aquiii mano ${value}");
          widget.dataBloc.add(GrandesMontosDataEvent.updateUserPep(value));
        }, widget.dataBloc.state.sarlaftItem.isPep),

        widget.dataBloc.state.sarlaftItem.isPep == true
            ? Column(
                children: [
                  SizedBox(
                    height: AppDimens.layoutSpacerHeader,
                  ),
                  _switchWidget(context, S.of(context).pepText10, (value) {
                    print("aquiii mano ${value}");
                    widget.dataBloc.add(
                        GrandesMontosDataEvent.updateFinantialAccounts(value));
                  }, widget.dataBloc.state.sarlaftItem.finantialAcconts),
                ],
              )
            : Container(),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _switchWidget(
            context,
            S.of(context).pepText2,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updateFamilyPep(value)),
            widget.dataBloc.state.sarlaftItem.hasPepRelationships),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _showPep(context),
        _switchWidget(
            context,
            S.of(context).pepText3,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updatePartnerPep(value)),
            widget.dataBloc.state.sarlaftItem.partnerPep),

        widget.dataBloc.state.sarlaftItem.partnerPep
            ? _showPepParnet(context)
            : Container(),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),

        _switchWidget(
            context,
            S.of(context).pepText4,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updateOperacionesOtraMoneda(value)),
            widget.dataBloc.state.sarlaftItem.manageForeignCurrency),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),

        _switchWidget(context, S.of(context).pepText5, (value) {
          if (!widget.dataBloc.state.sarlaftItem.ifPayTaxesNotColombia)
            setState(() {
              keys.add(GlobalKey<AutoCompleteTextFieldState<String>>());
              controllers.add(TextEditingController());
            });
          else
            setState(() {
              keys = [];
              controllers = [];
            });
          widget.dataBloc
              .add(GrandesMontosDataEvent.updateTaxesNotColombia(value));
        }, widget.dataBloc.state.sarlaftItem.ifPayTaxesNotColombia),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _switchWidget(
            context,
            S.of(context).pepText6,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updatePagosEEUU(value)),
            widget.dataBloc.state.sarlaftItem.receivePaymentsUs),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _switchWidget(
            context,
            S.of(context).pepText7,
            (value) => widget.dataBloc.add(
                GrandesMontosDataEvent.updateIngresosPropiedadesEEUU(value)),
            widget.dataBloc.state.sarlaftItem.receiveIncomePropertyUs),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _switchWidget(
            context,
            S.of(context).pepText8,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updateDiasEEUU(value)),
            widget.dataBloc.state.sarlaftItem.permanencyInUs),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        _switchWidget(
            context,
            S.of(context).pepText9,
            (value) => widget.dataBloc
                .add(GrandesMontosDataEvent.updateCiudadanoEEUU(value)),
            widget.dataBloc.state.sarlaftItem.citizenResidentUs),

        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),

        widget.dataBloc.state.sarlaftItem.citizenResidentUs
            ? _switchWidget(
                context,
                S.of(context).pepText11,
                (value) => widget.dataBloc.add(
                    GrandesMontosDataEvent.updateCiudadanoEEUUFamily(value)),
                widget.dataBloc.state.sarlaftItem.citizenResidentUsFamily)
            : Container(),

        widget.dataBloc.state.sarlaftItem.citizenResidentUsFamily
            ? _showPepFamily(context)
            : Container(),
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        //pep
      ],
    );
  }

  Widget _showOtherTaxes(BuildContext context) {
    var numTaxes = widget.dataBloc.state.sarlaftItem.ifPayTaxesNotColombia
        ? 1 + widget.dataBloc.state.numTaxesExtra
        : 0;
    List<Widget> lst = [];
    var countries = widget.dataBloc.state.countries;
    for (int i = 0; i < numTaxes; i++) {
      PayTaxesNotColombiaItem item =
          widget.dataBloc.state.sarlaftItem.payTaxesNotColombiaModel[i];
      //pais

      lst.add(CustomDropdownAutocomplete(
          controller: TextEditingController(
              text: item.countryName != null ? "${item.countryName}" : ""),
          //   sonKey: keys[i],
          textSend: item.countryName,
          suggestions: countries.values.toList(),
          selectedIndex: 1,
          textSubmitted: (value) {
            var item2 =
                widget.dataBloc.state.sarlaftItem.payTaxesNotColombiaModel[i];
            widget.dataBloc
                .add(GrandesMontosDataEvent.updateTaxesNotColombiaItem(
                    item2.copyWith(
                      countryId: widget.dataBloc.getCountryId(value),
                      countryName: value,
                    ),
                    i));
          },
          label: S.of(context).country,
          clearOnSubmit: false));
      //Nombre
      lst.add(_normalFieldNoController(
          context, item.name, S.of(context).cityName, true, false, (value) {
        var item2 =
            widget.dataBloc.state.sarlaftItem.payTaxesNotColombiaModel[i];
        widget.dataBloc.add(GrandesMontosDataEvent.updateTaxesNotColombiaItem(
            item2.copyWith(name: value), i));
      }));
      //Documento
      lst.add(_normalFieldNoController(context, item.identification,
          S.of(context).idInSaidCountry, false, true, (value) {
        var item2 =
            widget.dataBloc.state.sarlaftItem.payTaxesNotColombiaModel[i];
        widget.dataBloc.add(GrandesMontosDataEvent.updateTaxesNotColombiaItem(
            item2.copyWith(identification: value), i));
      }));
    }
    return Column(children: lst);
  }

  Widget _showPep(BuildContext context) {
    var numPeps = widget.dataBloc.state.sarlaftItem.hasPepRelationships
        ? 1 + widget.dataBloc.state.numPepsExtra
        : 0;
    List<Widget> lst = [];
    for (int i = 0; i < numPeps; i++) {
      PepFamilyMember pep = widget.dataBloc.state.sarlaftItem.pepList[i];
      lst.add(
        //Nombre
        _normalFieldNoController(
            context, pep.name, S.of(context).name, true, false, (value) {
          var pep2 = widget.dataBloc.state.sarlaftItem.pepList[i];
          widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPepItem(
              pep2.copyWith(name: value), i));
        }),
      );

      lst.add(SimpleAutoCompleteTextField(
          decoration: InputDecoration(
            hintText: S.of(context).documentTypePep,
          ),
          inputFormatters: [
            new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
          ],
          suggestions: ListidTypes,
          clearOnSubmit: false,
          clearOnTap: false,
          textChanged: (value) {},
          textSubmitted: (value) {
            var pep2 = widget.dataBloc.state.sarlaftItem.pepList[i];
            widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPepItem(
                pep2.copyWith(identificationType: int.parse(idTypes[value])),
                i));
          }
          // label: S.of(context).birthCountry,
          ));

      //id
      lst.add(
        _normalFieldNoController(context, pep.identification,
            S.of(context).identification, false, true, (value) {
          var pep2 = widget.dataBloc.state.sarlaftItem.pepList[i];
          widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPepItem(
              pep2.copyWith(identification: value), i));
        }),
        //cargo
      );

      lst.add(
        _normalFieldNoController(
            context, pep.parentType, S.of(context).parentTypePep, true, false,
            (value) {
          var pep2 = widget.dataBloc.state.sarlaftItem.pepList[i];
          widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPepItem(
              pep2.copyWith(parentType: value), i));
        }),
        //cargo
      );

      List<String> listCountries = [];
      var countries = widget.dataBloc.state.countries;

      print("aquyii los paises  ${countries}");
      countries.forEach((key, value) {
        listCountries.add(value);
      });

      lst.add(Container(
        child: SimpleAutoCompleteTextField(
            decoration: InputDecoration(
              hintText: S.of(context).countryPep,
            ),
            inputFormatters: [
              new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
            ],
            suggestions: listCountries,
            clearOnSubmit: false,
            clearOnTap: false,
            textChanged: (value) {},
            textSubmitted: (value) {
              var countryId = 0;
              countries.forEach((key, valueC) {
                if (value == valueC) {
                  countryId = int.parse(key);
                }
              });

              var pep2 = widget.dataBloc.state.sarlaftItem.pepList[i];
              widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPepItem(
                  pep2.copyWith(country: "${countryId}"), i));
            }),
        margin: EdgeInsets.only(top: 20, bottom: 20),
      ));

      if (i < numPeps - 1) lst.add(Divider());
    }
    return Column(
      children: lst,
    );
  }

  Widget _showPepParnet(BuildContext context) {
    List<Widget> lst = [];

    lst.add(
      _normalFieldNoController(
          context,
          widget.dataBloc.state.sarlaftItem.partnerName,
          S.of(context).name,
          true,
          false, (value) {
        widget.dataBloc.add(GrandesMontosDataEvent.updatePartnerName(value));
      }),
    );

    lst.add(
      _normalFieldNoController(
          context,
          widget.dataBloc.state.sarlaftItem.partnerType,
          S.of(context).parentTypePep,
          true,
          false, (value) {
        print("este es el parent type    ${value}");
        widget.dataBloc.add(GrandesMontosDataEvent.updatePartnerType(value));
      }),
    );

    lst.add(
      _normalFieldNoController(
          context,
          widget.dataBloc.state.sarlaftItem.partnerIdentification,
          S.of(context).juridicPerson,
          false,
          false, (value) {
        widget.dataBloc
            .add(GrandesMontosDataEvent.updatePartnerIdentification(value));
      }),
    );

    return Column(
      children: lst,
    );
  }

  Widget _showPepFamily(BuildContext context) {
    List<Widget> lst = [];

    lst.add(
      _normalFieldNoController(
          context,
          widget.dataBloc.state.sarlaftItem.familyPosition,
          S.of(context).position,
          true,
          false, (value) {
        print("aquiii esta el position");
        widget.dataBloc.add(GrandesMontosDataEvent.updateFamilyPosition(value));
      }),
    );

    List<String> listCountries = [];
    var countries = widget.dataBloc.state.countries;

    print("aquyii los paises  ${countries}");
    countries.forEach((key, value) {
      listCountries.add(value);
    });

    lst.add(Container(
      child: SimpleAutoCompleteTextField(
          decoration: InputDecoration(
            hintText: S.of(context).countryPep,
          ),
          inputFormatters: [
            new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
          ],
          suggestions: listCountries,
          clearOnSubmit: false,
          clearOnTap: false,
          textChanged: (value) {},
          textSubmitted: (value) {
            var countryId = 0;
            countries.forEach((key, valueC) {
              if (value == valueC) {
                countryId = int.parse(key);
              }

              widget.dataBloc
                  .add(GrandesMontosDataEvent.updateFamilyCountry(value));
            });
          }),
      margin: EdgeInsets.only(top: 20, bottom: 20),
    ));

    return Column(
      children: lst,
    );
  }

  Widget _switchWidget(BuildContext context, String label,
      Function(bool) onChanged, bool state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Text(
            "${label}",
            style: AppTextStyles.normal4
                .copyWith(color: AppColors.g50Color, fontSize: 15),
          ),
        )),
        _customSwitch(state, onChanged),
      ],
    );
  }

  Widget _customSwitch(bool value, Function(bool) onTap) {
    print("aquiii estoy ");
    final duration = Duration(milliseconds: 200);
    return AnimatedContainer(
      duration: duration,
      height: 20.0,
      width: 40.0,
      decoration: BoxDecoration(
          color: AppColors.inputColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: AppColors.g10Color,
          )),
      child: InkWell(
        onTap: () => onTap(!value),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: duration,
              curve: Curves.easeIn,
              top: -1.0,
              left: value ? 20.0 : 0.0,
              right: value ? 0.0 : 20.0,
              child: InkWell(
                onTap: () => onTap(!value),
                child: AnimatedSwitcher(
                  duration: duration,
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            value ? AppColors.successColor : AppColors.g50Color,
                      ),
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          value ? S.of(context).yes : S.of(context).no,
                          style: AppTextStyles.caption1.copyWith(
                              fontSize: 9, color: AppColors.whiteColor),
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _normalField(BuildContext context, TextEditingController controller,
      String label, Function(String) onChanged) {
    var textField = label;
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: CustomTextFormField(
            controller: controller,
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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _normalFieldNoController(
      BuildContext context,
      String value,
      String label,
      bool forcedOnlyLetters,
      bool forcedOnlyNumbers,
      Function(String) onChanged) {
    var textField = label;
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: CustomTextFormField(
            initialValue: value,
            textAlign: TextAlign.start,
            keyboardType:
                forcedOnlyNumbers ? TextInputType.number : TextInputType.text,
            inputFormatters: forcedOnlyLetters
                ? [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))]
                : forcedOnlyNumbers
                    ? [FilteringTextInputFormatter.digitsOnly]
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
}
