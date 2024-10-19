import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/models/change_password_model.dart';

abstract class ChangePasswordRepository {
  Future<void> changePassword(ChangePasswordModel model, String token);
  Future<bool> verifyOldPassword(String oldPassword, String token);
}
