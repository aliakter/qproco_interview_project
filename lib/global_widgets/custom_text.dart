import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.maxLines,
      this.color,
      this.textOverflow,
      this.fontWeight});

  final String text;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: AppTextStyle.bodyMedium.copyWith(
        color: color ?? AppColors.grey1,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
