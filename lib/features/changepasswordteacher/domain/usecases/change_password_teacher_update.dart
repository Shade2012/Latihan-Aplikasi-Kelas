import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/data/models/change_password_teacher_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/domain/repository/change_password_teacher_repository.dart';

class ChangePasswordTeacherUseCase {
  final ChangePasswordTeacherRepository repository;

  ChangePasswordTeacherUseCase(this.repository);

  Future<void> execute(String oldPassword, String newPassword, String confirmPassword, String token) {
    final model = ChangePasswordTeacherModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    return repository.changePasswordTeacher(model, token);
  }

  Future<bool> verifyOldPasswordTeacher(String oldPassword, String token) {
    return repository.verifyOldPasswordTeacher(oldPassword, token);
  }
}
