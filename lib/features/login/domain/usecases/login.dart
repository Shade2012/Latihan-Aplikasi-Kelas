import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/repositories/login_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entities.dart';


class Login{
  final LoginRepository loginRepository;
  Login(this.loginRepository);

  //dijalankan
  Future<Either<Failure,LoginEntities>> execute(String email, String password) async {
    try {
      return await loginRepository.login(email, password);
    } catch (e) {
      return Left(Failure(message: 'Failed to login')); // Return Failure on any exception
    }
  }
}
