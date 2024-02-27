import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gittask/app/utils/widgets/navbar/nav_model.dart';

import '../../../utils/widgets/scaffold/base_scaffold.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 1;

    int selectedTab = 1;
    List<NavModel> items = [];

    return BaseScaffold(
      selectedTab: selectedTab,
      items: items,
      selectedIndex: _selectedIndex,
      page: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  "My List",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
