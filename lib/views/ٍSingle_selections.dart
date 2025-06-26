import 'package:flutter/material.dart';
import 'package:some_logic/core/models/plats_model.dart';

class SingleSelections extends StatefulWidget {
  const SingleSelections({super.key});

  @override
  State<SingleSelections> createState() => _SingleSelectionsState();
}

class _SingleSelectionsState extends State<SingleSelections> {
  final List<PlatsModel> plats = [
    PlatsModel(
      id: "1",
      title: "Butterfly",
      image: "assets/carvel/Butterfly.png",
    ),
    PlatsModel(id: "2", title: "Circle", image: "assets/carvel/Circle.png"),
    PlatsModel(id: "3", title: "Flower", image: "assets/carvel/flower.png"),
    PlatsModel(id: "4", title: "Hearts", image: "assets/carvel/Hearts.png"),
    PlatsModel(id: "5", title: "Hexagon", image: "assets/carvel/Hexagon.png"),
    PlatsModel(
      id: "6",
      title: "Large Flower",
      image: "assets/carvel/large_flower.png",
    ),
    PlatsModel(
      id: "7",
      title: "Large Square",
      image: "assets/carvel/large_square.png",
    ),
    PlatsModel(id: "8", title: "Leaf", image: "assets/carvel/leaf.png"),
    PlatsModel(id: "9", title: "Oval", image: "assets/carvel/Oval.png"),
    PlatsModel(
      id: "10",
      title: "Small Square",
      image: "assets/carvel/Small_Square.png",
    ),
  ];

  int? _selectedIndex; // To track the selected index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: plats.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 60,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  // background
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.1, 1.0],
                      ),
                    ),
                  ),
                  // image
                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      plats[index].image,
                      fit: BoxFit.fitHeight,
                      height:
                          _selectedIndex == index
                              ? MediaQuery.sizeOf(context).height * .25
                              : MediaQuery.sizeOf(context).height * .2,
                    ),
                  ),
                  // title
                  Positioned(
                    bottom: 70,

                    child: Center(
                      child:
                          _selectedIndex == index
                              ? SizedBox.shrink()
                              : Text(
                                plats[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
                  ),
                  // select button
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index; // Update the selected index
                        }); // Update the selected index
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${plats[index].title} selected!'),
                            duration:  Duration(milliseconds: 500),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color:
                                _selectedIndex == index
                                    ? Colors.greenAccent.withOpacity(0.5)
                                    : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _selectedIndex == index ? "Selected" : "Select",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
