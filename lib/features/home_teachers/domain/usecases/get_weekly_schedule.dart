import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/repositories/home_teachers_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/lecture_entities.dart';

class GetScheduleWeekly{
  final HomeTeachersRepository teachersRepository;
  GetScheduleWeekly(this.teachersRepository);

  Future<Either<Failure, List<DaySchedule>>> execute() async{
    return await teachersRepository.getWeeklySchedule();
  }
}
