import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);
    var formatter;
    String newText;
    if (getIt<IEnv>().isColombia()) {
      formatter = NumberFormat.currency(
          customPattern: "\u00A4#,##0.00",
          symbol: "\$",
          decimalDigits: 0,
          locale: "es");

      newText = formatter.format(value);
    } else {
      formatter = NumberFormat.simpleCurrency(locale: "es_Mx");

      newText = formatter.format(value / 100);
    }

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
