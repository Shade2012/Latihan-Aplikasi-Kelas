import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/entities/notification_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<List<NotificationEntity>> call() async {
    return await repository.getNotifications();
  }
}
  