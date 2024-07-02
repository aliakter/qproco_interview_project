import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_bloc.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_bloc.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_event.dart';
import 'package:qproco_interview_project/features/splash/splash_screen.dart';
import 'package:qproco_interview_project/shared/data/local/storage_service.dart';
import 'package:qproco_interview_project/shared/injection_data.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Get.putAsync<StorageService>(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(344, 844),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EmployeeBloc>(
              create: (_) => di.sl<EmployeeBloc>()..add(const GetEmployee()),
            ),
            BlocProvider<AddEmployeeBloc>(
              create: (_) => di.sl<AddEmployeeBloc>(),
            ),
          ],
          child: MaterialApp(
            title: 'Qproco Interview Project',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
