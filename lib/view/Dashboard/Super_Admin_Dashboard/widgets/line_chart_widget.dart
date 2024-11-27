import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  final int selectedYear;

  LineChartWidget({required this.selectedYear,});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = _getDataForYear(selectedYear);

    return Container(
      height: 250,
      padding: const EdgeInsets.only(right: 10.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Months', textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          labelRotation: 0,
          labelStyle: TextStyle(fontSize: 10),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Engagement', textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          labelFormat: '{value}',
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(fontSize: 10),
        ),
        title: ChartTitle(
          text: 'Engagement Matrix for Year $selectedYear',
          textStyle: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          LineSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            color: Colors.green,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 9),
              ),
            markerSettings: MarkerSettings(isVisible: true), // Show markers on data points
          ),
        ],
      ),
    );
  }

  List<ChartData> _getDataForYear(int year) {
    switch (year) {
      case 2024:
        return [
          ChartData('Jan', 200),
          ChartData('Feb', 220),
          ChartData('Mar', 250),
          ChartData('Apr', 270),
          ChartData('May', 300),
          ChartData('Jun', 350),
          ChartData('Jul', 380),
          ChartData('Aug', 400),
          ChartData('Sep', 420),
          ChartData('Oct', 450),
          ChartData('Nov', 470),
          ChartData('Dec', 500),
        ];
      case 2025:
        return [
          ChartData('Jan', 220),
          ChartData('Feb', 240),
          ChartData('Mar', 260),
          ChartData('Apr', 280),
          ChartData('May', 310),
          ChartData('Jun', 340),
          ChartData('Jul', 370),
          ChartData('Aug', 400),
          ChartData('Sep', 430),
          ChartData('Oct', 460),
          ChartData('Nov', 490),
          ChartData('Dec', 520),
        ];
      default:
        return [];
    }
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
