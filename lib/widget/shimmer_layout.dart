import 'package:flutter/material.dart';
import 'package:marvel_comics/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 22.sp),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return SizedBox(
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
                      color: Colors.black54,
                      offset: Offset(4, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Shimmer.fromColors(
                  baseColor: Constants.cShimmerBaseColor,
                  highlightColor: Constants.cShimmerHighlightColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 23.sp),
                        height: 45.sp,
                        width: 45.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.grey.shade300,
                              height: 16.sp,
                              width: 40.sp,
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 16.sp,
                              width: 50.sp,
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 16.sp,
                              width: 50.sp,
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 16.sp,
                              width: 50.sp,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -5.sp,
                left: 51.sp,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
