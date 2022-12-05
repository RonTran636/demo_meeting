import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_color.dart';
import '../../utils/spacing.dart';
import '../dpo/meeting_dpo.dart';

class CalendarEventTileWidget extends StatelessWidget {
  const CalendarEventTileWidget({Key? key, required this.meetingDpo}) : super(key: key);

  final MeetingDpo meetingDpo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.02, 0.02],
          colors: [meetingDpo.backgroundColor, AppColor.white],
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: ListTile(
        onTap: () {},
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Assets.images.clock.svg(),
            HorizontalSpacer.custom(width: 8.w),
            Text(
              '',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColor.grey88,
                  ),
            )
          ],
        ),
        subtitle: Text(
          meetingDpo.eventName,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
