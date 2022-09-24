import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_comics/constants/constants.dart';
import 'package:marvel_comics/model/comics_model.dart';
import 'package:marvel_comics/providers/all_provider.dart';
import 'package:marvel_comics/repository/hive_repository.dart';
import 'package:marvel_comics/view/detail_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicsCard extends ConsumerWidget {
  final ComicsModel comicsModel;
  ComicsCard({required this.comicsModel, Key? key}) : super(key: key);
  final _hiveRepository = HiveRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var newModel = ref.watch(comicProvider(comicsModel));
    _hiveRepository.init();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailPage(comicsModel: comicsModel),
          ),
        );
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
                  Hero(
                    tag: comicsModel.comicId,
                    child: Container(
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
                          image: '${comicsModel.imagePath}.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          overflow: TextOverflow.ellipsis,
                          comicsModel.comicTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            softWrap: false,
                            maxLines: Device.orientation == Orientation.portrait
                                ? 4
                                : 3,
                            comicsModel.comicDescription,
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
                onPressed: () async {
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
          ],
        ),
      ),
    );
  }
}
