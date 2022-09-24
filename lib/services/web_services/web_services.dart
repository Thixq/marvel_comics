import 'package:dio/dio.dart';

abstract class WebServices {
  late Dio dio;

  WebServices(BaseOptions options) {
    BaseOptions baseOptions = options;
    dio = Dio(baseOptions);
  }
}
