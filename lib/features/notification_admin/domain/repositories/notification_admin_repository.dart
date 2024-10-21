import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/entities/notification_entities.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getNotifications();
}
