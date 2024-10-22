import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserEntity extends Equatable{
  final int id;
  final String? image;
  final String name;
  final String email;
  final String password;
  final String? fcmToken;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
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

  factory UserEntity.fromModel(UserModel model) {
    return UserModel(
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
