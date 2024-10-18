import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user_teachers/models/profile_teachers_model.dart';

abstract class ProfileTeachersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileTeachersInitial extends ProfileTeachersState {}

class ProfileTeachersLoading extends ProfileTeachersState {}

class ProfileTeachersLoaded extends ProfileTeachersState {
  final ProfileTeachers profile;

  ProfileTeachersLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileTeachersError extends ProfileTeachersState {
  final String message;

  ProfileTeachersError({required this.message});

  @override
  List<Object?> get props => [message];
}
