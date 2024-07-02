import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_images.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';
import 'package:qproco_interview_project/config/constant/hard_coded_data.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/screen/add_emplyee_screen.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_bloc.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_event.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_state.dart';
import 'package:qproco_interview_project/global_widgets/custom_appbar.dart';
import 'package:qproco_interview_project/global_widgets/custom_button_in_text.dart';
import 'package:qproco_interview_project/global_widgets/custom_information.dart';
import 'package:qproco_interview_project/global_widgets/custom_text.dart';
import 'package:qproco_interview_project/shared/globals_settings.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late EmployeeBloc _employeeBloc;

  @override
  void initState() {
    super.initState();
    IS_POST = "false";
    _employeeBloc = BlocProvider.of<EmployeeBloc>(context);
    _employeeBloc.add(const GetEmployee());
  }

  Future<void> refreshEmployees() async {
    _employeeBloc.add(const GetEmployee());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppBar(
            elevation: 5,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              HardCodedData.employees,
              style: AppTextStyle.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddEmployeeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              );
            } else if (state is EmployeeErrorState) {
              return Center(
                child: Text(
                  "${state.error!.message}",
                  style: AppTextStyle.bodyLarge
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              );
            } else if (state is EmployeeDoneState) {
              return RefreshIndicator(
                color: AppColors.blue,
                backgroundColor: AppColors.whiteColor,
                onRefresh: refreshEmployees,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              "${HardCodedData.employees} (${state.employeeListModel!.results.length})",
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 20.h),
                        state.employeeListModel!.results != null
                            ? ListView.builder(
                                itemCount:
                                    state.employeeListModel!.results.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final employeeData =
                                      state.employeeListModel!.results[index];
                                  return Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border.all(
                                              color: AppColors.grey,
                                              width: 1.w),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomInformation(
                                                  title: HardCodedData.name,
                                                  subTitle: "${employeeData.name.title} ${employeeData.name.first} ${employeeData.name.last}",
                                                ),
                                                CustomButtonInText(
                                                  color: AppColors.grey3,
                                                  text: employeeData.location.country,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h),
                                            CustomInformation(
                                              title: HardCodedData.gender,
                                              subTitle: employeeData.gender,
                                            ),
                                            SizedBox(height: 16.h),
                                            CustomInformation(
                                              title: HardCodedData.email,
                                              subTitle: employeeData.email,
                                            ),
                                            SizedBox(height: 16.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomInformation(
                                                  title: HardCodedData.phone,
                                                  subTitle: employeeData.phone,
                                                ),
                                                CustomButtonInText(
                                                  color: AppColors.whiteColor2,
                                                  text: HardCodedData.edit,
                                                  widget: SvgPicture.asset(
                                                      AppImages.edit,
                                                      height: 16.h,
                                                      width: 16.h),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                    ],
                                  );
                                },
                              )
                            : SizedBox(
                                height: 500.h,
                                child: Center(
                                  child: Text(
                                    HardCodedData.noDataFound,
                                    style: AppTextStyle.titleMedium
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
