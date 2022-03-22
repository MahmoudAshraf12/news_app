import 'package:dio/dio.dart';

class DioHelper{

  static Dio ? dio ;


  static init(){ // هستعمل ال init جوا داله ال main عشان اول ما التطبيق يشتغل يقوم مشغل ال dio

    dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/' ,
          receiveDataWhenStatusError: true,
        )
    );

  }

  static Future<Response> getData ({
    required  String url,
    required  Map < String,dynamic> query,
  }) async
  {
    return await dio!.get
      ( url ,
      queryParameters : query,
    );
  }

}