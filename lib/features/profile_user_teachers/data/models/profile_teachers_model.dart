import '../../domain/entities/profile_teachers_entities.dart';

class ProfileTeachersModel extends ProfileTeachersEntities {
  const ProfileTeachersModel({
    required super.id,
    required super.image,
    required super.name,
    required super.email,
    required super.password,
    required super.fcmToken,
    required super.role,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProfileTeachersModel.fromJson(Map<String, dynamic> json) {
    return ProfileTeachersModel(
      id: json['id'],
      image: json['image'] is String ? json['image'] : '',
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      password: json['password'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
      role: json['role'] ?? 'Unknown',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'password': password,
      'fcmToken': fcmToken,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
