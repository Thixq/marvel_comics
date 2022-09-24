import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Constants {
  final ThemeData themeData = ThemeData(
      textTheme: TextTheme(
        titleMedium:
            GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.poppins(fontSize: 14.sp),
        bodyMedium: GoogleFonts.poppins(fontSize: 14.sp),
      ),
      iconTheme: IconThemeData(color: Colors.red.shade500));

  //Colors
  static const Color cWhiteColor = Colors.white;
  static const Color cShadowColor = Colors.black54;
  static Color cDetailCardColor = Colors.blueGrey.shade100;
  //Shimmer Colors
  static Color cShimmerBaseColor = Colors.grey.shade300;
  static const Color cShimmerHighlightColor = Colors.white60;
}
