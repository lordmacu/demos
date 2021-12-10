// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'redirection_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RedirectionItem {
  bool get forceRedirect;
  int get customerLevel;
  String get title;
  String get message;

  RedirectionItem copyWith(
      {bool forceRedirect, int customerLevel, String title, String message});
}

class _$RedirectionItemTearOff {
  const _$RedirectionItemTearOff();

  _RedirectionItem call(
      {@required bool forceRedirect,
      @required int customerLevel,
      @required String title,
      @required String message}) {
    return _RedirectionItem(
      forceRedirect: forceRedirect,
      customerLevel: customerLevel,
      title: title,
      message: message,
    );
  }
}

const $RedirectionItem = _$RedirectionItemTearOff();

class _$_RedirectionItem implements _RedirectionItem {
  const _$_RedirectionItem(
      {@required this.forceRedirect,
      @required this.customerLevel,
      @required this.title,
      @required this.message})
      : assert(forceRedirect != null),
        assert(customerLevel != null),
        assert(title != null),
        assert(message != null);

  @override
  final bool forceRedirect;
  @override
  final int customerLevel;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'RedirectionItem(forceRedirect: $forceRedirect, customerLevel: $customerLevel, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RedirectionItem &&
            (identical(other.forceRedirect, forceRedirect) ||
                const DeepCollectionEquality()
                    .equals(other.forceRedirect, forceRedirect)) &&
            (identical(other.customerLevel, customerLevel) ||
                const DeepCollectionEquality()
                    .equals(other.customerLevel, customerLevel)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(forceRedirect) ^
      const DeepCollectionEquality().hash(customerLevel) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(message);

  @override
  _$_RedirectionItem copyWith({
    Object forceRedirect = freezed,
    Object customerLevel = freezed,
    Object title = freezed,
    Object message = freezed,
  }) {
    return _$_RedirectionItem(
      forceRedirect:
          forceRedirect == freezed ? this.forceRedirect : forceRedirect as bool,
      customerLevel:
          customerLevel == freezed ? this.customerLevel : customerLevel as int,
      title: title == freezed ? this.title : title as String,
      message: message == freezed ? this.message : message as String,
    );
  }
}

abstract class _RedirectionItem implements RedirectionItem {
  const factory _RedirectionItem(
      {@required bool forceRedirect,
      @required int customerLevel,
      @required String title,
      @required String message}) = _$_RedirectionItem;

  @override
  bool get forceRedirect;
  @override
  int get customerLevel;
  @override
  String get title;
  @override
  String get message;

  @override
  _RedirectionItem copyWith(
      {bool forceRedirect, int customerLevel, String title, String message});
}
