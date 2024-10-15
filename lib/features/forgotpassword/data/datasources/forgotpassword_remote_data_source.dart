import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/models/forgot_password_model.dart';

abstract class ForgotpasswordRemoteDataSource {
  Future <ForgotPasswordModel> sendOtp(String email);//kemungkinan itu ada 2 hasil :  gagal (failure) / berhasil (List User)
  Future <ForgotPasswordModel> verifyOtp(String otp);
  Future <ForgotPasswordModel> resetPassword(String newPassword,String confirmPassword);
}
