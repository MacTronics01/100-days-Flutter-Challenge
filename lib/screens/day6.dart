import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day6AnimatedList extends StatefulWidget {
  Day6AnimatedList({super.key});

  @override
  _Day6AnimatedListState createState() => _Day6AnimatedListState();
}

class _Day6AnimatedListState extends State<Day6AnimatedList> {
  List<String> family = [];
  final GlobalKey<AnimatedListState> _animList = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList"),
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
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: AnimatedList(
                  // ? What is AnimatedList....

                  /**
                   * ! AnimatedList is to change the Normal list to something great....
                   * ! A key value is used to get the state of the Animlist....
                   */
                  key: _animList, // ! this is the key of AnimatedListState....
                  itemBuilder: (context, index, animation) {
                    /**
                     * ! [itemBuilder] will give you the (context, index, animation)....
                     * ! with the help of [animation] we can easily perform the animation on the list items....
                     */
                    return FadeTransition(
                      // ? here I am used the animation as fade transition....
                      opacity: animation.drive(
                        Tween(
                            begin: 0.0,
                            end:
                            1.0), // ? and i give the begining and end value as 0.0 to 1.0....
                      ),
                      child: ListTile(
                        title: Text(family[index]),
                      ),
                    );
                  },
                  initialItemCount: family
                      .length, // ! here we give the total list count as the value....
                  scrollDirection: Axis
                      .vertical, // ! we can specify the scold direction as vertical or horizontal....
                  shrinkWrap:
                  false, // ? Whether the extent of the scroll view in the [scrollDirection] should be determined by the contents being viewed....
                  padding: const EdgeInsets.all(20.0),
                  primary:
                  true, // ? Whether this is the primary scroll view associated with the parent....
                  reverse: false, // ? to reverse the direction to opposite
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              family.add("Item at : ${family.length}");
                              /**
                               * ! here we add the new item to the last index....
                               * ! and we set the state to reflect in the ui....
                               */
                              _animList.currentState
                                  ?.insertItem(family.length - 1);

                              /**
                               * ! so to perform animation in the list we can....
                               * ! we can get the current state from the key and insert the new item, with the help of [insertItem]....
                               */
                              print("Add : ${family.length - 1}");
                            });
                          },
                          child: const Text("Add"),
                        )
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (family.isNotEmpty) {
                              setState(() {
                                /**
                                 * ! here we are going to remove the last value from the list....
                                 * ! hence we store the last index from the list....
                                 */
                                int index = family.length - 1;
                                _animList.currentState?.removeItem(
                                  /**
                                   * ! so to perform animation in the list we can....
                                   * ! we can get the current state from the key and remove the last item, with the help of [removeItem]....
                                   */
                                  index, // ? here we need to provide index value....
                                      (context, animation)
                                  /**
                                   * ? here we give the same eliminating value with the help of (context, animation)....
                                   */
                                  => FadeTransition(
                                    opacity: animation.drive(
                                      Tween(begin: 0.0, end: 1.0),
                                    ),
                                    child: ListTile(
                                      title: Text(family.removeLast()),
                                    ),
                                  ),
                                );
                                print("Remove : ${family.length - 1}");
                              });
                            }
                          },
                          child: const Text("Remove"),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}