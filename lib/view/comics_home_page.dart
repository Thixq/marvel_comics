import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics/cubit/comics_cubit/comics_cubit.dart';
import 'package:marvel_comics/model/comic_character_model.dart';
import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/repository/character_repository.dart';
import 'package:marvel_comics/repository/comics_repository.dart';
import 'package:marvel_comics/view/favorite_page.dart';

import 'package:marvel_comics/widget/comics_list_view.dart';
import 'package:marvel_comics/widget/custom_container.dart';
import 'package:marvel_comics/widget/filter_widget.dart';
import 'package:marvel_comics/widget/shimmer_layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicsHomePage extends StatefulWidget {
  const ComicsHomePage({Key? key}) : super(key: key);

  @override
  _ComicsHomePageState createState() => _ComicsHomePageState();
}

late Future<List<ComicCharacterModel>> comicCharacter;

class _ComicsHomePageState extends State<ComicsHomePage> {
  @override
  void initState() {
    super.initState();
    comicCharacter = CharacterRepository().getComicCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      appBar: appBar(),
      body: _body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => FavoritePage(),
              ),
            );
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }

  ScrollConfiguration _body() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child: Column(
          children: <Widget>[
            CustomContainer(
              height: 8,
              width: 100,
              color: Colors.red.shade200,
              child: const Text('text'),
            ),
            SizedBox(
              height: 15.sp,
            ),
            FutureBuilder<List<ComicCharacterModel>>(
              future: comicCharacter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomContainer(
                    height: 40,
                    width: 100,
                    color: Colors.amber.shade200,
                    child: ComicsListView(showList: snapshot.data!),
                  );
                } else if (snapshot.hasError) {
                  return CustomContainer(
                    height: 40,
                    width: 100,
                    color: Colors.green.shade200,
                    child: Text(snapshot.error.toString()),
                  );
                }
                return CustomContainer(
                  height: 40,
                  width: 100,
                  color: Colors.green.shade200,
                  child: const ShimmerLayout(),
                );
              },
            ),
            SizedBox(
              height: 15.sp,
            ),
            CustomContainer(
              height: 8,
              width: 100,
              color: Colors.yellow.shade200,
              child: const FilterWidget(),
            ),
            SizedBox(
              height: 15.sp,
            ),
            _buildComicsList(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ComicsCubit, ComicsState> _buildComicsList() {
    return BlocBuilder<ComicsCubit, ComicsState>(
      builder: (context, state) {
        if (state is ComicsInitial) {
          return FutureBuilder<List<ComicsModel>>(
            future: ComicsRepository().getComics(characterId: 1009268),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomContainer(
                  height: 40,
                  width: 100,
                  color: Colors.blueAccent.shade200,
                  child: ComicsListView(showList: snapshot.data!),
                );
              } else if (snapshot.hasError) {
                return CustomContainer(
                  height: 40,
                  width: 100,
                  color: Colors.blueAccent.shade200,
                  child: Text(snapshot.error.toString()),
                );
              }
              return CustomContainer(
                height: 40,
                width: 100,
                color: Colors.blueAccent.shade200,
                child: const ShimmerLayout(),
              );
            },
          );
        } else if (state is ComicsLoading) {
          return CustomContainer(
            height: 40,
            width: 100,
            color: Colors.blueAccent.shade200,
            child: const Center(
              child: ShimmerLayout(),
            ),
          );
        } else if (state is ComicsLoaded) {
          return CustomContainer(
            height: 40,
            width: 100,
            color: Colors.blueAccent.shade200,
            child: ComicsListView(showList: state.comicsList),
          );
        } else {
          final error = state as ComicsError;
          return CustomContainer(
            height: 40,
            width: 100,
            color: Colors.blueAccent.shade200,
            child: Text(error.message),
          );
        }
      },
    );
  }
}
