import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/filter_drop_down_button.dart';

class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Overview', style: TextstyleConstants.homePlaceHolderTitle),
            FilterDropDownButton(label: 'This Week'),
          ],
        ),
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 6,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const days = [
                        'SUN',
                        'MON',
                        'TUE',
                        'WED',
                        'THU',
                        'FRI',
                        'SAT',
                      ];
                      final day = days[value.toInt()];
                      final isWeekend = value == 0 || value == 6;
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          day,
                          style: TextStyle(
                            color: isWeekend ? Colors.red : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}h',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.white, width: 1),
                  bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              barGroups: [
                _makeGroup(0, 2.5, '2h30m'),
                _makeGroup(1, 3.5, '3h30m'),
                _makeGroup(2, 5, '5H'),
                _makeGroup(3, 3, '3h'),
                _makeGroup(4, 4, '4h'),
                _makeGroup(5, 4.5, '4h30m', isFriday: true),
                _makeGroup(6, 2, '2h'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData _makeGroup(
    int x,
    double y,
    String label, {
    bool isFriday = false,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 20,
          color: isFriday ? Colors.blueAccent : Colors.grey,
          borderRadius: BorderRadius.circular(4),
          rodStackItems: [],
          backDrawRodData: BackgroundBarChartRodData(show: false),
        ),
      ],
      showingTooltipIndicators: [],
      barsSpace: 4,
    );
  }
}

// class BarLabel extends BarChartRodTopYLabel {
//   final String text;
//   final TextStyle textStyle;

//   BarLabel({required this.text, required this.textStyle});
