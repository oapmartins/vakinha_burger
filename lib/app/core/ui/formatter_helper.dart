import 'package:intl/intl.dart';

class FormatterHelper {
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: r'R$',
  );

  FormatterHelper._();

  static String formatCurrency(double value) {
    return _currencyFormat.format(value);
  }
}
