import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/repository/repository.dart';
import 'package:marvel_comics/services/web_services/comics_web_services.dart';

class ComicsRepository extends CoreRepository {
  Future<List<ComicsModel>> getComics({required int characterId}) async {
    final ComicsWebServices comicWebServices = ComicsWebServices(options);

    try {
      final comics = await comicWebServices.getComics(characterId: characterId);
      return comics.map((e) => ComicsModel.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ComicsModel>> getQueryComics(
      {required int characterId,
      required Map<String, dynamic> queryParameters}) async {
    final ComicsWebServices comicWebServices = ComicsWebServices(options);

    try {
      final comics = await comicWebServices.getQueryComics(
          characterId: characterId, queryParameters: queryParameters);
      return comics.map((e) => ComicsModel.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
