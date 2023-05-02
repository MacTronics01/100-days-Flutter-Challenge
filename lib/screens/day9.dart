import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Day9AbsorbPointer extends StatefulWidget {
  const Day9AbsorbPointer({super.key});
  @override
  State<Day9AbsorbPointer> createState() => _Day9AbsorbPointerState();
}

class _Day9AbsorbPointerState extends State<Day9AbsorbPointer> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AbsorbPointer(
          /**
           * ? What is AbsorbPointer....
           * ! with the help of [AbsorbPointer] we can prevent the touch event from the user....
           */
          absorbing: true, // ! change here to activate the event....
          /**
           * ! When absorbing is true, this widget prevents its subtree from receiving pointer events by terminating hit testing at itself....
           * [absorbing] == true ? try to scroll the listview....
           */
          ignoringSemantics: false,
          /**
           * ! Whether the semantics of this render object is ignored when compiling the semantics tree....
           * ! if null takes the [absorbing] value....
           */
          child: ListView.builder(
            itemCount: 5,
            // ? here the ListView have scroll event....
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: ElevatedButton(onPressed: () {
                  Fluttertoast.showToast(
                      msg: "List item $index",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.lightGreenAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                    child: Text("List item $index")),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Day9 AbsorbPointer"),
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