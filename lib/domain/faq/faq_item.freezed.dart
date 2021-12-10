// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'faq_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$FAQItem {
  List<dynamic> get faq;
  String get type;
  String get name;

  FAQItem copyWith({List<dynamic> faq, String type, String name});
}

class _$FAQItemTearOff {
  const _$FAQItemTearOff();

  _FAQItem call(
      {@required List<dynamic> faq,
      @required String type,
      @required String name}) {
    return _FAQItem(
      faq: faq,
      type: type,
      name: name,
    );
  }
}

const $FAQItem = _$FAQItemTearOff();

class _$_FAQItem implements _FAQItem {
  const _$_FAQItem(
      {@required this.faq, @required this.type, @required this.name})
      : assert(faq != null),
        assert(type != null),
        assert(name != null);

  @override
  final List<dynamic> faq;
  @override
  final String type;
  @override
  final String name;

  @override
  String toString() {
    return 'FAQItem(faq: $faq, type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQItem &&
            (identical(other.faq, faq) ||
                const DeepCollectionEquality().equals(other.faq, faq)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(faq) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$_FAQItem copyWith({
    Object faq = freezed,
    Object type = freezed,
    Object name = freezed,
  }) {
    return _$_FAQItem(
      faq: faq == freezed ? this.faq : faq as List<dynamic>,
      type: type == freezed ? this.type : type as String,
      name: name == freezed ? this.name : name as String,
    );
  }
}

abstract class _FAQItem implements FAQItem {
  const factory _FAQItem(
      {@required List<dynamic> faq,
      @required String type,
      @required String name}) = _$_FAQItem;

  @override
  List<dynamic> get faq;
  @override
  String get type;
  @override
  String get name;

  @override
  _FAQItem copyWith({List<dynamic> faq, String type, String name});
}
