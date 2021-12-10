part of 'terms_bloc.dart';

@freezed
abstract class TermsEvent with _$TermsEvent {
  const factory TermsEvent.getTermsItems() = _GetTermsItems;
  const factory TermsEvent.termsItemsreceived(
      Either<BaseFailure, String> failureOrItem) = _TermsItemsReceived;
}
