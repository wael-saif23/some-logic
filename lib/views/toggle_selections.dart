import 'package:flutter/material.dart';

class ToggleSelections extends StatefulWidget {
  const ToggleSelections({super.key});

  @override
  State<ToggleSelections> createState() => _ToggleSelectionsState();
}

class _ToggleSelectionsState extends State<ToggleSelections> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // main image
            CircleAvatar(
              radius: 103,
              backgroundColor: Colors.blueAccent,
              child: CircleAvatar(
                radius: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/carvel/the logo.png",
                    fit: BoxFit.cover,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            // add a toggle button
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    isSelected ? Icons.check : Icons.add,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    isSelected = !isSelected;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
