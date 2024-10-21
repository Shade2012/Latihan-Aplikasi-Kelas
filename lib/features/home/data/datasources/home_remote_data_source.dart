import '../models/schedule_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ScheduleModel>> fetchSchedule(String day);
}
