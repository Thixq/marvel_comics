part of 'comics_cubit.dart';

abstract class ComicsState {
  const ComicsState();
}

class ComicsInitial extends ComicsState {
  const ComicsInitial();
}

class FetchComics extends ComicsState {
  const FetchComics();
}

class ComicsLoading extends ComicsState {
  const ComicsLoading();
}

class ComicsLoaded extends ComicsState {
  final List<ComicsModel> comicsList;
  const ComicsLoaded(this.comicsList);
}

class ComicsError extends ComicsState {
  final String message;
  const ComicsError(this.message);
}
