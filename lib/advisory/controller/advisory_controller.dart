import 'package:flutter/foundation.dart';
import '../model/advisory_model.dart';

class AdvisoryController extends ChangeNotifier {
  TimerData _timerData = TimerData(months: 04, days: 00);

  TimerData get timerData => _timerData;

  void updateTimer(int months, int days) {
    _timerData = TimerData(months: months, days: days);
    notifyListeners();
  }
}
