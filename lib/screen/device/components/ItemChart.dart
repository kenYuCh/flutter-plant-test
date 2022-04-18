import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BuildChart extends StatefulWidget {
  const BuildChart({Key? key}) : super(key: key);

  @override
  _buildChartState createState() => _buildChartState();
}

class _buildChartState extends State<BuildChart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        titlesData: LineTitles.getTimeData(),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.white, strokeWidth: 1.0);
          },
          drawVerticalLine: true, // bg-VerticalLine
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.red,
            barWidth: 5.0,
            dotData: FlDotData(show: false),
            spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 4),
              FlSpot(3.4, 3),
              FlSpot(5.8, 4),
              FlSpot(8.5, 5),
              FlSpot(9.8, 3),
              FlSpot(11, 4),
            ],
            belowBarData: BarAreaData(
              show: false,
              color: Color.fromARGB(66, 192, 192, 192),
            ),
          )
        ],
      ),
    );
  }
}

class LineTitles {
  static getTimeData() => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                color: Color(0xff72719b),
                fontWeight: FontWeight.bold,
                fontSize: 10,
              );
              Widget text;
              switch (value.toInt()) {
                case 2:
                  text = const Text('SEPT', style: style);
                  break;
                case 7:
                  text = const Text('OCT', style: style);
                  break;
                case 12:
                  text = const Text('DEC', style: style);
                  break;
                default:
                  text = const Text('');
                  break;
              }
              return Padding(
                child: text,
                padding: const EdgeInsets.only(top: 10.0),
              );
            },
          ),
        ),
      );
}
