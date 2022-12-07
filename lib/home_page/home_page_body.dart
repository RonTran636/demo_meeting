import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_color.dart';
import '../utils/progress_indicator_dialog.dart';
import 'cubit/calendar_cubit.dart';
import 'dpo/meeting_dpo.dart';
import 'widgets/calendar_tab_view_widget.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('MEETING DEMO'),
          centerTitle: false,
          backgroundColor: AppColor.teacherPrimaryColor,
          foregroundColor: AppColor.white,
          elevation: 0,
        ),
        Expanded(
          child: BlocBuilder<CalendarCubit, CalendarState>(
            builder: (context, state) {
              Map<String, List<MeetingDpo>> eventGroupByDay = state.maybeWhen(
                bookingListLoaded: (dpo) => dpo.groupBy((e) => e.eventDay),
                orElse: () => {},
              );
              return CalendarTabViewWidget(
                onDateSelect: (date) => setState(() {}),
                listEvent: eventGroupByDay,
              );
            },
          ),
        ),
      ],
    );
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E element) =>
            map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
      );
}
