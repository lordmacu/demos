import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/notifications/i_notifications_repository.dart';
import 'package:ualet/domain/notifications/notification_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'notifications_state.dart';
part 'notifications_event.dart';
part 'notifications_bloc.freezed.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final INotificationsRepository _notificationsRepository;

  NotificationsBloc(this._notificationsRepository);

  @override
  NotificationsState get initialState => NotificationsState.initial();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    Either<BaseFailure, KtList<NotificationItem>> fOrData;

    yield NotificationsState.loading();
    fOrData = await _notificationsRepository.getNotifications();
    yield fOrData.fold(
      (error) => NotificationsState.loadFailure(error),
      (success) => NotificationsState.loadSuccess(success),
    );
  }
}
