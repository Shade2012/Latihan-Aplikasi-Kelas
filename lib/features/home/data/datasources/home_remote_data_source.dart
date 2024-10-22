import '../models/schedule_model.dart';
import '../models/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ScheduleModel>> fetchSchedule(String day);
  Future<UserModel> fetchProfiles();
}
