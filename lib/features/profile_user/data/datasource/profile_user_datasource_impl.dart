import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/exceptions.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/data/datasource/profile_user_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart'; // Import API Endpoint

class ProfileUserDataSourceImpl implements ProfileUserDataSource {
  final DioInstance dioInstance;

  ProfileUserDataSourceImpl({required this.dioInstance});

  @override
  Future<ProfileUserModel> getUserProfile() async {
    try {
      final response = await dioInstance.getRequest(
        endpoint: ApiEndPoint.baseUrlProfileUser,
        isAuthorize: true,
      );

      // Logging response
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      Map<String, dynamic> body = response.data;

      if (response.statusCode == 200) {
        if (body['user'] != null) {
          // Gunakan ProfileUserModel untuk parsing JSON
          return ProfileUserModel.fromJson(body['user']);
        } else {
          throw Exception("User data not found");
        }
      } else if (response.statusCode == 404) {
        throw const EmptyException(message: 'User not found Error 404');
      } else {
        throw GeneralException(message: 'Cannot Get User Data: ${response.data}');
      }
    } catch (e) {
      print("Error in getUserProfile: ${e.toString()}");
      throw Exception("Failed to fetch user profile: ${e.toString()}");
    }
  }
}
