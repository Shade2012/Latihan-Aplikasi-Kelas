import 'package:equatable/equatable.dart';

abstract class ProfileTeachersEvent extends Equatable {
  const ProfileTeachersEvent();

  @override
  List<Object> get props => [];
}

class LoadProfileTeachers extends ProfileTeachersEvent {}
