import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class ChartWidget extends StatefulWidget {
  final Map<double, String> titleX;
  final Map<double, String> titleY;
  final List<Map<double, double>> data;
  final List<Color> lineColors;
  final double numberDataX;
  final double numberDataY;

  const ChartWidget({
    Key key,
    this.titleX,
    this.titleY,
    this.data,
    this.lineColors,
    this.numberDataX,
    this.numberDataY,
  })  : assert(titleX != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<Color> gradientColors = [
    const Color(0xffFFFFFF),
    const Color(0xffD7C7FF),
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: AppColors.whiteColor), //Fondo
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 00, top: 30, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    var listGraph = List<LineChartBarData>();
    var i = 0;
    for (var item in widget.data) {
      List<FlSpot> lst = List<FlSpot>();
      item.forEach((key, value) {
        lst.add(FlSpot(key, value));
      });
      final LineChartBarData lineGraph = LineChartBarData(
        spots: lst,
        isCurved: true,
        colors: [widget.lineColors.asMap()[i]],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          
          show: true,
          // dotSize: 5,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [widget.lineColors.asMap()[i].withOpacity(0.5)].toList(),
        ),
      );
      listGraph.add(lineGraph);
      i++;
    }

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
              // color: const Color(0xff37434d), //Grilla  en Y
              color: AppColors.primaryColor,
              strokeWidth: 1,
              dashArray: [20, 20]);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d), //Grilla  en X
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 10,
          textStyle: const TextStyle(
              // color: AppColors.txtColorChart,
              color: AppColors.g50Color, // eje x texto
              fontWeight: FontWeight.bold,
              fontSize: 12),
          getTitles: (value) {
            return widget.titleX[value] ?? "";
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            // color: AppColors.txtColorChart, // eje y texto
            color: AppColors.g50Color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            return widget.titleY[value] ?? "";
          },
          reservedSize: 30,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(
              color: AppColors.txtColorChart, width: 1)), //Color borde grilla
      minX: 0,
      maxX: widget.numberDataX,
      minY: 0,
      maxY: widget.numberDataY,
      lineBarsData: listGraph,
    );
  }

  // LineChartData avgData() {
  //   return LineChartData(
  //     lineTouchData: LineTouchData(enabled: false),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: true,
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         textStyle: const TextStyle(
  //             color: AppColors.txtColorChart,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 2:
  //               return 'MAR';
  //             case 5:
  //               return 'JUN';
  //             case 8:
  //               return 'SEP';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         textStyle: const TextStyle(
  //           color: AppColors.titlesColorChart,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return '10k';
  //             case 3:
  //               return '30k';
  //             case 5:
  //               return '50k';
  //           }
  //           return '';
  //         },
  //         reservedSize: 28,
  //         margin: 12,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true,
  //         border: Border.all(color: const Color(0xff37434d), width: 1)),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: [
  //           FlSpot(0, 3.44),
  //           FlSpot(2.6, 3.44),
  //           FlSpot(4.9, 3.44),
  //           FlSpot(6.8, 3.44),
  //           FlSpot(8, 3.44),
  //           FlSpot(9.5, 3.44),
  //           FlSpot(11, 3.44),
  //         ],
  //         isCurved: true,
  //         colors: [
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //               .lerp(0.2),
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //               .lerp(0.2),
  //         ],
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(show: true, colors: [
  //           ColorTween(begin: Colors.black, end: Colors.red)
  //               .lerp(0.2)
  //               .withOpacity(0.1),
  //           ColorTween(begin: Colors.blue, end: Colors.yellow)
  //               .lerp(0.2)
  //               .withOpacity(0.1),
  //         ]),
  //       ),
  //     ],
  //   );
  // }
}
