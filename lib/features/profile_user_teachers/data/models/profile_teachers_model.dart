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
      image: json['image'] ?? '',
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      password: json['password'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
      role: json['role'] ?? 'Unknown',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
