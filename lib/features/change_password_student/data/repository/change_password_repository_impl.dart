import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/datasources/change_password_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/models/change_password_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/domain/repository/change_password_repository.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> changePassword(ChangePasswordModel model, String token) {
    return remoteDataSource.changePassword(model, token);
  }

  @override
  Future<bool> verifyOldPassword(String oldPassword, String token) {
    return remoteDataSource.verifyOldPassword(oldPassword, token);
  }
}
