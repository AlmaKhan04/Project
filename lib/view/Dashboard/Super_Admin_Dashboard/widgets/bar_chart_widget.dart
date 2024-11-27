import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatelessWidget {
  final int selectedYear;

  BarChartWidget({required this.selectedYear});

  @override
  Widget build(BuildContext context) {
    // Generate data based on the selected year
    List<ChartData> data = _getDataForYear(selectedYear);

    return Container(
      height: 300, // Adjusted height for mobile
      padding: const EdgeInsets.only(right: 10.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Months', textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          labelRotation: 0, // Rotate labels for better readability on mobile
          labelStyle: TextStyle(fontSize: 10),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Number of Organizations', textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          labelFormat: '{value}',
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(fontSize: 10),
        ),
        title: ChartTitle(
          text: 'Organizations Purchased in $selectedYear',
          textStyle: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          ColumnSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5), // Rounded bars
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 9),
              ),
          ),
        ],
      ),
    );
  }

  // Method to generate data based on the year
  List<ChartData> _getDataForYear(int year) {
    // Example data generation based on year
    // You can replace this with actual data fetching logic
    Map<int, List<ChartData>> yearlyData = {
      2024: [
        ChartData('Jan', 30),
        ChartData('Feb', 40),
        ChartData('Mar', 35),
        ChartData('Apr', 50),
        ChartData('May', 60),
        ChartData('Jun', 55),
        ChartData('Jul', 70),
        ChartData('Aug', 80),
        ChartData('Sep', 65),
        ChartData('Oct', 75),
        ChartData('Nov', 85),
        ChartData('Dec', 90),
      ],
      2023: [
        ChartData('Jan', 25),
        ChartData('Feb', 35),
        ChartData('Mar', 40),
        ChartData('Apr', 45),
        ChartData('May', 55),
        ChartData('Jun', 60),
        ChartData('Jul', 65),
        ChartData('Aug', 70),
        ChartData('Sep', 60),
        ChartData('Oct', 50),
        ChartData('Nov', 45),
        ChartData('Dec', 55),
      ],
      // Add more years as needed
    };

    return yearlyData[year] ?? [];
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
