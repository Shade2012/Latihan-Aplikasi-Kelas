import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/datasources/login_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/dio_instance.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  DioInstance dioInstance = DioInstance();

LoginRemoteDataSourceImpl();

  @override
  Future<LoginModel> login(String email, String password) async {
    // TODO: implement login
    final response = await dioInstance.postRequest(endpoint: ApiEndPoint.baseUrlLogin,
        data:{
          'email':email,
          'password':password
        } );
    if(response.statusCode == 200){
      Map<String,dynamic> dataBody = response.data;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', dataBody['token']);
      return LoginModel.fromJson(dataBody);
      // return UserModel.fromJson(data);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

}
