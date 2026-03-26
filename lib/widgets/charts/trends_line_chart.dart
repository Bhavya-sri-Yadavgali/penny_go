import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrendsLineChart extends StatelessWidget {
  final List<dynamic> stats;

  const TrendsLineChart({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats.isEmpty) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _getBottomTitles,
                reservedSize: 22,
                interval: 2,
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (stats.length - 1).toDouble(),
          minY: 0,
          maxY: _getMaxY(),
          lineBarsData: [
            LineChartBarData(
              spots: _getSpots(),
              isCurved: true,
              gradient: const LinearGradient(colors: [Colors.blue, Colors.indigoAccent]),
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.blue.withOpacity(0.3), Colors.indigoAccent.withOpacity(0.0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getMaxY() {
    double max = 0;
    for (var stat in stats) {
      if (double.parse(stat['total'].toString()) > max) {
        max = double.parse(stat['total'].toString());
      }
    }
    return max * 1.5;
  }

  Widget _getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);
    final index = value.toInt();
    if (index < 0 || index >= stats.length) return const SizedBox.shrink();

    final monthStr = stats[index]['month'];
    final date = DateFormat('yyyy-MM').parse(monthStr);
    final label = DateFormat('MMM').format(date);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(label, style: style),
    );
  }

  List<FlSpot> _getSpots() {
    return List.generate(stats.length, (i) {
      final value = double.parse(stats[i]['total'].toString());
      return FlSpot(i.toDouble(), value);
    });
  }
}
