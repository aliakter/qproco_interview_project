import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';

class CircularProgress extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double? value;
  final double? height;
  final double? width;

  const CircularProgress(
      {super.key,
      this.color,
      this.strokeWidth = 4.0,
      this.value,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          value: value,
          color: color ?? AppColors.grey,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
