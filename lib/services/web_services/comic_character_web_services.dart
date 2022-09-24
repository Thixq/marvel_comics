import 'package:marvel_comics/model/comic_character_model.dart';
import 'package:marvel_comics/services/web_services/web_services.dart';

class ComicCharacterWebServices extends WebServices {
  ComicCharacterWebServices(super.options);

  Future<List<ComicCharacterModel>> getComicCharacter() async {
    List<int> characterIdList = [
      1009268,
      1009718,
      1009610,
      1009471,
      1009368,
      1010743,
      1010740,
      1009351,
      1009338,
      1009220,
      1009189,
      1009664,
      1009282,
      1009562,
    ];
    List characterList = [];
    try {
      for (var item in characterIdList) {
        var response = await dio.get(
            '/characters/$item?ts=1&apikey=017613744ba6c5a1e09e6ea750b3180c&hash=a4f82293eafadbae4fe815a14d1c640b');
        var responseMap = await response.data['data']['results'][0];
        characterList.add(responseMap);
      }
      return characterList.map((e) => ComicCharacterModel.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
