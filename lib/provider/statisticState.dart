import 'package:flutter/foundation.dart';

class StatisticState with ChangeNotifier {
  DateTime _selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final List<DateTime> _dates = [];

  StatisticState() {
    _generateDates();
  }

  DateTime get selectedDate => _selectedDate;
  List<DateTime> get dates => _dates;

  void _generateDates() {
    final today = DateTime.now();
    final startDate = DateTime(today.year, today.month, today.day).subtract(Duration(days: 2));
    for (int i = 0; i < 61; i++) {
      final date = startDate.add(Duration(days: i));
      _dates.add(date);
    }
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  int toggleIndex = 0;
  void toggleEvent(int index) {
    toggleIndex = index;
    notifyListeners();
  }

}
