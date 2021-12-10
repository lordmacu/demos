import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_item.freezed.dart';

@freezed
abstract class FAQItem with _$FAQItem {
  const factory FAQItem({
    @required List faq,
    @required String type,
    @required String name,
  }) = _FAQItem;

  factory FAQItem.empty() => FAQItem(faq: [], type: '', name: '');
}
