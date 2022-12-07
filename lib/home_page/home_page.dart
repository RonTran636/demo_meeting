import 'package:demo_meeting/home_page/home_page_body.dart';
import 'package:demo_meeting/home_page/pages/booking_page.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: HomePageBody()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookingPage(),
            ),
          );
        },
        child: const Icon(Icons.add, color: AppColor.white,),
      ),
    );
  }
}
