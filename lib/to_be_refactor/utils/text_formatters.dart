import 'package:intl/intl.dart';

class NumberFormaters {
  // static final copFormater = NumberFormat("##.###.###");
  static final copFormater =
      NumberFormat.currency(locale: 'es', decimalDigits: 0, symbol: "", );
  static final mxFormater = NumberFormat.currency(
    locale: 'es_MX',
    symbol: "\$",
  );
}
