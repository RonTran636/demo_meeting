import 'package:demo_meeting/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../network/dto/user_dto.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({
    Key? key,
    required this.userList,
    required this.onUserTap,
  }) : super(key: key);

  final List<Result> userList;
  final ValueChanged<Result> onUserTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USER LIST',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.grey88,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: userList.length,
        separatorBuilder: (_, __) => VerticalSpacer.medium(),
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(userList[index].image!),
          title: Text(userList[index].name),
          onTap: () => onUserTap(userList[index]),
        ),
      ),
    );
  }
}
