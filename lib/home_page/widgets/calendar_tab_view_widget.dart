import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_color.dart';
import '../../utils/spacing.dart';
import '../cubit/calendar_cubit.dart';
import '../dpo/meeting_dpo.dart';
import 'calendar_day_tile_widget.dart';
import 'calendar_event_tile_widget.dart';

class CalendarTabViewWidget extends StatefulWidget {
  const CalendarTabViewWidget({
    Key? key,
    required this.onDateSelect,
    required this.listEvent,
  }) : super(key: key);

  final ValueChanged<DateTime?> onDateSelect;
  final Map<String, List<MeetingDpo>> listEvent;

  @override
  State<CalendarTabViewWidget> createState() => _CalendarTabViewWidgetState();
}

class _CalendarTabViewWidgetState extends State<CalendarTabViewWidget> {
  var _selectedDay = DateTime.now();
  late List<MeetingDpo> _currentListEvent =
      widget.listEvent[DateFormat('yyyyMMdd').format(_selectedDay)] ?? [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarCubit, CalendarState>(
      listener: (context, state) {
        state.maybeWhen(
          bookingListLoaded: (listMeetingDpo) => _calendar(context).onDaySelected!(
            DateTime.now(),
            DateTime.now(),
          ),
          orElse: () {},
        );
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          _calendar(context),
          VerticalSpacer.small(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: CalendarDayTileWidget(day: _selectedDay),
              ),
              Expanded(
                flex: 6,
                child: _currentListEvent.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'No event',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _currentListEvent.length,
                        itemBuilder: (context, index) =>
                            CalendarEventTileWidget(meetingDpo: _currentListEvent[index]),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableCalendar _calendar(BuildContext context) {
    return TableCalendar(
      rowHeight: 42.h,
      availableGestures: AvailableGestures.none,
      daysOfWeekHeight: 35.h,
      focusedDay: _selectedDay,
      calendarFormat: CalendarFormat.month,
      onHeaderTapped: (date) {},
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (_, day, __) => _defaultBuilder(context, day),
        todayBuilder: (_, day, __) => _defaultBuilder(context, day, isTodayBuilder: true),
        selectedBuilder: (_, day, focusedDay) => _defaultBuilder(
          context,
          day,
          isSelectedBuilder: true,
          isTodayBuilder: isSameDay(day, DateTime.now()),
        ),
        markerBuilder: (context, day, events) {
          late final List<MeetingDpo> meetingDpoList;
          try {
            meetingDpoList = events as List<MeetingDpo>;
          } on TypeError {
            meetingDpoList = [];
          }
          return Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: meetingDpoList.take(4).mapIndexed((index, meetingDpo) {
                if (meetingDpoList.length > 4 && index == 3) {
                  return Container(
                    width: 7,
                    height: 7,
                    clipBehavior: Clip.none,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    alignment: Alignment.center,
                    // child: Assets.images.plus.svg(width: 7, height: 7),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: meetingDpo.backgroundColor,
                  ),
                  width: 7.0,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                );
              }).toList(),
            ),
          );
        },
        singleMarkerBuilder: (context, date, event) {
          final meetingDpo = event as MeetingDpo;
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: meetingDpo.backgroundColor,
            ),
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
          );
        },
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (day, _) => setState(() {
        final dayId = DateFormat('yyyyMMdd').format(day);
        _currentListEvent = widget.listEvent[dayId] ?? [];
        _selectedDay = day;
        widget.onDateSelect(_selectedDay);
      }),
      eventLoader: (day) {
        final dayId = DateFormat('yyyyMMdd').format(day);
        return widget.listEvent[dayId] ?? [];
      },
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarStyle: CalendarStyle(
        tableBorder: TableBorder.all(color: AppColor.grey9e, width: 0.5),
        markerMargin: EdgeInsets.symmetric(horizontal: 2.w),
      ),
      firstDay: DateTime(2010),
      lastDay: DateTime(2999),
    );
  }
}

Widget _defaultBuilder(
  BuildContext context,
  DateTime day, {
  bool isTodayBuilder = false,
  bool isSelectedBuilder = false,
}) {
  return Container(
    alignment: Alignment.topCenter,
    decoration: isSelectedBuilder
        ? BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
          )
        : null,
    child: Container(
      padding: EdgeInsets.all(6.r),
      decoration: isTodayBuilder
          ? BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            )
          : null,
      child: Text(
        DateFormat('d').format(day),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: isTodayBuilder ? AppColor.white : AppColor.blackText,
            ),
      ),
    ),
  );
}
