import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/schedule_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';

class GetScheduleUseCase {
  final HomeRepository homeRepository;

  GetScheduleUseCase(this.homeRepository);

  Future<Either<Failure, List<ScheduleEntity>>> execute(String day) async {
    return await homeRepository.getSchedule(day);
  }
}
