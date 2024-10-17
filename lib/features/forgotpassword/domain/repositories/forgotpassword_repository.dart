import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';

abstract class ForgotpasswordRepository {
  Future<Either<Failure,ForgotPasswordEntities>> sendOtp(String email);
  Future<Either<Failure,ForgotPasswordEntities>> verifyOtp(String otp);
  Future<Either<Failure,ForgotPasswordEntities>> resetPassword(String newPassword, String confirmPassword);
}
