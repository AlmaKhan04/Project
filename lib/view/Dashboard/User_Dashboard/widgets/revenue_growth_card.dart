import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueGrowthChart extends StatefulWidget {
  const RevenueGrowthChart({super.key});

  @override
  _RevenueGrowthChartState createState() => _RevenueGrowthChartState();
}

class _RevenueGrowthChartState extends State<RevenueGrowthChart> {
  String _selectedYear = '2024'; // Default selected year
  final List<String> _years = ['2023', '2024', '2025']; // List of years

  // Sample data for different years
  final Map<String, List<ChartData>> _dataByYear = {
    '2023': [
      ChartData('Jan', 900),
      ChartData('Feb', 1100),
      ChartData('Mar', 1300),
      ChartData('Apr', 1400),
      ChartData('May', 1600),
      ChartData('Jun', 1700),
      ChartData('Jul', 1800),
      ChartData('Aug', 1900),
      ChartData('Sep', 2000),
      ChartData('Oct', 2100),
      ChartData('Nov', 2200),
      ChartData('Dec', 2300),
    ],
    '2024': [
      ChartData('Jan', 1000),
      ChartData('Feb', 1200),
      ChartData('Mar', 1500),
      ChartData('Apr', 1800),
      ChartData('May', 2000),
      ChartData('Jun', 2500),
      ChartData('Jul', 2600),
      ChartData('Aug', 2700),
      ChartData('Sep', 2800),
      ChartData('Oct', 2900),
      ChartData('Nov', 3000),
      ChartData('Dec', 3100),
    ],
    '2025': [
      ChartData('Jan', 1100),
      ChartData('Feb', 1300),
      ChartData('Mar', 1600),
      ChartData('Apr', 1900),
      ChartData('May', 2100),
      ChartData('Jun', 2600),
      ChartData('Jul', 2700),
      ChartData('Aug', 2800),
      ChartData('Sep', 2900),
      ChartData('Oct', 3000),
      ChartData('Nov', 3100),
      ChartData('Dec', 3200),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Select Year:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8), // Adjust spacing as needed
            DropdownButton<String>(
              value: _selectedYear,
              items: _years.map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue!;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(title: AxisTitle(text: 'Revenue')),
            title: ChartTitle(text: 'Revenue Growth for $_selectedYear'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              LineSeries<ChartData, String>(
                dataSource: _dataByYear[_selectedYear]!,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.revenue,
                color: Colors.blue, // Customize the line color
                width: 3,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  color: Colors.red, // Customize the marker color
                  borderWidth: 2,
                  shape: DataMarkerType.circle, // Set marker shape to circle
                ),
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String month;
  final double revenue;

  ChartData(this.month, this.revenue);
}
