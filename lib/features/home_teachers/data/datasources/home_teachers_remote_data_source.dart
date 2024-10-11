import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/lecture_model.dart';

abstract class HomeTeachersRemoteDataSource {
  Future<DayScheduleModel> fetchDaySchedule();
  Future<LectureModel> fetchLecture();
  Future<ScheduleResponseModel> fetchSchedule();
}
