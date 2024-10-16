import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/models/notification_user_models.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/data/datasources/notification_remote_data_source.dart';
import '../../../../core/error/exceptions.dart';

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioInstance dioInstance; 

  NotificationRemoteDataSourceImpl({required this.dioInstance});

  @override
  Future<List<NotificationAdminModel>> getNotifications() async {
    final response = await dioInstance.getRequest(
      endpoint: "${ApiEndPoint.baseUrlUserNotification}",
      isAuthorize: true, 
    );

    Map<String, dynamic> body = response.data;

    if (response.statusCode == 200) {
      List<dynamic> data = body['notifications'];
      return NotificationAdminModel.fromJsonList(data); 
    }
    if (response.statusCode == 404) {
      if (body['message'] == 'No notifications found.') {
        throw const EmptyException(message: 'No Notifications Available');
      } else {
        throw const EmptyException(message: 'Data not found Error 404');
      }
    } else {
      throw GeneralException(message: 'Cannot Get Data: ${response.data}');
    }
  }
}
