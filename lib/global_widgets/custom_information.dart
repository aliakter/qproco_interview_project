import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/global_widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInformation extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomInformation({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 5.h),
        Container(
          width: 180.w,
          color: AppColors.whiteColor,
          child: CustomText(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            text: subTitle,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
