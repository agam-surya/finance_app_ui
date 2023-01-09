import 'package:charts_flutter/flutter.dart' as charts;

class ChartSeries{
    final int value;
  final String month;
  final charts.Color barColor;

  ChartSeries(
    {
      required this.value,
      required this.month,
      required this.barColor
    }
  );
}