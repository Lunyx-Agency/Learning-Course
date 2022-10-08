
import 'package:shamsi_date/shamsi_date.dart';

class Tools {
  static String shamsiFormat(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }
}
