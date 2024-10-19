import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/models/change_password_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/domain/repository/change_password_repository.dart';

class ChangePasswordUseCase {
  final ChangePasswordRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<void> execute(String oldPassword, String newPassword, String confirmPassword, String token) {
    final model = ChangePasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    return repository.changePassword(model, token);
  }

  Future<bool> verifyOldPassword(String oldPassword, String token) {
    return repository.verifyOldPassword(oldPassword, token);
  }
}
