import 'package:flutter/services.dart';
import 'package:manda_aquela/core/formats/currency_format.dart';

class CurrencyTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final value = double.tryParse(newValue.text);
    if (value == null) {
      return oldValue;
    }

    final valueWithDecimals = value / 100.0;
    final text = CurrencyFormats.withSymbol.format(valueWithDecimals);
    final offset =
        text.length - newValue.text.length + newValue.selection.baseOffset;

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
