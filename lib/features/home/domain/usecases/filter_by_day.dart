import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/schedule_entities.dart';
import '../repositories/home_repository.dart';

class FilterByDayUseCase {
  final HomeRepository homeRepository;

  FilterByDayUseCase(this.homeRepository);

  // Future<Either<Failure, List<ScheduleEntity>>> execute(int day) async {
  //   return homeRepository.filterByDay(day);
  // }
}
