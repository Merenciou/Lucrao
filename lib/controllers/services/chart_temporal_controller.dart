import 'package:flutter/material.dart';

class ChartTemporalController extends ChangeNotifier {
  static ChartTemporalController instance = ChartTemporalController();
  int chartIndex = 0;

  chartWeekly() {
    chartIndex = 0;
    ChangeNotifier();
  }

  chartMonthly() {
    chartIndex = 1;
    ChangeNotifier();
  }
}
