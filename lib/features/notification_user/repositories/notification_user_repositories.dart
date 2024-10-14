import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/models/notification_user_models.dart';

class NotificationAdminRepository {
  Future<List<NotificationAdminModel>> fetchNotifications() async {
    // Simulasi data notifikasi
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay network
    return [
      NotificationAdminModel(
          title: "Jam Pelajaran ketuju", time: "15:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran keenam", time: "14:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran kelima", time: "13:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran keempat", time: "11:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran ketiga", time: "10:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran kedua", time: "09:30", relativeTime: "15 minutes ago"),
      NotificationAdminModel(
          title: "Jam Pelajaran pertama", time: "07:30", relativeTime: "4 hours ago"),
    ];
  }
}
