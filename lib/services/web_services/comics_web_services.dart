import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvel_comics/services/web_services/web_services.dart';

class ComicsWebServices extends WebServices {
  ComicsWebServices(super.options);

  Future<List<dynamic>> getComics({required int characterId}) async {
    try {
      Response response = await dio.get(
          "/characters/$characterId/comics?ts=1&apikey=017613744ba6c5a1e09e6ea750b3180c&hash=a4f82293eafadbae4fe815a14d1c640b");

      return response.data["data"]["results"];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<dynamic>> getQueryComics(
      {required int characterId,
      required Map<String, dynamic> queryParameters}) async {
    try {
      Response response = await dio.get(
        "/characters/$characterId/comics?ts=1&apikey=017613744ba6c5a1e09e6ea750b3180c&hash=a4f82293eafadbae4fe815a14d1c640b",
        queryParameters: queryParameters,
      );

      return response.data["data"]["results"];
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }
}
