import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../datasources/home_remote_data_source_impl.dart';
import '../../domain/entities/schedule_entities.dart';
import '../../domain/repositories/home_repository.dart';

import '../models/schedule_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;

  HomeRepositoryImpl({required this.homeRemoteDataSourceImpl});

  @override
  Future<Either<Failure, List<ScheduleEntity>>> getSchedule(String day) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      } else {
        List<ScheduleModel> scheduleModels =
            await homeRemoteDataSourceImpl.fetchSchedule(day);
        List<ScheduleEntity> scheduleEntities = scheduleModels.map((model) {
          return ScheduleEntity.fromModel(model);
        }).toList();

        return Right(scheduleEntities);
      }
    } on Exception catch (e) {
      return Left(Failure(message: '$e'));
    }
  }
}
