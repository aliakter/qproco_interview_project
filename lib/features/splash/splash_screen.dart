import 'package:flutter/material.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qproco_interview_project/config/constant/app_images.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';
import 'package:qproco_interview_project/config/constant/hard_coded_data.dart';
import 'package:qproco_interview_project/core/utils/constants.dart';
import 'package:qproco_interview_project/features/employee/employee_screen.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/screen/employee_list_screen.dart';
import 'package:qproco_interview_project/global_widgets/custom_button.dart';
import 'package:qproco_interview_project/shared/data/local/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String onTimeSee = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onTimeSee = StorageService.to.getString(STORAGE_USER_SEE_KEY);
    startTime();
  }

  Future<void> startTime() async {
    await Future.delayed(const Duration(seconds: 3));

    if (onTimeSee == "1") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const EmployeeListScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EmployeeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Padding(
          padding: EdgeInsets.only(
              left: 16.w, right: 16.w, top: 120.h, bottom: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  HardCodedData.employeeCreator,
                  style: AppTextStyle.titleBig,
                ),
              ),
              SvgPicture.asset(
                AppImages.employeeCreator,
                height: 190.h,
                width: 250.w,
              ),
              CustomButton(
                width: double.infinity,
                elevation: 0,
                text: HardCodedData.getStarted,
                textColor: AppColors.blackColor,
                foregroundColor: AppColors.green,
                onPressed: () {
                  onTimeSee == "1"
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmployeeListScreen()),
                          (Route<dynamic> route) => false,
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EmployeeScreen(),
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
