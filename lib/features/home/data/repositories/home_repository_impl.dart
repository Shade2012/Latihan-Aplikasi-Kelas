import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/datasources/home_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/datasources/home_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/schedule_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/user_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/repositories/home_repository.dart';

import '../models/schedule_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;

  HomeRepositoryImpl({required this.homeRemoteDataSourceImpl});

  @override
  Future<Either<Failure, List<ScheduleEntity>>> getSchedule() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      } else {
        List<ScheduleModel> scheduleModels =
            await homeRemoteDataSourceImpl.fetchSchedule();

        List<ScheduleEntity> scheduleEntities = scheduleModels.map((model) {
          return ScheduleEntity.fromModel(model);
        }).toList();

        return Right(scheduleEntities);
      }
    } catch (e) {
      return Left(Failure(message: '$e'));
    }
  }
}
