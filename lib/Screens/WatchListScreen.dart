import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,left: 20),
              child:
              Text("Watchlist",
                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),),
          ],
        )
      ],
    );
  }
}
