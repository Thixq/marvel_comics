import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marvel_comics/constants/constants.dart';
import 'package:marvel_comics/cubit/comics_cubit/comics_cubit.dart';
import 'package:marvel_comics/providers/all_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterWidget extends ConsumerStatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends ConsumerState<FilterWidget> {
  Map<String, dynamic> queryMap = {};

  String? orderBy;
  int? limit;
  int? characterId;
  int? characterId2;

  @override
  Widget build(BuildContext context) {
    characterId2 = characterId;

    characterId = ref.watch(providerCharacterId);
    if (characterId2 != characterId) {
      limit = null;
      orderBy = null;
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 14.sp),
      scrollDirection: Axis.horizontal,
      children: [
        OrderBy(context),
        SizedBox(width: 15.sp),
        Limit(context),
      ],
    );
  }

//Limit Filter
  Container Limit(BuildContext context) {
    return Container(
      width: 35.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Constants.cWhiteColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, offset: Offset(2, 2), blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<int>(
        alignment: Alignment.center,
        elevation: 2,
        isExpanded: false,
        style: Theme.of(context).textTheme.titleMedium,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(10),
        hint: const Text('Limit'),
        value: limit,
        onChanged: (value) {
          setState(() {
            limit = value!;
            queryMap.addAll({'limit': '$limit'});
            context.read<ComicsCubit>().getQueryComics(
                characterId: characterId!, queryParameters: queryMap);
          });
        },
        items: const [
          DropdownMenuItem<int>(value: 5, child: Text('5')),
          DropdownMenuItem<int>(value: 10, child: Text('10')),
          DropdownMenuItem<int>(value: 20, child: Text('20')),
          DropdownMenuItem<int>(value: 50, child: Text('50')),
          DropdownMenuItem<int>(value: 100, child: Text('100')),
        ],
      ),
    );
  }

//OrderBy Filter
  Widget OrderBy(BuildContext context) {
    return Container(
      width: 51.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.cWhiteColor,
        boxShadow: const [
          BoxShadow(
            color: Constants.cShadowColor,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: const Text('OrderBy'),
        alignment: Alignment.center,
        elevation: 2,
        isExpanded: false,
        style: Theme.of(context).textTheme.titleMedium,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(10),
        value: orderBy,
        onChanged: (value) {
          setState(() {
            orderBy = value!;
            queryMap.addAll({'orderBy': '$orderBy'});
            context.read<ComicsCubit>().getQueryComics(
                characterId: characterId!, queryParameters: queryMap);
          });
        },
        items: const [
          DropdownMenuItem<String>(value: 'title', child: Text('A-Z')),
          DropdownMenuItem<String>(value: '-title', child: Text('Z-A')),
          DropdownMenuItem<String>(
              value: 'onsaleDate', child: Text('On Sale Date <')),
          DropdownMenuItem<String>(
              value: '-onsaleDate', child: Text('On Sale Date >')),
        ],
      ),
    );
  }
}




/*
  Map<String, dynamic>? queryMap;
  bool isOrderBy = false;
  bool isLimit = false;

  String? orderBy;
  int? limit;

return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 51.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            hint: Text('OrderBy'),
            alignment: Alignment.center,
            elevation: 2,
            isExpanded: false,
            style: GoogleFonts.poppins(color: Colors.black54, fontSize: 17.sp),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(10),
            value: orderBy,
            onChanged: (value) {
              queryMap!.addAll({'orderby': '$orderBy'});
              debugPrint(queryMap.toString());
              context.read<ComicsCubit>().getQueryComics(
                  characterId: ref.watch(providerCharacterId),
                  queryParameters: queryMap!);
              setState(() {
                isOrderBy = false;
                orderBy = value!;
              });
            },
            items: const [
              DropdownMenuItem<String>(
                  value: 'title', child: const Text('A-Z')),
              DropdownMenuItem<String>(
                  value: '-title', child: const Text('Z-A')),
              DropdownMenuItem<String>(
                  value: 'onsaleDate', child: const Text('On Sale Date >')),
              DropdownMenuItem<String>(
                  value: '-onsaleDate', child: const Text('On Sale Date <')),
            ],
          ),
        ),
        Container(
          width: 35.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<int>(
            alignment: Alignment.center,
            elevation: 2,
            isExpanded: false,
            style: GoogleFonts.poppins(color: Colors.black54, fontSize: 17.sp),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(10),
            hint: const Text('Limit'),
            value: limit,
            onChanged: (value) {
              setState(() {
                limit = value!;
                queryMap!.addAll({'limit': '$limit'});
                debugPrint(queryMap.toString());
              });
            },
            items: const [
              DropdownMenuItem<int>(value: 5, child: const Text('5')),
              DropdownMenuItem<int>(value: 10, child: const Text('10')),
              DropdownMenuItem<int>(value: 20, child: const Text('20')),
              DropdownMenuItem<int>(value: 50, child: const Text('50')),
              DropdownMenuItem<int>(value: 100, child: const Text('100')),
            ],
          ),
        ),
      ],
    );
    */