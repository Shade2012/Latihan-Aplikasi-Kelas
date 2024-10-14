import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/repositories/notification_user_repositories.dart';

import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/models/notification_user_models.dart';


class NotificationAdminBloc extends Bloc<NotificationAdminEvent, NotificationAdminState> {
  final NotificationAdminRepository notificationRepository;

  NotificationAdminBloc({required this.notificationRepository}) : super(NotificationInitial()) {
    on<LoadNotifications>((event, emit) async {
      emit(NotificationLoading());
      try {
        final notifications = await notificationRepository.fetchNotifications();
        emit(NotificationLoaded(notifications: notifications));
      } catch (e) {
        emit(NotificationError(message: e.toString()));
      }
    });
  }
}
