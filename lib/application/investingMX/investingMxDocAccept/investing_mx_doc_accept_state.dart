part of 'investing_mx_doc_accept_bloc.dart';

@freezed
abstract class InvestingMxDocAcceptState with _$InvestingMxDocAcceptState {
  const factory InvestingMxDocAcceptState({
    @required bool checkBox1,
    @required bool checkBox2,
    @required bool checkBox3,
    @required bool checkBox4,
    bool isSubmitting,
  }) = _InvestingMxDocAcceptState;

  factory InvestingMxDocAcceptState.initial() => InvestingMxDocAcceptState(
        checkBox1: false,
        checkBox2: false,
        checkBox3: false,
        checkBox4: false,
        isSubmitting: false,
      );
}
