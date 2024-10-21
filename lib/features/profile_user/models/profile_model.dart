import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/entities/profile_user_entities.dart';

class ProfileUserModel extends ProfileUserEntity {
  ProfileUserModel({
    required int id,
    String? image,
    required String name,
    required String email,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
    id: id,
    image: image,
    name: name,
    email: email,
    role: role,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      id: json['id'],
      // Check if image is a map, if so, set image to null
      image: json['image'] is Map ? null : json['image'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}