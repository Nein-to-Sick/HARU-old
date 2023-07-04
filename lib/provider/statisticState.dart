import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class StatisticState with ChangeNotifier {
  DateTime _selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late List<DateTime> _dates = [];

  StatisticState() {
    _generateDates();
  }

  DateTime get selectedDate => _selectedDate;
  List<DateTime> get dates => _dates;

  void _generateDates() {
    _dates = [];
    final startDate = selectedDate.subtract(const Duration(days: 2));
    for (int i = 0; i < 5; i++) {
      final date = startDate.add(Duration(days: i));
      _dates.add(date);
    }
  }

  DateTime currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  void selectCurrentDate(DateTime date) {
    currentDate = date;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    _generateDates();
    notifyListeners();
  }

  int toggleIndex = 0;
  void toggleEvent(int index) {
    toggleIndex = index;
    notifyListeners();
  }

  double height = 115;
  void changeHeight(double hei) {
    height = hei;
    notifyListeners();
  }

  int calendarCount = 0;
  void countCalendar(int count) {
    calendarCount = count;
    notifyListeners();
  }
}
