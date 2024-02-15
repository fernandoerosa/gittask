import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gittask/app/utils/widgets/navbar/NavBar.dart';

import '../../../utils/widgets/navbar/NavModel.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeNavKey = GlobalKey<NavigatorState>();
    final searchNavKey = GlobalKey<NavigatorState>();
    final notificationNavKey = GlobalKey<NavigatorState>();
    final profileNavKey = GlobalKey<NavigatorState>();
    int selectedTab = 0;
    List<NavModel> items = [];

    var _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.red, // Splash color
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
      body: Obx(
        () => Center(
          child: Text(
            controller.getCount(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 50),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () => controller.increment(),
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
        onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {}
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
                      "Welcome Babydoll!",
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
