import 'package:latihan_aplikasi_manajemen_kelas/core/network/api_endpoint.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/datasources/forgotpassword_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/models/forgot_password_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_instance.dart';

class ForgotpasswordRemoteDataSourceImpl extends ForgotpasswordRemoteDataSource {
  DioInstance dioInstance = DioInstance();

ForgotpasswordRemoteDataSourceImpl();

  @override
  Future<ForgotPasswordModel> resetPassword(String newPassword, String confirmPassword) async {
    // TODO: implement resetPassword
    final response = await dioInstance.postRequest(isAuthorize: true,endpoint: ApiEndPoint.baseUrlForgotPasswordConfirm, data: {
      "password" : newPassword,
      "password_confirmation" : confirmPassword,
    });
    Map<String,dynamic> dataBody = response.data;
    if(response.statusCode == 200 || response.statusCode == 201){
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      return ForgotPasswordModel.fromJson(dataBody);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }if(response.statusCode == 401 || response.statusCode == 422 || response.statusCode == 400){
      throw ServerException(message: dataBody['message']);
    }else{
      throw GeneralException(message: 'Cannot Get Data ${dataBody['message']}');
    }
  }

  @override
  Future<ForgotPasswordModel> sendOtp(String email) async {
    // TODO: implement sendOtp
    final response = await dioInstance.postRequest(endpoint: ApiEndPoint.baseUrlForgotSendOtp,
    data:{
      'email':email
    });
    Map<String,dynamic> dataBody = response.data;
    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', dataBody['access_token']);
      prefs.setString('email', email);
      return ForgotPasswordModel.fromJson(dataBody);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }if(response.statusCode == 401 || response.statusCode == 422 || response.statusCode == 400){
      throw ServerException(message: dataBody['message']);
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<ForgotPasswordModel> verifyOtp(String otp) async {
    // TODO: implement verifyOtp
    final response = await dioInstance.postRequest(isAuthorize: true,endpoint: ApiEndPoint.baseUrlForgotVerifiedOtp, data: {
      'otp':otp
    });

    Map<String,dynamic> dataBody = response.data;
    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', dataBody['access_token']);
      return ForgotPasswordModel.fromJson(dataBody);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }if(response.statusCode == 401 || response.statusCode == 422 || response.statusCode == 400){
      throw ServerException(message: dataBody['message']);
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

}
