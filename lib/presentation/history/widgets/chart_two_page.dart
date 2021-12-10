import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartTwoWidget extends StatefulWidget {
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final int valuePeriod;
  final Map<int, double> mapSumTransactionToMonth;

  const ChartTwoWidget(
      {Key key,
      this.minX,
      this.maxX,
      this.minY,
      this.maxY,
      this.valuePeriod,
      this.mapSumTransactionToMonth})
      : super(key: key);

  @override
  _ChartTwoWidgetState createState() => _ChartTwoWidgetState();
}

class _ChartTwoWidgetState extends State<ChartTwoWidget> {
  List<Color> gradientColors = [
    const Color(0xff724dea),
    const Color(0xff7D6EEA),
  ];

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
                color: AppColors.inputColor),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.inputColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 16,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          getTitles: (value) => valueAxisX(value, widget.valuePeriod),
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          getTitles: (value) => valueAxisY(value),
          reservedSize: 28,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: widget.minX,
      maxX: widget.maxX,
      minY: widget.minY,
      maxY: widget.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: contentGraphic(widget.valuePeriod),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  String valueAxisX(double value, int valuePeriod) {
    DateTime getDate = DateTime.now();

    switch (valuePeriod) {
      case 0: // Mensual
        switch (value.toInt()) {
          case 0:
            return (valueMonthsSelect(getDate.month - 1));
          case 5:
            return (valueMonthsSelect(getDate.month));
        }
        return '';
      case 1: // Trimestral
        switch (value.toInt()) {
          case 1:
            return (valueMonthsSelect(getDate.month));
          case 5:
            return (valueMonthsSelect(getDate.month - 1));
          case 10:
            return (valueMonthsSelect(getDate.month - 2));
        }
        return '';
      case 2: // Semestral
        switch (value.toInt()) {
          case 0:
            return (valueMonthsSelect(getDate.month));
          case 2:
            return (valueMonthsSelect(getDate.month - 1));
          case 4:
            return (valueMonthsSelect(getDate.month - 2));
          case 6:
            return (valueMonthsSelect(getDate.month - 3));
          case 8:
            return (valueMonthsSelect(getDate.month - 4));
          case 10:
            return (valueMonthsSelect(getDate.month - 5));
        }
        return '';
      default:
        return '';
    }
  }

  String valueAxisY(double value) {
    switch (value.toInt()) {
      case 1:
        return '10k';
      case 3:
        return '100k';
      case 5:
        return '1M';
      case 7:
        return '10M';
      case 9:
        return '100M';
    }
    return '';
  }

  List<FlSpot> contentGraphic(int valuePeriod) {
    DateTime getDate = DateTime.now();

    switch (valuePeriod) {
      case 0: // Mensual
        return [
          FlSpot(
              0,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 1)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 1])
                  : valueValidGrphicY(0)),
          FlSpot(
              5,
              widget.mapSumTransactionToMonth.containsKey(getDate.month)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month])
                  : valueValidGrphicY(0)),
          // FlSpot(10, 0),
        ];
      case 1: // Trimestral
        return [
          FlSpot(
              1,
              widget.mapSumTransactionToMonth.containsKey(getDate.month)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month])
                  : valueValidGrphicY(0)),
          FlSpot(
              5,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 1)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 1])
                  : valueValidGrphicY(0)),
          FlSpot(
              10,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 2)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 2])
                  : valueValidGrphicY(0)),
        ];
      case 2: // Semestral
        return [
          FlSpot(
              0,
              widget.mapSumTransactionToMonth.containsKey(getDate.month)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month])
                  : valueValidGrphicY(0)),
          FlSpot(
              2,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 1)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 1])
                  : valueValidGrphicY(0)),
          FlSpot(
              4,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 2)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 2])
                  : valueValidGrphicY(0)),
          FlSpot(
              6,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 3)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 3])
                  : valueValidGrphicY(0)),
          FlSpot(
              8,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 4)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 4])
                  : valueValidGrphicY(0)),
          FlSpot(
              10,
              widget.mapSumTransactionToMonth.containsKey(getDate.month - 5)
                  ? valueValidGrphicY(
                      widget.mapSumTransactionToMonth[getDate.month - 5])
                  : valueValidGrphicY(0)),
        ];

        break;
      default:
    }
    return [FlSpot(0, 0)];
  }

  double valueValidGrphicY(double value) {
    if (value == 10000) {
      return 1;
    } else if (value > 10000 && value < 100000) {
      return 2;
    } else if (value == 100000) {
      return 3;
    } else if (value > 100000 && value < 1000000) {
      return 4;
    } else if (value == 1000000) {
      return 5;
    } else if (value > 1000000 && value < 10000000) {
      return 6;
    } else if (value == 10000000) {
      return 7;
    } else if (value > 10000000 && value < 100000000) {
      return 8;
    } else if (value == 100000000) {
      return 9;
    }
    return 0;
  }

  String valueMonthsSelect(int value) {
    switch (value) {
      case 1:
        return 'En';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Agto';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dic';

        break;
      default:
    }
    return '';
  }
}
