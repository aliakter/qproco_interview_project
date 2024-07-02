import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final double? height;
  final double? elevation;
  final double? titleSpacing;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.height,
    this.elevation,
    this.titleSpacing,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      shadowColor: Colors.grey.shade100,
      // automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      titleSpacing: titleSpacing,
      actions: actions,
      leading: leading,
      title: title,
    );
  }
}
