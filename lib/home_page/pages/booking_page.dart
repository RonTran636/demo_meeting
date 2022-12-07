import 'dart:io';
import 'dart:math';

import 'package:demo_meeting/home_page/cubit/calendar_cubit.dart';
import 'package:demo_meeting/home_page/pages/user_list_page.dart';
import 'package:demo_meeting/utils/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/app_color.dart';
import '../dpo/meeting_dpo.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _indexSelected = 0;
  late String _currentTimeSlot = _timeAvailable.first;
  late DateTime _selectedDay = DateTime.now();
  late final _cubit = context.read<CalendarCubit>();

  // late final _cubit = context.read<PtcBookingCubit>();

  @override
  void initState() {
    _cubit.getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyFA,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.grey88,
        elevation: 0,
        title: Text(
          'BOOKING A MEETING',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<CalendarCubit, CalendarState>(
            builder: (context, state) {
              return state.maybeWhen(
                userLoaded: (listUser) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacer.medium(),
                      const Text('Selected user:'),
                      VerticalSpacer.medium(),
                      ListTile(
                        leading: Image.network(listUser[_indexSelected].image!),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserListPage(
                              userList: listUser,
                              onUserTap: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  _indexSelected = listUser.indexOf(value);
                                });
                              },
                            ),
                          ),
                        ),
                        title: Text(listUser[_indexSelected].name),
                      ),
                      VerticalSpacer.medium(),
                      const Divider(),
                      const Text('Select day:'),
                      VerticalSpacer.medium(),
                      InkWell(
                        onTap: () {
                          showCalendar(
                            context,
                            initialDay: _selectedDay,
                            onDateSelect: (dateSelect) => setState(() {
                              _selectedDay = dateSelect;
                            }),
                          );
                        },
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColor.greyE7),
                          ),
                          child: Row(
                            children: [
                              HorizontalSpacer.custom(width: 12.w),
                              Expanded(
                                child: Text(
                                  _selectString,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const Icon(Icons.calendar_month),
                              HorizontalSpacer.custom(width: 12.w),
                            ],
                          ),
                        ),
                      ),
                      VerticalSpacer.medium(),
                      const Divider(),
                      const Text('Time available:'),
                      VerticalSpacer.medium(),
                      Expanded(
                        child: GridView.builder(
                          itemCount: _timeAvailable.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSpacing.medium.space,
                            mainAxisSpacing: AppSpacing.medium.space,
                            childAspectRatio: 164 / 40,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                _currentTimeSlot = _timeAvailable[index];
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _currentTimeSlot == _timeAvailable[index]
                                      ? Theme.of(context).backgroundColor
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: Text(
                                  _timeAvailable[index],
                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      VerticalSpacer.medium(),
                      InkWell(
                        onTap: () {
                          _cubit.addMeeting(
                            MeetingDpo(
                              eventId: '',
                              eventName: 'Meeting with ${listUser[_indexSelected].name}',
                              backgroundColor: AppColor.markerColors[Random().nextInt(4)],
                              eventDay: DateFormat('yyyyMMdd').format(_selectedDay),
                              eventDuration: _currentTimeSlot,
                            ),
                          );
                          Fluttertoast.showToast(msg: 'Booking success');
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Text(
                            'Book meeting',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      VerticalSpacer.large(),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }

  void showCalendar(
    BuildContext context, {
    DateTime? initialDay,
    required ValueChanged<DateTime> onDateSelect,
  }) async {
    if (Platform.isAndroid) {
      final chosenDay = await showDatePicker(
        context: context,
        initialDate: initialDay ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
        builder: (context, dialogWidget) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.teacherPrimaryColor, // header background color
              onPrimary: AppColor.white, // header text color
              onSurface: AppColor.teacherPrimaryColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.teacherPrimaryColor, // button text color
              ),
            ),
          ),
          child: dialogWidget!,
        ),
      );
      if (chosenDay != null) {
        onDateSelect(chosenDay);
      }
    } else {
      DateTime chosenDay = DateTime.now();
      showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.medium.space,
                vertical: AppSpacing.small.space,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'Cancel',
                        style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColor.grey88),
                      ),
                    ),
                  ),
                  HorizontalSpacer.small(),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        onDateSelect(chosenDay);
                      },
                      child: Text(
                        'OK',
                        textAlign: TextAlign.right,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: AppColor.teacherPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: CupertinoDatePicker(
                initialDateTime: initialDay ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  chosenDay = value;
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  String get _selectString => DateFormat('dd MMM, yyyy').format(_selectedDay);

  final _timeAvailable = [
    '09:30 - 10:00',
    '10:00 - 10:30',
    '10:30 - 11:00',
    '11:00 - 11:30',
    '13:00 - 13:30',
    '13:30 - 14:00',
    '14:00 - 14:30',
    '14:30 - 15:00',
  ];
}
