import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_endpoint.dart';

class DioInstance {
  late Dio dio;

  DioInstance() {
    dio = Dio(BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
    ));
    initializeInterceptors();
  }

  // GET Request Method
  Future<Response> getRequest({
    required String endpoint,
    bool? isAuthorize,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    try {
      response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token"
          },
        ),
      );
    } on DioException catch (e) {
      throw Exception(e.message);  // Handle error
    }
    return response;
  }

  // POST Request Method
  Future<Response> postRequest({
    required String endpoint,
    bool? isAuthorize,  // Flag untuk Authorization
    required Object data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token"
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);  // Handle error
    }
    return response;
  }

  // PUT Request Method
  Future<Response> putRequest({
    required String endpoint,
    bool? isAuthorize,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token"
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  // DELETE Request Method
  Future<Response> deleteRequest({
    required String endpoint,
    bool? isAuthorize,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token"
          },
        ),
      );
    }on DioException catch (e){
//      print(e.message);
      throw Exception('Dio Error : ${e.message}');
    }
    return response;
  }


  // Inisialisasi Interceptors
  void initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print('Error occurred: ${error.message}');
          return handler.next(error);
        },
        onRequest: (request, handler) {
          print('Requesting: ${request.method} ${request.path}');
          return handler.next(request);  // Lanjutkan permintaan
        },
        onResponse: (response, handler) {
          print('Response data: ${response.data}');
          return handler.next(response);  // Lanjutkan respons
        },
      ),
    );
  }
}
