import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/models/notification_user_models.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationAdminModel>> getNotifications();
}

