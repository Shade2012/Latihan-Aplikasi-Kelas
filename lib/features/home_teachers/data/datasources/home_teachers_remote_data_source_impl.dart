import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/kelas_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/lecture_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/models/pelajaran_model.dart';
import '../../../../core/error/exceptions.dart';
import 'home_teachers_remote_data_source.dart';

class HomeTeachersRemoteDataSourceImpl extends HomeTeachersRemoteDataSource {
  DioInstance dioInstance = DioInstance();

HomeTeachersRemoteDataSourceImpl();

  @override
  Future<DayScheduleModel> fetchDaySchedule({required String hari, String? kelas, String? pelajaran}) async {
    // TODO: implement fetchDaySchedule
    final response = await dioInstance.getRequest(isAuthorize: true,endpoint: ApiEndPoint.baseUrlScheduleDay,queryParameters: {
      'hari':hari,
      if(kelas != null && kelas.isNotEmpty) 'kelas':kelas,
      if(pelajaran != 'Semua Pelajaran') 'mata_pelajaran':pelajaran
    });
    if(response.statusCode == 200){
      Map<String,dynamic> dataBody = response.data;
      print(dataBody);
      return DayScheduleModel.fromJson(dataBody);
    }
    if(response.statusCode == 404){
      Map<String,dynamic> dataBody = response.data;
      return DayScheduleModel.fromJson(dataBody);
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<List<KelasModel>> fetchAllKelas() async {
    // TODO: implement fetchAllKelas
    final response = await dioInstance.getRequest(endpoint: ApiEndPoint.baseUrlAllKelas,isAuthorize: true);
    List<dynamic> dataBody = response.data['kelas'] as List<dynamic>;
    if(response.statusCode == 200){
      return KelasModel.fromJsonList(dataBody);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<List<PelajaranModel>> fetchAllPelajaran() async {
    // TODO: implement fetchAllPelajaran
    final response = await dioInstance.getRequest(endpoint: ApiEndPoint.baseUrlAllPelajaran,isAuthorize: true);
    List<dynamic> dataBody = response.data['mata_pelajaran'] as List<dynamic>;
    if(response.statusCode == 200){
      return PelajaranModel.fromJsonList(dataBody);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }
}
