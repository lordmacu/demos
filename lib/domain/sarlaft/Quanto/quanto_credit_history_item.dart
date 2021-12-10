import 'package:freezed_annotation/freezed_annotation.dart';

part 'quanto_credit_history_item.freezed.dart';

@freezed
abstract class QuantoCreditHistoryItem with _$QuantoCreditHistoryItem {
  const factory QuantoCreditHistoryItem({
    @required String clave,
    @required String identificacion,
    @required String primerApellido,
    @required String producto,
    @required String tipoIdentificacion,
    @required String usuario,
    @required int ingress,
    @required int egress

  }) = _QuantoCreditHistoryItem;
  factory QuantoCreditHistoryItem.empty() => QuantoCreditHistoryItem(
        clave: '',
        identificacion: '',
        primerApellido: '',
        producto: '',
        tipoIdentificacion: '',
        usuario: '',
        ingress: 0,
        egress: 0
      );  


}
