import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyTextInputFormatterMx extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    double value = double.parse(newValue.text) / 100;

    final formatter = NumberFormat.simpleCurrency(locale: "es_Mx");

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
