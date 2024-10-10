import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/datasources/home_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/models/home_model.dart';

import '../../../../core/error/exceptions.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  DioInstance dioInstance = DioInstance();
// HomeRemoteDataSourceImpl();

  @override
  Future<List<UserModel>> getAllUser() async {
    // TODO: implement getAllUser
    final response = await dioInstance.getRequest(endpoint: ApiEndPoint.baseUrlAllUser,isAuthorize: false);
    Map<String,dynamic> databody = response.data;
    if(response.statusCode == 200){
      List<dynamic> data = databody['user'];
      return UserModel.fromJsonList(data);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

}
