import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_comics/constants/constants.dart';
import 'package:marvel_comics/cubit/comics_cubit/comics_cubit.dart';
import 'package:marvel_comics/model/comics_model.dart';

import 'package:marvel_comics/view/comics_home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(ComicsModelAdapter());
  await Hive.openBox<ComicsModel>('favorite');
  runApp(const ProviderScope(child: MarvelComics()));
}

class MarvelComics extends StatelessWidget {
  const MarvelComics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ComicsCubit(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: Constants().themeData,
            home: ComicsHomePage(),
          );
        },
      ),
    );
  }
}
