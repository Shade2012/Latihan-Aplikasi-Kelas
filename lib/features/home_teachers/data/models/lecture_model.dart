import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';

class LectureModel extends Lecture{
  LectureModel({
    required super.guru, required super.namaPelajaran, required super.kelas, required super.ruang, required super.id, required super.jamMulai, required super.jamSelesai, required super.hari,
  });
  factory LectureModel.fromJson(Map<String,dynamic> lecture){
    return LectureModel(
        guru: lecture['guru']?? '',
        kelas: lecture['kelas']?? '',
        namaPelajaran: lecture['pelajaran']?? '',
        ruang: lecture['ruang'] ?? '' ,
        id: lecture['id'] ?? 0,
        jamMulai: formatJam(lecture['jam_mulai'] ?? ''),
        jamSelesai: formatJam( lecture['jam_selesai'] ?? ''),
        hari:  lecture['hari'] ?? '',
    );
  }

  static String formatJam (String jamMulai){
    final DateTime parsedTime = DateTime.parse("1970-01-01 $jamMulai");
    return "${parsedTime.hour.toString().padLeft(2,'0')}.${parsedTime.minute.toString().padLeft(2,'0')}";
  }

  Map<String,dynamic> toJson() {
    return{
      'id': id.toString(),
      'hari':hari,
      'jam_selesai' : jamSelesai,
      'jam_mulai' : jamMulai,
      'pelajaran':namaPelajaran,
      'ruang': ruang,
      'kelas':kelas,
      'guru':guru
    };
  }

  //List <Map> -> List<UserModel>
  static List<LectureModel> fromJsonList(List data){
    if(data.isEmpty) return[];
    return data.map((singleData) => LectureModel.fromJson(singleData)).toList();
  }
}
class DayScheduleModel extends DaySchedule{

  DayScheduleModel({required super.name, required super.lectures});

  factory DayScheduleModel.fromJson(Map<String, dynamic> daySchedule) {
    // Check if 'jadwal' is available and is a List
    var lecturesList = daySchedule['jadwal'] != null && daySchedule['jadwal'] is List
        ? daySchedule['jadwal'] as List<dynamic>
        : <dynamic>[];
    List<Lecture> lectures = lecturesList.isNotEmpty
        ? lecturesList.map((item) => LectureModel.fromJson(item)).toList()
        : <Lecture>[];
    String name = lecturesList.isNotEmpty && lecturesList[0]['hari'] != null
        ? lecturesList[0]['hari'] as String
        : '';

    return DayScheduleModel(
      name: name,
      lectures: lectures,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hari': name,
      'lecture': lectures.map((lecture) => (lecture as LectureModel).toJson()).toList(),
    };
  }
  static List<DayScheduleModel> fromJsonList(List<dynamic> data) {
    if (data.isEmpty) return [];
    return data.map((item) => DayScheduleModel.fromJson(item)).toList();
  }
}

