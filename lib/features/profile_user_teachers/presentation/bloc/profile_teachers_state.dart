import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/profile_teachers_entities.dart';

abstract class ProfileTeachersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileTeachersInitial extends ProfileTeachersState {}

class ProfileTeachersLoading extends ProfileTeachersState {}

class ProfileTeachersLoaded extends ProfileTeachersState {
  final ProfileTeachersEntities profile;
  ProfileTeachersLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileTeachersError extends ProfileTeachersState {
  final Failure failure;
  ProfileTeachersError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
