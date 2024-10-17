import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/domain/entities/notification_entities.dart';

class NotificationAdminModel {
  final int id;
  final int userId;
  final String title;
  final String message;
  final String fcmToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationAdminModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationAdminModel.fromJson(Map<String, dynamic> json) {
    return NotificationAdminModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      message: json['message'],
      fcmToken: json['fcm_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  static List<NotificationAdminModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NotificationAdminModel.fromJson(json)).toList();
  }
}