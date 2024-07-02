import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qproco_interview_project/config/constant/app_images.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';
import 'package:qproco_interview_project/config/constant/hard_coded_data.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/screen/add_emplyee_screen.dart';
import 'package:qproco_interview_project/global_widgets/custom_button.dart';
import 'package:qproco_interview_project/shared/data/local/user_store.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.chair,
                height: 100.h,
                width: 100.h,
              ),
              SizedBox(height: 16.h),
              Text(
                HardCodedData.youAreTheOnlyOneHere,
                style: AppTextStyle.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                HardCodedData.youHaveNoEmployeesWorkingForYou,
                style: AppTextStyle.bodyLarge.copyWith(color: AppColors.grey1),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100.h,
          width: double.infinity,
          color: AppColors.whiteColor,
          padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                height: 44.h,
                width: double.infinity,
                elevation: 0,
                text: HardCodedData.addEmployee,
                textColor: AppColors.blackColor,
                foregroundColor: AppColors.green,
                backgroundColor: AppColors.whiteColor2,
                icon: const Icon(Icons.add, color: AppColors.blackColor),
                onPressed: () async {
                  await UserStore().saveProfile("1");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddEmployeeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
