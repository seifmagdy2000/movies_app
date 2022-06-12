import 'package:flutter/material.dart';
import 'package:movies_app/Screens/BrowseScreen.dart';
import 'package:movies_app/Screens/HomeScreen.dart';
import 'package:movies_app/Screens/SearchScreen.dart';
import 'package:movies_app/Screens/WatchListScreen.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
                icon: Icon(Icons.home),
                label: 'HOME'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
                icon: Icon(Icons.search),
                label: 'SEARCH'),
            // BottomNavigationBarItem(
            //     backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
            //     icon: Icon(Icons.movie),
            //     label: 'BROWSE'),
            // BottomNavigationBarItem(
            //     backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
            //     icon: Icon(Icons.book),
            //     label: 'WatchLIST'),
          ],
          showUnselectedLabels: true,
          selectedItemColor: Color.fromRGBO(255, 187, 59, 1.0),
          backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
          unselectedItemColor: Colors.white,
        ),
        body: views[currentPage]);
  }

  List<Widget> views = [
    HomeScreen(),
    SearchScreen(),
    // BrowseScreen(),
    // WatchListScreen()
  ];
}
