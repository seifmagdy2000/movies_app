import 'package:flutter/material.dart';
import 'package:movies_app/Data/Items/newRelease_movie_item.dart';

import 'package:movies_app/Data/Items/popular_movie_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [PopularMovieItem(), NewMovieItem()],
    );
  }
}
