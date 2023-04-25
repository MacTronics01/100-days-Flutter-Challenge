import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class Day2AnimationContainer extends StatefulWidget {
  const Day2AnimationContainer({super.key,});

  @override
  _Day2AnimationContainerState createState() => _Day2AnimationContainerState();
}

class _Day2AnimationContainerState extends State<Day2AnimationContainer> {
  var isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Day2 AnimatedContainer"),
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClick = !isClick;
            });
          },
          child: Center(
            child: AnimatedContainer(
              // ? what is AnimatedContainer....
              // ! The [curve] and [duration] arguments must not be null....

              duration: const Duration(milliseconds: 500),
              /**
               * ! [duration] is the important and requried property for the AnimatedContainer....
               * ! here we give the time duration of the animation....
               */
              curve: Curves.elasticIn,
              /**
               * ! [curve] is the property where you can specify the animation effect.....
               * ! there are plenty of animations are there in the Curves....
               * ! such as - linear, decelerate, ease, bounce, elastic....
               */
              width: isClick ? 200.0 : 200.0,
              height: isClick ? 100.0 : 200.0,
              decoration: BoxDecoration(
                borderRadius: isClick
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(100),
                color: isClick ? Colors.red : Colors.green,
              ),
              child: isClick
                  ? const Center(
                child: Text(
                  "Off",
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              )
                  : const Center(
                child: Text(
                  "On",
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}