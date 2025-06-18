 import 'package:intl/intl.dart';

String formatDate(String? rawDate) {
  if (rawDate == null) return 'غير محدد';
  try {
    final parsedDate = DateTime.parse(rawDate);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  } catch (e) {
    return 'تاريخ غير صالح';
  }
}