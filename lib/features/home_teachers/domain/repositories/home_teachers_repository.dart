import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
abstract class HomeTeachersRepository {
  Future<Either<Failure,List<DaySchedule>>> getWeeklySchedule();
}

