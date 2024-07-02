import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonInText extends StatelessWidget {
  final Widget? widget;
  final String text;
  final Color color;
  final int maxChars;

  const CustomButtonInText({
    super.key,
    this.widget,
    required this.text,
    required this.color,
    this.maxChars = 11,
  });

  @override
  Widget build(BuildContext context) {
    String displayText =     text.length > maxChars ? "${text.substring(0, maxChars)}..." : text;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget != null) widget!,
          widget != null ? SizedBox(width: 5.w) : Container(),
          Text(
            displayText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titleSmall.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
