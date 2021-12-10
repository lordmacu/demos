import 'package:flutter/services.dart';

class ClabeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    int counter = 1;
    final String cleaned = newValue.text.replaceAll(" ", "");
    for (int i = 0; i < cleaned.length && i < 18; i++) {
      newText.write(cleaned[i]);
      if (counter % 4 == 0) {
        newText.write(" ");
      }
      counter++;
    }

    return TextEditingValue(
        text: newText.toString().trim(),
        selection: TextSelection.collapsed(offset: newText.toString().trim().length));
  }
}
