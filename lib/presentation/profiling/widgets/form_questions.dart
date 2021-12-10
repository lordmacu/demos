import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type_input.dart';
import 'package:ualet/generated/l10n.dart';
import 'FilteringTextInputFormatterTemporal.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_datetime_picker.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

/// For sarlaf
class FormQuestions extends StatefulWidget {
  final ProfilingFormOption option;
  final Function(
          String qId, String optionId, String vfObservation, double score)
      selectAction;

  final Function(String qId, String sqId, String response, double score)
      subQuestionAction;
  const FormQuestions(
      {Key key,
      @required this.option,
      @required this.selectAction,
      @required this.subQuestionAction});

  @override
  _FormQuestionsState createState() => _FormQuestionsState();
}

class _FormQuestionsState extends State<FormQuestions> {
  Map<String, TextEditingController> controllers = {};
  Map<String, List<bool>> multiCheckBools = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.option.listOptionTypeField) {
      controllers[item.id] = createController(item);
    }
  }

  String selectedValue = '';
  String selectedId = '';
  bool showExtras = false;
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.option.description,
          style: AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
        ),
        Column(
          children: <Widget>[
            ...widget.option.listOptionTypeCheck
                .map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 25,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              groupValue: selectedValue,
                              value: e.value,
                              activeColor: AppColors.successColor,
                              onChanged: (val) {
                                setState(() {
                                  selectedValue = val;
                                  selectedId = e.id;
                                  showExtras = e.isObservation;
                                });
                                widget.selectAction(
                                    widget.option.id, e.id, '', e.score);
                              },
                            ),
                            Text(
                              e.value,
                              style: AppTextStyles.normal4,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      // RadioListTile<String>(
                      //   activeColor: AppColors.primaryColor,
                      //   isThreeLine: false,
                      //   groupValue: selectedValue,
                      //   title: Text(
                      //     e.value,
                      //     style: AppTextStyles.normal4,
                      //     textAlign: TextAlign.start,
                      //   ),
                      //   selected: e.value == selectedValue,
                      //   value: e.value,
                      //   onChanged: (val) {
                      //     setState(() {
                      //       selectedValue = val;
                      //       selectedId = e.id;
                      //       showExtras = e.isObservation;
                      //     });
                      //     widget.selectAction(widget.option.id, e.id, '');
                      //   },
                      // ),
                    ],
                  ),
                )
                .toList(),
            SizedBox(height: AppDimens.layoutSpacerM),
            if (showExtras) ...[
              ...widget.option.listOptionTypeField.map((j) {
                return createField(j, controllers[j.id]);
              }),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
            ],
          ],
        )
      ],
    );
  }

  TextEditingController createController(
      ProfilingFormOptionTypeInput fieldData) {
    TextEditingController controller;
    int type = fieldData.typeInput;
    switch (type) {
      case ProfilingFormOptionTypeInput.DATE:
        controller = TextEditingController();
        break;
      case ProfilingFormOptionTypeInput.MONEY:
        // controller = MoneyMaskedTextController(
        //     decimalSeparator: "", precision: 0, thousandSeparator: ".");
        controller = MoneyMaskedTextController(
          decimalSeparator: ".",
          precision: 2,
          thousandSeparator: ",",
        );
        controller.addListener(() {
          widget.subQuestionAction(
              widget.option.id, fieldData.id, controller.text, 0);
        });
        break;
      default:
        controller = TextEditingController();
        controller.addListener(() {
          widget.subQuestionAction(
              widget.option.id, fieldData.id, controller.text, 0);
        });
    }

    return controller;
  }

  List<Widget> _getMultiCheckList(ProfilingFormOptionTypeInput item) {
    if (!multiCheckBools.containsKey(item.id)) {
      multiCheckBools[item.id] = [];
      item.options.forEach((element) {
        multiCheckBools[item.id].add(false);
      });
    }
    List<Widget> lst = [];
    lst.add(Text(
      item.hintTextInput,
      style: AppTextStyles.normal4,
    ));
    for (var i = 0; i < item.options.length; i++) {
      var rowState = multiCheckBools[item.id][i];
      String option = item.options[i];
      Widget w = Row(
        children: [
          Container(
            height: 25,
            child: Radio<bool>(
              toggleable: true,
              activeColor: AppColors.successColor,
              groupValue: rowState,
              value: true,
              onChanged: (_) {
                setState(() {
                  multiCheckBools[item.id][i] = !multiCheckBools[item.id][i];
                });
                print("test");
                widget.subQuestionAction(widget.option.id, item.id, option, 0);
              },
            ),
          ),
          Text(option),
        ],
      );
      lst.add(w);
    }
    return lst;
  }

  Widget createField(ProfilingFormOptionTypeInput fieldData,
      TextEditingController controller) {
    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: node,
            onTapAction: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            displayDoneButton: true,
          ),
        ],
      );
    }

    switch (fieldData.typeInput) {
      case ProfilingFormOptionTypeInput.MULTI_CHECK:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getMultiCheckList(fieldData),
        );
        break;

      case ProfilingFormOptionTypeInput.DATE:
        return CustomDatetimePicker(
          dateController: controller,
          initialValue: fieldData.hintTextInput,
          onChanged: (date) {
            controller.text = date.toLocal().toString().split(" ")[0];
            widget.subQuestionAction(
                widget.option.id, fieldData.id, controller.text, 0);
          },
        );
        break;
      case ProfilingFormOptionTypeInput.MONEY:
        var textField = fieldData.hintTextInput;
        return Column(
          children: <Widget>[
            Container(
              height: 113,
              child: KeyboardActions(
                config: _buildConfig(context),
                child: CustomTextFormField(
                  validator: (value) {
                    print(value);
                    if (value == "0.00") return S.of(context).errorAmountIsZero;
                    return null;
                  },
                  autovalidate: AutovalidateMode.always,
                  focusNode: node,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hoverColor: AppColors.g25Color,
                    fillColor: AppColors.inputColor,
                    filled: true,
                    hintText: textField,
                    prefixText: r'$ ',
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
                ),
              ),
            ),
          ],
        );
      case ProfilingFormOptionTypeInput.TEXT_LONG:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(fieldData.hintTextInput, style: AppTextStyles.normal4),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            TextField(
              controller: controller,
              maxLength: 200,
              maxLengthEnforced: true,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              onChanged: (value) => {},
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: widget.option.hintTextObservation,
                  counterStyle: TextStyle(color: Colors.transparent)),
            ),
          ],
        );
        break;
      case ProfilingFormOptionTypeInput.TEXT:
        var textField = fieldData.hintTextInput;
        return Column(
          children: <Widget>[
            Container(
              height: 110,
              child: CustomTextFormField(
                maxLength: 45,
                controller: controller,
                textAlign: TextAlign.start,
                inputFormatters: [
                  LengthLimitingTextFieldFormatterFixed(45),
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ñÑ]")),
                ],
                decoration: InputDecoration(
                  hoverColor: AppColors.g25Color,
                  fillColor: AppColors.inputColor,
                  filled: true,
                  hintText: textField,
                  counterStyle: TextStyle(color: Colors.transparent),
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
              ),
            ),
          ],
        );
      case ProfilingFormOptionTypeInput.TEXT_NUMBER:
        var textField = fieldData.hintTextInput;
        return Column(
          children: <Widget>[
            Container(
              height: 110,
              child: CustomTextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                maxLength: 45,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  hoverColor: AppColors.g25Color,
                  fillColor: AppColors.inputColor,
                  filled: true,
                  hintText: textField,
                  counterStyle: TextStyle(color: Colors.transparent),
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
              ),
            ),
          ],
        );
      default:
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelStyle: AppTextStyles.normal1.copyWith(
                color: AppColors.g25Color, fontWeight: FontWeight.w400),
            counterStyle: TextStyle(color: Colors.transparent),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorMaxLines: 3,
          ),
          style: AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
          maxLength: 45,
          maxLengthEnforced: true,
          autocorrect: false,
        );
    }
  }
}
