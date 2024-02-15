import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Test'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
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
