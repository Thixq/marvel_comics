import 'package:bloc/bloc.dart';

import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/repository/comics_repository.dart';

part 'comics_state.dart';

class ComicsCubit extends Cubit<ComicsState> {
  ComicsCubit() : super(const ComicsInitial());
  final ComicsRepository repo = ComicsRepository();

  void getComics(int characterId) async {
    emit(const ComicsLoading());
    try {
      final comicsList = await repo.getComics(characterId: characterId);
      emit(ComicsLoaded(comicsList));
    } catch (e) {
      emit(ComicsError(e.toString()));
    }
  }

  void getQueryComics(
      {required int characterId,
      required Map<String, dynamic> queryParameters}) async {
    emit(const ComicsLoading());
    try {
      final filterComicsList = await repo.getQueryComics(
          characterId: characterId, queryParameters: queryParameters);
      emit(ComicsLoaded(filterComicsList));
    } catch (e) {
      emit(ComicsError(e.toString()));
    }
  }
}
