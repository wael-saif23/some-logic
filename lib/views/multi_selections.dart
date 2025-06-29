import 'package:flutter/material.dart';

class MultiSelections extends StatefulWidget {
  const MultiSelections({super.key});

  @override
  State<MultiSelections> createState() => _MultiSelectionsState();
}

class _MultiSelectionsState extends State<MultiSelections> {
  List<String> services = [
    "doors",
    "cieling",
    "furniture carve",
    "wall decor",
    "wall art",
    "phillin",
    "marble",
    "products",
    "3d work",
  ];

  Set<String> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "What do you want to work on in Carvel?",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 20),
              Wrap(
                children: List.generate(services.length, (int index) {
                  String item = services.elementAt(index);
                  bool isSelected = selectedItems.contains(item);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedItems.contains(item)) {
                          selectedItems.remove(item);
                        } else {
                          selectedItems.add(item);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.transparent : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      // ChoiceChip(
                      //   label: Text(
                      //     services[index],
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   selected: selectedItems.contains(services[index]),
                      //   onSelected: (bool selected) {
                      //     setState(() {
                      //       if (selected) {
                      //         selectedItems.add(services[index]);
                      //       } else {
                      //         selectedItems.remove(services[index]);
                      //       }
                      //     });
                      //   },
                      //   backgroundColor: Colors.grey[800],
                      //   selectedColor: Colors.blueAccent,
                      // ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                        selectedItems.map((String item) {
                          return Card(
                            color: Colors.grey[900],
                            child: ListTile(
                              title: Text(
                                item,
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    selectedItems.remove(item);
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),

                    // List.generate(selectedItems.length, (int index) {
                    //   String item = selectedItems.elementAt(index);
                    //   return Card(
                    //     color: Colors.grey[900],
                    //     child: ListTile(
                    //       title: Text(
                    //         item,
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       trailing: IconButton(
                    //         icon: Icon(Icons.close, color: Colors.red),
                    //         onPressed: () {
                    //           setState(() {
                    //             selectedItems.remove(item);
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   );
                    // },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
