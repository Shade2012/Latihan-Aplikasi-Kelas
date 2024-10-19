import '../models/profile_teachers_model.dart';

abstract class ProfileTeachersRemoteDataSource {
  Future<ProfileTeachersModel> fetchProfile();
}
