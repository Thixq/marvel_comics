import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_comics/constants/constants.dart';
import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/providers/all_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailPage extends ConsumerWidget {
  final ComicsModel comicsModel;
  const DetailPage({required this.comicsModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var newModel = ref.watch(comicProvider(comicsModel));

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: (100.h),
              color: Colors.grey.shade100,
            ),
            Positioned(
              left: Device.orientation == Orientation.portrait ? null : 2.5.w,
              top: Device.orientation == Orientation.portrait ? 40.sp : 30.sp,
              child: Hero(
                tag: comicsModel.comicId,
                child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    height: 75.sp,
                    width: 75.sp,
                    placeholder: 'assets/images/loading_animation.gif',
                    image: "${comicsModel.imagePath}.jpg"),
              ),
            ),
            Positioned(
              top: 10.5.h,
              left: Device.orientation == Orientation.portrait ? 81.w : 72.4.sp,
              child: IconButton(
                onPressed: () {
                  ref.read(comicProvider(comicsModel).notifier).isFav();
                },
                icon: Icon(
                  Icons.favorite,
                  color: newModel.isFav
                      ? Theme.of(context).iconTheme.color
                      : Colors.grey,
                ),
              ),
            ),
            Positioned(
              left: Device.orientation == Orientation.portrait ? null : 80.sp,
              top: Device.orientation == Orientation.portrait ? 86.sp : 30.sp,
              child: Container(
                padding: EdgeInsets.all(20.sp),
                width: Device.orientation == Orientation.portrait
                    ? 75.sp
                    : 82.5.sp,
                height: 75.sp,
                decoration: BoxDecoration(
                    color: Constants.cDetailCardColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      comicsModel.comicTitle,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      maxLines: 11,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyMedium,
                      comicsModel.comicDescription,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Characters:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          comicsModel.characters,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Creators:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          comicsModel.creators,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Page Count:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          comicsModel.pageCount.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
