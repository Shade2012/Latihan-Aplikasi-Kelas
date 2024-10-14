import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/google_login_entities.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entities.dart';

abstract class LoginRepository {
  Future<Either<Failure,LoginEntities>> login(String email, String password);
  Future<Either<Failure,GoogleLoginEntities>> googleLogin();
}
