import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/google_login_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/repositories/login_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entities.dart';


class GoogleLogin{
  final LoginRepository loginRepository;
  GoogleLogin(this.loginRepository);

  //dijalankan
  Future<Either<Failure,GoogleLoginEntities>> execute() async {
    try {
      return await loginRepository.googleLogin();
    } catch (e) {
      return Left(Failure(message: 'Login Gagal Akun Tidak Terdaftar')); // Return Failure on any exception
    }
  }
}
