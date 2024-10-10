import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/datasources/login_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/login_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
	LoginRepositoryImpl({
    required this.loginRemoteDataSource
});

  @override
  Future<Either<Failure, LoginEntities>> login(String email, String password) async {
    try{
      LoginEntities hasil = await loginRemoteDataSource.login(email, password);
      return Right(hasil);
    }catch(e){
      return Left(Failure(message: '$e'));
    }

  }


}
