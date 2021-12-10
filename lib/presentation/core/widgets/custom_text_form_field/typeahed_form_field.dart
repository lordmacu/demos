import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:kt_dart/collection.dart';

///Formfield con droptdown de sugerencias/autocompletado
class TypeaheadFormField extends StatefulWidget {
  ///List of the options to show (Strings)
  final List<String> itemsList;

  final Function(String) onChanged;

  ///Label to be shown on top of the dropdown menu and as the first item if none selected

  final String label;
  final TextEditingController controller;
  final String initialValue;

  const TypeaheadFormField(
      {Key key,
      @required this.itemsList,
      @required this.onChanged,
      @required this.label,
      @required this.controller,
      this.initialValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print("createState: $itemsList");
    return _TypeaheadFormField(onChanged, label, itemsList, controller);
  }
}

class _TypeaheadFormField extends State<TypeaheadFormField> {
  final Function(String) onChanged;
  final String label;
  bool showLabel = false;
  final TextEditingController controller;
  _TypeaheadFormField(
      this.onChanged, this.label, this.itemsList, this.controller);
  List<String> itemsList;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.initialValue != '') {
      controller.text = widget.initialValue;
    } else {
      controller.text = label;
    }
    showLabel = (widget.initialValue != null && widget.initialValue != '');
    controller.addListener(() {
      if (controller.text == label) {
        showLabel = false;
      } else {
        showLabel = true;
      }
      onChanged(controller.text);
    });
  }

  List<String> getSuggestions(String input) {
    KtList<String> lst = KtList.from(itemsList);
    print("GetSuggestions: $input");
    print("ItemsList: $itemsList");
    if (input == '' || input == label) return lst.asList();
    return lst.filter((item) => item.contains(input)).asList();
  }

  @override
  Widget build(BuildContext context) {
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
          // padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
          // decoration: BoxDecoration(
          //     color: AppColors.inputColor,
          //     borderRadius: BorderRadius.circular(12.0),
          //     border: Border.all(
          //       color: AppColors.g10Color,
          //     )),
          child: TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              style: AppTextStyles.normal4.copyWith(
                  fontWeight: showLabel ? FontWeight.w600 : FontWeight.w400,
                  color: showLabel ? AppColors.g75Color : AppColors.g25Color),
            ),
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion,
                    style: AppTextStyles.normal4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.g75Color)),
              );
            },
            hideOnEmpty: true,
            onSuggestionSelected: (suggestion) {
              controller.text = suggestion;
              onChanged(suggestion);
            },
            suggestionsCallback: (pattern) {
              var a = getSuggestions(pattern);
              return a;
            },
            noItemsFoundBuilder: (context) => Container(),
          ),
        ),
      ],
    );
  }
}
