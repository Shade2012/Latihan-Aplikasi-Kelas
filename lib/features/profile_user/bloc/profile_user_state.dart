import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/entities/profile_user_entities.dart';

abstract class ProfileUserState extends Equatable {
  const ProfileUserState();

  @override
  List<Object> get props => [];
}

class ProfileUserInitial extends ProfileUserState {}

class ProfileUserLoading extends ProfileUserState {}

class ProfileUserLoaded extends ProfileUserState {
  final ProfileUserEntity profileUser; // Menggunakan ProfileUserEntity

  const ProfileUserLoaded({required this.profileUser});

  @override
  List<Object> get props => [profileUser];
}

class ProfileUserError extends ProfileUserState {
  final String message;

  const ProfileUserError({required this.message});

  @override
  List<Object> get props => [message];
}
