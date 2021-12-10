// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'support_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SupportMessage {
  String get message;
  File get file;
  String get typology;

  SupportMessage copyWith({String message, File file, String typology});
}

class _$SupportMessageTearOff {
  const _$SupportMessageTearOff();

  _SupportMessage call({@required String message, File file, String typology}) {
    return _SupportMessage(
      message: message,
      file: file,
      typology: typology,
    );
  }
}

const $SupportMessage = _$SupportMessageTearOff();

class _$_SupportMessage implements _SupportMessage {
  const _$_SupportMessage({@required this.message, this.file, this.typology})
      : assert(message != null);

  @override
  final String message;
  @override
  final File file;
  @override
  final String typology;

  @override
  String toString() {
    return 'SupportMessage(message: $message, file: $file, typology: $typology)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SupportMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.typology, typology) ||
                const DeepCollectionEquality()
                    .equals(other.typology, typology)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(typology);

  @override
  _$_SupportMessage copyWith({
    Object message = freezed,
    Object file = freezed,
    Object typology = freezed,
  }) {
    return _$_SupportMessage(
      message: message == freezed ? this.message : message as String,
      file: file == freezed ? this.file : file as File,
      typology: typology == freezed ? this.typology : typology as String,
    );
  }
}

abstract class _SupportMessage implements SupportMessage {
  const factory _SupportMessage(
      {@required String message,
      File file,
      String typology}) = _$_SupportMessage;

  @override
  String get message;
  @override
  File get file;
  @override
  String get typology;

  @override
  _SupportMessage copyWith({String message, File file, String typology});
}
