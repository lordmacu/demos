part of 'grandes_montos_data_bloc.dart';

@freezed
abstract class GrandesMontosDataState with _$GrandesMontosDataState {
  const factory GrandesMontosDataState({
    @required SarlaftItem sarlaftItem,
    @required List<OcupationItem> ocupacionesList,
    @required List<String> ciuuList,
    @required int numPepsExtra,
    @required int numTaxesExtra,
    @required int numCurrencyExtra,
    @required List<RequiredFileItem> requiredFiles,
    @required KtList<FileResponseItem> filesResponse,
    @required bool showWorkStuff,
    @required Map<String, String> cities,
    @required Map<String, String> countries,
    @required String resCityText,
    @required String companyCityText,
  }) = _GrandesMontosDataState;

  factory GrandesMontosDataState.initial() => GrandesMontosDataState(
        numCurrencyExtra: 0,
        numTaxesExtra: 0,
        sarlaftItem: SarlaftItem.empty(),
        ocupacionesList: [],
        ciuuList: [],
        numPepsExtra: 0,
        requiredFiles: [],
        filesResponse: KtList.empty(),
        showWorkStuff: false,
        cities: {},
        countries: {},
        resCityText: '',
        companyCityText: '',

      );
}
