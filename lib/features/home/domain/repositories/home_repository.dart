import '../../../../core/error/failure.dart';
import '../entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure,List<User>>> getAllUser();
}
