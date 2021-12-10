part of 'support_form_bloc.dart';

@freezed
abstract class SupportFormEvent with _$SupportFormEvent {
  const factory SupportFormEvent.supportMessageChanged(SupportMessage message) =
      _SupportMessageChanged;
  const factory SupportFormEvent.postSupportMessage() = _PostSupportMessage;
  const factory SupportFormEvent.fileChanged(File file) = _FileChanged;
  const factory SupportFormEvent.fileDeleted() = _FileDeleted;
  const factory SupportFormEvent.isSubmitting(bool value) = _isSubmitting;
}
