import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class SliderWidgetPercent extends StatefulWidget {
  @override
  _SliderWidgetPercentState createState() => _SliderWidgetPercentState();
}

int _valueNumber = 0; // input
double _setValue = 0.0; // control

class _SliderWidgetPercentState extends State<SliderWidgetPercent> {
  TextEditingController _controller = TextEditingController();

  double _min = 0.0;
  double _max = 50.0;

  final FocusNode focusInput = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (_valueNumber > 0) {
      if (_valueNumber > 50) {
        setState(() {
          _setValue = 50;
        });
      } else {
        setState(() {
          var numberDouble = _valueNumber.toString();
          _setValue = double.parse(numberDouble);
        });
      }
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: _createInput(),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("1%"),
                          Text("10%"),
                          Text("40"),
                          _valueNumber > 50 ? Text("50%+") : Text("50%")
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
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayColor:
                            AppColors.backgroundSplashTopColor.withAlpha(32),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                        value: _setValue,
                        min: _min,
                        max: _max,
                        // divisions: 5,
                        onChanged: (value) {
                          setState(() {
                            _setValue = value;
                          });
                          if (_setValue > 0) {
                            setState(() {
                              String doubleNumber =
                                  _setValue.toStringAsFixed(2);
                              var separateString = doubleNumber.split('.');
                              _controller.text = separateString[0];
                              var stringNumber = int.parse(separateString[0]);
                              _valueNumber = stringNumber;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
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
          height: 100,
          child: KeyboardActions(
            config: _buildConfig(context),
            child: CustomTextFormField(
              enableFloatingLabel: false,
              controller: _controller,
              maxLength: 2,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              // textCapitalization: TextCapitalization.sentences,
              textAlign: TextAlign.center,
              focusNode: focusInput,
              decoration: InputDecoration(
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
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
                var splitValue = value.split('')[0];
                if (splitValue == '0') {
                  _controller.text = '';
                  _valueNumber = null;
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
