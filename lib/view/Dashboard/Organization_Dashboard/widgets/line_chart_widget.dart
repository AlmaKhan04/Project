import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  final int selectedYear;

  LineChartWidget({required this.selectedYear,});

  @override
  Widget build(BuildContext context) {
    final List<ExpenseData> data = _expenseData(selectedYear);

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
          title: AxisTitle(text: 'Expenses', textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          labelFormat: '{value}K',
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(fontSize: 10),
        ),
        title: ChartTitle(
          text: 'Revenue Generated in Year $selectedYear',
          textStyle: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          LineSeries<ExpenseData, String>(
            dataSource: data,
            xValueMapper: (ExpenseData data, _) => data.x,
            yValueMapper: (ExpenseData data, _) => data.y,
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

  List<ExpenseData> _expenseData(int year) {
    switch (year) {
      case 2024:
        return [
          ExpenseData('Jan', 30),
          ExpenseData('Feb', 28),
          ExpenseData('Mar', 35),
          ExpenseData('Apr', 40),
          ExpenseData('May', 42),
          ExpenseData('June', 45),
          ExpenseData('July', 50),
          ExpenseData('Aug', 59),
          ExpenseData('Sept', 50),
          ExpenseData('Oct', 60),
          ExpenseData('Nov', 100),
          ExpenseData('Dec', 80),
        ];
      case 2023:
        return [
          ExpenseData('Jan', 30),
          ExpenseData('Feb', 28),
          ExpenseData('Mar', 35),
          ExpenseData('Apr', 40),
          ExpenseData('May', 42),
          ExpenseData('June', 45),
          ExpenseData('July', 50),
          ExpenseData('Aug', 59),
          ExpenseData('Sept', 40),
          ExpenseData('Oct', 30),
          ExpenseData('Nov', 60),
          ExpenseData('Dec', 72),
        ];
      default:
        return [];
    }
  }
}

class ExpenseData {
  final String x;
  final double y;

  ExpenseData(this.x, this.y);
}
