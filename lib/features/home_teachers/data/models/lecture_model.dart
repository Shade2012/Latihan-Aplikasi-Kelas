import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';

class LectureModel extends Lecture{
  LectureModel({
    required super.name, required super.kelas, required super.ruang, required super.id,
  });
  factory LectureModel.fromJson(Map<String,dynamic> lecture){
    return LectureModel(
        kelas: lecture['kelas'],
        name: lecture['name'],
        ruang: lecture['ruang'],
        id: lecture['id'],
    );
  }

  Map<String,dynamic> toJson() {
    return{
      'id': id,
      'name':name,
      'ruang': ruang,
      'kelas':kelas,
    };
  }

  //List <Map> -> List<UserModel>
  static List<LectureModel> fromJsonList(List data){
    if(data.isEmpty) return[];
    return data.map((singleData) => LectureModel.fromJson(singleData)).toList();
  }
}
class DayScheduleModel extends DaySchedule{
  DayScheduleModel({required super.name, required super.lectures, required super.id});
  factory DayScheduleModel.fromJson(Map<String, dynamic> daySchedule){
    var lecturesList = daySchedule['lecture'] as List<dynamic>;
    List<Lecture> lectures = LectureModel.fromJsonList(lecturesList);
    return DayScheduleModel(
      id: daySchedule['id'],
      name: daySchedule['name'],
      lectures: lectures,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'lecture': lectures.map((lecture) => (lecture as LectureModel).toJson()).toList(),
    };
  }
  static List<DayScheduleModel> fromJsonList(List<dynamic> data) {
    if (data.isEmpty) return [];
    return data.map((item) => DayScheduleModel.fromJson(item)).toList();
  }
}
class ScheduleResponseModel extends ScheduleResponse {
  const ScheduleResponseModel({
    required super.schedule,
  });

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    var scheduleList = json['Schedule'] as List<dynamic>;
    List<DaySchedule> schedule = DayScheduleModel.fromJsonList(scheduleList);

    return ScheduleResponseModel(
      schedule: schedule,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Schedule': schedule.map((daySchedule) => (daySchedule as DayScheduleModel).toJson()).toList(),
    };
  }
}
