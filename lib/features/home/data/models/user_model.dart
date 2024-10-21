// class User


import '../../domain/entities/user_entities.dart';

class UserModel extends UserEntity{
  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
