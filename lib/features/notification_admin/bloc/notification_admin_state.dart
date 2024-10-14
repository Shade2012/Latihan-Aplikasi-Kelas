import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_admin/models/notification_admin_models.dart';

abstract class NotificationAdminState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationAdminState {}

class NotificationLoading extends NotificationAdminState {}

class NotificationLoaded extends NotificationAdminState {
  final List<NotificationAdminModel> notifications;

  NotificationLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationAdminState {
  final String message;

  NotificationError({required this.message});

  @override
  List<Object?> get props => [message];
}
