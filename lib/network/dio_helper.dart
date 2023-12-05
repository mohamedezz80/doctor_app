import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://d3mk.com',
        receiveDataWhenStatusError: true,
        connectTimeout: 20*1000,
        receiveTimeout: 20*1000,
      ),
    );
  }
  static Dio dio2 = Dio();

  static void init2() {
    dio2 = Dio(
      BaseOptions(
        baseUrl: 'https://d3mk.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getSchaduleData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response<dynamic>> getData(
      {
        required String url,
        Map<String , dynamic>? query,
        String lang = 'ar',
        String? token,
      }) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token??'',
    };


    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {
        required String url ,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String lang = 'ar',
        String? token,
      }) async
  {
    // Response response = await dio!.post(
    //     "https://D3mk.com/manshy.php", data: {"token": token});
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token??'',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {
        required String url,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String lang = 'ar',
        String? token,
      }) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization': token??'',
    };

    return dio.put(
      url ,
      queryParameters: query,
      data: data,
    );
  }

}