import 'package:ualet/domain/goals/goal_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_debit_chart_data.freezed.dart';

@freezed
abstract class EditDebitChartData with _$EditDebitChartData {
  const factory EditDebitChartData({
    @required int monthsUalet,
    @required double fee,
    @required Map<double, double> dataUalet,
    @required Map<double, double> dataOtros,
    @required bool showChart,
    @required double maxX,
    @required double maxY,
    @required Map<double, String> lx,
    @required Map<double, String> ly,
    @required int numPeriodsUalet,
    @required int monthsOthers, //Mese
  }) = _EditDebitChartData;
  factory EditDebitChartData.empty() => EditDebitChartData(
        monthsUalet: 0,
        fee: 0,
        showChart: true,
        dataUalet: {},
        dataOtros: {},
        maxX: 0,
        maxY: 0,
        lx: {},
        ly: {},
        numPeriodsUalet: 0,
        monthsOthers: 0,
      );
}
