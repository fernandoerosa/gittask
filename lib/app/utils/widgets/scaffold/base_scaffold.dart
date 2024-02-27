import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gittask/app/modules/task/controllers/task_controller.dart';
import 'package:gittask/app/utils/widgets/navbar/nav_model.dart';

import '../navbar/nav_bar.dart';

class BaseScaffold extends StatelessWidget {
  BaseScaffold({
    super.key,
    required this.selectedTab,
    required this.items,
    required int selectedIndex,
    required this.page,
  }) : _selectedIndex = selectedIndex;

  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  final int selectedTab;
  final List<NavModel> items;
  final int _selectedIndex;
  final Widget page;

  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.deepPurpleAccent,
                  onTap: () {},
                  child: const SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pipocamusical.files.wordpress.com/2011/06/sucker-punch-sucker-punch-19983470-1920-1080.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 50),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {
            Get.bottomSheet(
              SafeArea(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text(
                          'Create \nNew Task',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: TextField(
                          controller: taskNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Task Name',
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: SizedBox(
                          height: 150,
                          child: TextField(
                            controller: taskDescriptionController,
                            expands: true,
                            maxLines: null,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: 'Task Decription',
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 75,
                          child: IconButton(
                            onPressed: () {
                              taskController.createTask(
                                taskNameController.text,
                                taskDescriptionController.text,
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ignoreSafeArea: false,
              isScrollControlled: true,
              backgroundColor: Colors.white
            );
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (route) {
          Get.toNamed(route);
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://pipocamusical.files.wordpress.com/2011/06/sucker-punch-sucker-punch-19983470-1920-1080.jpg"),
                    ),
                  ),
                  height: 175.0,
                ),
                Container(
                  height: 175.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 175.0,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      "Babydoll Punch",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.task_alt_outlined),
              title: const Text('Tasks'),
              selected: _selectedIndex == 1,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.summarize_outlined),
              title: const Text('Summary'),
              selected: _selectedIndex == 2,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
