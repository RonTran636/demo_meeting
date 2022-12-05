import 'package:demo_meeting/home_page/cubit/calendar_cubit.dart';
import 'package:demo_meeting/home_page/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit(),
      child: const Scaffold(
        body: SafeArea(child: HomePageBody()),
      ),
    );
  }
}