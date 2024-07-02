import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.height,
    this.width,
    this.textInputType,
    this.textInputAction,
    this.onChanged,
    required this.controller,
    required this.hintText,
    this.filColor,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.textAlignVertical,
    this.decoration,
    this.hintStyle,
    this.padding,
    this.borderRadius,
    this.borderSide,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final double? height, width;
  final Widget? prefixIcon;
  final Decoration? decoration;
  final int maxLines;
  final int? minLines;
  final String hintText;
  final Color? filColor;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? hintStyle;
  final bool obscureText;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 46.h,
      width: width ?? double.infinity,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: textInputType,
        textAlignVertical: textAlignVertical,
        textInputAction: textInputAction,
        obscureText: obscureText,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.blackColor),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: padding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintStyle: hintStyle ?? AppTextStyle.titleMedium,
          filled: true,
          fillColor: filColor ?? Colors.white,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            borderSide:
                borderSide ?? BorderSide(color: AppColors.whiteColor, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            borderSide:
                borderSide ?? BorderSide(color: AppColors.whiteColor, width: 1.w),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            borderSide:
                borderSide ?? BorderSide(color: AppColors.whiteColor, width: 1.w),
          ),
        ),
      ),
    );
  }
}
