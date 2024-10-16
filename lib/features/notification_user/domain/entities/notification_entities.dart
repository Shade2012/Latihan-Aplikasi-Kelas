import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String title;
  final String time;
  final String relativeTime;

  NotificationEntity({
    required this.title,
    required this.time,
    required this.relativeTime,
  });

  @override
  List<Object> get props => [title, time, relativeTime];
}
