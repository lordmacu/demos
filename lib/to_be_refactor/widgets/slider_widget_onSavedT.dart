import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class SliderWidgetOnSavedT extends StatefulWidget {
  final MoneyMaskedTextController controller;
  final double min;
  final double max;
  final List<String> labels;
  final double initialValue;
  final FormFieldValidator<String> validator;

  const SliderWidgetOnSavedT({
    Key key,
    @required this.controller,
    @required this.min,
    @required this.max,
    @required this.labels,
    this.initialValue = 10.0,
    this.validator,
  });
  @override
  State<StatefulWidget> createState() => _SliderWidgetOnSavedTState();
}

class _SliderWidgetOnSavedTState extends State<SliderWidgetOnSavedT> {
  // double _min = 0.0;
  // double _max = 10000000.0;
  double _valueNumber = 0; // input
  double _setValue; // control

  final FocusNode focusInput = FocusNode();

  @override
  void initState() {
    super.initState();
    _setValue = widget.initialValue;
    _valueNumber = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    _setValue = widget.min ?? 0.0;
    if (_valueNumber > widget.min) {
      if (_valueNumber > widget.max) {
        setState(() {
          _setValue = widget.max;
        });
      } else {
        setState(() {
          var numberDouble = _valueNumber.toStringAsFixed(0);
          _setValue = double.parse(numberDouble);
        });
      }
    } else {
      setState(() {
        _valueNumber = widget.min;
      });
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          _createInput(),
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),

        ],
      ),
    );
  }

  Widget _createSlider() {
    var formater = NumberFormaters.copFormater;
    double _min = widget.min;
    double _max = widget.max;
    List<String> sliderTexts = widget.labels;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createTextSlider("\$${sliderTexts[0]}"),
                _createTextSlider("\$${sliderTexts[1]}"),
                _createTextSlider("\$${sliderTexts[2]}"),
                _valueNumber > widget.max
                    ? _createTextSlider("\$${sliderTexts[3]}+")
                    : _createTextSlider("\$${sliderTexts[3]}")
              ],
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.backgroundSplashTopColor,
              inactiveTrackColor: AppColors.g10Color,
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 5.0,
              thumbColor: AppColors.backgroundSplashTopColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayColor: AppColors.backgroundSplashTopColor.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
              value: _setValue,
              min: _min,
              max: _max,
              onChangeEnd: (value) {
                setState(() {
                  _setValue = value;
                });
                if (_setValue >= _min) {
                  setState(() {
                    String doubleNumber = _setValue.toStringAsFixed(0);
                    widget.controller.text = doubleNumber;
                    var stringNumber = double.parse(doubleNumber);
                    _valueNumber = stringNumber;
                  });
                }
              },
              onChanged: (value) {
                setState(() {
                  _setValue = value;
                });
              },
              //   if (_setValue >= _min) {
              //     setState(() {
              //       String doubleNumber = _setValue.toStringAsFixed(2);
              //       var separateString = doubleNumber.split('.');
              //       widget.controller.text = separateString[0];
              //       var stringNumber = int.parse(separateString[0]);
              //       _valueNumber = stringNumber;
              //     });
              //   }
              // },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createTextSlider(String value) {
    return Text(
      value,
      style: TextStyle(
          fontFamily: 'open-sans-regular',
          fontWeight: FontWeight.normal,
          color: AppColors.g50Color),
    );
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayDoneButton: true,
          focusNode: focusInput,
        ),
      ],
    );
  }

  Widget _createInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextFormField(

          enableFloatingLabel: false,
          style: TextStyle(
              fontFamily: 'open-sans-semi-bold',
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppColors.g90Color),
          controller: widget.controller,
          focusNode: focusInput,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hoverColor: AppColors.g25Color,
            fillColor: AppColors.inputColor,
            filled: true,
             hintText: S.of(context).valueEveryCoute,
            prefixStyle: TextStyle(
                fontFamily: 'open-sans-semi-bold',
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppColors.g90Color),
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
                width: 1.5,
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
            errorMaxLines: 2,
          ),
          // initialValue: "$_valueNumber",
          // autovalidate: true,
          validator: widget.validator != null
              ? widget.validator
              : (value) {
                  return null;
                },
          // onSaved: (value) => name = value,
          onChanged: (value) {
            value == '' ? value = '0' : value = value;

            setState(() {
              _setValue = double.parse(value);
            });
            var splitValue = value.split('')[0];
            if (splitValue == '0') {
              widget.controller.text = '';
              _valueNumber = 0;
            } else {
              setState(() {
                _valueNumber = double.parse(value);
              });
            }
          },
        ),
      ],
    );
  }
}
