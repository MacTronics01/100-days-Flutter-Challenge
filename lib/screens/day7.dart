import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day7ReorderableListView extends StatefulWidget {
  Day7ReorderableListView({super.key});


  @override
  _Day7ReorderableListViewState createState() =>
      _Day7ReorderableListViewState();
}

class _Day7ReorderableListViewState extends State<Day7ReorderableListView> {
  final family = [
    "11 SriSanth",
    "1 Janarthanan",
    "5 Rajus",
    "2 Saratha",
    "3 Babu",
    "12 Humsi",
    "4 Yanuma",
    "6 Jothi",
    "10 Sharika",
    "7 Ramu",
    "8 Gayathri",
    "13 Niki",
    "14 Hari",
    "9 Sanjay",
  ]; // ? This is the Family list....
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          /**
           * ? What is ReorderableListView....
           * ! ReorderableListView is the cool widget for change the list view by dragging....
           */
          child: ReorderableListView(
            // ! it have header property to add then header to the list item....
            header: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Order the Falimy Tree",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: "\nLong press and drag to reorder the list",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            // ! children is the property where defalut list generated....
            children: <Widget>[
              for (String data in family)
                ListTile(
                  key: ValueKey(data),
                  title: Text(data),
                )
            ],
            /**
             * ! very important property is that onReorder and it is must too....
             * ! onReorder give us the old and new postion of the list....
             * ! we needed to update the list accordingly....
             */
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                // ? here I am updating the family list by....
                // ! insert the drag element in to new position and remove it from there....
                family.insert(newIndex, family.removeAt(oldIndex));
              });
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("ReorderableListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png';;
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