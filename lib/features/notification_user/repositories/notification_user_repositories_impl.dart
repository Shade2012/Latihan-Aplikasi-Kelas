import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/data/datasources/notification_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/entities/notification_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/repositories/notification_repository.dart';

class NotificationAdminRepository implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationAdminRepository({required this.remoteDataSource});

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    try {
      // Mengambil data dari remote data source
      final notificationModels = await remoteDataSource.getNotifications();

      // Mengonversi model menjadi entitas
      return notificationModels.map((notificationModel) {
        return NotificationEntity(
          title: notificationModel.title,
          message: notificationModel.message, 
          createdAt: notificationModel.createdAt, 
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }
}