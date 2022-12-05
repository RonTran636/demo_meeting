import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_color.dart';

class CalendarDayTileWidget extends StatelessWidget {
  const CalendarDayTileWidget({Key? key, required this.day, this.isMonthRequired})
      : super(key: key);

  final DateTime day;
  final bool? isMonthRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isMonthRequired == true ? DateFormat('MMM').format(day) : DateFormat('EEE').format(day),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isSameDay(day, DateTime.now())
                      ? Theme.of(context).primaryColor
                      : AppColor.blackText,
                ),
          ),
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: isSameDay(day, DateTime.now())
                ? BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  )
                : null,
            child: Text(
              DateFormat('d').format(day),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: isSameDay(day, DateTime.now()) ? AppColor.white : AppColor.blackText,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
