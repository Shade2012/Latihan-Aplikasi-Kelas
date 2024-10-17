class NotificationAdminModel {
  final String title;
  final String time;
  final String relativeTime;

  NotificationAdminModel({required this.title, required this.time, required this.relativeTime});

  factory NotificationAdminModel.fromJson(Map<String, dynamic> json) {
    return NotificationAdminModel(
      title: json['title'],
      time: json['time'],
      relativeTime: json['relative_time'],
    );
  }

  static List<NotificationAdminModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NotificationAdminModel.fromJson(json)).toList();
  }
}
