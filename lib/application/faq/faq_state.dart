part of 'faq_bloc.dart';

@freezed
abstract class FAQState with _$FAQState {
  const factory FAQState.initial() = Initial;
  const factory FAQState.loadInProgress() = DataTransferInProgress;
  const factory FAQState.loadSuccess(
      KtList<FAQItem> faqItems, ProfilingResult profile) = LoadSuccess;
  const factory FAQState.loadFailure(BaseFailure failure) = LoadFailure;
}
