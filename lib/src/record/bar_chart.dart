import 'dart:math';

import 'package:cubestation_flutter/common/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CSBarChart extends StatelessWidget {
  const CSBarChart();

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: FlGridData(show: true),
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      angle: -pi / 2,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.blue.withOpacity(0.2),
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 16,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: CSBarChart(),
    );
  }
}

class BarChartSample4 extends StatefulWidget {
  BarChartSample4({super.key});

  final Color dark = Colors.cyan.withOpacity(0.6);
  final Color normal = Colors.cyan.withOpacity(0.3);
  final Color light = Colors.cyan;

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: CSColors.divider,
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: barsSpace,
                barGroups: getData(barsWidth, barsSpace),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, widget.dark),
              BarChartRodStackItem(2000000000, 12000000000, widget.normal),
              BarChartRodStackItem(12000000000, 17000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, widget.dark),
              BarChartRodStackItem(13000000000, 14000000000, widget.normal),
              BarChartRodStackItem(14000000000, 24000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, widget.dark),
              BarChartRodStackItem(6000000000.5, 18000000000, widget.normal),
              BarChartRodStackItem(18000000000, 23000000000.5, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, widget.dark),
              BarChartRodStackItem(9000000000, 15000000000, widget.normal),
              BarChartRodStackItem(15000000000, 29000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, widget.dark),
              BarChartRodStackItem(2000000000.5, 17000000000.5, widget.normal),
              BarChartRodStackItem(17000000000.5, 32000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, widget.dark),
              BarChartRodStackItem(11000000000, 18000000000, widget.normal),
              BarChartRodStackItem(18000000000, 31000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 80000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, widget.dark),
              BarChartRodStackItem(14000000000, 27000000000, widget.normal),
              BarChartRodStackItem(27000000000, 35000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, widget.dark),
              BarChartRodStackItem(8000000000, 24000000000, widget.normal),
              BarChartRodStackItem(24000000000, 31000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, widget.dark),
              BarChartRodStackItem(6000000000.5, 12000000000.5, widget.normal),
              BarChartRodStackItem(12000000000.5, 15000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, widget.dark),
              BarChartRodStackItem(9000000000, 15000000000, widget.normal),
              BarChartRodStackItem(15000000000, 17000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 34000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, widget.dark),
              BarChartRodStackItem(6000000000, 23000000000, widget.normal),
              BarChartRodStackItem(23000000000, 34000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, widget.dark),
              BarChartRodStackItem(7000000000, 24000000000, widget.normal),
              BarChartRodStackItem(24000000000, 32000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 14000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, widget.dark),
              BarChartRodStackItem(1000000000.5, 12000000000, widget.normal),
              BarChartRodStackItem(12000000000, 14000000000.5, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 20000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, widget.dark),
              BarChartRodStackItem(4000000000, 15000000000, widget.normal),
              BarChartRodStackItem(15000000000, 20000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, widget.dark),
              BarChartRodStackItem(4000000000, 15000000000, widget.normal),
              BarChartRodStackItem(15000000000, 24000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, widget.dark),
              BarChartRodStackItem(1000000000.5, 12000000000, widget.normal),
              BarChartRodStackItem(12000000000, 14000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 27000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, widget.dark),
              BarChartRodStackItem(7000000000, 25000000000, widget.normal),
              BarChartRodStackItem(25000000000, 27000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, widget.dark),
              BarChartRodStackItem(6000000000, 23000000000, widget.normal),
              BarChartRodStackItem(23000000000, 29000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 16000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, widget.dark),
              BarChartRodStackItem(9000000000, 15000000000, widget.normal),
              BarChartRodStackItem(15000000000, 16000000000.5, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, widget.dark),
              BarChartRodStackItem(7000000000, 12000000000.5, widget.normal),
              BarChartRodStackItem(12000000000.5, 15000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
