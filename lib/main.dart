import 'package:demo_meeting/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page/cubit/calendar_cubit.dart';
import 'home_page/home_page.dart';
import 'home_page/network/mobile_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => CalendarCubit(MobileRepository()),
        child: MaterialApp(
          title: 'Flutter Demo',
          color: AppColor.teacherPrimaryColor,
          theme: ThemeData(
            primaryColor: AppColor.teacherPrimaryColor,
            iconTheme: const IconThemeData(color: AppColor.grey88),
            backgroundColor: AppColor.lightRedBackground,
            scaffoldBackgroundColor: AppColor.greyFA,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
