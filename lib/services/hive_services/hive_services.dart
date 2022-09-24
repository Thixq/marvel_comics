import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_comics/model/comics_model.dart';

class HiveServices {
  Box<ComicsModel>? box;

  Future<void> init() async {
    box = Hive.box('favorite');
  }

  Future<void> addComic(ComicsModel comicsModel) async {
    await box!.put(comicsModel.comicId, comicsModel);
  }

  Future<void> deleteComic(ComicsModel comicsModel) async {
    await box!.delete(comicsModel.comicId);
  }

  Future<List<ComicsModel>> getComicsInit() async {
    return box!.values.toList();
  }
}
