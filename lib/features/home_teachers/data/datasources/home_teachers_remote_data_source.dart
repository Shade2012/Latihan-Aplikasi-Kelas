import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/kelas_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/lecture_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/pelajaran_model.dart';


abstract class HomeTeachersRemoteDataSource {
  Future<DayScheduleModel> fetchDaySchedule({required String hari, String? kelas, String? pelajaran});
  Future<List<KelasModel>> fetchAllKelas();
  Future<List<PelajaranModel>> fetchAllPelajaran();
}
