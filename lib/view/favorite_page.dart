import 'package:flutter/material.dart';
import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/repository/hive_repository.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final HiveRepository _hiveRepository = HiveRepository();

  @override
  Widget build(BuildContext context) {
    _hiveRepository.init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: Center(
        child: FutureBuilder<List<ComicsModel>>(
          future: _hiveRepository.getAllComics(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(snapshot.data![index].comicId),
                  onDismissed: (direction) {
                    _hiveRepository.deleteComic(snapshot.data![index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${snapshot.data![index].imagePath}.jpg'),
                      ),
                      title: Text(
                        snapshot.data![index].comicTitle,
                        maxLines: 1,
                      ),
                      subtitle: Text(snapshot.data![index].comicDescription,
                          maxLines: 2),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Card();
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
