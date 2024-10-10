import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entities.dart';

abstract class LoginRepository {
  Future<Either<Failure,LoginEntities>> login(String email, String password);
}
