import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';

import '../../../../core/error/failure.dart';
abstract class HomeTeachersRepository {
  Future<Either<Failure,DaySchedule>> getWeeklySchedule({required String hari,String? kelas, String? pelajaran});
  Future<Either<Failure,List<KelasEntities>>> getAllKelas();
  Future<Either<Failure,List<PelajaranEntities>>> getAllPelajaran();
}

