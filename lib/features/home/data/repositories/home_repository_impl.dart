import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/datasources/home_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/user_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

	HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

}
