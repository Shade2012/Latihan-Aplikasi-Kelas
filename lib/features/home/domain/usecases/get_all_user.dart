

import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entities.dart';


class GetAllUser{
  final HomeRepository homeRepository;
  GetAllUser(this.homeRepository);

  //dijalankan
  Future<Either<Failure, List<User>>> execute() async {
    return await homeRepository.getAllUser();
  }
}
