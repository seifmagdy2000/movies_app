import 'package:flutter/material.dart';
import 'Home.dart';
import 'Screens/DetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Home.routeName: (buildContext) => Home(),
        Details.RouteName: (buildContext) => Details(),
      },
      initialRoute: Home.routeName,
    );
  }
}
