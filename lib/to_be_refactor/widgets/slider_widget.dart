import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class SliderWidget extends StatefulWidget {
  final TextEditingController controller;
  final double min;
  final double max;

  const SliderWidget({
    Key key,
    @required this.controller,
    this.min,
    this.max,
  });
  @override
  State<StatefulWidget> createState() => _SliderWidgetState();
}

int _valueNumber = 0; // input
double _setValue = 10000; // control

class _SliderWidgetState extends State<SliderWidget> {
  // double _min = 0.0;
  // double _max = 10000000.0;

  final FocusNode focusInput = FocusNode();

  @override
  Widget build(BuildContext context) {
    _setValue = widget.min ?? 0.0;
    if (_valueNumber > widget.min) {
      if (_valueNumber > 10000000) {
        setState(() {
          _setValue = 10000000;
        });
      } else {
        setState(() {
          var numberDouble = _valueNumber.toString();
          _setValue = double.parse(numberDouble);
        });
      }
    } else {
      setState(() {
        _valueNumber = widget.min.toInt();
      });
    }
    return Container(
      padding: EdgeInsets.only(left: 2),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          _createInput(),
          _createSlider()
        ],
      ),
    );
  }

  Widget _createSlider() {
    double _min = widget.min ?? 0.0;
    double _max = widget.max ?? 10000000.0;
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
                _createTextSlider("\$0"),
                _createTextSlider("\$2.000.000"),
                _createTextSlider("\$6.000.000"),
                _valueNumber > 10000000
                    ? _createTextSlider("\$10.000.000+")
                    : _createTextSlider("\$10.000.000")
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
              onChanged: (value) {
                setState(() {
                  _setValue = value;
                });
                if (_setValue >= _min) {
                  setState(() {
                    String doubleNumber = _setValue.toStringAsFixed(2);
                    var separateString = doubleNumber.split('.');
                    widget.controller.text = separateString[0];
                    var stringNumber = int.parse(separateString[0]);
                    _valueNumber = stringNumber;
                  });
                }
              },
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
      children: <Widget>[
        Container(
          height: 80,
          child: KeyboardActions(
            config: _buildConfig(context),
            child: CustomTextFormField(
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
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
                contentPadding: EdgeInsets.only(left: 20),
                prefixText: r'$',
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
              ),
              // initialValue: "$_valueNumber",
              // autovalidate: true,
              // validator: utils.validateName,
              // onSaved: (value) => name = value,
              onChanged: (value) {
                value == '' ? value = '0' : value = value;
                var splitValue = value.split('')[0];
                if (splitValue == '0') {
                  widget.controller.text = '';
                  _valueNumber = 0;
                } else {
                  setState(() {
                    _valueNumber = int.parse(value);
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
