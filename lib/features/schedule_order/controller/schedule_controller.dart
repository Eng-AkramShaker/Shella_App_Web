import 'package:flutter/foundation.dart';

class ScheduleController extends ChangeNotifier {
  String _selectedDay = 'اليوم';
  String _selectedTime = '';

  String get selectedDay => _selectedDay;
  String get selectedTime => _selectedTime;

  void updateDay(String day) {
    _selectedDay = day;
    notifyListeners();
  }

  void updateTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  void scheduleOrder() {
    if (kDebugMode) {
      print('الوقت المحدد: $_selectedTime - اليوم: $_selectedDay');
    }
  }
}
