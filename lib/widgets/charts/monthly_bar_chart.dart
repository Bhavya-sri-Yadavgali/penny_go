import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyBarChart extends StatelessWidget {
  final List<dynamic> stats;

  const MonthlyBarChart({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats.isEmpty) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _getMaxY(),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '₹${rod.toY.toStringAsFixed(0)}',
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _getBottomTitles,
                reservedSize: 38,
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: _getBarGroups(),
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
    return max * 1.2;
  }

  Widget _getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);
    final index = value.toInt();
    if (index < 0 || index >= stats.length) return const SizedBox.shrink();

    final monthStr = stats[index]['month']; // YYYY-MM
    final date = DateFormat('yyyy-MM').parse(monthStr);
    final label = DateFormat('MMM').format(date);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(label, style: style),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return List.generate(stats.length, (i) {
      final value = double.parse(stats[i]['total'].toString());
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: value,
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigo.withOpacity(0.4)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }
}
