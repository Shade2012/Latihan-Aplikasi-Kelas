import '../../../../core/error/failure.dart';
import '../entities/schedule_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ScheduleEntity>>> getSchedule(String day);
}
