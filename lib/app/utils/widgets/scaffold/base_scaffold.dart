import 'package:asp_arch/app/(public)/task/task_controller.dart';
import 'package:asp_arch/app/injector.dart';
import 'package:asp_arch/app/utils/widgets/navbar/nav_model.dart';
import 'package:asp_arch/routes.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import '../navbar/nav_bar.dart';

class BaseScaffold extends StatelessWidget {

  BaseScaffold({
    super.key,
    required this.selectedTab,
    required this.items,
    required int selectedIndex,
    required this.page,
    required this.floatingActionButton,
  }) : _selectedIndex = selectedIndex;

  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  final Widget floatingActionButton;
  final int selectedTab;
  final List<NavModel> items;
  final int _selectedIndex;
  final Widget page;

  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  final TaskController taskController = injector.get<TaskController>();

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
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (route) {
          Routefly.navigate(route);
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
              onTap: () {
                Routefly.navigate(routePaths.home);
              },
            ),
            ListTile(
              leading: Icon(Icons.task_alt_outlined),
              title: const Text('Tasks'),
              selected: _selectedIndex == 1,
              onTap: () {
                Routefly.navigate(routePaths.task.path);
              },
            ),
            ListTile(
              leading: Icon(Icons.summarize_outlined),
              title: const Text('Summary'),
              selected: _selectedIndex == 2,
              onTap: () {
                Routefly.navigate(routePaths.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
