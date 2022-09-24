import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_comics/model/comics_model.dart';

final providerCharacterId = StateProvider<int>((ref) {
  return 1009268;
});

final comicProvider =
    StateNotifierProvider.family<ComicNotifier, ComicsModel, ComicsModel?>(
        (ref, comicsModel) {
  return ComicNotifier(comicsModel);
});

class ComicNotifier extends StateNotifier<ComicsModel> {
  ComicNotifier(this.comicsModel) : super(comicsModel!);
  final ComicsModel? comicsModel;
  void isFav() {
    state = state.copyWith(isFav: !state.isFav);
  }
}
