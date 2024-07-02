import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qproco_interview_project/config/constant/app_colors.dart';
import 'package:qproco_interview_project/config/constant/app_text_styles.dart';
import 'package:qproco_interview_project/config/constant/hard_coded_data.dart';
import 'package:qproco_interview_project/core/utils/utils.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_bloc.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_event.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_state.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/screen/employee_list_screen.dart';
import 'package:qproco_interview_project/global_widgets/custom_appbar.dart';
import 'package:qproco_interview_project/global_widgets/custom_button.dart';
import 'package:qproco_interview_project/global_widgets/custom_text.dart';
import 'package:qproco_interview_project/global_widgets/custom_textfield.dart';
import 'package:qproco_interview_project/shared/globals_settings.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  late AddEmployeeBloc addEmployeeBloc;

  @override
  void initState() {
    super.initState();
    IS_POST = "true";
    addEmployeeBloc = BlocProvider.of<AddEmployeeBloc>(context);
  }

  bool isNameOkay() {
    if (nameController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isEmailOkay() {
    if (emailController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isNumberOkay() {
    if (numberController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isRoleOkay() {
    if (roleController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor2,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              HardCodedData.addEmployee,
              style: AppTextStyle.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: HardCodedData.name),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: nameController,
                hintText: HardCodedData.writeYourEmployeeName,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16.h),
              const CustomText(text: HardCodedData.email),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: emailController,
                hintText: HardCodedData.writeYourEmployeeEmail,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16.h),
              const CustomText(text: HardCodedData.phoneNumber),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: numberController,
                hintText: HardCodedData.writeYourEmployeeEmail,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16.h),
              const CustomText(text: HardCodedData.role),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: roleController,
                hintText: HardCodedData.writeYourEmployeeEmail,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100.h,
          width: double.infinity,
          color: AppColors.whiteColor2,
          padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<AddEmployeeBloc, AddEmployeeState>(
                listener: (context, state) {
                  if (state is AddEmployeeLoadingState) {
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blue,
                      ),
                    );
                  } else if (state is AddEmployeeErrorState) {
                    Utils.toastMsg("${state.error.message}");
                  } else if (state is AddEmployeeDoneState) {
                    Utils.toastMsg(
                        HardCodedData.employeeAddedSuccessfullyCompleted);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmployeeListScreen()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return addEmployeeBloc.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        )
                      : CustomButton(
                          height: 44.h,
                          width: double.infinity,
                          elevation: 0,
                          text: HardCodedData.next,
                          foregroundColor: AppColors.green,
                          backgroundColor: AppColors.blue,
                          onPressed: () {
                            if (isNameOkay() &&
                                isEmailOkay() &&
                                isNumberOkay() &&
                                isRoleOkay()) {
                              context.read<AddEmployeeBloc>().add(
                                    PostAddEmployee(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phoneNumber: numberController.text,
                                      role: roleController.text,
                                    ),
                                  );
                            } else if (!isNameOkay()) {
                              Utils.toastMsg(HardCodedData.nameCannotBeEmpty);
                            } else if (!isEmailOkay()) {
                              Utils.toastMsg(HardCodedData.emailCannotBeEmpty);
                            } else if (!isNumberOkay()) {
                              Utils.toastMsg(
                                  HardCodedData.phoneNumberCannotBeEmpty);
                            } else if (!isRoleOkay()) {
                              Utils.toastMsg(HardCodedData.roleCannotBeEmpty);
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.clear();
    emailController.clear();
    numberController.clear();
    roleController.clear();
  }
}
