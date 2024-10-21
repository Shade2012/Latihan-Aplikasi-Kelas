import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/repositories/home_teachers_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/lecture_entities.dart';

class GetPelajaran{
  final HomeTeachersRepository teachersRepository;
  GetPelajaran(this.teachersRepository);

  Future<Either<Failure, List<PelajaranEntities>>> execute() async{
    return await teachersRepository.getAllPelajaran();
  }
}
