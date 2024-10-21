import 'package:dartz/dartz.dart';
import '../entities/schedule_entities.dart';
import '../repositories/home_repository.dart';

import '../../../../core/error/failure.dart';

class GetScheduleUseCase {
  final HomeRepository homeRepository;

  GetScheduleUseCase(this.homeRepository);

  Future<Either<Failure, List<ScheduleEntity>>> execute(String day) async {
    return await homeRepository.getSchedule(day);
  }
}
