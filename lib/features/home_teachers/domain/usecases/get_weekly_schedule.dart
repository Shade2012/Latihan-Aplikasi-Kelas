import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/repositories/home_teachers_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/lecture_entities.dart';

class GetScheduleWeekly{
  final HomeTeachersRepository teachersRepository;
  GetScheduleWeekly(this.teachersRepository);

  Future<Either<Failure, DaySchedule>> execute({required String hari, String? kelas, String? pelajaran}) async{
    return await teachersRepository.getWeeklySchedule(hari: hari,pelajaran: pelajaran,kelas: kelas);
  }
}
