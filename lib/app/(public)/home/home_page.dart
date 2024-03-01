import 'package:asp_arch/app/interactor/actions/todo_action.dart';
import 'package:asp_arch/app/utils/widgets/navbar/nav_model.dart';
import 'package:asp_arch/app/utils/widgets/scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    TodoAction.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    int selectedTab = 0;
    List<NavModel> items = [];

    var _selectedIndex = 0;
    return BaseScaffold(
      selectedTab: selectedTab,
      items: items,
      selectedIndex: _selectedIndex,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 50),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {

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
      page: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const Column(
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
          Flexible(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 8,
              children: [
                GridButton(title: "Canceled", description: "4 tasks"),
                GridButton(
                  title: "Upcoming",
                  description: "16 tasks",
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  titleColor: Colors.white,
                ),
                GridButton(
                  title: "Today",
                  description: "8 tasks",
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  titleColor: Colors.white,
                ),
                GridButton(title: "Inbox", description: "72 tasks"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GridButton extends StatelessWidget {
  String title;
  String description;
  ButtonStyle? style;
  Color? titleColor;

  GridButton({
    super.key,
    required this.title,
    required this.description,
    this.style,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: titleColor ?? Colors.black,
              fontSize: 20,
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Hello BabyDoll",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Good Morning!",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: SearchBar(
              leading: Icon(Icons.search, color: Colors.grey),
              hintText: "Search for something...",
            ),
          ),
        )
      ],
    );
  }
}
