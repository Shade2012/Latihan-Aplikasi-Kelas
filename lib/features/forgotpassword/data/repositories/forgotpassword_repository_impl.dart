import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/datasources/forgotpassword_remote_data_source.dart';

import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/repositories/forgotpassword_repository.dart';

class ForgotpasswordRepositoryImpl extends ForgotpasswordRepository {
  final ForgotpasswordRemoteDataSource forgotpasswordRemoteDataSource;

	ForgotpasswordRepositoryImpl({required this.forgotpasswordRemoteDataSource});

  @override
  Future<Either<Failure, ForgotPasswordEntities>> resetPassword(String newPassword, String confirmPassword) async {
    ForgotPasswordEntities result = await forgotpasswordRemoteDataSource.resetPassword(newPassword, confirmPassword);
    try{
      return Right(result);
    }catch(e){
      return Left(Failure(message: result.message));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordEntities>> sendOtp(String email) async {
    // TODO: implement sendOtp
    ForgotPasswordEntities result = await forgotpasswordRemoteDataSource.sendOtp(email);
    try{
      return Right(result);
    }catch(e){
      return Left(Failure(message: result.message));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordEntities>> verifyOtp(String otp) async {
    // TODO: implement verifyOtp
    ForgotPasswordEntities result = await forgotpasswordRemoteDataSource.verifyOtp(otp);
    try{
      return Right(result);
    }catch(e){
      return Left(Failure(message: result.message));
    }
  }

}
