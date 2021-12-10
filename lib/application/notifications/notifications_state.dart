part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _initial;
  const factory NotificationsState.loading() = _loading;
  const factory NotificationsState.loadSuccess(KtList<NotificationItem> data) =
      _loadSuccess;
  const factory NotificationsState.loadFailure(BaseFailure failure) =
      _loadFailure;
}
