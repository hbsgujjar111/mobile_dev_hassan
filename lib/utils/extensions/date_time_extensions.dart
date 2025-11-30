import 'package:intl/intl.dart';

extension DateTimeAge on DateTime {
  String formatDate() => DateFormat.yMMM().format(this);
}
