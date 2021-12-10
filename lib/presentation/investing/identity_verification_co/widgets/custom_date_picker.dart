import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  /// TextEditingController for the TextFormField inside the datetime picker
  final TextEditingController dateController;

  /// Initial value to be shown when no date is entered. Also, it is the value of the label
  final String initialValue;

  /// Callback function, called when a date is picked, the parameter is the new DateTime object that was selected
  final Function(DateTime) onChanged;

  final DateTime firstDate;
  final DateTime lastDate;

  final DateTime initialDate;

  const CustomDatePicker(
      {Key key,
      this.dateController,
      this.initialValue,
      this.onChanged,
      this.initialDate,
      this.firstDate,
      this.lastDate})
      : super(key: key);
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState(
      dateController, initialValue, onChanged, initialDate);
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController dateController;
  bool showLabel;
  final String initialValue;
  final Function(DateTime) onChanged;
  final DateTime initialDate;

  _CustomDatePickerState(
      this.dateController, this.initialValue, this.onChanged, this.initialDate);

  @override
  void initState() {
    super.initState();
    showLabel = initialDate != null;
    dateController.text = initialDate != null
        ? "${initialDate.day}/${initialDate.month}/${initialDate.year}"
        : initialValue;
    dateController.addListener(() {
      onChanged(selectedDate);
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: Locale('es'),
        initialDate: initialDate != null ? initialDate : selectedDate,
        firstDate: widget.firstDate != null ? widget.firstDate : DateTime(1900),
        lastDate: widget.lastDate != null ? widget.lastDate : DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        showLabel = true;
      });
      String dateStr = DateFormat.yMd().format(selectedDate);
      dateController.value = dateController.value.copyWith(text: dateStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(showLabel ? initialValue : " ", style: AppTextStyles.normal4),
        Container(
            padding: EdgeInsets.only(right: AppDimens.layoutMarginS),
            decoration: BoxDecoration(
                color: AppColors.inputColor,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: AppColors.g10Color,
                )),
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _selectDate(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      style: AppTextStyles.normal4.copyWith(
                          backgroundColor: Colors.transparent,
                          color: showLabel
                              ? AppColors.g90Color
                              : AppColors.g25Color),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      readOnly: true,
                      enabled: false,
                      controller: dateController,
                    ),
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            )),
      ],
    );
  }
}
