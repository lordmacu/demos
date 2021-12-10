import 'package:ualet/presentation/core/widgets/CustomSimpleAutoCompleteTextField/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:flutter/services.dart';
import 'package:ualet/generated/l10n.dart';

class CustomDropdownAutocomplete extends StatefulWidget {
  ///List of the options to show (Strings)
  final List<String> suggestions;

  /// initial selected index (defaults to 0)
  final int selectedIndex;

  ///Function to be executed when an item is selected.
  ///The parameter is the String representation of the selected item
  final Function(String) textSubmitted;

  ///Label to be shown on top of the dropdown menu and as the first item if none selected

  final String label;
  final String textSend;
  final TextEditingController controller;

  final bool disabled;
  final bool clearOnSubmit;
  final GlobalKey sonKey;
  const CustomDropdownAutocomplete({
    Key key,
    @required this.sonKey,
    @required this.suggestions,
    this.selectedIndex = 0,
    @required this.textSend,
    @required this.textSubmitted,
    @required this.label,
    @required this.clearOnSubmit,
    this.disabled = false,
    @required this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomDropdownAutocompleteState(
      selectedIndex, textSubmitted, label, textSend, controller);
}

class _CustomDropdownAutocompleteState
    extends State<CustomDropdownAutocomplete> {
  int selectedIndex;
  final Function(String) textSubmitted;
  final String label;
  bool showLabel = false;
  String text = "";
  final String textSend;
  final TextEditingController controller;
  FocusNode _focus = new FocusNode();
  bool isSelectedOption = true;

  _CustomDropdownAutocompleteState(this.selectedIndex, this.textSubmitted,
      this.label, this.textSend, this.controller);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print("CONTROLLER TEXT:::::");
      print(controller.text);
    });
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    bool isEqual = false;
    for (var item in widget.suggestions.toList()) {
      if (text == item) {
        isEqual = true;
      }
    }

    if (!isEqual) {
      setState(() {
        isSelectedOption = false;

        textSubmitted("");
        text = "";
        controller.text = "";
      });
    } else {
      setState(() {
        isSelectedOption = true;
      });
    }
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<String> suggestionsWithLabel = [];
    suggestionsWithLabel.insert(0, label);
    suggestionsWithLabel.addAll(widget.suggestions);
    List<DropdownMenuItem<String>> items = [];
    bool first = true;
    for (String item in suggestionsWithLabel) {
      if (first) {
        items.add(DropdownMenuItem<String>(
          child: Text(item,
              style: AppTextStyles.normal4.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.g50Color,
              )),
          value: item,
        ));
        first = false;
      } else {
        items.add(DropdownMenuItem<String>(
          child: Text(item,
              style: AppTextStyles.normal1.copyWith(
                fontWeight: FontWeight.w400,
              )),
          value: item,
        ));
      }
    }


    print("aquiii esta el------  ${selectedIndex}  ${textSend}");

    if (textSend != null && textSend != "" && selectedIndex != -1) {
      text = textSend;

    }
    // if ( "" == textSend && selectedIndex == -1) {
    //   text = "";
    // }
    // print("Suggestions Padre");
    // print(widget.suggestions);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Label
        Text(showLabel ? label : " ", style: AppTextStyles.normal4),
        SizedBox(
          height: AppDimens.layoutSpacerXXs,
        ),
        //Dropdown
        Container(
          child: SimpleAutoCompleteTextField(


              key: widget.sonKey,

              decoration: InputDecoration(

                hintText: label,
              ),
              inputFormatters: [
                new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
              ],
              controller: controller,
              suggestions: widget.suggestions,
              clearOnSubmit: false,

              clearOnTap: false,
              textChanged: (value) {
                return text = value;
              },
              textSubmitted: (value) {
                textSubmitted(value);
                setState(() {
                  showLabel = text != value;
                  text = value;
                  controller.text = value;
                });
              }

              // label: S.of(context).birthCountry,
              ),
        ),
      ],
    );
  }
}
