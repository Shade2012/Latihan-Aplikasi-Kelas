import 'package:equatable/equatable.dart';

class ProfileUserEntity extends Equatable {
  final int id;
  final String? image;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileUserEntity({
    required this.id,
    this.image,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, image, name, email, role, createdAt, updatedAt];
}
