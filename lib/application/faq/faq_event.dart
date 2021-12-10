part of 'faq_bloc.dart';

@freezed
abstract class FAQEvent with _$FAQEvent {
  const factory FAQEvent.getFAQItems() = _GetFAQItems;
  const factory FAQEvent.faqItemsReceived(
          Either<BaseFailure, KtList<FAQItem>> failureOrItems,
          Either<BaseFailure, ProfilingResult> profileOrFailure) =
      _FAQItemsReceived;
}
