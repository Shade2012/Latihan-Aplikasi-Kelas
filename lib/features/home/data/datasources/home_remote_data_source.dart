import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/models/schedule_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ScheduleModel>> fetchSchedule(String day);
}
