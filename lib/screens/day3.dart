
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day3AnimatedBuilder extends StatefulWidget {
  const Day3AnimatedBuilder({super.key});

  @override
  _Day3AnimatedBuilderState createState() => _Day3AnimatedBuilderState();
}

class _Day3AnimatedBuilderState extends State<Day3AnimatedBuilder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _rotationAnim;

  @override
  void initState() {
    super.initState();
    // On init state we actually set the controller and animation....
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat(); // the controller....
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi)
        .animate(_controller); //  the tween animation....
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ? What is AnimatedBuilder....
    /**
     * [AnimatedBuilder] is the simplest way to perform the animation on to the flutter app....
     * this required two attribute [animation] & [builder]....
     */
    return Scaffold(
      body: AnimatedBuilder(
        /**
         * this [animation] accept Any Listenable Elements like (AnimationController, Draggable, Scrollable, etc..,)....
         */
        animation: _controller, // ? here we give the AnimationController....
        /**
         * this [builder] will function of two values that's (BuildContext context,Widget child)....
         * we needed to return the Ui which carry the animation value....
         */
        builder: (BuildContext context,Widget)
        => Transform.rotate(
          angle: _rotationAnim.value, // ? here we give the Animation value...
          child: Center(
            // This animation effect is (A 250x250Container going to be rotate at center)....
            child: Container(
              width: 250,
              height: 250,
              color: Colors.amber,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Day 3, AnimatedBuilder"),
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