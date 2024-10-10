
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_endpoint.dart';

class DioInstance {
  late Dio dio;

  DioInstance(){
    dio = Dio(BaseOptions(
        baseUrl: ApiEndPoint.baseUrl
    ));
    initializeInterceptors();
  }

  Future<Response> getRequest({
    required String endpoint,
    bool? isAuthorize,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try{
      response = await dio.get(endpoint,queryParameters: queryParameters,options: Options(
          headers: {
            "Accept": "application/json",
            if(isAuthorize ?? false) "Authorization" : "Bearer $token"
          }
      )
      );
    }on DioException catch (e){
//      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> postRequest ({
    required String endpoint,
    bool? isAuthorize,
    required Object data,
    Map<String, dynamic>? queryParameters,
  }) async{
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try{
      response = await dio.post(endpoint,data: data,queryParameters: queryParameters,options: Options(
          headers: {
            "Accept": "application/json",
            if(isAuthorize ?? false) "Authorization" : "Bearer $token",
          }
      ));
    } on DioException catch (e){
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> putResponse ({
    required String endpoint,
    bool? isAuthorize,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async{
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try{
      response = await dio.put(endpoint,queryParameters: queryParameters,options: Options(headers: {
        "Accept": "application/json",
        if(isAuthorize ?? false) "Authorize" : "Bearer $token"
      }));
    } on DioException catch (e){
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future <Response> deleteResponse ({
    required String endpoint,
    bool? isAuthorize,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async{
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try{
      response = await dio.delete(endpoint, queryParameters: queryParameters,options: Options(headers: {
        "Accept": "application/json",
        if(isAuthorize ?? false) "Authorize" : "Bearer $token"
      }));
    }on DioException catch(e){
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print("Error occurred: ${error.message}");
          return handler.next(error);
        },
        onRequest: (request, handler) {
          print("Requesting: ${request.method} ${request.path}");
          print("Request data: ${request.data ?? 'No data'}");
          return handler.next(request);
        },
        onResponse: (response, handler) {
          // Safely log the response without modifying it
          if (response.data != null) {
            print("Response data: ${response.data}");
          } else {
            print("Response is null");
          }
          return handler.next(response);  // Ensure the response is passed back correctly
        },
      ),
    );
  }


}


