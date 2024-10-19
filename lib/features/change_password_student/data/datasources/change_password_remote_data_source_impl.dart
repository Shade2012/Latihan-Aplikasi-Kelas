import 'package:dio/dio.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/exceptions.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import '../models/change_password_model.dart';
import 'change_password_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordRemoteDataSourceImpl extends ChangePasswordRemoteDataSource {
  final DioInstance dioInstance;

  ChangePasswordRemoteDataSourceImpl({required this.dioInstance});

  @override
  Future<bool> verifyOldPassword(String oldPassword, String token) async {
    try {
      // Make an API call to verify the old password
      final response = await dioInstance.postRequest(
        endpoint: ApiEndPoint.baseUrlUserChangePassword, // You need to create this endpoint
        data: {'old_password': oldPassword},
        isAuthorize: true,
      );

      if (response.statusCode == 200) {
        return true; // Old password is valid
      } else {
        return false; // Old password is invalid
      }
    } catch (e) {
      // Handle exceptions
      return false;
    }
  }

  @override
  Future<void> changePassword(ChangePasswordModel model, String token) async {
    final Map<String, dynamic> body = model.toJson();

    print("Request Body: $body"); // Log the request body

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final storedToken = prefs.getString('token');
      print("Token used for change password request: $storedToken");

      final response = await dioInstance.postRequest(
        endpoint: ApiEndPoint.baseUrlUserChangePassword,
        data: body,
        isAuthorize: true,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> dataBody = response.data;
        print('Response status: ${response.statusCode}');
        print('Password changed successfully');
      } else if (response.statusCode == 404) {
        throw const EmptyException(message: 'Data not found Error 404');
      } else {
        print('Error Response: ${response.data}'); // Log the error response
        throw GeneralException(
            message: 'Cannot Change Password: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          print('DioError Response: ${e.response
              ?.data}'); // Log the Dio error response
          throw GeneralException(
              message: 'Failed to change password: ${e.response?.data}');
        } else {
          print('DioError Message: ${e.message}'); // Log the Dio error message
          throw GeneralException(
              message: 'Failed to change password: ${e.message}');
        }
      } else {
        print('Unexpected Error: $e'); // Log any unexpected error
        throw GeneralException(message: 'Unexpected error: $e');
      }
    }
  }
}
