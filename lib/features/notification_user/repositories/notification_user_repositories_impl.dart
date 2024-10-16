import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/data/datasources/notification_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/entities/notification_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/repositories/notification_repository.dart';


class NotificationAdminRepository implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationAdminRepository({required this.remoteDataSource});

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    try {
      final notificationModels = await remoteDataSource.getNotifications();

      return notificationModels.map((notificationModel) => NotificationEntity(
        title: notificationModel.title,
        time: notificationModel.time,
        relativeTime: notificationModel.relativeTime,
      )).toList();
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }
}
