import 'package:demo_meeting/home_page/widgets/search_box_widget.dart';
import 'package:demo_meeting/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../network/dto/user_dto.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({
    Key? key,
    required this.userList,
    required this.onUserTap,
  }) : super(key: key);

  final List<Result> userList;
  final ValueChanged<Result> onUserTap;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localList = searchController.text.isEmpty
        ? widget.userList
        : widget.userList
            .where(
              (attendance) =>
                  attendance.name.toLowerCase().contains(searchController.text.toLowerCase()),
            )
            .toList();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            SearchBoxWidget(searchController: searchController),
            VerticalSpacer.medium(),
            Expanded(
              child: localList.isEmpty
                  ? const Text('No result')
                  : ListView.separated(
                      itemCount: localList.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => VerticalSpacer.medium(),
                      itemBuilder: (context, index) => ListTile(
                        leading: Image.network(localList[index].image!),
                        title: Text(localList[index].name),
                        onTap: () => widget.onUserTap(localList[index]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
