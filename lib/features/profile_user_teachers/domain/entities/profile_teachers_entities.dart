import 'package:equatable/equatable.dart';
import '../../data/models/profile_teachers_model.dart';

class ProfileTeachersEntities extends Equatable {
  final int id;
  final String? image;
  final String name;
  final String email;
  final String password;
  final String? fcmToken;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProfileTeachersEntities({
    required this.id,
    this.image,
    required this.name,
    required this.email,
    required this.password,
    this.fcmToken,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        email,
        password,
        fcmToken,
        role,
        createdAt,
        updatedAt,
      ];

  factory ProfileTeachersEntities.fromModel(ProfileTeachersModel model) {
    return ProfileTeachersEntities(
      id: model.id,
      image: model.image,
      name: model.name,
      email: model.email,
      password: model.password,
      fcmToken: model.fcmToken,
      role: model.role,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
