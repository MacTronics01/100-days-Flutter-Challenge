import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day8DraggableScrollableSheet extends StatefulWidget {
  const Day8DraggableScrollableSheet({super.key});

  @override
  _Day8DraggableScrollableSheetState createState() =>
      _Day8DraggableScrollableSheetState();
}

class _Day8DraggableScrollableSheetState
    extends State<Day8DraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "This is BackSide",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          DraggableScrollableSheet(
            /**
             * ! DraggableScrollableSheet is the cool widget which widely used in the mobiles....
             * ! when a bottm sheet is drag lead to scrollable list....
             */
            expand: true, // ! weather the builder item fill the space....
            initialChildSize:
            0.10, // ! intial size when the page is loaded or reloaded....
            maxChildSize: 0.90, // ! max size with the sheet is scroll up....
            minChildSize:
            0.10, // ! min size with the sheet is scroll down....
            builder:
            // ! here the list item is build with context and scroll controller....
                (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  // ! to showcase the scroll function we added the listview here....
                  controller:
                  scrollController, // ! added the parent scroll controller here....
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item ${index + 1}'));
                  },
                ),
              );
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(' Day8 DraggableScrollableSheet'),
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