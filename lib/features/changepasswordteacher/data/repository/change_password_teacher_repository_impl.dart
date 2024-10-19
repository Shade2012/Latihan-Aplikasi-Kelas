import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/data/datasources/change_password_teacher_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/data/models/change_password_teacher_model.dart';

import '../../domain/repository/change_password_teacher_repository.dart';

class ChangePasswordTeacherRepositoryImpl implements ChangePasswordTeacherRepository {
  final ChangePasswordTeacherDataSource remoteDataSource;

  ChangePasswordTeacherRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> changePasswordTeacher(ChangePasswordTeacherModel model, String token) {
    return remoteDataSource.changePasswordTeacher(model, token);
  }

  @override
  Future<bool> verifyOldPasswordTeacher(String oldPassword, String token) {
    return remoteDataSource.verifyOldPasswordTeacher(oldPassword, token);
  }
}
