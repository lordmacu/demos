import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class CustomDropdownMenu extends StatefulWidget {
  ///List of the options to show (Strings)
  final List<String> itemsList;

  /// initial selected index (defaults to 0)
  final int selectedIndex;

  ///Function to be executed when an item is selected.
  ///The parameter is the String representation of the selected item
  final Function(String) onChanged;

  ///Label to be shown on top of the dropdown menu and as the first item if none selected

  final String label;

  final bool disabled;

  const CustomDropdownMenu({
    Key key,
    @required this.itemsList,
    this.selectedIndex = 0,
    @required this.onChanged,
    @required this.label,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _CustomDropdownMenuState(selectedIndex, onChanged, label);
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  int selectedIndex;
  final Function(String) onChanged;
  final String label;
  bool showLabel = false;

  _CustomDropdownMenuState(this.selectedIndex, this.onChanged, this.label);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> itemsListWithLabel = [];
    itemsListWithLabel.insert(0, label);
    itemsListWithLabel.addAll(widget.itemsList);
    List<DropdownMenuItem<String>> items = [];
    bool first = true;
    for (String item in itemsListWithLabel) {
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
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
          decoration: BoxDecoration(
              color: AppColors.inputColor,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: AppColors.g10Color,
              )),
          child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              disabledHint: Text("Esperando..."),
              iconDisabledColor: AppColors.g25Color,
              icon: Icon(
                Icons.expand_more,
                color: AppColors.primaryColor,
                size: 20,
              ),
              value: itemsListWithLabel.length != 0
                  ? itemsListWithLabel[selectedIndex]
                  : "",
              items: items.toList(),
              onChanged: !widget.disabled
                  ? (value) {
                      setState(() {
                        selectedIndex = itemsListWithLabel.indexOf(value);
                        showLabel = selectedIndex != 0;
                      });
                      //Llama el callback
                      onChanged(value);
                    }
                  : null),
        ),
      ],
    );
  }
}
