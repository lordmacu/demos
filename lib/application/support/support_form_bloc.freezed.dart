// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'support_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SupportFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  });
}

class _$SupportFormEventTearOff {
  const _$SupportFormEventTearOff();

  _SupportMessageChanged supportMessageChanged(SupportMessage message) {
    return _SupportMessageChanged(
      message,
    );
  }

  _PostSupportMessage postSupportMessage() {
    return const _PostSupportMessage();
  }

  _FileChanged fileChanged(File file) {
    return _FileChanged(
      file,
    );
  }

  _FileDeleted fileDeleted() {
    return const _FileDeleted();
  }

  _isSubmitting isSubmitting(bool value) {
    return _isSubmitting(
      value,
    );
  }
}

const $SupportFormEvent = _$SupportFormEventTearOff();

class _$_SupportMessageChanged implements _SupportMessageChanged {
  const _$_SupportMessageChanged(this.message) : assert(message != null);

  @override
  final SupportMessage message;

  @override
  String toString() {
    return 'SupportFormEvent.supportMessageChanged(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SupportMessageChanged &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$_SupportMessageChanged copyWith({
    Object message = freezed,
  }) {
    return _$_SupportMessageChanged(
      message == freezed ? this.message : message as SupportMessage,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return supportMessageChanged(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (supportMessageChanged != null) {
      return supportMessageChanged(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return supportMessageChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (supportMessageChanged != null) {
      return supportMessageChanged(this);
    }
    return orElse();
  }
}

abstract class _SupportMessageChanged implements SupportFormEvent {
  const factory _SupportMessageChanged(SupportMessage message) =
      _$_SupportMessageChanged;

  SupportMessage get message;

  _SupportMessageChanged copyWith({SupportMessage message});
}

class _$_PostSupportMessage implements _PostSupportMessage {
  const _$_PostSupportMessage();

  @override
  String toString() {
    return 'SupportFormEvent.postSupportMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PostSupportMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return postSupportMessage();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSupportMessage != null) {
      return postSupportMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return postSupportMessage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postSupportMessage != null) {
      return postSupportMessage(this);
    }
    return orElse();
  }
}

abstract class _PostSupportMessage implements SupportFormEvent {
  const factory _PostSupportMessage() = _$_PostSupportMessage;
}

class _$_FileChanged implements _FileChanged {
  const _$_FileChanged(this.file) : assert(file != null);

  @override
  final File file;

  @override
  String toString() {
    return 'SupportFormEvent.fileChanged(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileChanged &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @override
  _$_FileChanged copyWith({
    Object file = freezed,
  }) {
    return _$_FileChanged(
      file == freezed ? this.file : file as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return fileChanged(file);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fileChanged != null) {
      return fileChanged(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return fileChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fileChanged != null) {
      return fileChanged(this);
    }
    return orElse();
  }
}

abstract class _FileChanged implements SupportFormEvent {
  const factory _FileChanged(File file) = _$_FileChanged;

  File get file;

  _FileChanged copyWith({File file});
}

class _$_FileDeleted implements _FileDeleted {
  const _$_FileDeleted();

  @override
  String toString() {
    return 'SupportFormEvent.fileDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FileDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return fileDeleted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fileDeleted != null) {
      return fileDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return fileDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fileDeleted != null) {
      return fileDeleted(this);
    }
    return orElse();
  }
}

abstract class _FileDeleted implements SupportFormEvent {
  const factory _FileDeleted() = _$_FileDeleted;
}

class _$_isSubmitting implements _isSubmitting {
  const _$_isSubmitting(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'SupportFormEvent.isSubmitting(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _isSubmitting &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$_isSubmitting copyWith({
    Object value = freezed,
  }) {
    return _$_isSubmitting(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result supportMessageChanged(SupportMessage message),
    @required Result postSupportMessage(),
    @required Result fileChanged(File file),
    @required Result fileDeleted(),
    @required Result isSubmitting(bool value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return isSubmitting(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result supportMessageChanged(SupportMessage message),
    Result postSupportMessage(),
    Result fileChanged(File file),
    Result fileDeleted(),
    Result isSubmitting(bool value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isSubmitting != null) {
      return isSubmitting(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result supportMessageChanged(_SupportMessageChanged value),
    @required Result postSupportMessage(_PostSupportMessage value),
    @required Result fileChanged(_FileChanged value),
    @required Result fileDeleted(_FileDeleted value),
    @required Result isSubmitting(_isSubmitting value),
  }) {
    assert(supportMessageChanged != null);
    assert(postSupportMessage != null);
    assert(fileChanged != null);
    assert(fileDeleted != null);
    assert(isSubmitting != null);
    return isSubmitting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result supportMessageChanged(_SupportMessageChanged value),
    Result postSupportMessage(_PostSupportMessage value),
    Result fileChanged(_FileChanged value),
    Result fileDeleted(_FileDeleted value),
    Result isSubmitting(_isSubmitting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isSubmitting != null) {
      return isSubmitting(this);
    }
    return orElse();
  }
}

abstract class _isSubmitting implements SupportFormEvent {
  const factory _isSubmitting(bool value) = _$_isSubmitting;

  bool get value;

  _isSubmitting copyWith({bool value});
}

mixin _$SupportFormState {
  bool get isSubmitting;
  SupportMessage get message;
  File get file;
  Option<Either<BaseFailure, SupportMessage>> get postFailureorSuccessOption;

  SupportFormState copyWith(
      {bool isSubmitting,
      SupportMessage message,
      File file,
      Option<Either<BaseFailure, SupportMessage>> postFailureorSuccessOption});
}

class _$SupportFormStateTearOff {
  const _$SupportFormStateTearOff();

  _SupportFormState call(
      {@required
          bool isSubmitting,
      @required
          SupportMessage message,
      File file,
      @required
          Option<Either<BaseFailure, SupportMessage>>
              postFailureorSuccessOption}) {
    return _SupportFormState(
      isSubmitting: isSubmitting,
      message: message,
      file: file,
      postFailureorSuccessOption: postFailureorSuccessOption,
    );
  }
}

const $SupportFormState = _$SupportFormStateTearOff();

class _$_SupportFormState implements _SupportFormState {
  const _$_SupportFormState(
      {@required this.isSubmitting,
      @required this.message,
      this.file,
      @required this.postFailureorSuccessOption})
      : assert(isSubmitting != null),
        assert(message != null),
        assert(postFailureorSuccessOption != null);

  @override
  final bool isSubmitting;
  @override
  final SupportMessage message;
  @override
  final File file;
  @override
  final Option<Either<BaseFailure, SupportMessage>> postFailureorSuccessOption;

  @override
  String toString() {
    return 'SupportFormState(isSubmitting: $isSubmitting, message: $message, file: $file, postFailureorSuccessOption: $postFailureorSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SupportFormState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)) &&
            (identical(other.postFailureorSuccessOption,
                    postFailureorSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.postFailureorSuccessOption,
                    postFailureorSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(file) ^
      const DeepCollectionEquality().hash(postFailureorSuccessOption);

  @override
  _$_SupportFormState copyWith({
    Object isSubmitting = freezed,
    Object message = freezed,
    Object file = freezed,
    Object postFailureorSuccessOption = freezed,
  }) {
    return _$_SupportFormState(
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      message: message == freezed ? this.message : message as SupportMessage,
      file: file == freezed ? this.file : file as File,
      postFailureorSuccessOption: postFailureorSuccessOption == freezed
          ? this.postFailureorSuccessOption
          : postFailureorSuccessOption
              as Option<Either<BaseFailure, SupportMessage>>,
    );
  }
}

abstract class _SupportFormState implements SupportFormState {
  const factory _SupportFormState(
      {@required
          bool isSubmitting,
      @required
          SupportMessage message,
      File file,
      @required
          Option<Either<BaseFailure, SupportMessage>>
              postFailureorSuccessOption}) = _$_SupportFormState;

  @override
  bool get isSubmitting;
  @override
  SupportMessage get message;
  @override
  File get file;
  @override
  Option<Either<BaseFailure, SupportMessage>> get postFailureorSuccessOption;

  @override
  _SupportFormState copyWith(
      {bool isSubmitting,
      SupportMessage message,
      File file,
      Option<Either<BaseFailure, SupportMessage>> postFailureorSuccessOption});
}
