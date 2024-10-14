import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user_teachers/models/profile_teachers_model.dart';

abstract class ProfileTeachersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProfileTeachers extends ProfileTeachersEvent {}
