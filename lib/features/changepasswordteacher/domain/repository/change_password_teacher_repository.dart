import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/data/models/change_password_teacher_model.dart';

abstract class ChangePasswordTeacherRepository {
  Future<void> changePasswordTeacher(ChangePasswordTeacherModel model, String token);
  Future<bool> verifyOldPasswordTeacher(String oldPassword, String token);
}
