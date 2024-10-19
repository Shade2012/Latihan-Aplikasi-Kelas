import '../models/change_password_model.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<void> changePassword(ChangePasswordModel model, String token);
  Future<bool> verifyOldPassword(String oldPassword, String token);

}
