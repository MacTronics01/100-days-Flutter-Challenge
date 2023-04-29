import 'package:flutter/material.dart';
import 'package:flutter_challange/screens/day4.dart';
import 'package:flutter_challange/screens/day5.dart';
import 'package:flutter_challange/screens/day6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:   Day6AnimatedList(key: null,),
    );
  }
}

