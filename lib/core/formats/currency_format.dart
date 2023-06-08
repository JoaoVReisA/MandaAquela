import 'package:intl/intl.dart';

class CurrencyFormats {
  static final withSymbol = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: "R\$",
    customPattern: '\u00A4 ###,###,###,###.##; \u00A4 - ###,###,###,###.##',
  );

  static final withoutSymbol = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: "",
    customPattern: '\u00A4 ###,###,###,###.##; \u00A4 - ###,###,###,###.##',
  );
}
