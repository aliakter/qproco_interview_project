import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';

class AppTextStyle {
  static TextStyle get titleBig {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.whiteColor,
      ),
    );
  }

  static TextStyle get bodyLarge {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    );
  }

  static TextStyle get bodyMedium {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    );
  }

  static TextStyle get titleMedium {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.grey2,
      ),
    );
  }

  static TextStyle get titleSmall {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.green,
      ),
    );
  }
}
