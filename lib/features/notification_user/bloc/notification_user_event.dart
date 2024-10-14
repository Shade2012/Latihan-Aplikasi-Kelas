import 'package:equatable/equatable.dart';

abstract class NotificationAdminEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadNotifications extends NotificationAdminEvent {}
