import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/profile_teachers_entities.dart';
import '../repositories/profile_teachers_repository.dart';

class GetProfileUseCase {
  final ProfileTeachersRepository profileTeachersRepository;

  GetProfileUseCase(this.profileTeachersRepository);

  Future<Either<Failure, ProfileTeachersEntities>> execute() async {
    return await profileTeachersRepository.getProfile();
  }
}
