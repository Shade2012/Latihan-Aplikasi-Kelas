import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/profile_teachers_entities.dart';

abstract class ProfileTeachersRepository {
  Future<Either<Failure, ProfileTeachersEntities>> getProfile();
}
