import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/repositories/forgotpassword_repository.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/google_login_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/repositories/login_repository.dart';

import '../../../../core/error/failure.dart';


class ForgotPasswordResetPassword{
  final ForgotpasswordRepository forgotpasswordRepository;
  ForgotPasswordResetPassword(this.forgotpasswordRepository);
  //dijalankan
  Future<Either<Failure,ForgotPasswordEntities>> execute(String newPassword, String confirmPassword) async {
    try {
      return await forgotpasswordRepository.resetPassword(newPassword,confirmPassword);
    } catch (e) {
      return Left(Failure(message: 'Reset Password Gagal Akun Tidak Terdaftar')); // Return Failure on any exception
    }
  }

}
