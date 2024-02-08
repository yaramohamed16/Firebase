import 'package:dio/dio.dart';



class DioHelper
{
  static late Dio dio;


  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>?query,
    String lang = 'en',
    String? token,
})async{
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',


    };

    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'lang': lang,
          'Authorization': token ?? '',
        },
      ),
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }




}


