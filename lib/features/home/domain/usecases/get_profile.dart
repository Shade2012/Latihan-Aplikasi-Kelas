import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entities.dart';
import '../repositories/home_repository.dart';

class GetHomeProfileUseCase {
  final HomeRepository homeRepository;

  GetHomeProfileUseCase(this.homeRepository);

  Future<Either<Failure, UserEntity>> execute() async {
    return await homeRepository.getProfiles();
  }
}
