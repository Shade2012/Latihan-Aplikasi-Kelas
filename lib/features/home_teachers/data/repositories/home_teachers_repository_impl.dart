

import 'package:dartz/dartz.dart';

import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';

import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';

import '../../domain/repositories/home_teachers_repository.dart';

class HomeTeachersRepositoryImpl extends HomeTeachersRepository {

	HomeTeachersRepositoryImpl();

  @override
  Future<Either<Failure, List<DaySchedule>>> getWeeklySchedule() {
    // TODO: implement getWeeklySchedule
    throw UnimplementedError();
  }

}
