import 'package:intl/intl.dart';

extension TimeExtensions on String {

  /// 10:00 AM
  String to12Format(){
    return DateFormat.jm().format(DateTime.parse('2024-01-01 $this'));
  }

}