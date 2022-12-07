import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../dpo/meeting_dpo.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
    this.existMeetingDpo,
  }) : super(key: key);

  final MeetingDpo? existMeetingDpo;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _indexSelected = 0;

  // late final _cubit = context.read<PtcBookingCubit>();

  @override
  void initState() {
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
          'Booking a meeting',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
