import 'package:dio/dio.dart';

abstract class CoreRepository {
  BaseOptions options = BaseOptions(
    baseUrl: "https://gateway.marvel.com/v1/public",
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
  );
}
