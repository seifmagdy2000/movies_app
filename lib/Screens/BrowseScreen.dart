import 'package:flutter/material.dart';
import 'package:movies_app/Data/genres.dart';
import 'package:movies_app/Data/movie_details.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 70, left: 20),
          child: Text(
            "Browse Category",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<Generes>(builder:
            (BuildContext context, AsyncSnapshot<Generes> snapshot) {
          if (snapshot.hasError)
            return Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.white),
            );
          else if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          print(snapshot.data?.genres?.elementAt(0).id);
          return Container(
            height: 500,
            child: ListView.builder(itemCount: snapshot.data?.genres!.length??0,
                //scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
              return Container(
                child:    Column(
                  children: [
                    Container(
                      color: Color.fromRGBO(40, 42, 40, 1.0),
                      height: 200,
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: ListView.builder(
                        itemCount: snapshot.data?.genres?.length??0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: 10, right: 10, bottom: 10),
                            child: InkWell(
                              onTap: () {
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    width: 100,
                                    child: Text(
                                      snapshot.data!.genres!
                                          .elementAt(index)
                                          .name ??
                                          "no name ",
                                      maxLines: 2,
                                      style: TextStyle(
                                          height: 2,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        })
      ],
    );
  }
}
