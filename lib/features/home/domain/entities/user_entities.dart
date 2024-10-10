import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String? profilePicture;
  final String nameUser;
  final String email;
  final String? emailVerified;
  final String createdAt;
  final String updateAt;

  const User({
    required this.id,
    this.profilePicture,
    required this.nameUser,
    required this.email,
    this.emailVerified,
    required this.createdAt,
    required this.updateAt,
  });

  @override
  List<Object?> get props => [
    id,
    profilePicture,
    nameUser,
    email,
    emailVerified,
    createdAt,
    updateAt
  ];
}
