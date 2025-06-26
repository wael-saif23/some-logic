import 'package:flutter/material.dart';
import 'package:some_logic/core/models/product_model.dart';

class ImageSelections extends StatefulWidget {
  const ImageSelections({super.key});

  @override
  State<ImageSelections> createState() => _ImageSelectionsState();
}

class _ImageSelectionsState extends State<ImageSelections> {
  final List<ProductModel> keysHolders = [
    ProductModel(id: "1", title: "Holer 1", image: "assets/carvel/shot1.jpg"),
    ProductModel(id: "2", title: "Holer 2", image: "assets/carvel/shot2.jpg"),
    ProductModel(id: "3", title: "Holer 3", image: "assets/carvel/shot3.jpg"),
    ProductModel(id: "4", title: "Holer 4", image: "assets/carvel/shot4.jpg"),
    ProductModel(id: "5", title: "Holer 5", image: "assets/carvel/shot5.jpg"),
  ];
  int _selectedIndex = 0; // To track the selected index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 120, 54),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                //main product photo
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    keysHolders[_selectedIndex ?? 0].image,
                    height: 300,
                    width: 300,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(height: 20),
                // list of products photos
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(keysHolders.length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                _selectedIndex == index
                                    ? Colors.blue
                                    : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Image.asset(
                            keysHolders[index].image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
