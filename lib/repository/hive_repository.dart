import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/repository/repository.dart';
import 'package:marvel_comics/services/hive_services/hive_services.dart';

class HiveRepository extends CoreRepository {
  final HiveServices _db = HiveServices();

  Future<void> addComic(ComicsModel comicsModel) async {
    if (_db.box!.isOpen) {
      await _db.addComic(comicsModel);
    }
  }

  Future<void> deleteComic(ComicsModel comicsModel) async {
    if (_db.box!.isOpen) {
      _db.deleteComic(comicsModel);
    }
  }

  Future<List<ComicsModel>> getAllComics() async {
    return await _db.getComicsInit();
  }

  Future<void> init() async {
    await _db.init();
  }
}
