import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/profile_teachers_entities.dart';
import '../../domain/repositories/profile_teachers_repository.dart';
import '../datasources/profile_teachers_remote_data_source_impl.dart';

class ProfileTeachersRepositoryImpl extends ProfileTeachersRepository {
  final ProfileTeachersRemoteDataSourceImpl profileTeachersRemoteDataSourceImpl;

  ProfileTeachersRepositoryImpl({
    required this.profileTeachersRemoteDataSourceImpl,
  });

  @override
  Future<Either<Failure, ProfileTeachersEntities>> getProfile() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'No internet connection'));
      } else {
        final profileTeachersModel =
            await profileTeachersRemoteDataSourceImpl.fetchProfile();
        final profileTeachersEntity =
            ProfileTeachersEntities.fromModel(profileTeachersModel);
        return Right(profileTeachersEntity);
      }
    } on Exception catch (e) {
      return Left(Failure(message: '$e'));
    }
  }
}
