import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final double height;
  final double width;
  const CustomContainer({
    required this.color,
    required this.child,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      height: Device.orientation == Orientation.portrait
          ? height.h
          : (height * 2).h,
      width: Device.orientation == Orientation.portrait ? width.w : width.w,
      child: child,
    );
  }
}
