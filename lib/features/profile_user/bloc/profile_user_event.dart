import 'package:equatable/equatable.dart';

abstract class ProfileUserEvent extends Equatable {
  const ProfileUserEvent();

  @override
  List<Object> get props => [];
}

class LoadProfileUser extends ProfileUserEvent {}
