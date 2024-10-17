import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/repositories/home_teachers_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/lecture_entities.dart';

class GetKelas{
  final HomeTeachersRepository teachersRepository;
  GetKelas(this.teachersRepository);

  Future<Either<Failure, List<KelasEntities>>> execute() async{
    return await teachersRepository.getAllKelas();
  }
}
