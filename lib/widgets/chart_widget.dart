import 'package:finance_app_ui/common/constant.dart';
import 'package:finance_app_ui/models/chart_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.data}) : super(key: key);
  final List<ChartSeries> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartSeries, String>> series = [
      charts.Series(
        id: "agam",
        data: data,
        domainFn: (series, _) => series.month,
        measureFn: (series, _) => series.value,
        colorFn: (series, _) => series.value >= 1750
            ? series.barColor
            : charts.ColorUtil.fromDartColor(Bcolor),
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

class ChartWidgetLine extends StatelessWidget {
  const ChartWidgetLine({Key? key, required this.data}) : super(key: key);
  final List<ChartSeries> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartSeries, num>> series = [
      charts.Series(
        id: "agam",
        data: data,
        domainFn: (series, _) => int.parse(series.month),
        measureFn: (series, _) => series.value,
        colorFn: (series, _) => series.value >= 1750
            ? series.barColor
            : charts.ColorUtil.fromDartColor(Bcolor),
      )
    ];
    return charts.LineChart(
      series,
      domainAxis: const charts.NumericAxisSpec(
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            zeroBound: false,
          ),
          viewport: charts.NumericExtents(1, 5),
          showAxisLine: true),
      primaryMeasureAxis:
          const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      animate: true,
      behaviors: [
        charts.LinePointHighlighter(
          drawFollowLinesAcrossChart: true,
          showHorizontalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest,
        ),
      ],
    );
  }
}
