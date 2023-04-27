import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day4Dismissible extends StatefulWidget {
  const Day4Dismissible({super.key});

  @override
  _Day4DismissibleState createState() => _Day4DismissibleState();
}

class _Day4DismissibleState extends State<Day4Dismissible> {
  final family = [
    "Usen",
    "Macaulay",
    "Ubon",
    "Udeme",
    "Christiana",
    "IniObong",
    "Emmanuel",
    "Victor",
    "Esther",
    "Emmanuella",
    "Darsi",
    "Emem",
    "Akpan",
    "Mactronics"
  ]; // ? This is the Family list....
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day4 Dismissible"),
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
        child: ListView.builder(
          // ! Creating the List view....
          itemCount: family.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              // ? What is Dismissible....
              /**
               * ! Dismissible is the cool flutter widget which delete the Widget via swipe....
               * ! yes, it requried 2 properties [key], [child]....
               */
              key: Key(family[
              index]),
              background: Container(
                // ! this the background effect given to the dismissal (primary driection) ....
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 25),
                child: const Icon(Icons.add),
              ),
              secondaryBackground: Container(
                // ! this the background effect given to the dismissal (secondary driection) ....
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 25),
                child: const Icon(Icons.remove),
              ),
              onDismissed: (direction) {
                // ! this is where we can control the dismiss actions with the help of parameter direction....
                setState(() {
                  family.removeAt(
                      index); // ! I am set the state to the updated list....
                });
                direction ==
                    DismissDirection
                        .startToEnd // ! If the Dimiss Direction is left or right then green or red....
                    ? SnackBar(content:
                    Text("Member ${family[index]} Dismissed by Green")
                ): SnackBar(content:
                Text("Member ${family[index]} Dismissed by Red")
                );
                // Scaffold.of(context).showSnackBar(SnackBar(
                //     content:
                //     Text("Member ${family[index]} Dismissed by Green")))
                //     : Scaffold.of(context).showSnackBar(SnackBar(
                //     content:
                //     Text("Member ${family[index]} Dismissed by Red"))
                // );
              },
              direction: DismissDirection.horizontal,
              /**
               * ! we can give then swpie direction like:-
               * * horizontal,
               * * vertical,
               * * up,
               * * downm
               * * startToEnd,
               * * endToStart
               */
              movementDuration: const Duration(
                  seconds:
                  2), // ? this is the time duration for the moment and the motion while restore to normal....
              resizeDuration: const Duration(
                  seconds:
                  2), // ! it required unique key to perfrom the effect or dismissal....
              child: ListTile(
                // ! this is the place where dismissal is going to be happen....
                title: Text(family[index]),
              ), // ? this is the time duration for the dismissal and the fill the size....
            );
          },
        ),
      ),
    );
  }
}