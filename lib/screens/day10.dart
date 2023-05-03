import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day10DefaultTabControllerAndTabBar extends StatefulWidget {
  Day10DefaultTabControllerAndTabBar({super.key});

  @override
  _Day10DefaultTabControllerAndTabBarState createState() =>
      _Day10DefaultTabControllerAndTabBarState();
}

class _Day10DefaultTabControllerAndTabBarState
    extends State<Day10DefaultTabControllerAndTabBar> {
  @override
  Widget build(BuildContext context) {
    // ? What is DefaultTabController, TabBar & TabBarView....
    /**
     * ! To impelment the Tabs in the Flutter we need to maintain and understand the there important Widget....
     * * 1 - DefaultTabController to control the UiChange....
     * * 2 - TabBar to display the Tabs in [appBar]....
     * * 3 - TabBarView to display the current Page corresponding to Tabs....
     */
    return DefaultTabController(
      // ! here we added the [DefaultTabController]....
      length: 3, // ! [length] denote the total tabs....
      initialIndex: 1, // ! here we initialize the stating tab....
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              // ! here we added the [TabBar] at the bottom of the [appBar]....
              // ! and added the tabs one by one....
              Tab(
                child: Text("Left"),
              ),
              Tab(
                child: Text("Mid"),
              ),
              Tab(
                child: Text("Right"),
              ),
            ],
          ),
          title: const Text('Day10 DefaultTabController'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: () async {
                const url =
                    'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )
          ],
        ),
        body: const SafeArea(
          child: TabBarView(
            // ! here we added the [TabBarView]....
            children: [
              // ! to the [children] of the TabBarView we added the actual tabs views....
              Center(
                child: Text(
                  "This is Left Side",
                  style: TextStyle(fontSize: 30, color: Colors.pink),
                ),
              ),
              Center(
                child: Text(
                  "This is Middle",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "This is Right Side",
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}