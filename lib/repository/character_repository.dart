import 'package:marvel_comics/model/comic_character_model.dart';
import 'package:marvel_comics/repository/repository.dart';
import 'package:marvel_comics/services/web_services/comic_character_web_services.dart';

class CharacterRepository extends CoreRepository {
  Future<List<ComicCharacterModel>> getComicCharacter() async {
    final ComicCharacterWebServices characterWebServices =
        ComicCharacterWebServices(options);
    return characterWebServices.getComicCharacter();
  }
}
