import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day1 extends StatefulWidget {
  const Day1({super.key, required this.title});

  final String title;

  @override
  State<Day1> createState() => _Day1State();
}

class _Day1State extends State<Day1> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("001 Flutter Challange"),
      ),
      body: Container(
        margin:const EdgeInsets.only(right: 20,left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Person1',
                  style: TextStyle(color: Colors.blue,fontSize: 20),
                ),Text(
                  'Person2',
                  style: TextStyle(color: Colors.green,fontSize: 20),
                ),Text(
                  'Person3',
                  style: TextStyle(color: Colors.red,fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.accessibility,color: Colors.blue, size:25),
                Icon(Icons.accessibility,color: Colors.green, size:25),
                Icon(Icons.accessibility,color: Colors.red, size:25)
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Person1',
                  style: TextStyle(color: Colors.blue,fontSize: 20),
                ),Text(
                  'Person2',
                  style: TextStyle(color: Colors.green,fontSize: 20),
                ),Text(
                  'Person3',
                  style: TextStyle(color: Colors.red,fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.accessibility,color: Colors.blue, size:25),
                Icon(Icons.accessibility,color: Colors.green, size:25),
                Icon(Icons.accessibility,color: Colors.red, size:25)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
