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

    if (bpmSpots.isEmpty && spo2Spots.isEmpty) {
      return const Center(
        child: Text(
          'No data available to display chart.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return LineChart(
      LineChartData(
        lineBarsData: [
          if (bpmSpots.isNotEmpty)
            LineChartBarData(
              spots: bpmSpots,
              isCurved: true,
              barWidth: 3,
              color: Colors.red,
              dotData: const FlDotData(show: false),
            ),
          if (spo2Spots.isNotEmpty)
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
