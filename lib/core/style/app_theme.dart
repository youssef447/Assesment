import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.defaultColor,
    appBarTheme: const AppBarTheme(
      //actionsIconTheme: IconThemeData(color: Colors.black),
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.defaultColor,
      ),
      backgroundColor: AppColors.defaultColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColors.defaultGreyColor,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.defaultGreyColor),
    dividerTheme: const DividerThemeData(thickness: 1.5, color: Colors.white),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: 33.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18.sp,
      ),
      titleSmall: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 10.0.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  );
}
