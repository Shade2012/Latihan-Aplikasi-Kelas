import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/dio_instance.dart';
import '../models/user_model.dart';
import 'home_remote_data_source.dart';
import '../models/schedule_model.dart';

import '../../../../core/error/exceptions.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  DioInstance dioInstance = DioInstance();
// HomeRemoteDataSourceImpl();

  @override
  Future<List<ScheduleModel>> fetchSchedule(String day) async {
    final response = await dioInstance.getRequest(
      endpoint: '${ApiEndPoint.baseUrlUserSchedule}?hari=$day',
      isAuthorize: true,
    );
    Map<String, dynamic> body = response.data;
    if (response.statusCode == 200) {
      List<dynamic> data = body['jadwal'];
      return ScheduleModel.fromJsonList(data);
    }
    if (response.statusCode == 404) {
      throw const EmptyException(message: 'Data not found Error 404');
    } else {
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<UserModel> fetchProfiles() async {
    final response = await dioInstance.getRequest(
      endpoint: ApiEndPoint.baseUrlProfileUser,
      isAuthorize: true,
    );
    Map<String, dynamic> body = response.data;
    if (response.statusCode == 200) {
      final data = body['user'];
      return UserModel.fromJson(data);
    }

    if (response.statusCode == 404) {
      throw const EmptyException(
        message: 'Data not found Error 404',
      );
    } else {
      throw GeneralException(
        message: 'Cannot Get Data ${response.data}',
      );
    }
  }
}
