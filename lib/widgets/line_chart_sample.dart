import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample5 extends StatelessWidget {
  final List<double> heartRates;
  final List<double> spo2Levels;

  const LineChartSample5({
    super.key,
    required this.heartRates,
    required this.spo2Levels,
  });

  List<FlSpot> convertToSpots(List<double> values) {
    return List.generate(
      values.length,
      (index) => FlSpot(index.toDouble(), values[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> bpmSpots = convertToSpots(heartRates);
    final List<FlSpot> spo2Spots = convertToSpots(spo2Levels);

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: bpmSpots,
            isCurved: true,
            barWidth: 3,
            color: Colors.red,
            dotData: const FlDotData(show: false),
          ),
          LineChartBarData(
            spots: spo2Spots,
            isCurved: true,
            barWidth: 3,
            color: Colors.blue,
            dotData: const FlDotData(show: false),
          ),
        ],
        titlesData: const FlTitlesData(show: true),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
      ),
    );
  }
}
