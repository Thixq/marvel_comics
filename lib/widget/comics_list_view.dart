import 'package:flutter/material.dart';
import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/widget/character_card.dart';
import 'package:marvel_comics/widget/comics_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicsListView extends StatelessWidget {
  final List<dynamic> showList;

  const ComicsListView({required this.showList, super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior()
          .copyWith(overscroll: false, physics: const BouncingScrollPhysics()),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 22.sp),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: showList.length,
        itemBuilder: (context, index) {
          if (showList.runtimeType == List<ComicsModel>) {
            return ComicsCard(
              comicsModel: showList[index],
            );
          }
          return CharacterCard(
            characterModel: showList[index],
          );
        },
      ),
    );
  }
}
