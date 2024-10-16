import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/datasources/home_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/models/schedule_model.dart';

import '../../../../core/error/exceptions.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  DioInstance dioInstance = DioInstance();
// HomeRemoteDataSourceImpl();

  @override
  Future<List<ScheduleModel>> fetchSchedule(String day) async {
    final response = await dioInstance.getRequest(
      endpoint: "${ApiEndPoint.baseUrlUserSchedule}?hari=$day",
      isAuthorize: true,
    );
    Map<String, dynamic> body = response.data;
    if (response.statusCode == 200) {
      List<dynamic> data = body['jadwal'];
      return ScheduleModel.fromJsonList(data);
    }
    if (response.statusCode == 404 &&
        body['message'] == 'Jadwal kelas hari ini tidak ada.') {
      throw const EmptyException(message: 'No Schedule Available');
    }
    if (response.statusCode == 404) {
      throw const EmptyException(message: 'Data not found Error 404');
    } else {
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }
}
