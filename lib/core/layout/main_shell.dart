import 'package:flutter/material.dart';
import 'package:some_logic/views/five/pagination.dart';
import 'package:some_logic/views/four/form_feature.dart';
import 'package:some_logic/views/one/%D9%8DSingle_selections.dart';
import 'package:some_logic/views/one/image_selection.dart';
import 'package:some_logic/views/one/multi_selections.dart';
import 'package:some_logic/views/one/toggle_selections.dart';
import 'package:some_logic/views/three/search_page.dart';
import 'package:some_logic/views/two/upload_files.dart';
import 'package:some_logic/views/two/upload_image.dart';
import 'package:some_logic/views/two/upload_multi_images.dart';
import 'package:some_logic/views/two/upload_video.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  //controller for page view
  // final PageController _pageController = PageController();
  final List<Widget> _pages = [
    SingleSelections(),
    ImageSelections(),
    ToggleSelections(),
    MultiSelections(),
    UploadImage(),
    UploadMultiImages(),
    UploadVideo(),
    UploadFiles(),
  SearchPage(),
    FormFeature(),
  Pagination(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return
    ///first shell setup
    // Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: _pages,
    //     onPageChanged: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //   ),
    //   bottomNavigationBar: Container(
    //     height: 100,
    //     width: double.infinity,
    //     color: Colors.white,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ///back button
    //         GestureDetector(
    //           onTap: () {
    //             if (_currentIndex > 0) {
    //               _pageController.jumpToPage(_currentIndex - 1);
    //             }
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             height: 50,
    //             color: Colors.black,
    //             child: Icon(Icons.arrow_back_ios_new,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //         SizedBox(width: 20
    //         ),
    //         ///next button
    //         GestureDetector(
    //           onTap: () {
    //             if (_currentIndex < _pages.length - 1) {
    //               _pageController.jumpToPage(_currentIndex + 1);
    //             }
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             color: Colors.black,
    //             height: 50,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   'Next Page',
    //                   style: TextStyle(color: Colors.white, fontSize: 20),
    //                 ),
    //                 SizedBox(width: 10),
    //                 Icon(Icons.arrow_forward_ios,
    //                   color: Colors.white,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    ///----------------------------------------------------------------
    ///second shell setup
    Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///back button
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
            ),
            SizedBox(width: 20),

            ///next button
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex =
                      _currentIndex < _pages.length - 1
                          ? _currentIndex + 1
                          : _pages.length - 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.black,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next Page',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
