part of 'investing_mx_doc_accept_bloc.dart';

@freezed
abstract class InvestingMxDocAcceptEvent with _$InvestingMxDocAcceptEvent {
  const factory InvestingMxDocAcceptEvent.initial() = _initial;
  const factory InvestingMxDocAcceptEvent.checkBox1() = _checkBox1;
  const factory InvestingMxDocAcceptEvent.checkBox2() = _checkBox2;
  const factory InvestingMxDocAcceptEvent.checkBox3() = _checkBox3;
  const factory InvestingMxDocAcceptEvent.checkBox4() = _checkBox4;
  const factory InvestingMxDocAcceptEvent.isSubmitting(bool value) =
      _isSubmitting;
}
