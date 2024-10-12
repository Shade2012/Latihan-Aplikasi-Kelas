

import 'dart:convert';

import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/lecture_model.dart';

import '../../mock_data/data_sementara.dart';
import 'home_teachers_remote_data_source.dart';

class HomeTeachersRemoteDataSourceImpl extends HomeTeachersRemoteDataSource {

HomeTeachersRemoteDataSourceImpl();

  @override
  Future<DayScheduleModel> fetchDaySchedule() async {
    // TODO: implement fetchDaySchedule
    Map<String, dynamic> decodedJson = json.decode(jsonResponse);
    return DayScheduleModel.fromJson(decodedJson);

  }

  @override
  Future<LectureModel> fetchLecture() async {
    Map<String,dynamic> decodeJson = json.decode(jsonResponse);
    return LectureModel.fromJson(decodeJson);
  }

  @override
  Future<List<DayScheduleModel>> fetchSchedule() async {
    Map<String,dynamic> dataBody = json.decode(jsonResponse);
    List<dynamic> decodeJsonDataBody = dataBody['Schedule'];
    return DayScheduleModel.fromJsonList(decodeJsonDataBody);
  }

}
