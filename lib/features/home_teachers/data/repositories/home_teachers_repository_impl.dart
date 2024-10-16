

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/datasources/home_teachers_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';
import '../../domain/repositories/home_teachers_repository.dart';

class HomeTeachersRepositoryImpl extends HomeTeachersRepository {
  final HomeTeachersRemoteDataSourceImpl homeTeachersRemoteDataSourceImpl;
	HomeTeachersRepositoryImpl({required this.homeTeachersRemoteDataSourceImpl});

  @override
  Future<Either<Failure, DaySchedule>> getWeeklySchedule({required String hari, String? kelas, String? pelajaran}) async {
    // TODO: implement getWeeklySchedule
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      }else{
        DaySchedule hasil = await homeTeachersRemoteDataSourceImpl.fetchDaySchedule(hari: hari,kelas: kelas,pelajaran: pelajaran);
        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e' ));

    }

  }

  @override
  Future<Either<Failure, List<KelasEntities>>> getAllKelas() async {
    // TODO: implement getAllKelas
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      }else{
        List<KelasEntities> hasil = await homeTeachersRemoteDataSourceImpl.fetchAllKelas();
        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e' ));

    }
  }

  @override
  Future<Either<Failure, List<PelajaranEntities>>> getAllPelajaran() async {
    // TODO: implement getAllPelajaran
    // TODO: implement getAllKelas
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      }else{
        List<PelajaranEntities> hasil = await homeTeachersRemoteDataSourceImpl.fetchAllPelajaran();
        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e' ));

    }
  }
}
