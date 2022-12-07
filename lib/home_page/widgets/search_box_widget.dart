import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';
import '../../utils/spacing.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColor.greyF7,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          HorizontalSpacer.small(),
          Icon(Icons.search, size: 16.w,),
          HorizontalSpacer.custom(width: 4.w),
          Expanded(
            child: TextField(
              controller: searchController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}