import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/dio_instance.dart';
import '../models/profile_teachers_model.dart';
import 'profile_teachers_remote_data_source.dart';

class ProfileTeachersRemoteDataSourceImpl
    extends ProfileTeachersRemoteDataSource {
  DioInstance dioInstance = DioInstance();

  @override
  Future<ProfileTeachersModel> fetchProfile() async {
    final response = await dioInstance.getRequest(
      endpoint: ApiEndPoint.baseUrlTeacherProfile,
      isAuthorize: true,
    );
    Map<String, dynamic> body = response.data;
    if (response.statusCode == 200) {
      final data = body['user'];
      print(data);
      return ProfileTeachersModel.fromJson(data);
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
