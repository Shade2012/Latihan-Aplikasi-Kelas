
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_admin/models/notification_admin_models.dart';

class NotificationAdminRepository {
  Future<List<NotificationAdminModel>> fetchNotifications() async {
    // Simulasi data notifikasi
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay network
    return [
      NotificationAdminModel(
          title: "Jam Pelajaran ketuju", time: "15:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran keenam", time: "14:30", relativeTime: "1 hour 15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran kelima", time: "13:30", relativeTime: "2 hour 15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran keempat", time: "11:30", relativeTime: "4 hour 15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran ketiga", time: "10:30", relativeTime: "5 hour 15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran kedua", time: "09:30", relativeTime: "6 hour 15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran pertama", time: "07:30", relativeTime: "8 hour 15 minutes ago"),
    ];
  }
}
