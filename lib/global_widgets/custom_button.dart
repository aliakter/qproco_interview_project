import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double height;
  final double width;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadius? borderRadius;
  final void Function() onPressed;
  final Widget? widget;
  final Icon? icon;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final Alignment? alignment;
  final RoundedRectangleBorder? shapeColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widget,
    this.textColor = Colors.white,
    this.height = 44,
    this.shapeColor,
    this.border,
    this.icon,
    this.elevation,
    required this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.alignment,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 5,
        shadowColor: Colors.grey.shade400,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        foregroundColor: foregroundColor ?? Colors.grey.shade900,
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        ),
      ),
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: icon),
            Text(
              text,
              style: AppTextStyle.bodyMedium.copyWith(
                color: textColor ?? AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
