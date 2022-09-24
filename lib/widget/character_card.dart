import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_comics/constants/constants.dart';

import 'package:marvel_comics/model/comic_character_model.dart';
import 'package:marvel_comics/providers/all_provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubit/comics_cubit/comics_cubit.dart';

class CharacterCard extends ConsumerWidget {
  final ComicCharacterModel characterModel;
  const CharacterCard({required this.characterModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(providerCharacterId.notifier).state =
            characterModel.characterId;
        context.read<ComicsCubit>().getComics(characterModel.characterId);
        // BlocProvider.of<ComicsCubit>(context)
        //     .getComics(characterModel.characterID);
      },
      child: SizedBox(
        width: 60.sp,
        height: 69.sp,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 68.sp,
              width: 58.sp,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Constants.cShadowColor,
                    offset: Offset(4, 4),
                  ),
                ],
                color: Constants.cWhiteColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 23.sp),
                    height: 45.sp,
                    width: 45.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.cWhiteColor,
                    ),
                    child: FadeInImage.assetNetwork(
                        height: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: 'assets/images/loading_animation.gif',
                        image: '${characterModel.imagePath}.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          overflow: TextOverflow.ellipsis,
                          characterModel.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            softWrap: false,
                            maxLines: Device.orientation == Orientation.portrait
                                ? 4
                                : 3,
                            characterModel.description,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -5.sp,
              left: 51.sp,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
