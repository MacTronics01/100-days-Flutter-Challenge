import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day5AnimatedSwitcher extends StatefulWidget {
  Day5AnimatedSwitcher({super.key});

  @override
  _Day5AnimatedSwitcherState createState() => _Day5AnimatedSwitcherState();
}

class _Day5AnimatedSwitcherState extends State<Day5AnimatedSwitcher> {
  var _viewItem;

  final _widthItem = ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      color: Colors.deepOrange,
      width: 250,
      height: 100,
      child: const Center(
        child:
        Text("Click", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
  );

  final _heightItem = ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      color: Colors.green,
      width: 100,
      height: 250,
      child: const Center(
        child:
        Text("Flip", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
  );
  @override
  void initState() {
    super.initState();
    _viewItem = _widthItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _viewItem = _viewItem == _widthItem
                  ? _heightItem
                  : _widthItem; // ! here we toggle the item....
            });
          },
          child: Center(
            /**
             * ? What is AnimatedSwitcher....
             * ! AnimatedSwitcher is the cool flutter widget....
             * ! Where we can switch between the Widgets by cool animation....
             */
            child: AnimatedSwitcher(
              // ! [duration] is important property where we give the time duration
              duration: const Duration(milliseconds: 500),
              // ! [transitionBuilder] is the place we can customize the default FadeTransition...
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.0, end: 3.0).animate(animation),
                child: child,
              ),
              // ! [child] is the property for apply changes....
              child: Container(
                // * very important point to perfrom the AnimatedSwitcher is key....
                // * yes, we needed to provide the key for each widget....
                key: ValueKey<ClipRRect>(_viewItem),
                child: _viewItem, // ! we apply the viewItem here....
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(" Day5 AnimatedSwitcher"),
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
    );
  }
}