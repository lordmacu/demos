import 'package:freezed_annotation/freezed_annotation.dart';

part 'validar_transaction_popup_info.freezed.dart';

@freezed
abstract class ValidarTransactionPopupInfo with _$ValidarTransactionPopupInfo {
  const factory ValidarTransactionPopupInfo(
      {
        @required bool result,
        @required String message,
        @required int popUpType
      }) = _ValidarTransactionPopupInfo;

  factory ValidarTransactionPopupInfo.empty() => ValidarTransactionPopupInfo(
      result: false,
      message: "",
      popUpType: 0
  );
}
